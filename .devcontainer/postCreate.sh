#!/bin/bash

set -e

echo "🚀 Configuring environment..."

# Define Godot binary for GDUnit4 .NET test adapters
export GODOT_BIN=$(which godot)
mkdir -p /workspaces/godot-csharp-devcontainer/IA/logs

# =========================
# 🎮 GODOT PROJECT
# =========================

mkdir -p game
cd game

if [[ ! -f "project.godot" ]]; then
    echo "🎮 Creating Godot project..."
    # Create a basic project.godot file with C# support
    cat <<EOF > project.godot
[application]
config/name="Project Placeholder"

[mono]
assembly_name="Game.Core"

[editor_plugins]
enabled=PackedStringArray("res://addons/gdUnit4/plugin.cfg")
EOF
fi

cd ..

# =========================
# 🧠 .NET SOLUTION
# =========================

if [[ ! -f "game/GameSolution.sln" ]]; then
    echo "🧠 Creating C# Solution..."
    dotnet new sln -n GameSolution -o game
fi

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
dotnet sln game/GameSolution.sln add game/Game.Core/Game.Core.csproj 2>/dev/null || true
dotnet sln game/GameSolution.sln remove game/game.csproj >/dev/null 2>&1 || true 

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

dotnet sln game/GameSolution.sln add tests/Game.Core.Tests/Game.Core.Tests.csproj 2>/dev/null || true

# =========================
# 🎮 GDUNIT4
# =========================

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

        # Patch gdUnit4.csproj to target net8.0 and LangVersion 12.0 (compatible with .NET 8)
        sed -i 's/<TargetFramework>net9.0<\/TargetFramework>/<TargetFramework>net8.0<\/TargetFramework>/' game/addons/gdUnit4/gdUnit4.csproj
        sed -i 's/<LangVersion>13.0<\/LangVersion>/<LangVersion>12.0<\/LangVersion>/' game/addons/gdUnit4/gdUnit4.csproj
        echo "Patched gdUnit4.csproj to target net8.0 and LangVersion 12.0"

        # Enable ImplicitUsings to resolve LINQ issues globally in the addon
        grep -q "<ImplicitUsings>" game/addons/gdUnit4/gdUnit4.csproj || sed -i '/<LangVersion>12.0<\/LangVersion>/a \    <ImplicitUsings>enable</ImplicitUsings>' game/addons/gdUnit4/gdUnit4.csproj

        # Specifically patch the failing test file to ensure System.Linq is present
        grep -q "using System.Linq;" game/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs || sed -i '/using Godot.Collections;/a using System.Linq;' game/addons/gdUnit4/test/dotnet/GdUnit4CSharpApiTest.cs

        echo "Installed GDUnit4 addon files to game/addons/gdUnit4"
    else
        echo "Error: 'addons/gdUnit4' not found in cloned repository."
        exit 1
    fi

    # Clean up the temporary directory
    [ -d "$TMP_GDUNIT_DIR" ] && rm -rf "$TMP_GDUNIT_DIR"
    echo "Cleaned up temporary directory."

    echo "📦 Importing addons..."
    godot --headless --path game --import --quit || true
fi

# Ensure gdUnit4.csproj is added to the solution AFTER installation
if [ -f "game/addons/gdUnit4/gdUnit4.csproj" ]; then
    dotnet sln game/GameSolution.sln add game/addons/gdUnit4/gdUnit4.csproj 2>/dev/null || true
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
dotnet restore game/GameSolution.sln

# =========================
# 🧪 VALIDATION
# =========================

echo "🧪 Running .NET tests..."
dotnet test game/GameSolution.sln || true

echo "🎮 Running Godot tests..."
bash .devcontainer/gdunit.sh -a run || true
bash .devcontainer/gdunit.sh -a res://test/ || true

echo "✅ Environment ready"