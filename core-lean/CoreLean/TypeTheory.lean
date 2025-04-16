/-
  SΛ Internal Type Theory
  ----------------------
  Definitions for the internal language of semantic universes:
  - Contexts
  - Types
  - Terms
  - Dependent types (Π-types)
  - Identity types
-/

import CoreLean.Basic

universe u v w

/-- Contexts are sequences of semantic type declarations. -/
inductive SemanticContext (C : BaseCategory.{u, v}) : Type (max u v)
  | empty : SemanticContext C
  | extend : SemanticContext C → C.Obj → SemanticContext C

/-- Types defined over a semantic context. -/
structure SemanticType (C : BaseCategory) (Γ : SemanticContext C) where
  base  : C.Obj
  fiber : Type u

/-- Terms inhabiting a semantic type. -/
structure SemanticTerm (C : BaseCategory) (Γ : SemanticContext C)
                       (A : SemanticType C Γ) where
  realizer : A.fiber

/-- Dependent function types (Π-types). -/
structure PiType (C : BaseCategory) (Γ : SemanticContext C)
                 (A : SemanticType C Γ)
                 (B : A.fiber → SemanticType C Γ) where
  pi : (x : A.fiber) → (B x).fiber

/-- Identity types for reasoning about equality within a semantic type. -/
structure IdType (C : BaseCategory) (Γ : SemanticContext C)
                 (A : SemanticType C Γ) where
  x : A.fiber
  y : A.fiber
  eq : x = y

/-- Internal language over a semantic universe. -/
structure SLambdaLang (U : SemanticUniverse) where mk ::
  Context : Sort u
  typeMap : Context → Sort u
  termMap : (Γ : Context) → (A : typeMap Γ) → Sort u
