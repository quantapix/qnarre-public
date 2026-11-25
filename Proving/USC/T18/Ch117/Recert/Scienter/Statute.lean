








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch117.Recert.Scienter.Types
import Proving.USC.T18.Ch117.Recert.Scienter.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Scienter

open Proving.USC.Common









def ScienterMet2421A
    (p : Person) (req : MentalState) (el : ScienterElement2421A) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast req ∧ MentalStateProvenAsTo2421A p rung el c


def ScienterMet2423
    (p : Person) (req : MentalState) (el : ScienterElement2423) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast req ∧ MentalStateProvenAsTo2423 p rung el c







def Culpable2421Aa (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2421A p .Specific .PromoteFacilitateProstitution c





def Culpable2421Ab1 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2421A p .Specific .PromoteFacilitateProstitution c





def Culpable2421Ab2 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2421A p .Specific .PromoteFacilitateProstitution c
  ∧ ScienterMet2421A p .Recklessness .ContributionToSexTrafficking c













def Culpable2421AaUndefeated (p : Person) (c : ComplaintText) : Prop :=
  Culpable2421Aa p c ∧ ¬ PromotionLegalInTargetedJurisdiction p c


def Culpable2421Ab1Undefeated (p : Person) (c : ComplaintText) : Prop :=
  Culpable2421Ab1 p c ∧ ¬ PromotionLegalInTargetedJurisdiction p c







def Culpable2423a (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2423 p .Knowledge .TransportationOfIndividual c
  ∧ ScienterMet2423 p .Specific .IntendedProstitutionOrChargeableSexualActivity c
  ∧ IntentHeldAtTimeOfTravel p c



def Culpable2423b (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2423 p .Specific .IntendedIllicitSexualConduct c
  ∧ IntentHeldAtTimeOfTravel p c







def Culpable2423c (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2423 p .StrictLiability .EngagingInIllicitSexualConduct c





def Culpable2423d (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2423 p .Specific .OrganizationalActInFurtherance c





def Culpable2423e (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet2423 p .Specific .CommercialAdvantageOrPrivateFinancialGain c
  ∧ ScienterMet2423 p .Knowledge .TravelerIntentToEngageInIllicitSexualConduct c







def Culpable2423f (p : Person) (target : Provision2423) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast (RequiredRung2423f target) ∧ MentalStateProven p rung c












def NotDefeatedByAgeBelief (culpable : Prop) (p : Person) (c : ComplaintText) : Prop :=
  culpable ∧ ¬ ReasonableBeliefOfMajority p c

end Proving.USC.T18.Ch117.Recert.Scienter
