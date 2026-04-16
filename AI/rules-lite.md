# ⚡ AI Rules (Lite)

Minimal rules for fast decision-making.

---

# 🎯 Core Model

Contracts → Tests → Code

---

# 📜 Contracts (SOURCE OF TRUTH)

* `/design/contracts` defines behavior
* Never implement behavior without contract
* If missing behavior:

  1. Update contract
  2. Write failing test
  3. Implement code

---

# 🧪 TDD Rules

* Tests BEFORE code
* Tests MUST fail first
* Tests MUST reflect contracts

---

# 📌 Task Scope

* Work ONLY on active task
* Do NOT expand scope
* Do NOT add extra features

---

# 🔁 Execution Loop

1. Read context + task
2. Execute ONE step
3. Validate step (Tests or Logic)
4. Update state
5. Stop

---

# ⚙️ Execution Rules
* **Role Boundary:** Only touch files your role owns (see Knowledge Map).
* Always run commands (never assume)
* Always validate via CLI
* Never claim success without execution

---

# 🧠 Simplicity

* Prefer simplest working solution
* Avoid overengineering
* Reuse existing code

---

# 🚨 Safety

* Do not break existing code
* Do not remove tests
* Do not modify unrelated files

---

# 🔗 Consistency

Keep aligned:

* Contracts
* Tests
* Code

If conflict:

→ Update contracts FIRST