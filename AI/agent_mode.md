#  AI Agent Router

This file defines the specialized agent roles and the corresponding bootstrap files to be used. Use this as a reference to switch between operational modes.

---

## 👥 Specialized Roles

### 🏛️ Architect (Planner)
*Focus: System design, GDD updates, Contract formalization, and Task decomposition.*
- **FULL MODE:** `AI/agents/architect_full.md`
- **FAST MODE:** `AI/agents/architect_fast.md`

### 🧪 Tester (TDD Guardian)
*Focus: Writing failing tests, executing test suites, and logging results.*
- **FULL MODE:** `AI/agents/tester_full.md`
- **FAST MODE:** `AI/agents/tester_fast.md`

### 💻 Developer (Executor)
*Focus: Implementing minimal code to pass tests and refactoring.*
- **FULL MODE:** `AI/agents/developer_full.md`
- **FAST MODE:** `AI/agents/developer_fast.md`

---

## 🚀 Selection Logic

To initialize an agent, provide the following command to the AI Chat:

> "Initialize as **[ROLE]** in **[MODE]** mode."

**Example:**
*"Initialize as Architect in FULL mode to plan the inventory system."*

---

## 🚨 Workflow Rule
1. **Architect** creates the `design/contracts` and `AI/tasks/XXX.md`.
2. **Tester** writes the failing test and updates `AI/logs/`.
3. **Developer** modifies the `game/` folder until tests pass.