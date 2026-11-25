











import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Scienter.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Scienter

open Proving.USC.Common








axiom MentalStateProvenAsTo2421A
    (p : Person) (rung : MentalState) (el : ScienterElement2421A) (c : ComplaintText) : Prop




axiom MentalStateProvenAsTo2423
    (p : Person) (rung : MentalState) (el : ScienterElement2423) (c : ComplaintText) : Prop








axiom IntentHeldAtTimeOfTravel (p : Person) (c : ComplaintText) : Prop








axiom ReasonableBeliefOfMajority (p : Person) (c : ComplaintText) : Prop








axiom PromotionLegalInTargetedJurisdiction (p : Person) (c : ComplaintText) : Prop










def RequiredRung2421A : ScienterElement2421A → Option MentalState

  | .PromoteFacilitateProstitution => some .Specific



  | .FiveOrMorePersons => none


  | .ContributionToSexTrafficking => some .Recklessness


def RequiredRung2423 : ScienterElement2423 → Option MentalState

  | .TransportationOfIndividual => some .Knowledge

  | .AgeUnder18 => none

  | .IntendedProstitutionOrChargeableSexualActivity => some .Specific

  | .TravelInCommerce => none

  | .IntendedIllicitSexualConduct => some .Specific




  | .EngagingInIllicitSexualConduct => some .StrictLiability




  | .OrganizationalActInFurtherance => some .Specific

  | .CommercialAdvantageOrPrivateFinancialGain => some .Specific


  | .TravelerIntentToEngageInIllicitSexualConduct => some .Knowledge



def OffenceRung2423 : Provision2423 → MentalState
  | .SubsecA => .Specific
  | .SubsecB => .Specific
  | .SubsecC => .StrictLiability
  | .SubsecD => .Specific
  | .SubsecE => .Specific






def RequiredRung2423f (target : Provision2423) : MentalState := OffenceRung2423 target

end Proving.USC.T18.Ch117.Recert.Scienter
