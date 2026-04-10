#!/bin/bash

# Script customizado para rodar GDUnit4 em modo Headless no DevContainer

GODOT_BIN=$(which godot)
FILTERED_ARGS=""

# Processar argumentos (ex: -a run)
while [ $# -gt 0 ]; do
    if [ "$1" = "--godot_binary" ] && [ $# -gt 1 ]; then
        GODOT_BIN="$2"
        shift 2
    else
        FILTERED_ARGS="$FILTERED_ARGS $1"
        shift
    fi
done

if [ -z "$GODOT_BIN" ]; then
    echo "❌ Erro: Executável do Godot não encontrado."
    exit 1
fi

echo "🚀 Iniciando testes Godot (Headless)..."

# 1. Compilar C# (Obrigatório para GDUnit4 Mono)
echo "📦 Compilando solução .NET..."
dotnet build game/GameSolution.sln --debug
if [ $? -ne 0 ]; then
    echo "❌ Falha na compilação do C#."
    exit 1
fi

# 2. Executar Testes
# Removido --remote-debug port 0 que causava erro no Godot 4.x
"$GODOT_BIN" --headless --path game -d -s res://addons/gdUnit4/bin/GdUnitCmdTool.gd --ignoreHeadlessMode $FILTERED_ARGS
EXIT_CODE=$?

echo "🏁 Execução de testes finalizada com código: $EXIT_CODE"

# 3. Limpeza/Logs (Opcional)
"$GODOT_BIN" --headless --path game --quiet -s res://addons/gdUnit4/bin/GdUnitCopyLog.gd $FILTERED_ARGS > /dev/null 2>&1

exit $EXIT_CODE