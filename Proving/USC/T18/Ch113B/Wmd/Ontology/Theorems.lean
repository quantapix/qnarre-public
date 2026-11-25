




import Proving.USC.T18.Ch113B.Wmd.Ontology.Types
import Proving.USC.T18.Ch113B.Wmd.Ontology.Predicates
import Proving.USC.T18.Ch113B.Wmd.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Ontology

open Proving.USC.Common




theorem weaponOfMassDestruction_intro_destructiveDevice
    {w : Weapon} {c : ComplaintText} (h : IsDestructiveDevice w c)
    : WeaponOfMassDestruction w c :=
  WeaponOfMassDestruction.destructiveDevice h


theorem weaponOfMassDestruction_intro_toxicChemical
    {w : Weapon} {c : ComplaintText} (h : IsToxicChemicalWeapon w c)
    : WeaponOfMassDestruction w c :=
  WeaponOfMassDestruction.toxicChemical h


theorem weaponOfMassDestruction_intro_biological
    {w : Weapon} {c : ComplaintText} (h : InvolvesBiologicalAgentToxinOrVector w c)
    : WeaponOfMassDestruction w c :=
  WeaponOfMassDestruction.biological h


theorem weaponOfMassDestruction_intro_radiological
    {w : Weapon} {c : ComplaintText} (h : IsRadiologicalWeapon w c)
    : WeaponOfMassDestruction w c :=
  WeaponOfMassDestruction.radiological h




theorem propertyUnder2332a_intro_real
    {x : Property} {c : ComplaintText} (h : IsRealProperty x c)
    : PropertyUnder2332a x c :=
  PropertyUnder2332a.real h


theorem propertyUnder2332a_intro_personal
    {x : Property} {c : ComplaintText} (h : IsPersonalProperty x c)
    : PropertyUnder2332a x c :=
  PropertyUnder2332a.personal h


theorem propertyUnder2332a_intro_otherwise
    {x : Property} {c : ComplaintText} (h : IsPropertyOtherwiseIncluded x c)
    : PropertyUnder2332a x c :=
  PropertyUnder2332a.otherwise h




theorem conductTranscendingNationalBoundaries_intro
    {x : Conduct} {c : ComplaintText}
    (hOutside : OccursOutsideTheUnitedStates x c)
    (hWithin  : OccursWithinTheUnitedStates x c)
    : ConductTranscendingNationalBoundaries x c :=
  ⟨hOutside, hWithin⟩




theorem territorialSeaOfTheUnitedStates_intro
    {z : MaritimeZone} {c : ComplaintText}
    (hExtent    : ExtendsSeawardWithinTwelveNauticalMiles z c)
    (hBaselines : MeasuredFromUnitedStatesBaselines z c)
    : TerritorialSeaOfTheUnitedStates z c :=
  ⟨hExtent, hBaselines⟩




theorem enumeratedTerrorismProvisionViolation_intro_title18
    {o : Offense} {c : ComplaintText} (h : ViolatesEnumeratedTitle18Provision o c)
    : EnumeratedTerrorismProvisionViolation o c :=
  EnumeratedTerrorismProvisionViolation.title18 h


theorem enumeratedTerrorismProvisionViolation_intro_atomicEnergy
    {o : Offense} {c : ComplaintText} (h : ViolatesEnumeratedAtomicEnergyActProvision o c)
    : EnumeratedTerrorismProvisionViolation o c :=
  EnumeratedTerrorismProvisionViolation.atomicEnergy h


theorem enumeratedTerrorismProvisionViolation_intro_title49
    {o : Offense} {c : ComplaintText} (h : ViolatesEnumeratedTitle49Provision o c)
    : EnumeratedTerrorismProvisionViolation o c :=
  EnumeratedTerrorismProvisionViolation.title49 h


theorem enumeratedTerrorismProvisionViolation_intro_narcoTerrorism
    {o : Offense} {c : ComplaintText} (h : ViolatesNarcoTerrorismProvision o c)
    : EnumeratedTerrorismProvisionViolation o c :=
  EnumeratedTerrorismProvisionViolation.narcoTerrorism h






theorem federalCrimeOfTerrorism_intro
    {o : Offense} {c : ComplaintText}
    (hMotive     : CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct o c)
    (hEnumerated : EnumeratedTerrorismProvisionViolation o c)
    : FederalCrimeOfTerrorism o c :=
  ⟨hMotive, hEnumerated⟩




theorem circumstanceUnder2332b_intro_mailOrFacility
    {cir : Circumstance} {c : ComplaintText}
    (h : MailOrFacilityOfCommerceUsedInFurtherance cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.mailOrFacility h


theorem circumstanceUnder2332b_intro_commerceEffect
    {cir : Circumstance} {c : ComplaintText}
    (h : OffenseObstructsDelaysOrAffectsCommerce cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.commerceEffect h


theorem circumstanceUnder2332b_intro_federalVictim
    {cir : Circumstance} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrOfficial cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.federalVictim h


theorem circumstanceUnder2332b_intro_federalProperty
    {cir : Circumstance} {c : ComplaintText}
    (h : PropertyOwnedPossessedOrLeasedByUnitedStates cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.federalProperty h


theorem circumstanceUnder2332b_intro_territorialSea
    {cir : Circumstance} {c : ComplaintText}
    (h : CommittedInTerritorialSeaOfTheUnitedStates cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.territorialSea h


theorem circumstanceUnder2332b_intro_specialJurisdiction
    {cir : Circumstance} {c : ComplaintText}
    (h : CommittedWithinSpecialMaritimeAndTerritorialJurisdiction cir c)
    : CircumstanceUnder2332b cir c :=
  CircumstanceUnder2332b.specialJurisdiction h




theorem jurisdictionalCircumstanceAttribution_intro
    {cir : Circumstance} {c : ComplaintText}
    (hEnumerated : CircumstanceUnder2332b cir c)
    (hAttributed : AppliesToAtLeastOneOffender cir c)
    : JurisdictionalCircumstanceAttribution cir c :=
  ⟨hEnumerated, hAttributed⟩

end Proving.USC.T18.Ch113B.Wmd.Ontology
