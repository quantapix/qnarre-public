






import Proving.USC.T18.Ch77.Part4.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Scienter

open Proving.USC.Common





def ProvenAtLeast (p : Person) (el : ScienterElement) (m : MentalState)
    (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalState.atLeast rung m ∧ MentalStateProven p el rung c













def DemandMet (d : ScienterDemand) (p : Person) (el : ScienterElement)
    (c : ComplaintText) : Prop :=
  match d with
  | .atLeast .StrictLiability => True
  | .atLeast m => ProvenAtLeast p el m c
  | .unspecified =>
      ∃ rung : MentalState, MentalStateProven p el rung c ∧ SufficesForUnspecifiedDemand rung c










def CircumstanceScienterMet (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop :=
  (ActConstitutingViolationIsAdvertising p c →
      DemandMet RequiredMentalState1591CircumstanceAdvertising p el c)
  ∧ (¬ ActConstitutingViolationIsAdvertising p c →
      DemandMet RequiredMentalState1591Circumstance p el c)





def AgeScienterRelief (defendant : Person) (subject : Person) (c : ComplaintText) : Prop :=
  ProsecutionUnderParagraphOne c ∧ ReasonableOpportunityToObserve defendant subject c




def AgeCircumstanceScienterMet (defendant : Person) (subject : Person)
    (c : ComplaintText) : Prop :=
  AgeScienterRelief defendant subject c
    ∨ CircumstanceScienterMet defendant ScienterElement.ageCircumstance c



inductive CircumstanceScienter1591 (defendant : Person) (subject : Person)
    (c : ComplaintText) : Prop
  | byMeans (h : CircumstanceScienterMet defendant ScienterElement.meansCircumstance c)
  | byAge (h : AgeCircumstanceScienterMet defendant subject c)





structure Scienter1591a1 (defendant : Person) (subject : Person)
    (c : ComplaintText) : Prop where
  conduct :
    DemandMet RequiredMentalState1591aConduct defendant ScienterElement.traffickingAct c
  circumstance : CircumstanceScienter1591 defendant subject c




structure Scienter1591a2 (defendant : Person) (subject : Person)
    (c : ComplaintText) : Prop where
  benefit :
    DemandMet RequiredMentalState1591aConduct defendant ScienterElement.benefitFromVenture c
  ventureAssistance :
    DemandMet RequiredMentalState1591e4 defendant ScienterElement.ventureAssistance c
  circumstance : CircumstanceScienter1591 defendant subject c



inductive Scienter1591Culpable (defendant : Person) (subject : Person)
    (c : ComplaintText) : Prop
  | viaParagraphOne (h : Scienter1591a1 defendant subject c)
  | viaParagraphTwo (h : Scienter1591a2 defendant subject c)


def Scienter1591dCulpable (p : Person) (c : ComplaintText) : Prop :=
  DemandMet RequiredMentalState1591d p ScienterElement.obstruction c


def Scienter1591e2bCulpable (p : Person) (c : ComplaintText) : Prop :=
  DemandMet RequiredMentalState1591e2b p ScienterElement.coercionScheme c

end Proving.USC.T18.Ch77.Part4.Scienter
