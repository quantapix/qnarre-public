









import Proving.USC.T18.Ch113B.Wmd.Part3.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Ontology

open Proving.USC.Common








axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop






axiom IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop





axiom IsDestructiveDevice (w : Weapon) (c : ComplaintText) : Prop



axiom IsChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom DesignedOrIntendedToCauseDeathOrSeriousBodilyInjury
    (w : Weapon) (c : ComplaintText) : Prop





axiom ActsByReleaseDisseminationOrImpactOfToxicChemicals
    (w : Weapon) (ch : ToxicChemical) (c : ComplaintText) : Prop




axiom IsToxicOrPoisonousChemicalOrPrecursor
    (ch : ToxicChemical) (c : ComplaintText) : Prop



axiom IsBiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom InvolvesBiologicalMaterial
    (w : Weapon) (b : BiologicalMaterial) (c : ComplaintText) : Prop





axiom IsBiologicalAgentToxinOrVector
    (b : BiologicalMaterial) (c : ComplaintText) : Prop



axiom IsRadiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom DesignedToReleaseDangerousRadiation (w : Weapon) (c : ComplaintText) : Prop







axiom IsProperty (pr : Property) (c : ComplaintText) : Prop




axiom IsRealProperty (pr : Property) (c : ComplaintText) : Prop




axiom IsPersonalProperty (pr : Property) (c : ComplaintText) : Prop






axiom IsConductTranscendingNationalBoundaries
    (cd : Conduct) (c : ComplaintText) : Prop



axiom ConductOccursOutsideTheUnitedStates (cd : Conduct) (c : ComplaintText) : Prop





axiom ConductOccursWithinTheUnitedStates (cd : Conduct) (c : ComplaintText) : Prop






axiom IsFacilityOfInterstateOrForeignCommerce
    (f : Facility) (c : ComplaintText) : Prop










axiom IsSeriousBodilyInjury (inj : Injury) (c : ComplaintText) : Prop







axiom IsTerritorialSeaOfTheUnitedStates (wz : Waters) (c : ComplaintText) : Prop






axiom nauticalMilesSeawardFromBaseline (wz : Waters) (c : ComplaintText) : Nat




axiom BaselineDeterminedInAccordanceWithInternationalLaw
    (wz : Waters) (c : ComplaintText) : Prop








axiom IsFederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop





axiom CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct
    (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedTitle18TerrorismOffense
    (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedAtomicEnergyActOffense
    (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedTitle49Offense (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesNarcoTerrorismOffense (o : Offense) (c : ComplaintText) : Prop






axiom MailUsedInFurtherance (o : Offense) (c : ComplaintText) : Prop




axiom CommerceFacilityUsedInFurtherance
    (o : Offense) (f : Facility) (c : ComplaintText) : Prop





axiom OffenseObstructsDelaysOrAffectsInterstateCommerce
    (o : Offense) (c : ComplaintText) : Prop






axiom VictimIsUnitedStatesGovernmentOrOfficer
    (o : Offense) (p : Person) (c : ComplaintText) : Prop





axiom PropertyOwnedPossessedOrLeasedByUnitedStates
    (pr : Property) (c : ComplaintText) : Prop






axiom CommittedInTerritorialSeaOfTheUnitedStates
    (o : Offense) (wz : Waters) (c : ComplaintText) : Prop





axiom CommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (o : Offense) (pl : Place) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part3.Ontology
