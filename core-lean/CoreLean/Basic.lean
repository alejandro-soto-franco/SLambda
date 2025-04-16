/-
  SΛ Core Basic Definitions
  ------------------------
  The foundational structures for the semantic universe framework.
-/

universe u v w

/-- A base category of semantic types. -/
structure BaseCategory where
  Obj      : Type u
  Hom      : Obj → Obj → Type v
  id       : ∀ X, Hom X X
  comp     : ∀ {X Y Z}, Hom X Y → Hom Y Z → Hom X Z
  id_comp  : ∀ {X Y} (f : Hom X Y), comp (id X) f = f
  comp_id  : ∀ {X Y} (f : Hom X Y), comp f (id Y) = f
  assoc    : ∀ {W X Y Z} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
               comp (comp f g) h = comp f (comp g h)

/-- A functor assigning realizers to each semantic type. -/
structure FieldFunctor (C : BaseCategory.{u, v}) where
  Field : C.Obj → Type w
  map   : ∀ {X Y : C.Obj}, C.Hom X Y → (Field X → Field Y)
  functoriality_id  : ∀ {X : C.Obj}, map (C.id X) = id
  functoriality_comp : ∀ {X Y Z : C.Obj} (f : C.Hom X Y) (g : C.Hom Y Z),
                         map (C.comp f g) = Function.comp (map g) (map f)

/-- Gluing conditions over semantic covers. -/
structure GluingCondition (C : BaseCategory.{u, v}) (F : FieldFunctor C) where
  Cover         : C.Obj → Type w        -- index set
  LocalPatch    : ∀ (X : C.Obj), Cover X → C.Obj
  Restriction   : ∀ (X : C.Obj) (i : Cover X), C.Hom X (LocalPatch X i)  -- Changed direction
  glueExists    : ∀ (X : C.Obj) (s : ∀ i : Cover X, F.Field (LocalPatch X i)),
                    ∃ (t : F.Field X), ∀ (i : Cover X), s i = F.map (Restriction X i) t  -- Flipped equation

/-- The structure of a semantic universe. -/
structure SemanticUniverse where
  C : BaseCategory
  F : FieldFunctor C
  G : GluingCondition C F
