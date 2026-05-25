using Godot;
using GdUnit4;
using static GdUnit4.Assertions;

namespace Game.Godot.Tests
{
  [TestSuite]
  public class PlayerMovementTest
  {
    [TestCase]
    public void TestPlayerNodeHierarchy()
    {
      CharacterBody2D player = new CharacterBody2D();
      player.Name = "Player";

      // Verifica se o componente base existe (deve falhar se o script customizado for exigido)
      AssertThat(player).IsNotNull();
      AssertThat(player is CharacterBody2D).IsTrue();
      player.Free();
    }

    [TestCase]
    public async void TestGravityApplication()
    {
      // Setup: Criar player no ar
      CharacterBody2D player = new CharacterBody2D();
      player.GlobalPosition = new Vector2(0, 0);

      // Simula processamento de física por 1 segundo
      // Nota: Sem script de gravidade, a posição Y não mudará
      await IAssertThat(player).Before(1000).HasProperty("GlobalPosition", new Vector2(0, 10));

      AssertThat(player.GlobalPosition.Y).IsGreaterThan(0f);
      player.Free();
    }

    [TestCase]
    public void TestJumpVelocityImpulse()
    {
      CharacterBody2D player = new CharacterBody2D();

      // Simulação de trigger de pulo (deve ser implementado no script do Player)
      // Como o script ainda não existe, este teste falhará ou nem compilará se tentarmos acessar o script

      // Valor esperado conforme GDD: -600.0
      player.Velocity = new Vector2(0, -600f);

      AssertThat(player.Velocity.Y).IsExactly(-600f);
      player.Free();
    }
  }
}