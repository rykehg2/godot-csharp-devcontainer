# 🤖 AI Context – Godot C# TDD

This file defines how any AI agent should interact with this project.

# 🧠 Pre-Implementation Checklist

Before writing code:

1. Check `/design/contracts` → expected behavior
2. Check `/examples` → reusable patterns
3. Check `/docs` → external constraints

Rules:

* Prefer reuse over new code
* Do not reinvent existing solutions
* Do not guess behavior

---

# 🎯 Objective

* Maintain a clean, testable, and modular codebase
* Follow **Test-Driven Development (TDD)**
* Ensure all changes are verifiable via CLI
* Keep the project runnable in a headless environment

---

# 📜 Contract Authority Rule

/design/contracts.md defines the expected system behavior.

Tasks must:

* Implement contracts
* Or extend contracts (when adding new behavior)

Tasks must NOT:

* Contradict existing contracts
* Introduce behavior not defined in contracts without updating them

---

# 📌 Task System (CRITICAL)

## Active Task

The current task is defined in:

```text
IA/task.md
```

Which points to:

```text
IA/tasks/<task-file>.md
```

---

## Task Rules

* ONLY work on the active task

* DO NOT create new tasks unless instructed

* DO NOT modify:

  * Goal
  * Scope
  * Expected Behavior

* You MAY update:

  * Progress
  * Decisions
  * Issues
  * status

---

## Execution Model

* Execute **ONE STEP per iteration**
* NEVER complete the entire task at once
* ALWAYS update task.md and state.md after each step

---

# 🔄 Contract-Driven TDD Flow


---

# 🧠 Pre-Implementation Rules

Before writing code:

1. Check `/examples` for similar implementations
2. Reuse patterns whenever possible
3. Avoid reinventing solutions
4. Check `/design` for expected behavior
5. Check `/docs` for external contracts

---

# ⚙️ Environment

## Run project

```bash
godot --headless --path game
```

---

## Run tests (.NET - FAST)

```bash
dotnet test
```

Used for:

* Business logic
* Pure C# code
* Algorithms
* Game rules

---

## Run tests (Godot - INTEGRATION)

```bash
godot --headless --path game -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a run
```

Used for:

* Scenes
* Nodes
* Signals
* Physics
* Engine behavior

---

## Run ALL tests

```bash
dotnet test && godot --headless --path game -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a run
```

---

## Build

```bash
dotnet build
```

---

## Run validation

```bash
dotnet build && dotnet test && godot --headless --path game -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a run
```

---

# 🧪 Testing Strategy

## 🧠 .NET Tests (PRIMARY)

* Default choice
* Fast feedback loop
* Used for most features

---

## 🎮 Godot Tests (SECONDARY)

* Only when engine interaction is required
* Slower but validates real behavior

---

# 🧪 Testing Rules (TDD)

* ALWAYS write tests before implementation (after contract is defined)
* ALWAYS start with .NET tests
* ONLY use Godot tests when necessary
* NEVER implement without a failing test

Tests must:

* Fail before implementation
* Pass after implementation

---

## Test Quality Rules

* Avoid trivial tests
* Focus on behavior, not implementation
* Tests must provide real value

---

# 🧠 Test Selection Rule

* Default → .NET tests
* Use Godot tests ONLY for engine behavior

---

# 🧱 Code Guidelines

* Prefer small, modular classes and functions
* Avoid tight coupling
* Use signals instead of direct dependencies
* Keep gameplay logic in C#
* Separate:

  * Scene (Godot)
  * Logic (C#)

---

## Simplicity Rule

* Avoid overengineering
* Do not introduce abstractions without need
* Prefer simplest working solution

---

# 🔁 XP Loop

1. Write .NET test (FAIL)
2. Run `dotnet test`
3. Implement minimal code (PASS)
4. Run tests again
5. Refactor
6. If needed → add Godot test

---

# 🔁 Execution Flow (TASK-DRIVEN)

For each iteration:

### 1. Read

* context.md
* rules.md
* task.md
* state.md
* active task file

---

### 2. Analyze

* Understand goal
* Check scope
* Identify current step

---

### 3. Execute ONE step

Examples:

* Create test
* Run tests
* Implement minimal logic
* Refactor

---

### 4. Validate

* Run tests
* Confirm expected result

---

### 5. Update

Update:

* task (Progress, Decisions, Issues, status)
* state.md

---

### 6. Stop

Do NOT continue to next step automatically

---

# 🚨 Constraints

* Do NOT break existing functionality
* Do NOT remove tests
* Do NOT introduce unused code
* Do NOT hardcode values unnecessarily
* Do NOT assume behavior — verify via CLI
* Do NOT create files or folders outside defined project structure
* Do NOT invent paths that do not exist
* Always verify structure before writing files

---

# 🎯 Scope Control

# 🎯 Authority Order (CRITICAL)

1. Contracts (/design/contracts) → define system behavior
2. Task → defines what to implement now
3. Tests → validate behavior

---

## Rules

* Tasks must follow contracts
* If task conflicts with contracts:

  - Update contract FIRST
  - Then proceed with task

* Never implement behavior not defined in contracts

Do NOT:

* Add extra features
* Anticipate future requirements
* Expand scope

---

# 📂 Project Knowledge

## Design

`/design` defines game behavior.

If implementation conflicts:

* Update code
* OR propose design change

---

## Documentation

`/docs` defines:

* APIs
* Architecture
* Integrations

Never guess external behavior.

---

## Examples

`/examples` contains reusable patterns.

* Always check before implementing
* Prefer reuse over new code

---

# 🔄 Design Sync Rule

If code diverges from `/design/contracts`:

* Update code to match contracts
* OR explicitly update contracts first

Never:

* Modify code without updating contracts
* Diverge silently

---

# 🧠 Agent Behavior

* Think step-by-step
* Prefer execution over assumptions
* Use CLI to validate
* Keep changes minimal

---

# ⚠️ Important

* Never skip failing test step
* Never assume correctness
* Always update state.md

---

# 🧪 Validation Checklist

Before finishing:

* [ ] Code compiles
* [ ] Tests pass (.NET)
* [ ] Tests pass (Godot if needed)
* [ ] No runtime errors
* [ ] No unused imports
* [ ] No regressions

---

# 📌 Notes

* This project is designed for **AI-assisted execution**
* All actions must be reproducible via CLI
