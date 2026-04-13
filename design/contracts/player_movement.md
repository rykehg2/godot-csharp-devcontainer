# Contract: Player Movement

## Scenario: Horizontal Movement

Given a player character
When the player receives a horizontal input of 1.0 (Right)
Then the character's velocity.x should be positive

Given a player character
When the player receives a horizontal input of -1.0 (Left)
Then the character's velocity.x should be negative