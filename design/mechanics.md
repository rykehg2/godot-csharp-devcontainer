# Mecânicas do Jogo

Este documento descreve as mecânicas fundamentais do jogo, servindo como a base para a implementação e o comportamento esperado.

## 1. Personagem do Jogador (Player Character)

O jogador é a entidade principal controlada pelo usuário, representado por um `CharacterBody2D` no Godot.

### 1.1. Movimento Básico

O jogador pode se mover horizontalmente e verticalmente (pulo) em resposta a inputs.
Detalhes específicos do movimento são definidos no contrato `/design/contracts/player_movement.md`.

### 1.2. Gravidade

O jogador está sujeito à gravidade, o que o faz cair quando não está em contato com uma superfície sólida. A gravidade deve ser configurável e consistente.

### 1.3. Colisão

O jogador interage fisicamente com o ambiente, colidindo com superfícies sólidas como o chão e paredes.
A colisão com o chão é essencial para o movimento, para evitar que o jogador caia infinitamente e para permitir ações como o pulo.
Detalhes específicos da colisão com o ambiente são definidos no contrato `/design/contracts/platformer_collision.md`.

## 2. Ambiente (Environment)

O ambiente é composto por elementos estáticos e interativos que o jogador pode interagir.

### 2.1. Chão (Ground)

O chão é um elemento fundamental do ambiente, representado por um `StaticBody2D`. Ele serve como a superfície primária onde o jogador pode andar, correr e pular. O chão deve possuir uma forma de colisão (`CollisionShape2D`) que impede o jogador de atravessá-lo.

## 3. Interações Físicas

As interações físicas são baseadas no sistema de física 2D do Godot. Entidades com `CollisionShape2D` interagem de acordo com suas propriedades de corpo (e.g., `CharacterBody2D` vs `StaticBody2D`), respeitando as leis de física configuradas no projeto.