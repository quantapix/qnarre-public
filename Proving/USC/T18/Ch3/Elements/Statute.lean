








import Proving.USC.T18.Ch3.Elements.Types
import Proving.USC.T18.Ch3.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch3.Elements
open Proving.USC.Common




inductive Section41Act (c : ComplaintText) : Prop where
  | wildlife (h : TakesOrKillsProtectedWildlife c)
  | eggsNest (h : DestroysEggsOrNest c)
  | property (h : WillfullyInjuresUSProperty c)


structure Section41 (p : Person) (c : ComplaintText) : Prop where
  culpable     : IsCulpablePerson p c
  onRefuge     : OnProtectedRefugeLand c
  act          : Section41Act c
  notCompliant : ¬ InComplianceWithRegulations c




structure Section42 (p : Person) (c : ComplaintText) : Prop where
  culpable    : IsCulpablePerson p c
  federalHook : FederalJurisdictionalNexus c
  act         : ImportsOrShipsInjuriousSpecies c
  injurious   : IsInjuriousSpecies c
  notExempt   : ¬ ImportationExempt c


structure Section42c (p : Person) (c : ComplaintText) : Prop where
  culpable    : IsCulpablePerson p c
  scienter    : ActedWithScienter p c
  federalHook : FederalJurisdictionalNexus c
  act         : TransportsUnderInhumaneConditions c




inductive AnimalEnterprise1961d (e : Entity) (c : ComplaintText) : Prop where
  | commercial (h : IsCommercialOrAcademicAnimalEnterprise e c)
  | venue      (h : IsAnimalVenueEnterprise e c)
  | fair       (h : IsAgriculturalFairEvent e c)


abbrev IsAnimalEnterprise (e : Entity) (c : ComplaintText) : Prop :=
  AnimalEnterprise1961d e c



structure CourseOfConduct (c : ComplaintText) : Prop where
  continuity : HasContinuityOfPurpose c
  twoOrMore  : ∃ n : Nat, NumberOfConductActs n c ∧ 2 ≤ n


structure PlacesInFearByCourseOfConduct (c : ComplaintText) : Prop where
  fear   : IntentionallyPlacesInReasonableFear c
  course : CourseOfConduct c


inductive Section43PredicateAct (c : ComplaintText) : Prop where
  | property        (h : IntentionallyDamagesEnterpriseProperty c)
  | fear            (h : PlacesInFearByCourseOfConduct c)
  | conspireAttempt (h : ConspiresOrAttemptsSection43 c)


structure Section43 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  culpable     : IsCulpablePerson p c
  interstate   : TravelsOrUsesInterstateCommerceFacility p c
  purpose      : PurposeToDamageAnimalEnterprise p c
  enterprise   : IsAnimalEnterprise e c
  act          : Section43PredicateAct c
  notProtected : ¬ IsProtectedExpressiveConduct c




inductive Section47Act (c : ComplaintText) : Prop where
  | aircraftHunt (h : UsesAircraftOrVehicleToHunt c)
  | pollute      (h : PollutesWateringHole c)


structure Section47 (p : Person) (c : ComplaintText) : Prop where
  culpable : IsCulpablePerson p c
  purpose  : PurposeToTakeProtectedEquine p c
  equine   : IsProtectedWildEquine c
  onPublic : OnPublicLandOrRange c
  act      : Section47Act c




structure IsAnimalCrushVideo (v : CrushVideo) (c : ComplaintText) : Prop where
  depicts : DepictsAnimalCrushing v c
  obscene : VideoIsObscene v c


inductive Section48Act (c : ComplaintText) : Prop where
  | crush   (h : EngagesInAnimalCrushing c)
  | create  (v : CrushVideo) (hv : IsAnimalCrushVideo v c) (h : CreatesAnimalCrushVideo v c)
  | traffic (v : CrushVideo) (hv : IsAnimalCrushVideo v c) (h : TrafficksAnimalCrushVideo v c)


structure Section48 (p : Person) (c : ComplaintText) : Prop where
  culpable  : IsCulpablePerson p c
  scienter  : ActedWithScienter p c
  nexus     : HasInterstateOrSMTJNexus c
  act       : Section48Act c
  notExempt : ¬ Section48ExemptConduct c




structure Section49 (p : Person) (c : ComplaintText) : Prop where
  culpable    : IsCulpablePerson p c
  federalHook : FederalJurisdictionalNexus c
  violation   : ViolatedAnimalWelfareActFightingProhibition c



inductive Chapter3AnimalOffense (c : ComplaintText) : Prop where
  | s41  (p : Person) (h : Section41 p c)
  | s42  (p : Person) (h : Section42 p c)
  | s42c (p : Person) (h : Section42c p c)
  | s43  (p : Person) (e : Entity) (h : Section43 p e c)
  | s47  (p : Person) (h : Section47 p c)
  | s48  (p : Person) (h : Section48 p c)
  | s49  (p : Person) (h : Section49 p c)

end Proving.USC.T18.Ch3.Elements
