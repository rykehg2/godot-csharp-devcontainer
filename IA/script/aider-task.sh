#!/bin/bash
# Aider Task Runner: Launches Aider with project context pre-loaded.

aider --model "${AIDER_MODEL:-gemini-3.1-pro-preview}" \
      --read /workspaces/godot-csharp-devcontainer/IA/context.md \
      --read /workspaces/godot-csharp-devcontainer/IA/task.md \
      --read /workspaces/godot-csharp-devcontainer/IA/agent_mode.md \
      "$@"