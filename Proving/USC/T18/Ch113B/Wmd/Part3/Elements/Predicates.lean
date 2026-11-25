












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Elements







axiom HasLawfulAuthority (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsDestructiveDevice (w : Weapon) (c : ComplaintText) : Prop





axiom IsChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom IsBiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom IsRadiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom UsesWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom ThreatensToUseWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom AttemptsToUseWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop





axiom AgreedObjectIsWeaponUse (ag : Agreement) (w : Weapon) (c : ComplaintText) : Prop




axiom TargetIsNationalOfUnitedStates (t : Target) (c : ComplaintText) : Prop




axiom TargetIsOutsideUnitedStates (t : Target) (c : ComplaintText) : Prop





axiom TargetIsPersonOrPropertyWithinUnitedStates (t : Target) (c : ComplaintText) : Prop





axiom MailOrFacilityOfInterstateCommerceUsedInFurtherance
    (o : Offense) (c : ComplaintText) : Prop




axiom PropertyUsedInOrAffectingInterstateCommerce (t : Target) (c : ComplaintText) : Prop




axiom PerpetratorTravelsInInterstateCommerceInFurtherance
    (o : Offense) (c : ComplaintText) : Prop




axiom OffenseAffectsOrWouldAffectInterstateCommerce
    (o : Offense) (c : ComplaintText) : Prop





axiom TargetIsUnitedStatesProperty (t : Target) (c : ComplaintText) : Prop




axiom TargetIsForeignGovernmentPropertyWithinUnitedStates
    (t : Target) (c : ComplaintText) : Prop




axiom IsNationalOfUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ConductOccurredOutsideUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom ConductOccurredWithinUnitedStates (o : Offense) (c : ComplaintText) : Prop






axiom DeathResultedFromOffense (o : Offense) (c : ComplaintText) : Prop





axiom KillsPerson (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom KidnapsPerson (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom MaimsPerson (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom CommitsAssaultResultingInSeriousBodilyInjury
    (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom AssaultsWithDangerousWeapon (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom DestroysOrDamagesProperty (p : Person) (pr : PropertyItem) (c : ComplaintText) : Prop




axiom AttemptsOrConspiresToDestroyOrDamageProperty
    (p : Person) (pr : PropertyItem) (c : ComplaintText) : Prop



axiom PropertyIsWithinUnitedStates (pr : PropertyItem) (c : ComplaintText) : Prop




axiom CreatesSubstantialRiskOfSeriousBodilyInjury
    (p : Person) (pr : PropertyItem) (c : ComplaintText) : Prop





axiom ViolatesLawOfStateOrUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom OffenseObstructsDelaysOrAffectsInterstateCommerce
    (o : Offense) (c : ComplaintText) : Prop






axiom VictimIsUnitedStatesGovernmentOrOfficer (o : Offense) (c : ComplaintText) : Prop





axiom PropertyInvolvedIsUnitedStatesOwned (o : Offense) (c : ComplaintText) : Prop





axiom OffenseCommittedInTerritorialSea (o : Offense) (c : ComplaintText) : Prop




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (o : Offense) (c : ComplaintText) : Prop




axiom ThreatensToCommitSection2332bOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom AttemptsToCommitSection2332bOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom ConspiresToCommitSection2332bOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom ObjectOffenseWouldViolateParagraph1 (o : Offense) (c : ComplaintText) : Prop




axiom IsPrincipalOrCoconspirator (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsAccessoryAfterTheFact (p : Person) (o : Offense) (c : ComplaintText) : Prop






axiom KnowsOfJurisdictionalBase (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom CalculatedToInfluenceOrRetaliateAgainstGovernment
    (o : Offense) (c : ComplaintText) : Prop




axiom IsEnumeratedTerrorismOffense (o : Offense) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part3.Elements
