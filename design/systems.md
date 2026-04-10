# 🧠 Systems

## 🎮 Player System

Responsible for:

* Movement
* Player state
* Input

---

## 🧪 Core Logic (C#)

Responsible for:

* Business rules
* Movement calculation
* Game decisions

⚠️ Must not depend directly on Godot

---

## 🎮 Godot Layer

Responsible for:

* Rendering
* Nodes
* Scene

---

## 🔗 Comunicação

* Godot → calls C# logic
* C# → returns result
* Communication via simple methods or signals

---

## 🧩 Princípios

* Clear separation between engine and logic
* Tests focused on the C# layer