








import Proving.USC.T18.Ch77.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)










def DemandMet (proven : MentalState) : Demand → Prop
  | some required => proven.atLeast required
  | none          => True

instance decDemandMet (r : MentalState) : (d : Demand) → Decidable (DemandMet r d)
  | none       => isTrue trivial
  | some req   => inferInstanceAs (Decidable (r.atLeast req))




def MentalStateProven (p : Person) (elem : ScienterElement) (rung : MentalState)
    (c : ComplaintText) : Prop :=
  (provenRung p elem c).atLeast rung



def ElementScienterMet (p : Person) (elem : ScienterElement) (c : ComplaintText) : Prop :=
  DemandMet (provenRung p elem c) (RequiredMentalState elem)










structure Scienter1590a (p : Person) (c : ComplaintText) : Prop where


  conductKnowing : ElementScienterMet p .conduct1590a c

  chapterViolationAwareness : ElementScienterMet p .chapterViolationCircumstance1590a c





inductive Aggravator1590a (p : Person) (c : ComplaintText) : Prop where


  | resultBranch : ElementScienterMet p .deathOrKidnapResult1590a c → Aggravator1590a p c


  | attemptBranch : ElementScienterMet p .attemptAggravator1590a c → Aggravator1590a p c








inductive ObstructionScienter (p : Person) (completed attempted : ScienterElement)
    (c : ComplaintText) : Prop where
  | completedBranch : ElementScienterMet p completed c → ObstructionScienter p completed attempted c
  | attemptedBranch : ElementScienterMet p attempted c → ObstructionScienter p completed attempted c


def ObstructionScienter1590b (p : Person) (c : ComplaintText) : Prop :=
  ObstructionScienter p .obstruction1590b .obstructionAttempt1590b c


def ObstructionScienter1591d (p : Person) (c : ComplaintText) : Prop :=
  ObstructionScienter p .obstruction1591d .obstructionAttempt1591d c


def ObstructionScienter1592c (p : Person) (c : ComplaintText) : Prop :=
  ObstructionScienter p .obstruction1592c .obstructionAttempt1592c c







inductive CircumstanceScienter1591 (p : Person) (m : ActModality) (c : ComplaintText) : Prop where


  | coerciveMeans : ElementScienterMet p (.meansCircumstance1591a m) c →
      CircumstanceScienter1591 p m c


  | minority : ElementScienterMet p (.ageCircumstance1591a m) c →
      CircumstanceScienter1591 p m c






inductive CircumstanceScienter1591a1 (d v : Person) (m : ActModality) (c : ComplaintText) : Prop where

  | provedRung : CircumstanceScienter1591 d m c → CircumstanceScienter1591a1 d v m c

  | observeCarve : ReasonableOpportunityToObserve d v c → CircumstanceScienter1591a1 d v m c


structure Scienter1591a1 (d v : Person) (m : ActModality) (c : ComplaintText) : Prop where

  conductKnowing : ElementScienterMet d .conduct1591a1 c

  modality : ActModalityOfConduct d m c

  circumstance : CircumstanceScienter1591a1 d v m c








structure Scienter1591a2 (p : Person) (m : ActModality) (c : ComplaintText) : Prop where

  benefitKnowing : ElementScienterMet p .benefit1591a2 c

  participationKnowing : ElementScienterMet p .ventureParticipation1591e4 c

  modality : ActModalityOfConduct p m c

  circumstance : CircumstanceScienter1591 p m c






inductive DocumentTheory1592a (p : Person) (c : ComplaintText) : Prop where


  | inCourseOfViolation : ElementScienterMet p .inCourseOfViolation1592a1 c →
      DocumentTheory1592a p c


  | intentToViolate : ElementScienterMet p .intentToViolate1592a2 c → DocumentTheory1592a p c

  | libertyRestrictionPurpose : ElementScienterMet p .libertyRestrictionPurpose1592a3 c →
      DocumentTheory1592a p c










structure Scienter1592a (p : Person) (c : ComplaintText) : Prop where


  documentConductKnowing : ElementScienterMet p .documentConduct1592a c

  theory : DocumentTheory1592a p c

  notVictimException : ¬ VictimStatusConductException1592b p c

end Proving.USC.T18.Ch77.Reslice.Scienter
