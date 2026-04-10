# Contract: Player Ground Collision

This contract defines the expected behavior for collision interaction between the player and ground surfaces in the environment.

## Scenario: Basic Ground Collision

**Given** the player (`CharacterBody2D`) is in a vertical position above a ground surface (`StaticBody2D`)
**And** the player is subject to gravity, moving downward
**And** the ground has a configured and active `CollisionShape2D`

**When** the player comes into contact with the ground collision surface
**Then** the player must stop their downward vertical movement
**And** the player must not pass through the ground surface

## Scenario: Ground Collision After Jump

**Given** the player (`CharacterBody2D`) is in the air after a jump
**And** the player is falling toward the ground
**And** the ground has a configured and active `CollisionShape2D`

**When** the player comes into contact with the ground collision surface
**Then** the player must stop their downward vertical movement