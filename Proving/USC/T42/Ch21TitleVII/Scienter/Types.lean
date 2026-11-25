






import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Scienter

open Proving.USC.Common



inductive MentalState

  | strictLiability

  | negligence

  | recklessness

  | knowledge

  | specific
  deriving DecidableEq, Repr

namespace MentalState


def rank : MentalState → Nat
  | .strictLiability => 0
  | .negligence      => 1
  | .recklessness    => 2
  | .knowledge       => 3
  | .specific        => 4



def atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

instance (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))

theorem atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl _

theorem atLeast_trans {a b c : MentalState} (h₁ : a.atLeast b) (h₂ : b.atLeast c) :
    a.atLeast c := Nat.le_trans h₂ h₁


theorem specific_top (a : MentalState) : MentalState.specific.atLeast a := by
  cases a <;> decide


theorem strictLiability_bot (a : MentalState) : a.atLeast MentalState.strictLiability := by
  cases a <;> decide

end MentalState




inductive ScienterElement

  | disparateTreatment2000e2a

  | disparateImpact2000e2k1


  | seniorityOrMeritDifferential2000e2h


  | abilityTestDesign2000e2h


  | controlledSubstanceRule2000e2k3


  | scoreAdjustment2000e2l

  | retaliation2000e3a

  | discriminatoryAdvertisement2000e3b


  | seniorityAdoption2000e5e2


  | remedialIntentionalPractice2000e5g1

  | commissionDisclosure2000e5b


  | commissionOfficerDisclosure2000e8e

  | noticePosting2000e10


  | patternOrPractice2000e6a


  | federalPersonnelAction2000e16a

  | governmentEmployeePersonnelAction2000e16b


  | killingCommissionPersonnel2000e13
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch21TitleVII.Scienter
