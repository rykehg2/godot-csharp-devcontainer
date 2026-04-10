# 🤖 Godot C# AI Dev Environment (XP + TDD)

> Execution-driven development environment powered by AI + TDD

---

# 🚀 Quick Start (TL;DR)

```bash
# 1. Suba o container
Dev Containers: Reopen in Container

# 2. Rode validação
dotnet build
dotnet test

# 3. (Opcional) Testes Godot
bash .devcontainer/gdunit.sh -a res://test/
````

* IDEs errors like "GDScript server not connected" are expected.

---

# 🧠 Como trabalhar neste projeto

1. Leia:

   * `IA/context.md`
   * `IA/task.md`

2. Siga o fluxo:

   * Criar teste (FAIL)
   * Rodar testes
   * Implementar mínimo (PASS)
   * Refatorar
   * Atualizar `state.md`

👉 Tudo é guiado por **TDD + Tasks**

---

# 📂 Estrutura principal

```
.devcontainer/   → Ambiente reprodutível (Docker)
game/            → Projeto Godot
tests/           → Testes .NET

IA/              → Sistema de IA (contexto, tasks, estado)

design/          → Regras do jogo (fonte de verdade)
docs/            → APIs e arquitetura
examples/        → Referências reutilizáveis
```

---

# 🔁 Fluxo de desenvolvimento

```text
Contract → Task → Test → Fail → Code → Pass → Refactor → Update state
```

---

# 🎯 Filosofia

✔ Comportamento
✔ Testes
✔ Execução via CLI
✔ Pequenas iterações
✔ IA como executor, não como decisor

---

# 📚 Documentação completa

---

# 🔄 Atualização – Dev Container + IA (XP + TDD)

Este projeto implementa um ambiente completo para:

* 🤖 Desenvolvimento assistido por IA
* 🧪 Test-Driven Development (TDD)
* 🔁 Fluxo baseado em Extreme Programming (XP)

---

# 🐳 Container (Fonte da Verdade)

## 🎯 Objetivo

Ambiente:

* Reprodutível
* Headless
* Automatizado
* Independente de IDE

> 🔥 Container = fonte da verdade
> IDE = ferramenta auxiliar

---

## ⚙️ Stack

* Fedora 43
* .NET 8
* Godot 4 (mono, headless)
* GDUnit4
* SCons (toolchain Godot)
* Toolchain nativa (gcc, clang, cmake, ninja)

---

## 🧱 Estrutura

```
.devcontainer/
├── Dockerfile
├── devcontainer.json
├── postCreate.sh
├── run_post_create.sh
└── tests/
```

---

## 🚀 Inicialização automática

Ao subir o container:

```bash
postCreate.sh
```

Cria automaticamente:

* Projeto Godot
* Solution C#
* Projeto principal (Game.Core)
* Projeto de testes (xUnit)
* Integração com GDUnit4

---

## 🔍 Logs

```bash
.devcontainer/tmp/postCreate.log
```

---

# 🤖 Sistema de IA

```
IA/
├── context.md      → Regras operacionais
├── rules.md        → Restrições globais
├── task.md         → Task ativa
├── state.md        → Memória
└── tasks/          → Histórico de tasks
```

---

## 🧠 context.md

Define:

* Como rodar projeto
* Como testar
* Regras de TDD
* Fluxo XP

---

## 📏 rules.md

Define:

* Restrições globais
* Qualidade de código
* Regras de execução

---

## 📌 task.md

Define:

* O que deve ser feito AGORA

---

## 🧠 state.md

Armazena:

* Progresso
* Decisões
* Problemas

---

# 🧩 Sistema de Tasks

```
IA/tasks/
├── 000-template.md
├── 001-feature-x.md
├── 002-bugfix-y.md
```

---

## 🔁 Modelo

Cada task segue:

```text
Goal → Expected Behavior → Tests → Implementation → Done
```

---

## ⚠️ Regras

* Trabalhar em UMA task por vez
* Não expandir escopo
* Atualizar progresso continuamente

---

# 🎮 Design do Jogo

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

## 🧠 Fonte da verdade

👉 `/design` define comportamento do jogo

---

## 📜 Contracts (BDD-like)

```
design/contracts/
```

Define comportamentos como:

```text
Given / When / Then
```

---

## ⚠️ Regra

Se código ≠ design:

* Corrigir código
  **OU**
* Atualizar design

Nunca divergir silenciosamente

---

# 📚 Documentação técnica

```
docs/
├── api/
├── architecture/
└── integrations/
```

---

## Uso

* APIs externas → `/docs/api`
* Arquitetura → `/docs/architecture`

---

# 🧪 Exemplos reutilizáveis

```
examples/
├── godot/
├── csharp/
└── patterns/
```

---

## Regra

Antes de implementar:

👉 Verificar `/examples`

---

# 🧪 Estratégia de Testes

## 🧠 .NET (PRIORIDADE)

* Lógica
* Regras
* Algoritmos

```bash
dotnet test
```

---

## 🎮 Godot (SECUNDÁRIO)

* Nodes
* Scenes
* Engine

```bash
godot --headless ...
```

---

# 🔁 XP + TDD Loop

```text
1. Criar teste (FAIL)
2. Rodar testes
3. Implementar mínimo (PASS)
4. Rodar novamente
5. Refatorar
6. Atualizar state.md
```

---

# 🧠 Benefícios

✔ Reprodutibilidade total
✔ Desenvolvimento guiado por testes
✔ IA com contexto controlado
✔ Baixa regressão
✔ Alta previsibilidade

---

# 🚀 Futuro

* CI/CD automático
* Execução contínua de IA
* Testes distribuídos
* Integração com serviços externos

---

# 📌 Conclusão

Este projeto não é apenas um setup de desenvolvimento.

> 🧠 É um sistema completo de execução orientado por IA + TDD + XP

---
