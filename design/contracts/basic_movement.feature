Feature: Basic Platformer Movement
  As a game designer
  I want the player to interact with gravity and the ground
  So that the foundation for platforming is established

  Background:
    Given a scene containing a "Player" (CharacterBody2D)
    And a "Ground" (StaticBody2D) below the Player

  Scenario: Gravity affects the player
    When the game starts
    Then the Player should have a downward velocity due to gravity

  Scenario: Collision with ground
    When the Player contacts the Ground
    Then the Player's vertical velocity should become zero
    And the Player should not penetrate the Ground geometry

  Scenario: Jumping impulse
    When the jump action is triggered
    Then the Player should have a vertical velocity of -600.0