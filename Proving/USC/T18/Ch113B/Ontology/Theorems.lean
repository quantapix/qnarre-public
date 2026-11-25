







import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Ontology.Types
import Proving.USC.T18.Ch113B.Ontology.Predicates
import Proving.USC.T18.Ch113B.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Ontology

open Proving.USC.Common


theorem internationalTerrorismDefinition_intro {a : Activity} {c : ComplaintText}
    (hActs : InvolvesViolentActsOrActsDangerousToHumanLife a c)
    (hIntent :
      AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c ∨
      AppearsIntendedToInfluenceGovernmentPolicy a c ∨
      AppearsIntendedToAffectGovernmentConduct a c)
    (hLocus :
      OccursPrimarilyOutsideTerritorialJurisdictionOfUS a c ∨
      TranscendsNationalBoundaries a c)
    : InternationalTerrorismDefinition a c :=
  ⟨hActs, hIntent, hLocus⟩


theorem domesticTerrorismDefinition_intro {a : Activity} {c : ComplaintText}
    (hActs : InvolvesActsDangerousToHumanLife a c)
    (hIntent :
      AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c ∨
      AppearsIntendedToInfluenceGovernmentPolicy a c ∨
      AppearsIntendedToAffectGovernmentConduct a c)
    (hLocus : OccursPrimarilyWithinTerritorialJurisdictionOfUS a c)
    : DomesticTerrorismDefinition a c :=
  ⟨hActs, hIntent, hLocus⟩


theorem personDefinition_intro {p : Person} {c : ComplaintText}
    (h : CapableOfHoldingLegalOrBeneficialInterestInProperty p c)
    : PersonDefinition p c :=
  ⟨h⟩


theorem actOfWarDefinition_intro {x : Act} {c : ComplaintText}
    (h :
      OccursInCourseOfDeclaredWar x c ∨
      OccursInCourseOfArmedConflictBetweenNations x c ∨
      OccursInCourseOfArmedConflictBetweenMilitaryForces x c)
    : ActOfWarDefinition x c :=
  match h with
  | .inl h => .declaredWar h
  | .inr (.inl h) => .betweenNations h
  | .inr (.inr h) => .betweenMilitaryForces h


theorem excludedFromMilitaryForce_intro {m : MilitaryForce} {c : ComplaintText}
    (h :
      IsDesignatedForeignTerroristOrganization m c ∨
      IsSpeciallyDesignatedGlobalTerrorist m c ∨
      DeterminedByCourtNotToBeMilitaryForce m c)
    : ExcludedFromMilitaryForce m c :=
  match h with
  | .inl h => .designatedFTO h
  | .inr (.inl h) => .designatedSDGT h
  | .inr (.inr h) => .courtDetermination h


theorem militaryForceDefinition_intro {m : MilitaryForce} {c : ComplaintText}
    (hResidual : IsMilitaryForce m c) (hNot : ¬ ExcludedFromMilitaryForce m c)
    : MilitaryForceDefinition m c :=
  ⟨hResidual, hNot⟩


theorem weaponOfMassDestructionDefinition_intro {w : Weapon} {c : ComplaintText}
    (h :
      IsDestructiveDevice w c ∨
      IsToxicOrPoisonousChemicalWeapon w c ∨
      IsBiologicalAgentWeapon w c ∨
      IsRadiationReleasingWeapon w c)
    : WeaponOfMassDestructionDefinition w c :=
  match h with
  | .inl h => .destructiveDevice h
  | .inr (.inl h) => .chemical h
  | .inr (.inr (.inl h)) => .biological h
  | .inr (.inr (.inr h)) => .radiological h


theorem federalCrimeOfTerrorismDefinition_intro {o : Offense} {c : ComplaintText}
    (hPurpose : IsCalculatedToInfluenceOrRetaliateAgainstGovernment o c)
    (hOffense : IsEnumeratedTerrorismPredicateOffense o c)
    : FederalCrimeOfTerrorismDefinition o c :=
  ⟨hPurpose, hOffense⟩


theorem unitedStatesPersonDefinition_intro {p : Person} {c : ComplaintText}
    (h :
      IsUnitedStatesCitizenOrNational p c ∨
      IsPermanentResidentAlien p c ∨
      IsJuridicalPersonOrganizedUnderUnitedStatesLaw p c ∨
      IsPersonInUS p c)
    : UnitedStatesPersonDefinition p c :=
  match h with
  | .inl h => .citizenOrNational h
  | .inr (.inl h) => .permanentResident h
  | .inr (.inr (.inl h)) => .juridicalPerson h
  | .inr (.inr (.inr h)) => .presentInUS h


theorem armedConflictDefinition_intro {ac : ArmedConflict} {c : ComplaintText}
    (hResidual : IsArmedConflict ac c) (hNot : ¬ IsInternalDisturbanceOrTension ac c)
    : ArmedConflictDefinition ac c :=
  ⟨hResidual, hNot⟩


theorem deviceDefinition_intro {d : Device} {c : ComplaintText}
    (h : IsNuclearExplosiveDevice d c ∨ IsRadioactiveDispersalOrRadiationEmittingDevice d c)
    : DeviceDefinition d c :=
  match h with
  | .inl h => .nuclearExplosive h
  | .inr h => .dispersalOrEmitting h


theorem nuclearFacilityDefinition_intro {f : Facility} {c : ComplaintText}
    (h :
      IsNuclearReactor f c ∨
      IsRadioactiveMaterialPlantOrConveyance f c ∨
      IsNuclearMaterialHandlingFacility f c)
    : NuclearFacilityDefinition f c :=
  match h with
  | .inl h => .reactor h
  | .inr (.inl h) => .plantOrConveyance h
  | .inr (.inr h) => .handlingFacility h


theorem radioactiveMaterialDefinition_intro {m : Material} {c : ComplaintText}
    (h : IsNuclearMaterial m c ∨ ContainsSpontaneouslyDisintegratingNuclides m c)
    : RadioactiveMaterialDefinition m c :=
  match h with
  | .inl h => .nuclearMaterial h
  | .inr h => .otherRadioactiveSubstance h


theorem bombingDeviceDefinition_intro {d : Device} {c : ComplaintText}
    (h : IsExplosive d c ∨ IsOtherLethalDevice d c)
    : BombingDeviceDefinition d c :=
  match h with
  | .inl h => .explosive h
  | .inr h => .otherLethalDevice h


theorem blockedAssetInclusion_intro {a : Asset} {p : Person} {c : ComplaintText}
    (hOf : IsAssetOfTerroristParty a p c) (hParty : IsTerroristParty p c)
    (hSeized : SeizedOrFrozenUnderKingpinAct a c)
    : BlockedAssetInclusion a p c :=
  ⟨hOf, hParty, hSeized⟩

end Proving.USC.T18.Ch113B.Ontology
