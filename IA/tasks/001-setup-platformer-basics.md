# 📌 Task ID: 001-setup-platformer-basics

**status**: TODO  
**priority**: MEDIUM  
**type**: FEATURE  
**created_at**: 2026-04-09T00:55:05  
**updated_at**: 2026-04-09T00:55:05  

---

# 🎯 Goal

Setup the basic structure of a platformer game in Godot 4, establishing a static environment and a functional character with a movement script.

---

# 📖 Context

This task represents the project's starting point as demonstrated in the sources. It defines the essential physics components (static body for the ground and character body for the player) required for any subsequent game interactions.

---

# 🧪 Expected Behavior

*   **Environment:** A `StaticBody2D` with a `Sprite2D` and a `CollisionShape2D` (RectangleShape2D) properly resized to serve as the ground.
*   **Player:** A `CharacterBody2D` containing its own `Sprite2D` and `CollisionShape2D`.
*   **Movement:** A script associated with the player using the standard Godot template, with a specific adjustment of -600 (Jump Velocity) to allow movement testing.
*   **Interaction:** Upon starting the test, the character must physically interact with the level.

---

# 🧪 Test Requirements

### Required Tests:

*   [ ] **Core behavior:** Verify that `CharacterBody2D` (Player) and `StaticBody2D` (Ground) nodes exist in the main scene.
*   [ ] **Core behavior:** Verify that `CharacterBody2D` collides correctly with `StaticBody2D`.
*   [ ] **Core behavior:** Validate that the movement script is loaded and responds to basic template commands.
*   [ ] **Edge cases:** Ensure collision shapes (`RectangleShape2D`) adequately cover the visualized sprites.

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

1.  Write failing test (verify player existence in scene).
2.  Run tests → MUST fail. (Expected: Scene not found or nodes not found)
3.  Implement minimal code (assemble the node hierarchy).
4.  Run tests → MUST pass.
5.  Refactor safely (adjust collision shapes and script values).

---

# 📊 Progress (Updated)

**current_step**: 1
**last_action**: Task initialized.
**next_action**: Write failing test (verify player existence in scene).

---

# 🧠 Decisions

*   **Use of RectangleShape2D:** Chosen to simplify initial collision for both the ground and the player.
*   **Script Adjustment:** Change default value to -600 to ensure jump/movement is noticeable during initial testing.

# ⚠️ Issues

*   None reported so far.

---

# 📚 References

*   Video transcript: "Create A Platformer Game in 20 SECONDS! (Godot 4)".

---

# 🧠 Design Alignment

The implementation strictly follows the Godot 4 native hierarchy and workflow for rapid platformer prototyping.

---

# ✅ Definition of Done

*   [ ] `StaticBody2D` and `CharacterBody2D` nodes configured correctly.
*   [ ] Collision shapes adjusted to sprite size. (Covered by test requirement)
*   [ ] Movement script created and "-600" value applied. (Covered by test requirement)
*   [ ] Execution test successfully performed, confirming the player does not fall through the floor. (Covered by test requirement)

---

# 🧾 Final Notes (AFTER DONE)

*(A preencher após a conclusão da tarefa)*