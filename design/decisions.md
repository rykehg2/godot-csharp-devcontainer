# 🧾 Decisions

## 📌 Arquitetura

✔ Gameplay logic em C#  
✔ Godot apenas como camada de engine  

Motivo:
- Facilitar testes
- Melhor separação de responsabilidades

---

## 🧪 Testes

✔ Priorizar testes .NET  
✔ Usar Godot apenas quando necessário  

Motivo:
- Performance
- Feedback rápido

---

## 🧱 Estrutura

✔ Separação:

* Scene (Godot)
* Logic (C#)

Motivo:
- Manutenção
- Clareza

---

## ⚙️ Execução

✔ Tudo deve rodar via CLI  

Motivo:
- Compatível com IA
- Automação

---

## 🔄 Atualizações

Sempre que uma decisão mudar:

1. Atualizar este arquivo
2. Garantir consistência com código