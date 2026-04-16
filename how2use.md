# 🧠 How to use your system in practice (truly simple)

Think of it this way:

> You WON'T use everything all the time.
> You'll use **layers as needed**.

---
# ⚡ Real workflow (day-to-day)

# ⚙️ Initial Setup (API Keys)

Before opening the container, you must ensure the API keys are available. The system is configured to pull these variables from your local host machine.

1. **Linux/Mac:** Add to your `~/.bashrc` or `~/.zshrc`:
   `export GEMINI_API_KEY="your_key_here"`
2. **Windows (PowerShell):** `$env:GEMINI_API_KEY="your_key_here"`
3. **Alternative:** Create a `.env` file in the project root (use `.env.example` as a template). VS Code will load these variables when starting the Dev Container.

---

## 💻 CLI Mode OpenCode - Recommended

For autonomous execution directly in the terminal, use the convenience script:

'''bash 
 TODO
'''

---

# 🥇 Best way to start

Always start the conversation with:

```
You are working in a structured, specialized AI assembly line. Analyze the project, starting with README.md and AI/agent_mode.md.

Follow:
- TDD
- XP loop
- task-driven execution

- Role-based specialization (Architect, Tester, Developer) 
- TDD & XP loops 
- Task-driven execution 
- I will initialize you in a specific ROLE and MODE.
```
---

## 🥇 Standard Loop (90% of the time)

To start working, choose a role from `AI/agent_mode.md` and send:

```
Initialize as [ROLE] in [MODE] mode. 
Execute next step from AI/task.md.
```

👉 And that's it.

---

## 💬 Real Example

You:

```
Initialize as Developer in FAST mode. 
Task: Fix the jumping gravity in player_movement.md. 
Execute next step.
```

AI will:

* read task
* create test
* run mental logic
* propose code

---

# 🧠 When to use FULL MODE

Only when something breaks or becomes complex:

```
Initialize as Architect in FULL mode. 
Analyze the current project state and refine the contracts for the inventory system.
```

---

# 🔥 Golden Rule

| Situation | Recommended Role | Mode |
| :--- | :--- | :--- |
| Planning new features / Updating GDD | **Architect** | 🧠 FULL |
| Breaking down a big task into files | **Architect** | ⚡ FAST |
| Writing new tests / Fixing test suite | **Tester** | 🧠 FULL |
| Running tests and logging results | **Tester** | ⚡ FAST |
| Implementing logic to pass a test | **Developer** | ⚡ FAST |
| Complex refactoring / Optimization | **Developer** | 🧠 FULL |

---

# 🧩 How to use with your `task.md`

You've already made the best choice: **active task + history**

So your workflow becomes:

---

## 1. Define task

You edit:

```
AI/task.md
```

Pointing to:

```
AI/tasks/001-player-movement.md
```

---

## 2. Run AI

In ChatGPT:

```
Initialize as [Role] in FAST mode. Execute next step
```

---

## 3. AI responds with something like:

* create test
* suggest code
* explain step

---

## 4. You execute in the container

```bash
dotnet test
```

or

```bash
bash AI/gdunit.sh -a res://test/
```

## 5. Update state

AI or you update:

```
state.md
```

---

## 6. Repeat

---

# 🚀 Even more practical way (mental shortcut)

You can literally use it like this:

### 🟢 Minimum Prompt

```
Next step (FAST MODE)
```

👉 because everything else is already in the project

---

# 🧠 VERY important tip

You don't need to paste all the files.

👉 The secret is:

* You've already structured the thinking in the repo 
* Now you just give short commands

---


# 💡 Advanced trick (worth gold)

Create a fixed snippet:

### ⚡ FAST SNIPPET

```
Use FAST MODE
Execute next step from task.md
```

### 🧠 FULL SNIPPET

```
Use FULL MODE
Analyze state and execute next step
```

# ⚠️ Where it can go wrong

Without discipline, this becomes a mess.

Avoid:

❌ asking to "do everything" 
❌ skipping tests 
❌ not updating state.md 
❌ changing tasks in the middle without recording

---

# 🧠 How you should think now

You are no longer using ChatGPT as a:

> “code generator”

You are using it as:

> **an engineering system executor**

---

# 🔥 Brutally simple summary

Your entire system reduces to this:

## Real Loop:

```
1. Define task
2. Prompt: "Next step (FAST)"
3. Execute code
4. Run tests
5. Update state
6. Repeat
```

---
