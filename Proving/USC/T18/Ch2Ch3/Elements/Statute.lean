import Proving.USC.T18.Ch2Ch3.Elements.Types
import Proving.USC.T18.Ch2Ch3.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
set_option autoImplicit false
















namespace Proving.USC.T18.Ch2Ch3.Elements

open Proving.USC.Common





inductive AircraftSabotageAct (ac : Aircraft) (f : AirNavFacility) (c : ComplaintText) : Prop where
  | damage        (h : DamagesAircraft ac c)
  | device        (h : PlacesDestructiveDeviceOnAircraft ac c)
  | navFacility   (h : DamagesAirNavigationFacility f c)
  | supportProp   (h : DamagesAircraftSupportProperty ac c)
  | personnel     (h : InterferesWithAircraftPersonnel ac c)
  | onboard       (h : PerformsViolenceOnboardAircraft ac c)
  | falseInfo     (h : CommunicatesFalseAircraftInfo ac c)


structure Section32aOffense (p : Person) (ac : Aircraft) (f : AirNavFacility)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  covered  : IsCoveredAircraft ac c
  act      : AircraftSabotageAct ac f c


inductive ForeignAircraftAct (ac : Aircraft) (c : ComplaintText) : Prop where
  | violence (h : ViolenceOnboardForeignAircraft ac c)
  | destroy  (h : DestroysForeignAircraft ac c)
  | device   (h : PlacesDeviceOnForeignAircraft ac c)



structure Section32bOffense (p : Person) (ac : Aircraft) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  foreign      : IsForeignRegisteredAircraft ac c
  act          : ForeignAircraftAct ac c
  jurisdiction : ExtraterritorialFederalJurisdiction p c


structure Section32cOffense (p : Person) (c : ComplaintText) : Prop where
  threat : ConveysThreatToDestroyAircraft p c



inductive Section32Violation (p : Person) (ac : Aircraft) (f : AirNavFacility)
    (c : ComplaintText) : Prop where
  | domestic         (h : Section32aOffense p ac f c)
  | foreign          (h : Section32bOffense p ac c)
  | threat           (h : Section32cOffense p c)
  | attemptConspiracy (hSci : ActedWithScienter p c) (h : AttemptsOrConspiresToViolate p c)




structure Section36DriveBy (p : Person) (c : ComplaintText) : Prop where
  drugNexus : InFurtheranceOfMajorDrugOffense p c
  intent    : IntentToIntimidateOrInjure p c
  fires     : FiresWeaponIntoGroup p c
  graveRisk : CausesGraveRiskToLife p c



structure Section36DriveByKilling (p : Person) (c : ComplaintText) : Prop where
  drugNexus   : InFurtheranceOfMajorDrugOffense p c
  intent      : IntentToIntimidateOrInjure p c
  fires       : FiresWeaponIntoGroup p c
  causesDeath : ProximateCause p c


inductive Section36Violation (p : Person) (c : ComplaintText) : Prop where
  | graveRisk (h : Section36DriveBy p c)
  | killing   (h : Section36DriveByKilling p c)




inductive AirportViolenceAct (ap : Airport) (c : ComplaintText) : Prop where
  | person   (h : ViolenceAgainstPersonAtAirport ap c)
  | facility (h : DamagesInternationalAirportFacilities ap c)




structure Section37Offense (p : Person) (ap : Airport) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  airport      : IsInternationalAirport ap c
  act          : AirportViolenceAct ap c
  endangers    : EndangersAirportSafety ap c
  jurisdiction : ExtraterritorialFederalJurisdiction p c
  notBarred    : ¬ LaborDisputeStateFelonyBar p c




inductive PartFraudAct (part : AircraftPart) (c : ComplaintText) : Prop where
  | falsify (h : FalsifiesPartFact part c)
  | traffic (h : TraffsPartByFraud part c)



structure Section38Offense (p : Person) (part : AircraftPart) (c : ComplaintText) : Prop where
  commerce     : ActInInterstateCommerce p c
  scienter     : ActedWithScienter p c
  intentFraud  : IntentToDefraud p c
  isPart       : IsAircraftOrSpaceVehiclePart part c
  material     : MaterialFalsityConcerningPart part c
  act          : PartFraudAct part c




structure Section39BInterference (p : Person) (ua : UnmannedAircraft) (c : ComplaintText) : Prop where
  operates   : OperatesUnmannedAircraft ua c
  scienter   : ActedWithScienter p c
  interferes : InterferesWithOccupiedAircraft ua c
  hazard     : PosesImminentSafetyHazard ua c


structure Section39BRunwayZone (p : Person) (ua : UnmannedAircraft) (c : ComplaintText) : Prop where
  operates : OperatesUnmannedAircraft ua c
  scienter : ActedWithScienter p c
  noAuth   : WithoutAuthorization p c
  zone     : OperatesInRunwayExclusionZone ua c


inductive Section39BViolation (p : Person) (ua : UnmannedAircraft) (c : ComplaintText) : Prop where
  | interference (h : Section39BInterference p ua c)
  | runwayZone   (h : Section39BRunwayZone p ua c)




structure Section40AOffense (p : Person) (ua : UnmannedAircraft) (c : ComplaintText) : Prop where
  operates   : OperatesUnmannedAircraft ua c
  scienter   : ActedWithScienter p c
  interferes : InterferesWithWildfireSuppression ua c
  notExempt  : ¬ GovernmentWildfireOperationException p c





structure Section42Importation (p : Person) (sp : InjuriousSpecies) (c : ComplaintText) : Prop where
  imports     : ImportsOrShipsSpecies sp c
  injurious   : IsInjuriousSpecies sp c
  notPermitted : ¬ ImportationAuthorizedByPermitOrExemption p c


structure Section42InhumaneTransport (p : Person) (sp : InjuriousSpecies) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  transports : KnowinglyTransportsUnderInhumaneConditions sp c
  wild       : IsWildAnimalOrBird sp c


inductive Section42Violation (p : Person) (sp : InjuriousSpecies) (c : ComplaintText) : Prop where
  | importation (h : Section42Importation p sp c)
  | transport   (h : Section42InhumaneTransport p sp c)




inductive AnimalEnterpriseAct (p : Person) (ae : AnimalEnterprise) (c : ComplaintText) : Prop where
  | property          (h : DamagesAnimalEnterpriseProperty ae c)
  | fear              (h : PlacesPersonInFearByCourseOfConduct p c)
  | attemptConspiracy (h : AttemptsOrConspiresToViolate p c)




structure Section43Offense (p : Person) (ae : AnimalEnterprise) (c : ComplaintText) : Prop where
  commerce    : ActInInterstateCommerce p c
  purpose     : PurposeToDamageAnimalEnterprise p c
  enterprise  : IsAnimalEnterprise ae c
  act         : AnimalEnterpriseAct p ae c
  notProtected : ¬ ProtectedFirstAmendmentConduct p c

end Proving.USC.T18.Ch2Ch3.Elements
