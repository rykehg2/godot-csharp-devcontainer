# Game Mechanics

This document describes the fundamental game mechanics, serving as the basis for implementation and expected behavior.

## 1. Player Character

The player is the main entity controlled by the user, represented by a `CharacterBody2D` in Godot.

### 1.1. Basic Movement

The player can move horizontally and vertically (jump) in response to inputs.
Specific movement details are defined in the contract `/design/contracts/player_movement.md`.

### 1.2. Gravity

The player is subject to gravity, which causes them to fall when not in contact with a solid surface. Gravity must be configurable and consistent.

### 1.3. Collision

The player physically interacts with the environment, colliding with solid surfaces such as ground and walls.
Collision with the ground is essential for movement, to prevent the player from falling infinitely and to allow actions like jumping.
Specific collision details with the environment are defined in the contract `/design/contracts/platformer_collision.md`.

## 2. Environment

The environment consists of static and interactive elements that the player can interact with.

### 2.1. Ground

The ground is a fundamental element of the environment, represented by a `StaticBody2D`. It serves as the primary surface where the player can walk, run, and jump. The ground must have a collision shape (`CollisionShape2D`) that prevents the player from passing through it.

## 3. Physical Interactions

Physical interactions are based on Godot's 2D physics system. Entities with `CollisionShape2D` interact according to their body properties (e.g., `CharacterBody2D` vs `StaticBody2D`), respecting the physics laws configured in the project.