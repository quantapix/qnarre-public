


















namespace Proving.USC.Common



opaque ComplaintText : Type



opaque Person : Type





opaque Entity : Type




opaque Agreement : Type



opaque Time : Type








opaque IdentificationDocument : Type





opaque TraffickConduct : Type



opaque JurisdictionalState : Type



axiom Time.le : Time → Time → Prop












inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
  deriving DecidableEq, Repr


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4



def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank


theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl a.rank


theorem MentalState.atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c :=
  Nat.le_trans hbc hab



inductive SanctionKind
  | Imprisonment
  | Fine
  | Multiplier
  | Forfeiture
  | Penalty
  deriving DecidableEq



inductive Direction
  | Ceiling
  | Floor
  | Exact
  deriving DecidableEq



structure Sanction where
  kind  : SanctionKind
  bound : Nat
  dir   : Direction


inductive Bearer
  | Plaintiff
  | Defendant
  | Government
  deriving DecidableEq





inductive Standard
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  | ReasonableCause
  deriving DecidableEq



inductive Presumption
  | None
  | Rebuttable
  | Conclusive
  deriving DecidableEq



structure EffectiveWindow where
  fromDay  : Nat
  untilDay : Option Nat

















structure CalendarInterval where
  years  : Nat
  months : Nat
  days   : Nat
  deriving DecidableEq

end Proving.USC.Common
