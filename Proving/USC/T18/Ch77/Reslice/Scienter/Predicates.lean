







import Proving.USC.T18.Ch77.Reslice.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)







def circumstanceRung1591 : ActModality → MentalState
  | .advertising  => .Knowledge
  | .otherConduct => .Recklessness






def RequiredMentalState : ScienterElement → Demand

  | .conduct1590a                      => some .Knowledge
  | .chapterViolationCircumstance1590a => none
  | .deathOrKidnapResult1590a          => some .StrictLiability
  | .attemptAggravator1590a            => some .Specific
  | .obstruction1590b                  => none
  | .obstructionAttempt1590b           => some .Specific

  | .conduct1591a1                     => some .Knowledge
  | .benefit1591a2                     => some .Knowledge
  | .ventureParticipation1591e4        => some .Knowledge
  | .meansCircumstance1591a m          => some (circumstanceRung1591 m)
  | .ageCircumstance1591a m            => some (circumstanceRung1591 m)
  | .obstruction1591d                  => none
  | .obstructionAttempt1591d           => some .Specific

  | .documentConduct1592a              => some .Knowledge
  | .inCourseOfViolation1592a1         => none
  | .intentToViolate1592a2             => some .Specific
  | .libertyRestrictionPurpose1592a3   => some .Specific
  | .obstruction1592c                  => none
  | .obstructionAttempt1592c           => some .Specific










axiom provenRung (p : Person) (elem : ScienterElement) (c : ComplaintText) : MentalState








axiom ActModalityOfConduct (p : Person) (m : ActModality) (c : ComplaintText) : Prop












axiom ReasonableOpportunityToObserve (d v : Person) (c : ComplaintText) : Prop










axiom VictimStatusConductException1592b (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Reslice.Scienter
