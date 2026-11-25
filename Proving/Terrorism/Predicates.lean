

























import Proving.Terrorism.Types

namespace Proving.Terrorism


















axiom IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop






axiom WithoutLawfulAuthority
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop






axiom UsesThreatensAttemptsOrConspiresToUse
    (defendant : Person) (w : Weapon) (a : Action) (c : ComplaintText) : Prop





axiom AgainstUsNationalOutsideUs (a : Action) (c : ComplaintText) : Prop






axiom AgainstPersonOrPropertyWithinUs (a : Action) (c : ComplaintText) : Prop










axiom InterstateOrForeignCommerceNexus (a : Action) (c : ComplaintText) : Prop






axiom AgainstUnitedStatesProperty (a : Action) (c : ComplaintText) : Prop




axiom AgainstForeignGovernmentPropertyWithinUs
    (a : Action) (c : ComplaintText) : Prop






axiom IsNationalOfUnitedStates (defendant : Person) (c : ComplaintText) : Prop





axiom ConductOutsideUnitedStates (a : Action) (c : ComplaintText) : Prop














axiom ConductTranscendingNationalBoundaries
    (a : Action) (c : ComplaintText) : Prop
















axiom JurisdictionalCircumstanceExists (a : Action) (c : ComplaintText) : Prop







axiom ViolentActAgainstPersonWithinUs
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop









axiom PropertyHarmCreatingRiskOfSeriousBodilyInjury
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop






axiom InViolationOfStateOrFederalLaw (a : Action) (c : ComplaintText) : Prop





axiom ThreatensAttemptsOrConspiresUnderSection2332b
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop
















axiom CalculatedToInfluenceOrRetaliateAgainstGovernment
    (a : Action) (c : ComplaintText) : Prop










axiom ViolatesEnumeratedTerrorismOffense (a : Action) (c : ComplaintText) : Prop

end Proving.Terrorism
