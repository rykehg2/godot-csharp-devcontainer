#!/bin/bash

# Custom script to run GDUnit4 in Headless mode in the DevContainer

# Directory setup
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

LOG_DIR="$PROJECT_ROOT/AI/logs"
LOG_FILE="$LOG_DIR/last_gdunit_test.log"
GODOT_BIN=$(which godot)
FILTERED_ARGS=""

# Silence Godot root warning in logs
export GODOT_SILENCE_ROOT_WARNING=1

# Make sure log directory exists and is writable
if ! mkdir -p "$LOG_DIR"; then
    echo "❌ Critical Error: Could not create log directory $LOG_DIR"
    exit 1
fi

# Process arguments
while [ $# -gt 0 ]; do
    if [[ "$1" == "--godot_binary" ]] && [[ $# -gt 1 ]]; then
        GODOT_BIN="$2"
        shift 2
    else
        FILTERED_ARGS="$FILTERED_ARGS $1"
        shift
    fi
done

echo "🚀 Starting Godot Tests (Headless)..." | tee "$LOG_FILE"
echo "📝 Log File: $LOG_FILE" | tee -a "$LOG_FILE"

if [[ -z "$GODOT_BIN" ]]; then
    echo "❌ Error: Godot executable not found." | tee -a "$LOG_FILE"
    exit 1
fi

# --- DIAGNOSTIC START ---
echo "🔍 [DEBUG] Checking project.godot for GdUnit4 activation..." | tee -a "$LOG_FILE"
grep -H "gdUnit4" "$PROJECT_ROOT/game/project.godot" >> "$LOG_FILE" 2>&1 || echo "⚠️ GdUnit4 not mentioned in project.godot" | tee -a "$LOG_FILE"

echo "📂 [DEBUG] Listing test files in game/tests/:" | tee -a "$LOG_FILE"
ls -la "$PROJECT_ROOT/game/tests/" >> "$LOG_FILE" 2>&1
# --- DIAGNOSTIC END ---

# Debugging: Check for the presence of the test file
if [ -f "$PROJECT_ROOT/game/tests/GodotSampleTest.cs" ]; then
    echo "✅ GodotSampleTest.cs found at: $PROJECT_ROOT/game/tests/GodotSampleTest.cs" | tee -a "$LOG_FILE"
else
    echo "❌ GodotSampleTest.cs NOT found at: $PROJECT_ROOT/game/tests/GodotSampleTest.cs" | tee -a "$LOG_FILE"
fi

# Garante que o Godot importe os recursos e sincronize os metadados do C# antes da compilação
echo "🔍 Refreshing Godot project metadata..." | tee -a "$LOG_FILE"
"$GODOT_BIN" --headless --path game --import --quit >> "$LOG_FILE" 2>&1 || true

# 1. Compile C#
echo "📦 Compiling .NET Solution..." | tee -a "$LOG_FILE"
# Tentamos compilar a solução primeiro
dotnet build "$PROJECT_ROOT/game/GameSolution.sln" --debug -c Debug >> "$LOG_FILE" 2>&1

# No Godot 4, o CLI às vezes falha em buildar projetos Godot via .sln se o SDK não estiver no cache.
# Forçamos o build direto do Game.csproj para garantir que a assembly de testes seja gerada.
if [ -f "$PROJECT_ROOT/game/Game.csproj" ]; then
    echo "📦 Compiling .NET Solution..." | tee -a "$LOG_FILE"
    dotnet build "$PROJECT_ROOT/game/GameSolution.sln" --debug -c Debug >> "$LOG_FILE" 2>&1
    if [ $? -ne 0 ]; then
        echo "❌ C# Compilation failed. Check $LOG_FILE" | tee -a "$LOG_FILE"
        exit 1
    fi
fi

# Debugging: Check if Game.dll exists and contains the test
GAME_DLL_PATH="$PROJECT_ROOT/game/.godot/mono/temp/bin/Debug/Game.dll"
if [ -f "$GAME_DLL_PATH" ]; then
    echo "✅ Game.dll found at: $GAME_DLL_PATH" | tee -a "$LOG_FILE"
else
    echo "❌ Game.dll NOT found at: $GAME_DLL_PATH" | tee -a "$LOG_FILE"
    echo "This indicates a compilation issue or incorrect output path." | tee -a "$LOG_FILE"
    exit 1 # Exit if Game.dll is not found, as tests cannot run without it.
fi

# 2. Re-import para sincronizar classes C# compiladas
echo "🔍 Syncing C# classes to Godot..." | tee -a "$LOG_FILE"
# Usar --editor --quit é mais robusto para forçar o refresh do Mono metadata
"$GODOT_BIN" --headless --editor --quit --path game --verbose >> "$LOG_FILE" 2>&1 || true

# 3. Run Tests
# Removed --remote-debug port 0 which caused errors in Godot 4.x
"$GODOT_BIN" --headless --path game -v -d -s res://addons/gdUnit4/bin/GdUnitCmdTool.gd --ignoreHeadlessMode $FILTERED_ARGS 2>&1 | tee -a "$LOG_FILE"
EXIT_CODE=$?

echo "🏁 Test execution finished with code: $EXIT_CODE" | tee -a "$LOG_FILE"
ls -l "$LOG_FILE" # Verificação visual no terminal

# 3. Cleanup/Logs (Optional)
#"$GODOT_BIN" --headless --path game --quiet -s res://addons/gdUnit4/bin/GdUnitCopyLog.gd $FILTERED_ARGS > /dev/null 2>&1

exit $EXIT_CODE