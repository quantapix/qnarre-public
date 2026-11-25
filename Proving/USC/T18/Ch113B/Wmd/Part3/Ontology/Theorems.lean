









import Proving.USC.T18.Ch113B.Wmd.Part3.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Ontology

open Proving.USC.Common




theorem chemicalWeaponMembership_intro
    {w : Weapon} {ch : ToxicChemical} {c : ComplaintText}
    (hChemical : IsToxicOrPoisonousChemicalOrPrecursor ch c)
    (hDesign : DesignedOrIntendedToCauseDeathOrSeriousBodilyInjury w c)
    (hMechanism : ActsByReleaseDisseminationOrImpactOfToxicChemicals w ch c)
    (hMember : IsChemicalWeapon w c)
    : ChemicalWeaponMembership w ch c :=
  ⟨hChemical, hDesign, hMechanism, hMember⟩


theorem biologicalWeaponMembership_intro
    {w : Weapon} {b : BiologicalMaterial} {c : ComplaintText}
    (hMaterial : IsBiologicalAgentToxinOrVector b c)
    (hInvolves : InvolvesBiologicalMaterial w b c)
    (hMember : IsBiologicalWeapon w c)
    : BiologicalWeaponMembership w b c :=
  ⟨hMaterial, hInvolves, hMember⟩


theorem radiologicalWeaponMembership_intro
    {w : Weapon} {c : ComplaintText}
    (hDesign : DesignedToReleaseDangerousRadiation w c)
    (hMember : IsRadiologicalWeapon w c)
    : RadiologicalWeaponMembership w c :=
  ⟨hDesign, hMember⟩


theorem weaponOfMassDestructionMembership_intro
    {w : Weapon} {c : ComplaintText}
    (hDevice : IsDestructiveDevice w c)
    (hMember : IsWeaponOfMassDestruction w c)
    : WeaponOfMassDestructionMembership w c :=
  .destructiveDevice hDevice hMember


theorem weaponOfMassDestructionMembership_intro_chemical
    {w : Weapon} {ch : ToxicChemical} {c : ComplaintText}
    (hCase : ChemicalWeaponMembership w ch c)
    (hMember : IsWeaponOfMassDestruction w c)
    : WeaponOfMassDestructionMembership w c :=
  .chemical hCase hMember


theorem weaponOfMassDestructionMembership_intro_biological
    {w : Weapon} {b : BiologicalMaterial} {c : ComplaintText}
    (hCase : BiologicalWeaponMembership w b c)
    (hMember : IsWeaponOfMassDestruction w c)
    : WeaponOfMassDestructionMembership w c :=
  .biological hCase hMember


theorem weaponOfMassDestructionMembership_intro_radiological
    {w : Weapon} {c : ComplaintText}
    (hCase : RadiologicalWeaponMembership w c)
    (hMember : IsWeaponOfMassDestruction w c)
    : WeaponOfMassDestructionMembership w c :=
  .radiological hCase hMember




theorem propertyInclusion_intro
    {pr : Property} {c : ComplaintText}
    (hReal : IsRealProperty pr c) (hMember : IsProperty pr c)
    : PropertyInclusion pr c :=
  .real hReal hMember


theorem propertyInclusion_intro_personal
    {pr : Property} {c : ComplaintText}
    (hPersonal : IsPersonalProperty pr c) (hMember : IsProperty pr c)
    : PropertyInclusion pr c :=
  .personal hPersonal hMember




theorem conductTranscendingNationalBoundariesMembership_intro
    {cd : Conduct} {c : ComplaintText}
    (hOutside : ConductOccursOutsideTheUnitedStates cd c)
    (hInside : ConductOccursWithinTheUnitedStates cd c)
    (hMember : IsConductTranscendingNationalBoundaries cd c)
    : ConductTranscendingNationalBoundariesMembership cd c :=
  ⟨hOutside, hInside, hMember⟩




theorem territorialSeaMembership_intro
    {wz : Waters} {c : ComplaintText}
    (hWithin : nauticalMilesSeawardFromBaseline wz c ≤ 12)
    (hBaseline : BaselineDeterminedInAccordanceWithInternationalLaw wz c)
    (hMember : IsTerritorialSeaOfTheUnitedStates wz c)
    : TerritorialSeaMembership wz c :=
  ⟨hWithin, hBaseline, hMember⟩




theorem enumeratedTerrorismPredicate_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle18TerrorismOffense o c)
    : EnumeratedTerrorismPredicate o c :=
  .title18 h


theorem enumeratedTerrorismPredicate_intro_atomicEnergyAct
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedAtomicEnergyActOffense o c)
    : EnumeratedTerrorismPredicate o c :=
  .atomicEnergyAct h


theorem enumeratedTerrorismPredicate_intro_title49
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle49Offense o c)
    : EnumeratedTerrorismPredicate o c :=
  .title49 h


theorem enumeratedTerrorismPredicate_intro_narcoTerrorism
    {o : Offense} {c : ComplaintText}
    (h : ViolatesNarcoTerrorismOffense o c)
    : EnumeratedTerrorismPredicate o c :=
  .narcoTerrorism h


theorem federalCrimeOfTerrorismMembership_intro
    {o : Offense} {c : ComplaintText}
    (hCalculated : CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct o c)
    (hPredicate : EnumeratedTerrorismPredicate o c)
    (hMember : IsFederalCrimeOfTerrorism o c)
    : FederalCrimeOfTerrorismMembership o c :=
  ⟨hCalculated, hPredicate, hMember⟩




theorem jurisdictionalCircumstance_intro
    {o : Offense} {c : ComplaintText}
    (h : MailUsedInFurtherance o c)
    : JurisdictionalCircumstance o c :=
  .mail h


theorem jurisdictionalCircumstance_intro_commerceFacility
    {o : Offense} {f : Facility} {c : ComplaintText}
    (hFacility : IsFacilityOfInterstateOrForeignCommerce f c)
    (h : CommerceFacilityUsedInFurtherance o f c)
    : JurisdictionalCircumstance o c :=
  .commerceFacility hFacility h


theorem jurisdictionalCircumstance_intro_affectsCommerce
    {o : Offense} {c : ComplaintText}
    (h : OffenseObstructsDelaysOrAffectsInterstateCommerce o c)
    : JurisdictionalCircumstance o c :=
  .affectsCommerce h


theorem jurisdictionalCircumstance_intro_federalVictim
    {o : Offense} {p : Person} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrOfficer o p c)
    : JurisdictionalCircumstance o c :=
  .federalVictim h


theorem jurisdictionalCircumstance_intro_federalProperty
    {o : Offense} {pr : Property} {c : ComplaintText}
    (hProperty : IsProperty pr c)
    (h : PropertyOwnedPossessedOrLeasedByUnitedStates pr c)
    : JurisdictionalCircumstance o c :=
  .federalProperty hProperty h


theorem jurisdictionalCircumstance_intro_territorialSea
    {o : Offense} {wz : Waters} {c : ComplaintText}
    (hSea : IsTerritorialSeaOfTheUnitedStates wz c)
    (h : CommittedInTerritorialSeaOfTheUnitedStates o wz c)
    : JurisdictionalCircumstance o c :=
  .territorialSea hSea h


theorem jurisdictionalCircumstance_intro_specialMaritimeJurisdiction
    {o : Offense} {pl : Place} {c : ComplaintText}
    (h : CommittedWithinSpecialMaritimeAndTerritorialJurisdiction o pl c)
    : JurisdictionalCircumstance o c :=
  .specialMaritimeJurisdiction h

end Proving.USC.T18.Ch113B.Wmd.Part3.Ontology
