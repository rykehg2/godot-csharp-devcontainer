# Contrato: Player Platformer Base (Task 001)

## Cenário: Movimento Lateral
**Dado** que o jogador recebe inputs de direção (esquerda/direita)
**Quando** o input é processado no `_PhysicsProcess`
**Então** o `Velocity.X` deve ser alterado com base na direção e na velocidade padrão.

## Cenário: Pulo (Jump Velocity)
**Dado** que o jogador está no chão (`IsOnFloor()`)
**Quando** o comando de pulo é acionado
**Então** a velocidade vertical (`Velocity.Y`) deve ser definida exatamente como `-600`.

## Cenário: Aplicação de Gravidade
**Dado** que o jogador não está em contato com o chão
**Quando** o tempo passa (`delta`)
**Então** a gravidade do projeto deve ser aplicada ao `Velocity.Y`.
**E** o jogador deve se mover em direção ao `StaticBody2D` (chão).