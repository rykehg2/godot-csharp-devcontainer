# 🧠 Como usar seu sistema na prática (simples mesmo)

Pense assim:

> Você NÃO vai usar tudo sempre.
> Você vai usar **camadas conforme necessário**.

---

# ⚡ Fluxo real (dia a dia)

# ⚙️ Configuração Inicial (API Keys)

1. Certifique-se de ter o **Docker** e a extensão **Dev Containers** instalada no VS Code.
2. Abra a pasta do projeto e selecione "Reopen in Container".
3. O script `postCreate.sh` configurará automaticamente o ambiente C# e as ferramentas de teste.

---

# 🥇 Melhor forma de começar

Sempre começar conversa com:
```
You are working in a structured, specialized AI assembly line. Analyze the project, starting with README.md and AI/agent_mode.md.

Follow:
- Role-based specialization (Architect, Tester, Developer)
- TDD & XP loops
- Task-driven execution 
- I will initialize you in a specific ROLE and MODE.
```

---

## 💻 Modo CLI com OpenCode & Context-Mode (Recomendado) 
Para execução autônoma e direta no terminal: 

```bash
# Para iniciar uma sessão interativa com o OpenCode:
opencode

# Para gerar o contexto atualizado para uma LLM externa:
context-mode .
```

---

## 🥇 Loop padrão (90% do tempo)

Escolha um papel em `AI/agent_mode.md` e envie:

```
Initialize as [ROLE] in [MODE] mode. 
Execute next step from AI/task.md.
```

👉 E pronto.

---

## 💬 Exemplo real

Você:

```
Initialize as Developer in FAST mode. 
Task: Corrigir a gravidade do pulo em player_movement.md. 
Execute next step.
```

IA vai:

* ler task
* criar teste
* rodar lógica mental
* propor código

---

# 🧠 Quando usar FULL MODE

Só quando algo quebra ou fica complexo:

```
Initialize as Architect in FULL mode. 
Analyze the current project state and refine the contracts for the inventory system.
```

---

# 🔥 Regra de ouro

| Situação | Papel Recomendado | Modo |
| :--- | :--- | :--- |
| Planejar novas features / GDD | **Architect** | 🧠 FULL |
| Decompor tarefas grandes | **Architect** | 🧠 FULL |
| Criar novos testes / Corrigir suíte | **Tester** | 🧠 FULL |
| Rodar testes e atualizar logs | **Tester** | ⚡ FAST |
| Implementar lógica (passar teste) | **Developer** | ⚡ FAST |
| Refatoração complexa / Otimização | **Developer** | 🧠 FULL |

---

# 🧩 Como usar com seu `task.md`

Você já fez a melhor escolha: **task ativa + histórico**

Então seu fluxo vira:

---

## 1. Definir task

Você edita:

```
AI/task.md
```

Apontando para:

```
AI/tasks/001-player-movement.md
```

---

## 2. Rodar IA

No ChatGPT:

```
Initialize as [Role] in FAST mode. Execute next step
```

---

## 3. IA responde algo tipo:

* criar teste
* sugerir código
* explicar passo

---

## 4. Você executa no container

Pergunte ao Tester ou Developer qual script rodar, ou use os padrões:
* `bash AI/script/xunit.sh` (Lógica C#)
* `bash AI/script/gdunit.sh` (Integração Godot)
* `bash AI/script/validate.sh` (Validação completa)

---

## 5. Atualiza estado

A IA deve atualizar seu estado em:
`AI/states/state_[role].md`

E o estado global se necessário:
`AI/state.md`

---

## 6. Repete

---

# 🚀 Forma ainda mais prática (atalho mental)

Você pode literalmente usar assim:

### 🟢 Prompt mínimo

```
Next step (FAST MODE)
```

👉 porque todo o resto já está no projeto

---

# 🧠 Dica MUITO importante

Você não precisa colar todos os arquivos.

👉 O segredo é:

* Você **já estruturou o pensamento no repo**
* Agora só dá comandos curtos

---

# 💡 Truque avançado (vale ouro)

Cria um snippet fixo:

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

---

# ⚠️ Onde pode dar errado

Sem disciplina, isso vira bagunça.

Evite:

❌ pedir "faz tudo"
❌ pular teste
❌ não atualizar state.md
❌ mudar task no meio sem registrar

---

# 🧠 Como você deve pensar agora

Você não está mais usando ChatGPT como:

> “gerador de código”

Você está usando como:

> **executor de um sistema de engenharia**

---

# 🔥 Resumo brutalmente simples

Seu sistema inteiro reduz para isso:

### Loop real:

```
1. Definir task
2. Prompt: "Next step (FAST)"
3. Executar código
4. Rodar testes
5. Atualizar state
6. Repetir
```

---

# Prompts Suggestion
> Initialize as Reviewer in FULL mode. Audit the como_usar.md and how2use.md files to ensure they are 100% consistent with the current project scripts.

>Initialize as Planner in FULL mode. Let's start the discovery for the "Save/Load System" using the roadmap log.