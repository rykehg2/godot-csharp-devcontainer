# 🤖 Godot C# AI Dev Environment (XP + TDD)

> Execution-driven development environment powered by AI + TDD

---

# 🚀 Quick Start (TL;DR)

```bash
# 1. Start container
Dev Containers: Reopen in Container

## 🔑 API Keys
Ensure your `GEMINI_API_KEY` or `ANTHROPIC_API_KEY` is set in your host environment or a `.env` file before starting the container.

# 2. Choose Interaction (CLI vs Chat)
# For CLI (Aider):
bash IA/bin/aider-task.sh

# For Chat: Follow guidance in how2use.md

# 2. Run validation
dotnet build
dotnet test

# 3. (Optional) Godot tests
bash .devcontainer/gdunit.sh -a res://test/
````

* IDEs errors like "GDScript server not connected" are expected.

---

# 🧠 How to work on this project

1. Read:

   * `IA/context.md`
   * `IA/task.md`

2. Follow the flow:

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
game/            → Godot project
tests/           → .NET tests

IA/              → AI system (context, tasks, state)

design/          → Game rules (source of truth)
docs/            → APIs and architecture
examples/        → Reusable references
```

---

# 🔄 Development flow

```text
Contract → Task → Test → Fail → Code → Pass → Refactor → Update state
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

* Fedora 43
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
