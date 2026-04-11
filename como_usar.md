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
You are working in a structured AI-driven dev environment. Analize the hole project, start with README.md.

Follow:
- TDD
- XP loop
- task-driven execution

I will tell you the mode (FAST or FULL).
```

---

## 💻 Modo CLI com Aider (Recomendado) 
Para execução autônoma e direta no terminal, use o script de conveniência: 

```bash
bash IA/scripts/aider-task.sh 
```

## Troca de Modelos: 
O modelo padrão é definido no devcontainer.json. Para trocar rapidamente no terminal:
```
AIDER_MODEL=$MODEL_CLAUDE bash IA/scripts/aider-task.sh
```

---

## 🥇 Loop padrão (90% do tempo)

Você só precisa mandar isso pro ChatGPT:

```
Use FAST MODE

Load:
- IA/rules-lite.md
- IA/context.md (partial)
- IA/task.md

Execute next step.
```

👉 E pronto.

---

## 💬 Exemplo real

Você:

```
Use FAST MODE

Task:
(Add descrição ou só confie no task.md)

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
Use FULL MODE

Load:
- rules-lite.md
- rules.md
- context.md
- task.md
- state.md

Analyze and execute next step
```

---

# 🔥 Regra de ouro

| Situação              | Modo    |
| --------------------- | ------- |
| Criar feature simples | ⚡ FAST |
| Criar classe          | ⚡ FAST |
| Ajustar teste         | ⚡ FAST |
| Bug estranho          | 🧠 FULL |
| Refatoração           | 🧠 FULL |
| Integração Godot      | 🧠 FULL |

---

# 🧩 Como usar com seu `task.md`

Você já fez a melhor escolha: **task ativa + histórico**

Então seu fluxo vira:

---

## 1. Definir task

Você edita:

```
IA/task.md
```

Apontando para:

```
IA/tasks/001-player-movement.md
```

---

## 2. Rodar IA

No ChatGPT:

```
Use FAST MODE
Execute next step
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
