#!/bin/bash

set -e  # falha automática

echo "🧪 Testando suporte a C# no Godot..."

# Criar projeto temporário
mkdir -p /tmp/godot-test
cd /tmp/godot-test

# Inicializar projeto Godot
/usr/local/bin/godot --headless --path . --quit
godot --headless --help
echo "✔ Projeto criado"

# Criar script C#
cat <<EOF > Test.cs
using Godot;

public partial class Test : Node
{
    public override void _Ready()
    {
        GD.Print("C# funcionando!");
    }
}
EOF

# Criar arquivo .csproj manual (caso Godot não gere)
cat <<EOF > godot-test.csproj
<Project Sdk="Godot.NET.Sdk/4.0.0">
  <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
  </PropertyGroup>
</Project>
EOF

echo "✔ Arquivos C# criados"

# Restaurar dependências
dotnet restore

echo "✔ dotnet restore OK"

# Build do projeto
dotnet build

echo "✔ Build C# OK"

echo "🎉 SUCESSO: C# está funcionando no Godot!"

# Limpeza de resíduos
cd /
rm -rf /tmp/godot-test
echo "🧹 Resíduos limpos"