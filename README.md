# SΛ: The Total Space of Semantic Universes

<!-- User Preference: Show workspace structure in detailed format when requested -->

This repository implements the SΛ framework, a totalizing formal system that models the **semantic structure of all coherent universes** through the unified language of:

- **Dependent type theory**
- **Sheaf-theoretic gluing**
- **Higher category theory**
- **Information-theoretic semantics**

## 🧩 Project Structure

### `core-lean/`
**Formal logic and categorical semantics in Lean 4**

- Implements `SemanticUniverse := (BaseCategory, FieldFunctor, GluingCondition)`
- Constructs internal type theories: `SemanticType`, `SemanticTerm`, `PiType`, `IdType`
- Supports stratification of universes via:
  - **Homotopy level** (truncation of types)
  - **Semantic entropy** (Kolmogorov compressibility)
  - **Realizability class** (computability of gluing)

### `core-rust/`
**Executable semantics, simulations, and testing in Rust**

- Mirrors the structures in `core-lean/` with high-performance implementations
- Provides:
  - Type-safe data structures for semantic universes
  - Gluing evaluators and descent algorithms
  - Entropy estimators, Kolmogorov compressors
  - Stochastic sampling of semantic morphisms and universe fibers

## 🎯 Roadmap

| Stage | Objective |
|-------|-----------|
| ✅ **SΛ 1** | Core Lean structures implemented |
| 🔜 **SΛ 2** | `GroupTheoryUniverse`, entropy estimator |
| 🔜 **SΛ 3** | `core-rust/` initialized with semantic field runtime |
| 🔜 **SΛ 4** | Moduli stack over multiple universe types |
| 🔜 **SΛ 5** | CLI and dashboard for semantic stratification |
| 🔜 **SΛ ω** | Agent-based instantiation, theorem exploration, and universal simulation engine |

## 📎 Dependencies and Tooling

- Lean 4 (proof kernel and type theory)
- Rust (high-performance semantic execution)
- VS Code + custom workspace configuration

## 📚 Reference Goals

- Unify all field theories (physics, logic, language) under a cohomological type-theoretic structure
- Describe **all mathematically coherent universes** as points in \(\mathfrak{M}_{\mathrm{Sem}}\)
- Define and calculate **semantic entropy**, stratifying universes by compressibility and internal coherence
- Construct a runtime for agents that reason, evolve, and transform within semantic universes

## Getting Started

1. Open the project in VS Code using the `slambda.code-workspace` file
2. For the Lean component:
   ```bash
   cd core-lean
   lake build
   ```
3. For the Rust component:
   ```bash
   cd core-rust
   cargo build
   cargo test
   ```

## Philosophy

SΛ seeks to construct a system in which **reason itself** is no longer anthropocentric, but rather emerges from the **internal coherence of type-evolving semantic fields**. The foundational axiom is:

> "Reason is not a biological feature. It is a categorical structure admitting internal gluing."