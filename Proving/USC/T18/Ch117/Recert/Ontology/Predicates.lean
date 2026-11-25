
















import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Ontology.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Ontology

open Proving.USC.Common





axiom IsInteractiveComputerService
    (s : InteractiveComputerService) (c : ComplaintText) : Prop




axiom IsFacilityOrMeansOfInterstateCommerce
    (f : CommerceFacility) (c : ComplaintText) : Prop




axiom IsOwnerManagerOrOperator
    (p : Person) (s : InteractiveComputerService) (c : ComplaintText) : Prop



axiom IsPromotionOrFacilitationOfProstitution
    (a : ProstitutionActivity) (c : ComplaintText) : Prop




axiom IsProstitutionOfAnotherPerson
    (a : ProstitutionActivity) (subject : Person) (c : ComplaintText) : Prop




axiom IsFiveOrMorePersonsPromoted
    (a : ProstitutionActivity) (c : ComplaintText) : Prop




axiom IsSexTraffickingViolation
    (t : SexTraffickingViolation) (c : ComplaintText) : Prop




axiom IsRecklessDisregardOfContribution
    (p : Person) (t : SexTraffickingViolation) (c : ComplaintText) : Prop




axiom IsPersonInjuredByReasonOf (p : Person) (c : ComplaintText) : Prop



axiom IsAppropriateUnitedStatesDistrictCourt
    (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsRestitutionConsistentWithSection2327b
    (r : RestitutionOrder) (c : ComplaintText) : Prop




axiom IsTargetedJurisdiction
    (j : Jurisdiction) (a : ProstitutionActivity) (c : ComplaintText) : Prop




axiom IsProstitutionLegalInJurisdiction
    (j : Jurisdiction) (c : ComplaintText) : Prop







axiom IsSubstantiveOffenseInScope
    (o : SubstantiveOffense) (c : ComplaintText) : Prop




axiom IsAttemptOrConspiracyToViolate
    (p : Person) (o : SubstantiveOffense) (c : ComplaintText) : Prop






axiom IsMinorUnder18 (p : Person) (c : ComplaintText) : Prop



axiom IsKnowingTransportation
    (p : Person) (t : TravelOrTransportation) (subject : Person)
    (c : ComplaintText) : Prop



axiom IsInterstateOrForeignCommerceTransport
    (t : TravelOrTransportation) (c : ComplaintText) : Prop




axiom IsCommonwealthTerritoryOrPossession
    (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsTravelInInterstateCommerce
    (t : TravelOrTransportation) (c : ComplaintText) : Prop



axiom IsTravelIntoTheUnitedStates
    (t : TravelOrTransportation) (c : ComplaintText) : Prop



axiom IsTravelInForeignCommerce
    (t : TravelOrTransportation) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop




axiom IsAlienAdmittedForPermanentResidence
    (p : Person) (c : ComplaintText) : Prop



axiom IsForeignCountry (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsResidenceInForeignCountry
    (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsEngagementInIllicitSexualConduct
    (p : Person) (icc : IllicitSexualConduct) (other : Person)
    (c : ComplaintText) : Prop




axiom IsOfficerDirectorEmployeeOrAgent
    (p : Person) (o : Entity) (c : ComplaintText) : Prop




axiom IsOrganizationAffectingCommerce (o : Entity) (c : ComplaintText) : Prop





axiom IsUseOfMailsOrInstrumentality
    (p : Person) (o : Entity) (c : ComplaintText) : Prop





axiom IsActInFurtheranceThroughAffiliation
    (p : Person) (o : Entity) (icc : IllicitSexualConduct)
    (c : ComplaintText) : Prop




axiom IsForCommercialAdvantageOrPrivateFinancialGain
    (p : Person) (c : ComplaintText) : Prop




axiom IsArrangingInducingProcuringOrFacilitatingTravel
    (p : Person) (t : TravelOrTransportation) (c : ComplaintText) : Prop




axiom IsKnowledgeOfTravelersIntent
    (p : Person) (traveler : Person) (i : Intent) (c : ComplaintText) : Prop



axiom IsSexualActUnderSection2246 (a : SexualAct) (c : ComplaintText) : Prop





axiom IsChapter109AViolationIfInSMTJ (a : SexualAct) (c : ComplaintText) : Prop




axiom IsSpecialMaritimeAndTerritorialJurisdiction
    (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsCommercialSexActUnderSection1591
    (a : CommercialSexAct) (c : ComplaintText) : Prop




axiom IsProductionOfChildPornography
    (cp : ChildPornography) (c : ComplaintText) : Prop




axiom IsIllicitSexualConduct
    (icc : IllicitSexualConduct) (c : ComplaintText) : Prop




axiom IsIntentUnderSection2423 (i : Intent) (c : ComplaintText) : Prop




axiom IsAtTimeOfTransportationOrTravel
    (i : Intent) (t : TravelOrTransportation) (moment : Time)
    (c : ComplaintText) : Prop



axiom IsIntentionToEngageInProstitution (i : Intent) (c : ComplaintText) : Prop




axiom IsIntentionToEngageInChargeableSexualActivity
    (i : Intent) (c : ComplaintText) : Prop



axiom IsIntentionToEngageInIllicitSexualConduct
    (i : Intent) (c : ComplaintText) : Prop




axiom IsSexualActivityChargeableAsCriminalOffense
    (a : SexualActivityChargeableAsOffense) (c : ComplaintText) : Prop





axiom IsReasonableBeliefOfMajority
    (p : Person) (subject : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Recert.Ontology
