




















import Proving.USC.T18.Ch117.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Elements

open Proving.USC.Common








axiom UsesInterstateCommerceFacilityOrAffectsCommerce (p : Person) (c : ComplaintText) : Prop





axiom IsInteractiveComputerService (s : InteractiveComputerService) (c : ComplaintText) : Prop



axiom OwnsInteractiveComputerService (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop



axiom ManagesInteractiveComputerService (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop



axiom OperatesInteractiveComputerService (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom ConspiresToOwnManageOrOperateService (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom AttemptsToOwnManageOrOperateService (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop




axiom IntentToPromoteOrFacilitateProstitution (p : Person) (c : ComplaintText) : Prop






axiom ProstitutionLegalInTargetedJurisdiction (p : Person) (c : ComplaintText) : Prop





axiom PersonsWhoseProstitutionPromotedOrFacilitated (p : Person) (c : ComplaintText) : Nat






axiom ConductContributedToSexTrafficking (p : Person) (c : ComplaintText) : Prop





axiom ActsInRecklessDisregardOfTraffickingContribution (p : Person) (c : ComplaintText) : Prop





axiom PlaintiffInjuredByViolation (pl : Person) (c : ComplaintText) : Prop






axiom RestitutionScopeConsistentWithSection2327b (p : Person) (c : ComplaintText) : Prop






axiom KnowinglyTransportsIndividual (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom IndividualHasNotAttainedAge18 (v : Person) (c : ComplaintText) : Prop




axiom TransportationInInterstateOrForeignCommerce (d : Person) (c : ComplaintText) : Prop




axiom TransportationInCommonwealthTerritoryOrPossession (d : Person) (c : ComplaintText) : Prop




axiom IntentIndividualEngageInProstitution (d : Person) (c : ComplaintText) : Prop




axiom IntentIndividualEngageInChargeableSexualActivity (d : Person) (c : ComplaintText) : Prop





axiom IntentExistedAtTimeOfTransportationOrTravel (d : Person) (c : ComplaintText) : Prop




axiom TravelsInInterstateCommerce (d : Person) (c : ComplaintText) : Prop




axiom TravelsIntoTheUnitedStates (d : Person) (c : ComplaintText) : Prop




axiom IsCitizenOrLawfulPermanentResident (d : Person) (c : ComplaintText) : Prop




axiom TravelsInForeignCommerce (d : Person) (c : ComplaintText) : Prop





axiom IntentToEngageInIllicitSexualConduct (d : Person) (c : ComplaintText) : Prop




axiom ResidesInForeignCountry (d : Person) (c : ComplaintText) : Prop






axiom SexualActWithPersonUnder18ViolatingChapter109A (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom CommercialSexActWithPersonUnder18 (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom ProducesChildPornography (d : Person) (c : ComplaintText) : Prop






axiom ReasonableBeliefPersonAttainedAge18 (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom IsOfficerDirectorEmployeeOrAgentOfOrganization (d : Person) (o : Entity)
    (c : ComplaintText) : Prop




axiom UsesMailsOrInterstateInstrumentality (d : Person) (c : ComplaintText) : Prop





axiom ConnectionOrAffiliationWithOrganization (d : Person) (o : Entity)
    (c : ComplaintText) : Prop




axiom CommitsActInFurtheranceOfIllicitSexualConduct (d : Person) (c : ComplaintText) : Prop




axiom ActsForCommercialAdvantageOrPrivateFinancialGain (d : Person) (c : ComplaintText) : Prop




axiom ArrangesTravel (d : Person) (t : Person) (c : ComplaintText) : Prop




axiom InducesTravel (d : Person) (t : Person) (c : ComplaintText) : Prop




axiom ProcuresTravel (d : Person) (t : Person) (c : ComplaintText) : Prop




axiom FacilitatesTravel (d : Person) (t : Person) (c : ComplaintText) : Prop




axiom KnowsTravelerTravelsInInterstateOrForeignCommerce (d : Person) (t : Person)
    (c : ComplaintText) : Prop




axiom KnowsTravelerIntendsIllicitSexualConduct (d : Person) (t : Person)
    (c : ComplaintText) : Prop




axiom AttemptsToViolateSection2423 (d : Person) (c : ComplaintText) : Prop




axiom ConspiresToViolateSection2423 (d : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Reslice.Elements
