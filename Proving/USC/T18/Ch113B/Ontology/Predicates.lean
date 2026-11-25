










import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Ontology

open Proving.USC.Common





axiom IsInternationalTerrorism (a : Activity) (c : ComplaintText) : Prop




axiom InvolvesViolentActsOrActsDangerousToHumanLife (a : Activity) (c : ComplaintText) : Prop




axiom AppearsIntendedToIntimidateOrCoerceCivilianPopulation (a : Activity) (c : ComplaintText) : Prop




axiom AppearsIntendedToInfluenceGovernmentPolicy (a : Activity) (c : ComplaintText) : Prop




axiom AppearsIntendedToAffectGovernmentConduct (a : Activity) (c : ComplaintText) : Prop




axiom OccursPrimarilyOutsideTerritorialJurisdictionOfUS (a : Activity) (c : ComplaintText) : Prop




axiom TranscendsNationalBoundaries (a : Activity) (c : ComplaintText) : Prop





axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom CapableOfHoldingLegalOrBeneficialInterestInProperty (p : Person) (c : ComplaintText) : Prop



axiom IsActOfWar (x : Act) (c : ComplaintText) : Prop



axiom OccursInCourseOfDeclaredWar (x : Act) (c : ComplaintText) : Prop




axiom OccursInCourseOfArmedConflictBetweenNations (x : Act) (c : ComplaintText) : Prop




axiom OccursInCourseOfArmedConflictBetweenMilitaryForces (x : Act) (c : ComplaintText) : Prop



axiom IsDomesticTerrorism (a : Activity) (c : ComplaintText) : Prop





axiom InvolvesActsDangerousToHumanLife (a : Activity) (c : ComplaintText) : Prop




axiom OccursPrimarilyWithinTerritorialJurisdictionOfUS (a : Activity) (c : ComplaintText) : Prop





axiom IsMilitaryForce (m : MilitaryForce) (c : ComplaintText) : Prop




axiom IsDesignatedForeignTerroristOrganization (m : MilitaryForce) (c : ComplaintText) : Prop




axiom IsSpeciallyDesignatedGlobalTerrorist (m : MilitaryForce) (c : ComplaintText) : Prop



axiom DeterminedByCourtNotToBeMilitaryForce (m : MilitaryForce) (c : ComplaintText) : Prop





axiom IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop



axiom IsDestructiveDevice (w : Weapon) (c : ComplaintText) : Prop




axiom IsToxicOrPoisonousChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom IsBiologicalAgentWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom IsRadiationReleasingWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom IsProperty (pr : Property) (c : ComplaintText) : Prop






axiom IsConductTranscendingNationalBoundaries (cd : Conduct) (c : ComplaintText) : Prop




axiom IsFacilityOfInterstateOrForeignCommerce (f : CommerceFacility) (c : ComplaintText) : Prop





axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop




axiom IsTerritorialSeaOfTheUnitedStates (z : MaritimeZone) (c : ComplaintText) : Prop



axiom IsFederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop





axiom IsCalculatedToInfluenceOrRetaliateAgainstGovernment (o : Offense) (c : ComplaintText) : Prop




axiom IsEnumeratedTerrorismPredicateOffense (o : Offense) (c : ComplaintText) : Prop






axiom IsFinancialTransaction (t : FinancialTransaction) (c : ComplaintText) : Prop



axiom IsUnitedStatesPerson (p : Person) (c : ComplaintText) : Prop



axiom IsUnitedStatesCitizenOrNational (p : Person) (c : ComplaintText) : Prop



axiom IsPermanentResidentAlien (p : Person) (c : ComplaintText) : Prop




axiom IsJuridicalPersonOrganizedUnderUnitedStatesLaw (p : Person) (c : ComplaintText) : Prop



axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop






axiom IsStateOrGovernmentFacility (f : Facility) (c : ComplaintText) : Prop




axiom IsIntergovernmentalOrganization (o : Organization) (c : ComplaintText) : Prop



axiom IsInfrastructureFacility (f : Facility) (c : ComplaintText) : Prop



axiom IsPlaceOfPublicUse (pl : Place) (c : ComplaintText) : Prop



axiom IsPublicTransportationSystem (ts : TransportationSystem) (c : ComplaintText) : Prop





axiom IsExplosive (d : Device) (c : ComplaintText) : Prop



axiom IsOtherLethalDevice (d : Device) (c : ComplaintText) : Prop



axiom IsMilitaryForcesOfAState (m : MilitaryForce) (c : ComplaintText) : Prop




axiom IsArmedConflict (ac : ArmedConflict) (c : ComplaintText) : Prop





axiom IsInternalDisturbanceOrTension (ac : ArmedConflict) (c : ComplaintText) : Prop




axiom IsState (s : State) (c : ComplaintText) : Prop






axiom IsAircraft (ac : Aircraft) (c : ComplaintText) : Prop





axiom IsDevice (d : Device) (c : ComplaintText) : Prop



axiom IsNuclearExplosiveDevice (d : Device) (c : ComplaintText) : Prop





axiom IsRadioactiveDispersalOrRadiationEmittingDevice (d : Device) (c : ComplaintText) : Prop




axiom IsInternationalOrganization (o : Organization) (c : ComplaintText) : Prop



axiom IsNuclearFacility (f : Facility) (c : ComplaintText) : Prop




axiom IsNuclearReactor (f : Facility) (c : ComplaintText) : Prop




axiom IsRadioactiveMaterialPlantOrConveyance (f : Facility) (c : ComplaintText) : Prop





axiom IsNuclearMaterialHandlingFacility (f : Facility) (c : ComplaintText) : Prop




axiom IsNuclearMaterial (m : Material) (c : ComplaintText) : Prop



axiom IsRadioactiveMaterial (m : Material) (c : ComplaintText) : Prop





axiom ContainsSpontaneouslyDisintegratingNuclides (m : Material) (c : ComplaintText) : Prop



axiom IsUnitedStatesCorporationOrLegalEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsVessel (v : Vessel) (c : ComplaintText) : Prop




axiom IsVesselOfTheUnitedStates (v : Vessel) (c : ComplaintText) : Prop






axiom IsDictionaryActPerson (p : Person) (c : ComplaintText) : Prop





axiom IsTerroristParty (p : Person) (c : ComplaintText) : Prop




axiom IsBlockedAsset (a : Asset) (c : ComplaintText) : Prop




axiom IsAssetOfTerroristParty (a : Asset) (p : Person) (c : ComplaintText) : Prop




axiom SeizedOrFrozenUnderKingpinAct (a : Asset) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Ontology
