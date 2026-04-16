#!/bin/bash

# Full project validation: Build + xUnit + GDUnit
LOG_FILE="/workspaces/godot-csharp-devcontainer/AI/logs/full_validation.log"

echo "🚀 Starting Full Validation..." | tee "$LOG_FILE"

echo "🔨 Building Solution..." | tee -a "$LOG_FILE"
dotnet build /workspaces/godot-csharp-devcontainer/game/GameSolution.sln >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then echo "❌ Build Failed" | tee -a "$LOG_FILE"; exit 1; fi

echo "🧪 Running C# Logic Tests (xUnit)..." | tee -a "$LOG_FILE"
bash /workspaces/godot-csharp-devcontainer/AI/script/xunit.sh >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then echo "❌ xUnit Tests Failed" | tee -a "$LOG_FILE"; exit 1; fi

echo "🎮 Running Godot Integration Tests (GDUnit4)..." | tee -a "$LOG_FILE"
bash /workspaces/godot-csharp-devcontainer/AI/script/gdunit.sh -a run >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then echo "❌ GDUnit Tests Failed" | tee -a "$LOG_FILE"; exit 1; fi

echo "✨ All systems green!" | tee -a "$LOG_FILE"
exit 0