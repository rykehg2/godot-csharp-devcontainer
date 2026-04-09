# 📌 Task ID: 001-setup-platformer-basics

**status**: TODO  
**priority**: MEDIUM  
**type**: FEATURE  
**created_at**: 2026-04-09T00:55:05  
**updated_at**: 2026-04-09T00:55:05  

---

# 🎯 Goal

Configurar a estrutura básica de um jogo de plataforma no Godot 4, estabelecendo um cenário estático e um personagem funcional com script de movimento.

---

# 📖 Context

Esta tarefa representa o ponto de partida do projeto conforme demonstrado nas fontes. Ela define os componentes essenciais de física (corpo estático para o chão e corpo de personagem para o player) necessários para qualquer interação subsequente no jogo.

---

# 🧪 Expected Behavior

*   **Cenário:** Um `StaticBody2D` com um `Sprite2D` e um `CollisionShape2D` (RectangleShape2D) devidamente redimensionado para servir de chão.
*   **Jogador:** Um `CharacterBody2D` contendo seu próprio `Sprite2D` e `CollisionShape2D`.
*   **Movimentação:** Um script associado ao jogador que utilize o template padrão do Godot, com um ajuste específico de valor para -600 (provavelmente Jump Velocity) para permitir o teste de movimentação.
*   **Interação:** Ao iniciar o teste, o personagem deve interagir fisicamente com o nível criado.

---

# 🧪 Test Requirements

### Required Tests:

*   [ ] **Core behavior:** Verificar se o `CharacterBody2D` colide corretamente com o `StaticBody2D`.
*   [ ] **Core behavior:** Validar se o script de movimento é carregado e responde aos comandos básicos do template.
*   [ ] **Edge cases:** Garantir que as formas de colisão (`RectangleShape2D`) cobrem adequadamente os sprites visualizados.

---

### Test Type:

*   Use Godot tests ONLY if:
    *   Engine interaction is required (Node, Scene, Physics, Signals) — **Necessário para validar colisões e hierarquia de nós.**

---

# 📂 Scope

### ✅ Allowed:

*   Criação de nós `Node2D`, `StaticBody2D`, `CharacterBody2D`, `Sprite2D` e `CollisionShape2D`.
*   Criação e edição do script principal do personagem.
*   Importação e atribuição de assets de imagem aos sprites.

---

### ❌ Restricted:

*   Configurações de input complexas fora do template padrão.
*   Sistemas de partículas ou UI avançada.

---

# 🚫 Out of Scope

*   Implementação de animações via `AnimationPlayer`.
*   Criação de múltiplos níveis ou transições de cena.
*   Integração de áudio.

---

# 🔁 Execution Plan (TDD)

1.  Write failing test (verificar existência do jogador na cena).
2.  Run tests → MUST fail.
3.  Implement minimal code (montar a hierarquia de nós descrita no vídeo).
4.  Run tests → MUST pass.
5.  Refactor safely (ajustar formas de colisão e valores do script).

---

# 📊 Progress

**current_step**: 0  
**last_action**: none

---

# 🧠 Decisions

*   **Uso de RectangleShape2D:** Escolhido para simplificar a colisão inicial tanto do chão quanto do player.
*   **Ajuste de Script:** Alterar o valor padrão para -600 para garantir que o pulo/movimento seja perceptível durante o teste inicial.

---

# ⚠️ Issues

*   Nenhuma reportada até o momento.

---

# 📚 References

*   Transcrição do vídeo: "Create A Platformer Game in 20 SECONDS! (Godot 4)".

---

# 🧠 Design Alignment

A implementação segue estritamente a hierarquia e o fluxo de trabalho nativo do Godot 4 para prototipagem rápida de plataformas, conforme orientado pelas fontes.

---

# ✅ Definition of Done

*   [ ] Nós `StaticBody2D` e `CharacterBody2D` configurados corretamente.
*   [ ] Formas de colisão ajustadas ao tamanho dos sprites.
*   [ ] Script de movimento criado e valor de "-600" aplicado.
*   [ ] Teste de execução realizado com sucesso, confirmando que o player não atravessa o chão.

---

# 🧾 Final Notes (AFTER DONE)

*(A preencher após a conclusão da tarefa)*