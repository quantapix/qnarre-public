








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)






inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
  deriving DecidableEq

instance : Inhabited MentalState := ⟨MentalState.StrictLiability⟩


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4



def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

instance MentalState.decAtLeast (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))




abbrev Demand := Option MentalState





inductive ActModality
  | advertising
  | otherConduct
  deriving DecidableEq






inductive ScienterElement


  | conduct1590a



  | chapterViolationCircumstance1590a



  | deathOrKidnapResult1590a



  | attemptAggravator1590a


  | obstruction1590b

  | obstructionAttempt1590b



  | conduct1591a1


  | benefit1591a2



  | ventureParticipation1591e4



  | meansCircumstance1591a (m : ActModality)



  | ageCircumstance1591a (m : ActModality)

  | obstruction1591d

  | obstructionAttempt1591d




  | documentConduct1592a



  | inCourseOfViolation1592a1


  | intentToViolate1592a2


  | libertyRestrictionPurpose1592a3

  | obstruction1592c

  | obstructionAttempt1592c
  deriving DecidableEq

end Proving.USC.T18.Ch77.Reslice.Scienter
