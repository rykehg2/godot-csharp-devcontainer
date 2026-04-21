# 📏 AI Rules

Global rules that must always be followed.

---

# ❗ Core Rules

* Always follow TDD
* **Zero Noise:** No introductions, politeness, or conclusions. Purely technical output.
* **Semantic Compression:** Use short, dense sentences. Minimize token usage.
* Never skip validation steps
* Never assume correctness without running tests
* Always prefer simple solutions
* **Role Authority:** Respect folder ownership (Architect: `design/`, Tester: `tests/`, Developer: `game/`).
* **Spec-First:** Contracts in `design/contracts/` must be validated before any implementation.

---

# 👥 Role Ownership

* **Architect:** Planner. Owns `design/` and task decomposition. Never writes implementation code.
* **Tester:** Guardian. Owns `tests/`, `AI/logs/`, and final validation. Final judge of the task.
* **Developer:** Executor. Implements minimal logic in `game/`. Requests spec review if contracts are flawed.

---

# 🧪 Testing

* Tests are mandatory before implementation
* **Validation Cycle:** No task is "Done" without `validate.sh`, `xunit.sh`, or `gdunit.sh` approval.
* **Error Analysis:** Report only stack trace and root cause. No long descriptions.
* Do not delete failing tests
* Fix code, not tests (unless test is wrong)

---

# 🧱 Code Quality

* Keep code readable and maintainable
* **Strict Typing:** Always use explicit types in C#. Avoid `var` unless the type is obvious.
* **Pure Naming:** Variable and method names must carry all semantics. No redundant XML comments (///).
* Avoid duplication
* Prefer composition over inheritance

---

# ⚙️ Execution

* Use CLI commands whenever possible
* **Immutable State:** Update `AI/state.md` at the end of every task with factual logs.
* **Living Context:** Keep `AI/context.md` lean; remove obsolete info immediately.
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