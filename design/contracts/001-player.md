# Contract: Player Platformer Base (Task 001)

## Scenario: Lateral Movement
**Given** the player receives direction inputs (left/right)
**When** the input is processed in `_PhysicsProcess`
**Then** the `Velocity.X` must be changed based on direction and default speed.

## Scenario: Jump Velocity
**Given** the player is on the ground (`IsOnFloor()`)
**When** the jump command is triggered
**Then** the vertical velocity (`Velocity.Y`) must be set exactly to `-600`.

## Scenario: Gravity Application
**Given** the player is not in contact with the ground
**When** time passes (`delta`)
**Then** the project gravity must be applied to `Velocity.Y`.
**And** the player must move toward the `StaticBody2D` (ground).