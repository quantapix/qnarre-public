




import Proving.USC.T18.Ch113B.Wmd.Elements.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Elements

open Proving.USC.Common


axiom ActsUnderLawfulAuthority (p : Person) (c : ComplaintText) : Prop


axiom IsDestructiveDevice921 (w : Weapon) (c : ComplaintText) : Prop


axiom IsToxicChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop


axiom IsBiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop


axiom IsRadiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop


axiom UsesWeaponOfMassDestruction (p : Person) (w : Weapon) (c : ComplaintText) : Prop


axiom ThreatensToUseWeaponOfMassDestruction (p : Person) (w : Weapon) (c : ComplaintText) : Prop


axiom AttemptsToUseWeaponOfMassDestruction (p : Person) (w : Weapon) (c : ComplaintText) : Prop


axiom ConspiresToUseWeaponOfMassDestruction (p : Person) (w : Weapon) (c : ComplaintText) : Prop


axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop


axiom IsOutsideTheUnitedStates (p : Person) (c : ComplaintText) : Prop


axiom PropertyIsWithinTheUnitedStates (r : Property) (c : ComplaintText) : Prop


axiom MailOrFacilityOfInterstateCommerceUsedInFurtherance (c : ComplaintText) : Prop


axiom PropertyUsedInOrAffectingInterstateCommerce (r : Property) (c : ComplaintText) : Prop


axiom PerpetratorTravelsInInterstateCommerceInFurtherance (c : ComplaintText) : Prop


axiom OffenseAffectsInterstateCommerce (c : ComplaintText) : Prop


axiom PropertyOwnedLeasedOrUsedByUnitedStates (r : Property) (c : ComplaintText) : Prop


axiom PropertyOwnedLeasedOrUsedByForeignGovernment (r : Property) (c : ComplaintText) : Prop


axiom ConductOccursOutsideTheUnitedStates (c : ComplaintText) : Prop


axiom DeathResultsFromOffenseConduct (c : ComplaintText) : Prop


axiom ConductOccursWithinTheUnitedStates (c : ComplaintText) : Prop


axiom KillsVictim (p : Person) (v : Person) (c : ComplaintText) : Prop


axiom KidnapsVictim (p : Person) (v : Person) (c : ComplaintText) : Prop


axiom MaimsVictim (p : Person) (v : Person) (c : ComplaintText) : Prop


axiom AssaultsVictimResultingInSeriousBodilyInjury (p : Person) (v : Person) (c : ComplaintText) : Prop


axiom AssaultsVictimWithDangerousWeapon (p : Person) (v : Person) (c : ComplaintText) : Prop


axiom CreatesSubstantialRiskOfSeriousBodilyInjury (p : Person) (c : ComplaintText) : Prop


axiom DestroysOrDamagesProperty (p : Person) (r : Property) (c : ComplaintText) : Prop


axiom AttemptsToDestroyOrDamageProperty (p : Person) (r : Property) (c : ComplaintText) : Prop


axiom ConspiresToDestroyOrDamageProperty (p : Person) (r : Property) (c : ComplaintText) : Prop


axiom ViolatesStateLawOffenseElements (p : Person) (c : ComplaintText) : Prop


axiom ViolatesFederalLaw (p : Person) (c : ComplaintText) : Prop


axiom OffenseObstructsDelaysOrAffectsInterstateCommerce (c : ComplaintText) : Prop


axiom VictimIsUnitedStatesGovernmentOrOfficial (v : Person) (c : ComplaintText) : Prop


axiom PropertyOwnedPossessedOrLeasedByUnitedStates (r : Property) (c : ComplaintText) : Prop


axiom OffenseCommittedInTerritorialSeaOfTheUnitedStates (c : ComplaintText) : Prop


axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction (c : ComplaintText) : Prop


axiom ThreatensToCommitOffenseUnderSubsectionA1 (p : Person) (c : ComplaintText) : Prop


axiom AttemptsToCommitOffenseUnderSubsectionA1 (p : Person) (c : ComplaintText) : Prop


axiom ConspiresToCommitOffenseUnderSubsectionA1 (p : Person) (c : ComplaintText) : Prop


axiom IsPrincipalCoconspiratorOrAccessoryAfterTheFact (p : Person) (c : ComplaintText) : Prop


axiom CircumstanceAppliesToAtLeastOneOffender (c : ComplaintText) : Prop


axiom CalculatedToInfluenceOrRetaliateAgainstGovernment (o : Offense) (c : ComplaintText) : Prop


axiom ViolatesEnumeratedTerrorismOffense (o : Offense) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Elements