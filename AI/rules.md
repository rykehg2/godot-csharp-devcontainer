# 📏 AI Rules

Global rules that must always be followed.

---

# ❗ Core Rules

* Always follow TDD
* Never skip validation steps
* Never assume correctness without running tests
* Always prefer simple solutions
* **Role Authority:** Respect folder ownership (Architect: `design/`, Tester: `tests/`, Developer: `game/`).

---

# 👥 Role Ownership

* **Architect:** Owns the "What" (Contracts, GDD) and "Decomposition" (Tasks).
* **Tester:** Owns the "Validation" (Tests, Logs, Work Logs).
* **Developer:** Owns the "Implementation" (Production code in `game/`).

---

# 🧪 Testing

* Tests are mandatory before implementation
* Do not delete failing tests
* Fix code, not tests (unless test is wrong)

---

# 🧱 Code Quality

* Keep code readable and maintainable
* Avoid duplication
* Prefer composition over inheritance

---

# ⚙️ Execution

* Use CLI commands whenever possible
* Do not simulate results — execute them

---

# 🚨 Safety

* Do not modify unrelated files
* Do not introduce breaking changes
* Do not overwrite user work without reason

# 🔁 Execution Rules

* Always follow the **Assembly Line Flow** defined in `context.md`.
* Never jump directly to implementation
* Never skip test execution
* Always confirm test failure before coding

---

# 🧠 Decision Rules

* If unsure → inspect codebase
* If failing → debug using logs
* If ambiguous → choose simplest solution

---

# ⚡ Performance Rule

* Prefer small iterations over large changes
* Keep feedback loop fast

---

# 🔍 Code Discovery Rule

Before implementing any new code:

1. Search for existing implementations
2. Check for similar classes or patterns
3. Reuse or extend existing code when possible

Never duplicate logic that already exists.

---

# 🧪 Execution Integrity Rule

* Never assume test results
* Always execute commands
* Never claim tests passed without running them

---

# 🐛 Debugging Rule

When tests fail:

1. Read error output carefully
2. Identify root cause
3. Do NOT guess fixes
4. Apply minimal correction
5. Re-run tests

Avoid trial-and-error changes.

---

# 🔗 Consistency Rule

Ensure consistency between:
* Code
* Tests
* Design (/design)
* Documentation (/docs)

**Order of Correction:**
1. If Design is wrong: The **Architect** must update `/design/contracts`.
2. If Tests are missing: The **Tester** must update `/tests`.
3. If Code is wrong: The **Developer** must update `/game`.

---

# 🧱 Overengineering Rule

Do NOT:

* Add abstractions prematurely
* Introduce patterns without need
* Create generic solutions for specific problems

---

# 🧠 AI Behavior Constraints

* Do not hallucinate APIs or methods
* Do not invent behavior without validation
* Prefer explicit over implicit logic