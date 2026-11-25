







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Scienter

open Proving.USC.Common



opaque InteractiveComputerService : Type



opaque Conveyance : Type


opaque IllicitSexualConduct : Type




inductive MentalState where
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

instance (a b : MentalState) : Decidable (MentalState.atLeast a b) := by
  unfold MentalState.atLeast; exact inferInstance

theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl a.rank

theorem MentalState.atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c :=
  Nat.le_trans hbc hab


theorem MentalState.atLeast_strict (a : MentalState) : a.atLeast .StrictLiability :=
  Nat.zero_le a.rank




inductive Provision where


  | s2421A_a

  | s2421A_bChapeau


  | s2421A_b1


  | s2421A_b2

  | s2423_aTransport



  | s2423_aPurpose



  | s2423_aAge

  | s2423_b


  | s2423_c

  | s2423_d


  | s2423_eGain


  | s2423_eKnowledge
  deriving DecidableEq, Repr


inductive ProofStandard where
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  deriving DecidableEq, Repr


inductive Defense where


  | jurisdictionLegality2421Ae


  | reasonableBeliefAdult2423i
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch117.Reslice.Scienter
