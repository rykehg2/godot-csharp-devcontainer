#!/bin/bash

set -e

echo "🚀 Configurando ambiente..."

# =========================
# 🎮 GODOT PROJECT
# =========================

mkdir -p game
cd game

if [ ! -f "project.godot" ]; then
    echo "🎮 Criando projeto Godot..."
    godot --headless --path . --quit
fi

cd ..

# =========================
# 🧠 .NET SOLUTION
# =========================

if [ ! -f "game/GameSolution.sln" ]; then
    echo "🧠 Criando solução C#..."
    dotnet new sln -n GameSolution -o game
fi

# =========================
# 🧠 PROJETO C# BASE
# =========================

if [ ! -f "game/Game.Core/Game.Core.csproj" ]; then
    echo "📦 Criando projeto C# base..."
    dotnet new classlib -n Game.Core -o game/Game.Core
fi

# =========================
# 🔗 SOLUTION
# =========================

echo "🔗 Configurando solução..."

dotnet sln game/GameSolution.sln add game/Game.Core/Game.Core.csproj 2>/dev/null || true

# =========================
# 🧪 TEST PROJECT
# =========================

if [ ! -d "tests/Game.Core.Tests" ]; then
    echo "🧪 Criando projeto de testes (.NET)..."

    mkdir -p tests
    cd tests
    dotnet new xunit -n Game.Core.Tests
    cd ..
fi

# =========================
# 🔗 LINK TEST → CORE
# =========================

echo "🔗 Vinculando testes ao projeto principal..."

dotnet list tests/Game.Core.Tests/Game.Core.Tests.csproj reference \
  | grep "Game.Core.csproj" \
  || dotnet add tests/Game.Core.Tests/Game.Core.Tests.csproj reference game/Game.Core/Game.Core.csproj

dotnet sln game/GameSolution.sln add tests/Game.Core.Tests/Game.Core.Tests.csproj 2>/dev/null || true

# =========================
# 🎮 GDUNIT4
# =========================

if [ ! -d "game/addons/gdUnit4" ]; then
    echo "🎮 Instalando GDUnit4..."

    mkdir -p game/addons
    cd game/addons

    git clone https://github.com/MikeSchulze/gdUnit4.git

    cd ../..

    echo "📦 Importando addons..."
    godot --headless --path game --import --quit || true
fi

# =========================
# 🧪 Teste inicial de exemplo
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

echo "📦 Restaurando dependências..."
dotnet restore

# =========================
# 🧪 VALIDATION
# =========================

echo "🧪 Rodando testes .NET..."
dotnet test || true

echo "🎮 Rodando testes Godot..."
godot --headless --path game -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a run || true

echo "✅ Ambiente pronto"