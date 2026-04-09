# Contrato: Colisão do Jogador com o Chão

Este contrato define o comportamento esperado para a interação de colisão entre o jogador e as superfícies de chão no ambiente.

## Cenário: Colisão Básica com o Chão

**Dado** que o jogador (`CharacterBody2D`) está em uma posição vertical acima de uma superfície de chão (`StaticBody2D`)
**E** o jogador está sujeito à gravidade, movendo-se para baixo
**E** o chão possui uma `CollisionShape2D` configurada e ativa

**Quando** o jogador entra em contato com a superfície de colisão do chão
**Então** o jogador deve parar seu movimento vertical descendente
**E** o jogador não deve atravessar a superfície do chão

## Cenário: Colisão com o Chão após um Pulo

**Dado** que o jogador (`CharacterBody2D`) está no ar após um pulo
**E** o jogador está caindo em direção ao chão
**E** o chão possui uma `CollisionShape2D` configurada e ativa

**Quando** o jogador entra em contato com a superfície de colisão do chão
**Então** o jogador deve parar seu movimento vertical descendente