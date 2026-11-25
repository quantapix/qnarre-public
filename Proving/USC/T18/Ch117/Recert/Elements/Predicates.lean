import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch117.Recert.Elements.Types

set_option autoImplicit false













namespace Proving.USC.T18.Ch117.Recert.Elements

open Proving.USC.Common





axiom IsInteractiveComputerService (s : InteractiveComputerService) (c : ComplaintText) : Prop



axiom UsesFacilityOrMeansOfInterstateCommerce (d : Person) (c : ComplaintText) : Prop



axiom ConductInOrAffectingInterstateCommerce (d : Person) (c : ComplaintText) : Prop



axiom OwnsManagesOrOperatesIcs (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom IntentToOwnManageOrOperateIcs (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom TakesSubstantialStepTowardIcsOperation (d : Person)
    (s : InteractiveComputerService) (c : ComplaintText) : Prop




axiom AgreedObjectIsIcsOperation (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom IntentToPromoteOrFacilitateProstitution (d : Person) (c : ComplaintText) : Prop




axiom PromotesOrFacilitatesProstitutionOfAnother (d : Person) (c : ComplaintText) : Prop





axiom ProstitutedPersonCount (d : Person) (c : ComplaintText) : Nat






axiom ConductContributedToSexTrafficking (d : Person) (c : ComplaintText) : Prop




axiom ActsInRecklessDisregard (d : Person) (c : ComplaintText) : Prop





axiom DefenseProstitutionLegalInTargetedJurisdiction (d : Person) (c : ComplaintText) : Prop



axiom PlaintiffInjuredByViolation (pl : Person) (c : ComplaintText) : Prop




axiom BroughtInUnitedStatesDistrictCourt (c : ComplaintText) : Prop






axiom TransportsIndividual (d : Person) (v : Person) (t : Travel)
    (c : ComplaintText) : Prop





axiom VictimAgeYears (v : Person) (c : ComplaintText) : Nat



axiom TransportationInInterstateOrForeignCommerce (t : Travel) (c : ComplaintText) : Prop




axiom TransportationWithinTerritoryOrPossession (t : Travel) (c : ComplaintText) : Prop



axiom IntentThatIndividualEngageInProstitution (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom IntentThatIndividualEngageInChargeableSexualActivity (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom IntentExistedAtTimeOfTravel (d : Person) (c : ComplaintText) : Prop



axiom TravelsInInterstateCommerce (d : Person) (t : Travel) (c : ComplaintText) : Prop



axiom TravelsIntoTheUnitedStates (d : Person) (t : Travel) (c : ComplaintText) : Prop



axiom TravelsInForeignCommerce (d : Person) (t : Travel) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizenOrLawfulPermanentResident (d : Person) (c : ComplaintText) : Prop




axiom IntentToEngageInIllicitSexualConduct (d : Person) (c : ComplaintText) : Prop




axiom ResidesInForeignCountry (d : Person) (c : ComplaintText) : Prop



axiom SexualActUnderSection2246 (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom WouldViolateChapter109AInSpecialMaritimeJurisdiction (d : Person) (v : Person)
    (c : ComplaintText) : Prop



axiom CommercialSexActUnderSection1591 (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom ProducesChildPornographyUnderSection2256 (d : Person) (v : Person)
    (c : ComplaintText) : Prop





axiom DefenseReasonableBeliefVictimAttainedEighteen (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom IsOfficerDirectorEmployeeOrAgent (d : Person) (o : Entity) (c : ComplaintText) : Prop





axiom UsesMailsOrInstrumentalityThroughOrganization (d : Person) (o : Entity)
    (c : ComplaintText) : Prop




axiom CommitsActInFurtheranceOfIllicitSexualConduct (d : Person) (o : Entity)
    (c : ComplaintText) : Prop




axiom ForCommercialAdvantageOrPrivateFinancialGain (d : Person) (c : ComplaintText) : Prop




axiom ArrangesInducesProcuresOrFacilitatesTravel (d : Person) (v : Person)
    (t : Travel) (c : ComplaintText) : Prop




axiom KnowsTravelerTravelsInInterstateOrForeignCommerce (d : Person) (t : Travel)
    (c : ComplaintText) : Prop




axiom TravelerIntendsIllicitSexualConduct (v : Person) (c : ComplaintText) : Prop




axiom IntentToCommitSection2423Offense (d : Person) (c : ComplaintText) : Prop




axiom TakesSubstantialStepTowardSection2423Offense (d : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Recert.Elements
