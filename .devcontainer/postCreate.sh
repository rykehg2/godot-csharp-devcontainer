#!/bin/bash

set -e

echo "🚀 Configuring environment..."

# Define Godot binary for GDUnit4 .NET test adapters
export GODOT_BIN=$(which godot)
mkdir -p /workspaces/godot-csharp-devcontainer/AI/logs

# Limpeza preventiva para evitar conflitos de cache/objetos de builds anteriores
echo "🧹 Cleaning up old build artifacts..."
find . -type d -name "obj" -exec rm -rf {} + 2>/dev/null || true
find . -type d -name "bin" -exec rm -rf {} + 2>/dev/null || true

# =========================
# 🎮 GODOT PROJECT
# =========================

# Detectar versão do Godot para alinhar o SDK do .NET
# Versão padrão caso a detecção falhe (v4.3.0 é a estável atual)
#GODOT_VERSION_RAW=$($GODOT_BIN --version | cut -d. -f1-3 | cut -d- -f1)
#GODOT_SDK_VERSION=${GODOT_VERSION_RAW:-4.3.0}
# Garante formato X.Y.Z (ex: 4.6.2) para compatibilidade com NuGet
GODOT_VERSION_RAW=$($GODOT_BIN --version | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+' || echo "4.3.0")
GODOT_SDK_VERSION=${GODOT_VERSION_RAW}

echo "🎯 Detected Godot Version: $GODOT_VERSION_RAW (Using SDK: $GODOT_SDK_VERSION)"

mkdir -p game
cd game

if [[ ! -f "project.godot" ]]; then
    echo "🎮 Creating Godot project..."
    # Create a basic project.godot file with C# support
    cat <<EOF > project.godot
; Engine configuration file.
; It's best edited using the editor UI and not directly,
; but it can also be edited via text (it will not be overwritten by the editor).

config_version=5

[application]
config/name="Project Placeholder"

[dotnet]
project/assembly_name="Game"

[editor_plugins]
enabled=PackedStringArray("res://addons/gdUnit4/plugin.cfg")
EOF
fi

# Sempre atualizar o Game.csproj para garantir que as configurações de exclusão e NoWarn estejam presentes
cat <<EOF > Game.csproj
<Project Sdk="Godot.NET.Sdk/$GODOT_SDK_VERSION">
  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <LangVersion>14.0</LangVersion>
    <!-- Avoid conflicts with Godot SDK internal attribute generation and duplicate sources -->
    <GenerateAssemblyInfo>false</GenerateAssemblyInfo>
    <RollForward>Major</RollForward>
    <EnableDynamicLoading>true</EnableDynamicLoading>
    <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
    <!-- Exclui apenas o código-fonte de subprojetos que possuem .csproj próprio -->
    <DefaultItemExcludes>\$(DefaultItemExcludes);Game.Core/**/*.cs;.godot/mono/**</DefaultItemExcludes>
    <RootNamespace>Game</RootNamespace>
    <!-- Suppress common warnings related to GdUnit4 analyzers and duplicate attributes -->
    <NoWarn>\$(NoWarn);CS9057;CS0436;CS0579;NU1605</NoWarn>
  </PropertyGroup>
  <ItemGroup>
    <!-- Referências diretas -->
    <ProjectReference Include="Game.Core/Game.Core.csproj" />
    <ProjectReference Include="addons/gdUnit4/gdUnit4.csproj" Condition="Exists('addons/gdUnit4/gdUnit4.csproj')" />
  </ItemGroup>
</Project>
EOF

cd ..

# =========================
# 🧠 .NET SOLUTION
# =========================

if [[ ! -f "game/GameSolution.sln" && ! -f "game/GameSolution.slnx" ]]; then
    echo "🧠 Creating C# Solution..."
    dotnet new sln -n GameSolution -o game
fi

# Detectar caminho da solução dinamicamente (.sln ou .slnx)
SLN_PATH=$(find game -maxdepth 1 \( -name "*.sln" -o -name "*.slnx" \) | head -n 1)
echo "🔍 Using solution file: $SLN_PATH"

# Vincular projeto principal
dotnet sln "$SLN_PATH" add game/Game.csproj || echo "⚠️ Warning: Could not evaluate SDK during sln add, but project was linked."

# =========================
# 🧠 BASE C# PROJECT
# =========================

if [[ ! -f "game/Game.Core/Game.Core.csproj" ]]; then
    echo "📦 Creating Base C# Project..."
    dotnet new classlib -n Game.Core -o game/Game.Core
fi

# =========================
# 🔗 SOLUTION
# =========================
echo "🔗 Configuring Solution..."
dotnet sln "$SLN_PATH" add game/Game.Core/Game.Core.csproj 2>/dev/null || true

# =========================
# 🧪 TEST PROJECT
# =========================

if [[ ! -d "tests/Game.Core.Tests" ]]; then
    echo "🧪 Creating Test Project (.NET)..."

    mkdir -p tests
    cd tests
    dotnet new xunit -n Game.Core.Tests
    cd ..
fi

# =========================
# 🔗 LINK TEST → CORE
# =========================

echo "🔗 Linking tests to core project..."

dotnet list tests/Game.Core.Tests/Game.Core.Tests.csproj reference \
  | grep "Game.Core.csproj" \
  || dotnet add tests/Game.Core.Tests/Game.Core.Tests.csproj reference game/Game.Core/Game.Core.csproj

dotnet sln "$SLN_PATH" add tests/Game.Core.Tests/Game.Core.Tests.csproj 2>/dev/null || true

# =========================
# 🎮 GDUNIT4
# =========================

# Criar estrutura de testes do Godot e vincular dependências
if [[ ! -d "game/tests" ]]; then
    echo "🎮 Configuring Godot Tests..."
    mkdir -p game/tests

    cat <<EOF > game/tests/GodotSampleTest.cs
using Godot;
using GdUnit4;

[TestSuite]
public partial class GodotSampleTest
{
    [TestCase]
    public void Should_Pass_Godot_Interaction() => Assertions.AssertBool(true).IsTrue();
}
EOF
fi

# Verify command script exists to validate installation 
if [[ ! -f "game/addons/gdUnit4/bin/GdUnitCmdTool.gd" ]]; then
    echo "🎮 Installing GDUnit4..."

    # Create a temporary directory for cloning
    TMP_GDUNIT_DIR=$(mktemp -d -t gdunit4-XXXXXXXX)
    echo "Cloning GDUnit4 into temporary directory: $TMP_GDUNIT_DIR"

    # Clone the repository into the temporary directory
    git clone https://github.com/MikeSchulze/gdUnit4.git "$TMP_GDUNIT_DIR" || { echo "Failed to clone GDUnit4 repository."; exit 1; }

    # Remove existing gdUnit4 addon to ensure a clean install
    rm -rf game/addons/gdUnit4
    mkdir -p game/addons/gdUnit4

    # Move only the contents of 'addons/gdUnit4' from the repo to the project
    if [[ -d "$TMP_GDUNIT_DIR/addons/gdUnit4" ]]; then
        cp -r "$TMP_GDUNIT_DIR/addons/gdUnit4/." game/addons/gdUnit4/
        # Also copy the C# project file from the repo root
        cp "$TMP_GDUNIT_DIR/gdUnit4.csproj" game/addons/gdUnit4/ 2>/dev/null || true

        # Garantir que o SDK do addon use a mesma versão detectada
        sed -i "s|Sdk=\"Godot.NET.Sdk/[^\"]*\"|Sdk=\"Godot.NET.Sdk/$GODOT_SDK_VERSION\"|" game/addons/gdUnit4/gdUnit4.csproj

        # Enable ImplicitUsings to resolve LINQ issues globally in the addon
        grep -q "<ImplicitUsings>" game/addons/gdUnit4/gdUnit4.csproj || sed -i '/<LangVersion>13.0<\/LangVersion>/a \    <ImplicitUsings>enable</ImplicitUsings>' game/addons/gdUnit4/gdUnit4.csproj

        # Suppress warnings in the addon project as well
        sed -i '/<\/PropertyGroup>/i \    <NoWarn>$(NoWarn);CS9057;CS0436;CS0579;NU1605</NoWarn>' game/addons/gdUnit4/gdUnit4.csproj | head -n 1

        # Specifically patch the failing test file to ensure System.Linq is present
        if [ -f "game/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs" ]; then
            grep -q "using System.Linq;" game/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs || sed -i '/using Godot.Collections;/a using System.Linq;' game/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs
        fi

        echo "Installed GDUnit4 addon files to game/addons/gdUnit4"
    else
        echo "Error: 'addons/gdUnit4' not found in cloned repository."
        exit 1
    fi

    # Clean up the temporary directory
    [ -d "$TMP_GDUNIT_DIR" ] && rm -rf "$TMP_GDUNIT_DIR"
    echo "Cleaned up temporary directory."
fi

# Importação crucial para o Godot indexar os novos arquivos .cs e o plugin
echo "📦 Importing project resources..."
godot --headless --path game --import --quit || true

if [ -f "game/addons/gdUnit4/gdUnit4.csproj" ]; then
    dotnet sln "$SLN_PATH" add game/addons/gdUnit4/gdUnit4.csproj 2>/dev/null || true
else
    echo "❌ Error: 'game/addons/gdUnit4/gdUnit4.csproj' not found after GDUnit4 installation."
fi

# =========================
# 🧪 Initial sample test
# =========================

cat <<EOF > tests/Game.Core.Tests/SampleTest.cs
using Xunit;

public class SampleTest
{
    [Fact]
    public void Should_Pass()
    {
        Assert.True(true);
    }
}
EOF

# =========================
# 📦 RESTORE
# =========================

echo "📦 Restoring dependencies..."
dotnet restore "$SLN_PATH"

# =========================
# 🧪 VALIDATION
# =========================

echo "🧪 Running .NET tests..."
bash AI/script/xunit.sh || true

echo "🎮 Running Godot tests..."
bash AI/script/gdunit.sh -a res://tests/ || true

echo "✅ Environment ready"