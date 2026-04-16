# 🤖 Godot C# AI Dev Environment (XP + TDD)

> Execution-driven development environment powered by AI + TDD

## 📄 License

This project is licensed under the **GNU General Public License v3.0** (GPL-3.0).  
See the [LICENSE](LICENSE) file for details.

---

# 🚀 Quick Start (TL;DR)

### 🛠️ Prerequisites
Before starting, ensure you have the following installed on your host machine:
- **Docker Desktop** (or Docker Engine on Linux).
- **VS Code**.
- **Dev Containers Extension** (ms-vscode-remote.remote-containers).
- **Godot Engine (4.x Mono/C#)**: Required locally for editor access and UI/Editor testing.

### ⚙️ How to Start
1. Open this project folder in **VS Code**.
2. Press `F1` (or `Ctrl+Shift+P`) and select: **Dev Containers: Reopen in Container**.
3. Ensure your `GEMINI_API_KEY` or `ANTHROPIC_API_KEY` is set in your host environment or a `.env` file for AI features. (Not mandatory).
4. User your preferred IA chat code assist (Copilot, Gemini, Qwen, Cline, Continue...) or configure AI agente CLI.

### 🧪 Initial Validation
Inside the container terminal, run:
```bash
dotnet test
```

* IDEs errors like "GDScript server not connected" are expected.

---

# 🧠 How to work on this project

1. **Initialize the Agent:** Choose a role and mode from `AI/agent_mode.md` (e.g., "Initialize as Architect in FULL mode").
2. **Follow the Assembly Line:**
   * **Architect (Planner):** Refines `design/contracts` and decomposes features into `AI/tasks/XXX.md`.
   * **Tester (Guardian):** Writes failing tests based on tasks and logs results in `AI/logs/`.
   * **Developer (Executor):** Implements minimal logic in `game/` to turn the tests green.
3. **Source of Truth:** 
   * `AI/task.md` points to the active task.
   * `AI/context.md` defines the technical rules.
   * `design/contracts/` defines the behavioral requirements.

👉 Everything is guided by **Specialized Agents + TDD + Tasks**

---

# 📂 Main structure

```
.devcontainer/   → Reproducible environment (Docker)
game/            → Godot project (created postCreate, IA and Dev work here)
tests/           → .NET tests (created postCreate, IA and Dev work here)
AI/              → AI system (agents, context, tasks, state, logs)

design/          → Game rules (source of truth, Dev work here)
docs/            → APIs and architecture
examples/        → Reusable references for IA or Dev
```

---

# 🔄 Development flow

1. **Architect:** Contract → Task
2. **Tester:** Failing Test → Log Failure
3. **Developer:** Implementation → Green Test
4. **Tester:** Final Validation → Task Done

---

# 🎯 Philosophy

✔ Behavior
✔ Tests
✔ CLI execution
✔ Small iterations
✔ AI as executor, not decision maker

---

# 📚 Full documentation

---

# 🔄 Update – Dev Container + IA (XP + TDD)

This project implements a complete environment for:

* 🤖 AI-assisted development
* 🧪 Test-Driven Development (TDD)
* 🔄 Extreme Programming (XP) based flow

---

# 🐳 Container (Source of Truth)

## 🎯 Objective

Environment:

* Reproducible
* Headless
* Automated
* IDE independent

> 🔥 Container = source of truth
> IDE = auxiliary tool

---

## ⚙️ Stack

* Fedora 41
* .NET 8
* Godot 4 (mono, headless)
* GDUnit4
* SCons (Godot toolchain)
* OpenCode (AI CLI Agent)
* Native toolchain (gcc, clang, cmake, ninja)

---

## 🧱 Structure

```
.devcontainer/
├── Dockerfile
├── devcontainer.json
├── postCreate.sh
├── run_post_create.sh
└── tests/
```

---

## 🚀 Automatic initialization

When starting the container:

```bash
postCreate.sh
```

Automatically creates:

* Godot project
* C# Solution
* Main project (Game.Core)
* Test project (xUnit)
* GDUnit4 integration

---

## 🔍 Logs

```bash
.devcontainer/tmp/postCreate.log
```

---

# 🤖 AI System

```
AI/
├── context.md      → Operational rules
├── rules.md        → Global constraints
├── agent_mode.md   → Agent Router (Role definitions)
├── agents/         → Specialized Agent Bootstraps
├── task.md         → Active task
├── state.md        → Memory
└── tasks/          → Task history
```

---

## 🧠 context.md

Defines:

* How to run the project
* How to test
* TDD rules
* XP flow

---

## 📋 rules.md

Defines:

* Global constraints
* Code quality
* Execution rules

---

## 📌 task.md

Defines:

* What must be done NOW

---

## 🧠 state.md

Stores:

* Progress
* Decisions
* Issues

---

# 🧩 Task System

```
AI/tasks/
├── 000-template.md
├── 001-feature-x.md
├── 002-bugfix-y.md
```

---

## 🔄 Model

Each task follows:

```text
Goal → Expected Behavior → Tests → Implementation → Done
```

---

## ⚠️ Rules

* Work on ONE task at a time
* Do not expand scope
* Update progress continuously

---

# 🎮 Game Design

```
design/
├── gdd.md
├── mechanics.md
├── systems.md
├── roadmap.md
├── decisions.md
└── contracts/
```

---

## 🧠 Source of truth

👉 `/design` defines game behavior

---

## 📜 Contracts (BDD-like)

```
design/contracts/
```

Defines behaviors as:

```text
Given / When / Then
```

---

## ⚠️ Rule

If code ≠ design:

* Fix code
  **OR**
* Update design

Never silently diverge

---

# 📚 Technical documentation

```
docs/
├── api/
├── architecture/
└── integrations/
```

---

## Usage

* External APIs → `/docs/api`
* Architecture → `/docs/architecture`

---

# 🧪 Reusable examples

```
examples/
├── godot/
├── csharp/
└── patterns/
```

---

## Rule

Before implementing:

👉 Check `/examples`

---

# 🧪 Testing Strategy

## 🧠 .NET (PRIORITY)

* Logic
* Rules
* Algorithms

```bash
dotnet test
```

---

## 🎮 Godot (SECONDARY)

* Nodes
* Scenes
* Engine

```bash
godot --headless ...
```

---

# 🔄 XP + TDD Loop

```text
1. Create test (FAIL)
2. Run tests
3. Implement minimum (PASS)
4. Run again
5. Refactor
6. Update state.md
```

---

# 🧠 Benefits

✔ Total reproducibility
✔ Test-driven development
✔ AI with controlled context
✔ Low regression
✔ High predictability

---

# 🚀 Future

* Automatic CI/CD
* Continuous AI execution
* Distributed tests
* External service integration

---

# 📌 Conclusion

This project is not just a development setup.

> 🧠 It's a complete execution system oriented by AI + TDD + XP

---
