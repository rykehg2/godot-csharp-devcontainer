#!/bin/bash

# Script to run xUnit tests and log output for AI analysis
LOG_DIR="/workspaces/godot-csharp-devcontainer/AI/logs"
LOG_FILE="$LOG_DIR/last_xunit_test.log"
mkdir -p "$LOG_DIR"

echo "🧪 Running xUnit tests..." | tee "$LOG_FILE"

# Run dotnet test pointing to the solution
# Using --logger "console;verbosity=normal" to ensure logs are readable by AI
dotnet test /workspaces/godot-csharp-devcontainer/game/GameSolution.sln \
    --logger "console;verbosity=normal" 2>&1 | tee -a "$LOG_FILE"

EXIT_CODE=${PIPESTATUS[0]}

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ xUnit tests passed." | tee -a "$LOG_FILE"
else
    echo "❌ xUnit tests failed. Check $LOG_FILE for details." | tee -a "$LOG_FILE"
fi

exit $EXIT_CODE