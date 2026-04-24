#!/bin/bash

# Script to run xUnit tests and log output for AI analysis
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

LOG_DIR="$PROJECT_ROOT/AI/logs"
LOG_FILE="$LOG_DIR/last_xunit_test.log"
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# O adaptador de testes do GDUnit4 exige a variável GODOT_BIN definida.
# Caso não esteja no ambiente, tentamos localizar o binário automaticamente.
if [ -z "$GODOT_BIN" ]; then
    export GODOT_BIN=$(which godot 2>/dev/null)
fi

echo "🧪 Running xUnit tests..." | tee "$LOG_FILE"
echo "📄 Log File: $LOG_FILE" | tee -a "$LOG_FILE"

# Run dotnet test pointing to the solution
# Usamos um filtro para rodar apenas os testes do projeto (Game.Core.Tests) 
# e evitar carregar os testes internos do addon gdUnit4 durante a validação de lógica.
dotnet test "$PROJECT_ROOT/game/GameSolution.sln" \
    --filter "FullyQualifiedName!~gdUnit4" \
    --logger "console;verbosity=normal" 2>&1 | tee -a "$LOG_FILE"

EXIT_CODE=${PIPESTATUS[0]}

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ xUnit tests passed." | tee -a "$LOG_FILE"
else
    echo "❌ xUnit tests failed. Check $LOG_FILE for details." | tee -a "$LOG_FILE"
fi

exit $EXIT_CODE