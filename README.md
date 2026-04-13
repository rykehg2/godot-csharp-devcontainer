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
4. User your preferred IA chat code assist (Copilot, Gemini, Qwen, Cline) or configure AI agente CLI.

### 🧪 Initial Validation
Inside the container terminal, run:
```bash
dotnet test
```

* IDEs errors like "GDScript server not connected" are expected.

---

# 🧠 How to work on this project

1. Read:

   * `how2use.md` (Quick start guide for AI modes and CLI tools)
   * `design/contracts` 
   * `IA/task.md`
   * `IA/context.md`

2. Follow the flow:

   * Crate design (contract) or task
   * Create test (FAIL)
   * Run tests
   * Implement minimum (PASS)
   * Refactor
   * Update `state.md`

👉 Everything is guided by **TDD + Tasks**

---

# 📂 Main structure

```
.devcontainer/   → Reproducible environment (Docker)
game/            → Godot project (created postCreate, IA and Dev work here)
tests/           → .NET tests (created postCreate, IA and Dev work here)

IA/              → AI system (context, tasks, state, IA and Dev work here)

design/          → Game rules (source of truth, Dev work here)
docs/            → APIs and architecture
examples/        → Reusable references for IA or Dev
```

---

# 🔄 Development flow

```text
Contract (dev) → Task (dev) → Test (IA) → Fail → Code (IA) → Pass → Refactor (IA) → Update state (IA)
```

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
* Aider (AI CLI Agent)
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
IA/
├── context.md      → Operational rules
├── rules.md        → Global constraints
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
IA/tasks/
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
