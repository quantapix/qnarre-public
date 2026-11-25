




































import Proving.Trafficking.Types

namespace Proving.Trafficking
















axiom ActedKnowingly
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop















axiom RecruitsHarborsTransportsProvidesOrObtains
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop





axiom ForLaborOrServices
    (victim : Person) (a : Action) (c : ComplaintText) : Prop










axiom InViolationOfChapterSeventySeven
    (a : Action) (c : ComplaintText) : Prop




axiom ObstructsEnforcementOfSection1590
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop















axiom InterstateCommerceOrSpecialJurisdiction
    (a : Action) (c : ComplaintText) : Prop







axiom RecruitsEnticesHarborsAdvertisesOrSolicits
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop







axiom BenefitsFromParticipationInVenture
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop









axiom VentureEngagedInSection1591a1Act
    (a : Action) (c : ComplaintText) : Prop








axiom KnewOrRecklesslyDisregardedCoerciveMeans
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop













axiom CoerciveMeansWillBeUsed
    (victim : Person) (a : Action) (c : ComplaintText) : Prop




axiom PersonHasNotAttainedAgeEighteen
    (victim : Person) (c : ComplaintText) : Prop






axiom KnewOrRecklesslyDisregardedThatPersonWasMinor
    (defendant : Person) (victim : Person) (c : ComplaintText) : Prop














axiom ReasonableOpportunityToObservePerson
    (defendant : Person) (victim : Person) (c : ComplaintText) : Prop







axiom WillBeCausedToEngageInCommercialSexAct
    (victim : Person) (a : Action) (c : ComplaintText) : Prop





axiom ObstructsEnforcementOfSection1591
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop













axiom DestroysConcealsRemovesConfiscatesOrPossesses
    (defendant : Person) (d : Document)
    (a : Action) (c : ComplaintText) : Prop







axiom IsPassportOrGovernmentIdentificationDocument
    (d : Document) (c : ComplaintText) : Prop






axiom DocumentOfAnotherPerson
    (d : Document) (victim : Person) (c : ComplaintText) : Prop






axiom InCourseOfEnumeratedTraffickingViolation
    (a : Action) (c : ComplaintText) : Prop





axiom WithIntentToViolateEnumeratedTraffickingSection
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop





axiom ToPreventOrRestrictLibertyToMoveOrTravel
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop





axiom WithoutLawfulAuthority
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop



axiom InOrderToMaintainLaborOrServices
    (victim : Person) (a : Action) (c : ComplaintText) : Prop






axiom IsVictimOfSevereFormOfTrafficking
    (victim : Person) (c : ComplaintText) : Prop















axiom Section1592bVictimExclusionInapplicable
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop




axiom ObstructsEnforcementOfSection1592
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop

end Proving.Trafficking
