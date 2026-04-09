# 🧠 Systems

## 🎮 Player System

Responsável por:

* Movimento
* Estado do jogador
* Entrada (input)

---

## 🧪 Core Logic (C#)

Responsável por:

* Regras de negócio
* Cálculo de movimento
* Decisões do jogo

⚠️ Não deve depender diretamente de Godot

---

## 🎮 Godot Layer

Responsável por:

* Renderização
* Nodes
* Cena

---

## 🔗 Comunicação

* Godot → chama lógica C#
* C# → retorna resultado
* Comunicação via métodos simples ou signals

---

## 🧩 Princípios

* Separação clara entre engine e lógica
* Testes focados na camada C#