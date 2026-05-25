# 🧐 Code & Architecture Review

## 📅 Phase 1: Physics Foundation - Task 001 Audit
**Date:** 2026-05-05
**Status:** ✅ APPROVED

### 🎯 Achievements
- **TDD Baseline:** Established a reliable GdUnit4 test suite in a headless environment.
- **Physics Logic:** Minimal gravity accumulation implemented in `Player.cs` with proper `IsInsideTree` guards.
- **Memory Safety:** Implemented strict node cleanup in tests, eliminating orphan node leaks.

### 💡 Technical Insights
- Manual execution of `_PhysicsProcess` in tests is a viable and faster alternative to `SceneRunner` for pure unit-level node logic.
- Decoupling gravity from `ProjectSettings` allows for future environmental changes (e.g., low gravity zones).

### ⚠️ Devil's Advocate / Risks
- **Decoupling:** Current movement logic is inside the Godot Node layer. To follow the "Logic Separation" (GDD 3.0), we should plan to move velocity calculations to a `Game.Core` service in Phase 2.
- **Input Coverage:** Horizontal input scenarios in the contract are passing because speed constants are correct, but the actual input mapping logic hasn't been fully exercised by physics in the tests yet.