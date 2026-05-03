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
GODOT_VERSION_RAW=$($GODOT_BIN --version | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+' || echo "4.6.2")
GODOT_SDK_VERSION=${GODOT_VERSION_RAW}

echo "🎯 Detected Godot Version: $GODOT_VERSION_RAW (Using SDK: $GODOT_SDK_VERSION)"

# Criar estrutura de diretórios src
mkdir -p src/Game.Godot/Scenes src/Game.Godot/Scripts/Nodes src/Game.Godot/Scripts/UI src/Game.Godot/Scripts/Managers
mkdir -p src/Game.Core/Domain src/Game.Core/Services src/Game.Core/ValueObjects

if [[ ! -f "src/Game.Godot/project.godot" ]]; then
    echo "🎮 Creating Godot project..."
    cat <<EOF > src/Game.Godot/project.godot
; Engine configuration file.
; It's best edited using the editor UI and not directly,
; but it can also be edited via text (it will not be overwritten by the editor).

config_version=5

[application]
config/name="Project Placeholder"

[dotnet]
project/assembly_name="GameGodot"

[editor_plugins]
enabled=PackedStringArray("res://addons/gdUnit4/plugin.cfg")
EOF
fi

# Criar GameGodot.csproj dentro de src/Game.Godot apontando para Core
cat <<EOF > src/Game.Godot/GameGodot.csproj
<Project Sdk="Godot.NET.Sdk/$GODOT_SDK_VERSION">
  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <LangVersion>14.0</LangVersion>
    <!-- Avoid conflicts with Godot SDK internal attribute generation and duplicate sources -->
    <GenerateAssemblyInfo>false</GenerateAssemblyInfo>
    <RollForward>Major</RollForward>
    <EnableDynamicLoading>true</EnableDynamicLoading>
    <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
    <RootNamespace>Game.Godot</RootNamespace>
    <!-- Suppress common warnings related to GdUnit4 analyzers and duplicate attributes -->
    <NoWarn>\$(NoWarn);CS9057;CS0436;CS0579;NU1605</NoWarn>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="../Game.Core/Game.Core.csproj" />
    <ProjectReference Include="addons/gdUnit4/gdUnit4.csproj" Condition="Exists('addons/gdUnit4/gdUnit4.csproj')" />
  </ItemGroup>
</Project>
EOF

# =========================
# 🧠 .NET SOLUTION
# =========================

if [[ ! -f "src/GameSolution.slnx" && ! -f "src/GameSolution.sln" ]]; then
    echo "🧠 Creating C# Solution..."
    dotnet new sln -n GameSolution -o src
fi

# Detectar caminho da solução em src/
SLN_PATH=$(find src -maxdepth 1 \( -name "*.sln" -o -name "*.slnx" \) | head -n 1)
echo "🔍 Using solution file: $SLN_PATH"

# =========================
# 🧠 BASE C# PROJECT
# =========================

if [[ ! -f "src/Game.Core/Game.Core.csproj" ]]; then
    echo "📦 Creating Base C# Project..."
    dotnet new classlib -n Game.Core -o src/Game.Core
fi

# =========================
# 🔗 SOLUTION
# =========================
echo "🔗 Configuring Solution..."
dotnet sln "$SLN_PATH" add src/Game.Core/Game.Core.csproj 2>/dev/null || true
dotnet sln "$SLN_PATH" add src/Game.Godot/GameGodot.csproj 2>/dev/null || true

# =========================
# 🧪 TEST PROJECT
# =========================

if [[ ! -d "src/xunitTests/Game.Core.Tests" ]]; then
    echo "🧪 Creating Test Project (.NET)..."
    dotnet new xunit -n Game.Core.Tests -o src/xunitTests/Game.Core.Tests
fi

# =========================
# 🔗 LINK TEST → CORE
# =========================

echo "🔗 Linking tests to core project..."
dotnet list src/xunitTests/Game.Core.Tests/Game.Core.Tests.csproj reference \
  | grep "Game.Core.csproj" \
  || dotnet add src/xunitTests/Game.Core.Tests/Game.Core.Tests.csproj reference src/Game.Core/Game.Core.csproj

dotnet sln "$SLN_PATH" add src/xunitTests/Game.Core.Tests/Game.Core.Tests.csproj 2>/dev/null || true

# =========================
# 🎮 GDUNIT4
# =========================

# Criar estrutura de testes do Godot e vincular dependências
if [[ ! -d "src/Game.Godot/tests" ]]; then
    echo "🎮 Configuring Godot Tests..."
    mkdir -p src/Game.Godot/tests
    cat <<EOF > src/Game.Godot/tests/GodotSampleTest.cs
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

# Instalação do GDUnit4 resiliente
if [[ ! -f "src/Game.Godot/addons/gdUnit4/bin/GdUnitCmdTool.gd" ]]; then
    echo "🎮 Installing GDUnit4..."
    GDUNIT_VERSION="v6.1.3"
    TMP_GDUNIT_DIR=$(mktemp -d -t gdunit4-XXXXXXXX)

    git clone --branch "$GDUNIT_VERSION" --depth 1 https://github.com/MikeSchulze/gdUnit4.git "$TMP_GDUNIT_DIR" || { echo "Failed to clone GDUnit4 repository."; exit 1; }

    rm -rf src/Game.Godot/addons/gdUnit4
    mkdir -p src/Game.Godot/addons/gdUnit4

    if [[ -d "$TMP_GDUNIT_DIR/addons/gdUnit4" ]]; then
        cp -r "$TMP_GDUNIT_DIR/addons/gdUnit4/." src/Game.Godot/addons/gdUnit4/
        cp "$TMP_GDUNIT_DIR/gdUnit4.csproj" src/Game.Godot/addons/gdUnit4/ 2>/dev/null || true

        sed -i "s|Sdk=\"Godot.NET.Sdk/[^\"]*\"|Sdk=\"Godot.NET.Sdk/$GODOT_SDK_VERSION\"|" src/Game.Godot/addons/gdUnit4/gdUnit4.csproj
        grep -q "<ImplicitUsings>" src/Game.Godot/addons/gdUnit4/gdUnit4.csproj || sed -i '/<LangVersion>13.0<\/LangVersion>/a \    <ImplicitUsings>enable</ImplicitUsings>' src/Game.Godot/addons/gdUnit4/gdUnit4.csproj
        sed -i '/<\/PropertyGroup>/i \    <NoWarn>$(NoWarn);CS9057;CS0436;CS0579;NU1605</NoWarn>' src/Game.Godot/addons/gdUnit4/gdUnit4.csproj | head -n 1

        if [ -f "src/Game.Godot/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs" ]; then
            grep -q "using System.Linq;" src/Game.Godot/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs || sed -i '/using Godot.Collections;/a using System.Linq;' src/Game.Godot/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs
        fi
        echo "Installed GDUnit4 addon files to src/Game.Godot/addons/gdUnit4"
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
godot --headless --path src/Game.Godot --import --quit || true

if [ -f "src/Game.Godot/addons/gdUnit4/gdUnit4.csproj" ]; then
    dotnet sln "$SLN_PATH" add src/Game.Godot/addons/gdUnit4/gdUnit4.csproj 2>/dev/null || true
else
    echo "❌ Error: 'src/Game.Godot/addons/gdUnit4/gdUnit4.csproj' not found after GDUnit4 installation."
fi

# =========================
# 🧪 Initial sample test
# =========================

cat <<EOF > src/xunitTests/Game.Core.Tests/SampleTest.cs
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