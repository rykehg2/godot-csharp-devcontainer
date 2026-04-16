# 🧠 Como usar seu sistema na prática (simples mesmo)

Pense assim:

> Você NÃO vai usar tudo sempre.
> Você vai usar **camadas conforme necessário**.

---

# ⚡ Fluxo real (dia a dia)

# ⚙️ Configuração Inicial (API Keys)

Antes de abrir o container, você precisa garantir que as chaves de API estejam disponíveis. O sistema está configurado para ler as variáveis de ambiente da sua máquina local.

1. **No Linux/Mac:** Adicione ao seu `~/.bashrc` ou `~/.zshrc`:
   `export GEMINI_API_KEY="sua_chave_aqui"`
2. **No Windows (PowerShell):** `$env:GEMINI_API_KEY="sua_chave_aqui"`
3. **Alternativa:** Crie um arquivo `.env` na raiz do projeto (use o `.env.example` como base). O VS Code carregará essas variáveis ao iniciar o Dev Container.

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

## 💻 Modo CLI com OpenCode (Recomendado) 
Para execução autônoma e direta no terminal, use o script de conveniência: 

```bash
 TODO
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
| Decompor tarefas grandes | **Architect** | ⚡ FAST |
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

```bash
dotnet test
```

ou

```bash
godot --headless ...
```

---

## 5. Atualiza estado

IA ou você atualiza:

```
state.md
```

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
