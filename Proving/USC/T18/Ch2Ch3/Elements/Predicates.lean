import Proving.USC.T18.Ch2Ch3.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
set_option autoImplicit false
















namespace Proving.USC.T18.Ch2Ch3.Elements

open Proving.USC.Common






axiom AttemptsOrConspiresToViolate (p : Person) (c : ComplaintText) : Prop




axiom ExtraterritorialFederalJurisdiction (p : Person) (c : ComplaintText) : Prop





axiom ActInInterstateCommerce (p : Person) (c : ComplaintText) : Prop



axiom IntentToDefraud (p : Person) (c : ComplaintText) : Prop






axiom IsCoveredAircraft (ac : Aircraft) (c : ComplaintText) : Prop



axiom DamagesAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom PlacesDestructiveDeviceOnAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom DamagesAirNavigationFacility (f : AirNavFacility) (c : ComplaintText) : Prop




axiom DamagesAircraftSupportProperty (ac : Aircraft) (c : ComplaintText) : Prop




axiom InterferesWithAircraftPersonnel (ac : Aircraft) (c : ComplaintText) : Prop




axiom PerformsViolenceOnboardAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom CommunicatesFalseAircraftInfo (ac : Aircraft) (c : ComplaintText) : Prop




axiom IsForeignRegisteredAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom ViolenceOnboardForeignAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom DestroysForeignAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom PlacesDeviceOnForeignAircraft (ac : Aircraft) (c : ComplaintText) : Prop




axiom ConveysThreatToDestroyAircraft (p : Person) (c : ComplaintText) : Prop






axiom InFurtheranceOfMajorDrugOffense (p : Person) (c : ComplaintText) : Prop



axiom IntentToIntimidateOrInjure (p : Person) (c : ComplaintText) : Prop



axiom FiresWeaponIntoGroup (p : Person) (c : ComplaintText) : Prop



axiom CausesGraveRiskToLife (p : Person) (c : ComplaintText) : Prop





axiom IsInternationalAirport (ap : Airport) (c : ComplaintText) : Prop




axiom ViolenceAgainstPersonAtAirport (ap : Airport) (c : ComplaintText) : Prop




axiom DamagesInternationalAirportFacilities (ap : Airport) (c : ComplaintText) : Prop



axiom EndangersAirportSafety (ap : Airport) (c : ComplaintText) : Prop





axiom LaborDisputeStateFelonyBar (p : Person) (c : ComplaintText) : Prop





axiom IsAircraftOrSpaceVehiclePart (part : AircraftPart) (c : ComplaintText) : Prop



axiom MaterialFalsityConcerningPart (part : AircraftPart) (c : ComplaintText) : Prop




axiom FalsifiesPartFact (part : AircraftPart) (c : ComplaintText) : Prop




axiom TraffsPartByFraud (part : AircraftPart) (c : ComplaintText) : Prop





axiom OperatesUnmannedAircraft (ua : UnmannedAircraft) (c : ComplaintText) : Prop




axiom InterferesWithOccupiedAircraft (ua : UnmannedAircraft) (c : ComplaintText) : Prop



axiom PosesImminentSafetyHazard (ua : UnmannedAircraft) (c : ComplaintText) : Prop



axiom OperatesInRunwayExclusionZone (ua : UnmannedAircraft) (c : ComplaintText) : Prop



axiom WithoutAuthorization (p : Person) (c : ComplaintText) : Prop






axiom InterferesWithWildfireSuppression (ua : UnmannedAircraft) (c : ComplaintText) : Prop




axiom GovernmentWildfireOperationException (p : Person) (c : ComplaintText) : Prop





axiom ImportsOrShipsSpecies (sp : InjuriousSpecies) (c : ComplaintText) : Prop




axiom IsInjuriousSpecies (sp : InjuriousSpecies) (c : ComplaintText) : Prop




axiom ImportationAuthorizedByPermitOrExemption (p : Person) (c : ComplaintText) : Prop




axiom KnowinglyTransportsUnderInhumaneConditions (sp : InjuriousSpecies) (c : ComplaintText) : Prop



axiom IsWildAnimalOrBird (sp : InjuriousSpecies) (c : ComplaintText) : Prop






axiom PurposeToDamageAnimalEnterprise (p : Person) (c : ComplaintText) : Prop



axiom IsAnimalEnterprise (ae : AnimalEnterprise) (c : ComplaintText) : Prop




axiom DamagesAnimalEnterpriseProperty (ae : AnimalEnterprise) (c : ComplaintText) : Prop





axiom PlacesPersonInFearByCourseOfConduct (p : Person) (c : ComplaintText) : Prop




axiom ProtectedFirstAmendmentConduct (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch2Ch3.Elements
