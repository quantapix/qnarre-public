import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part2.Deontic.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Part2.Deontic

open Proving.USC.Common





axiom AddresseeWhoever1591 (p : Person) (c : ComplaintText) : Prop




axiom ActedKnowingly1591a (p : Person) (c : ComplaintText) : Prop







axiom RegulatedActTraffickingPerson1591a1
    (p : Person) (victim : Person) (c : ComplaintText) : Prop




axiom InterstateOrForeignCommerceNexus1591a1 (p : Person) (c : ComplaintText) : Prop




axiom SpecialMaritimeOrTerritorialJurisdiction1591a1
    (p : Person) (c : ComplaintText) : Prop







axiom ActConstitutingViolationIsAdvertising1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop






axiom ForceOrThreatsOfForceWillBeUsed1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop




axiom FraudWillBeUsed1591a (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom ActuallyKnewMeansWillBeUsed1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom RecklesslyDisregardedMeansWillBeUsed1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop







axiom VictimUnderStatutoryAge1591a (victim : Person) (c : ComplaintText) : Prop




axiom ActuallyKnewVictimUnderStatutoryAge1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom RecklesslyDisregardedVictimUnderStatutoryAge1591a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom WillBeCausedToEngageInSexAct1591a (victim : Person) (c : ComplaintText) : Prop




axiom SexActIsCommercial1591e3 (victim : Person) (c : ComplaintText) : Prop






axiom RegulatedActBenefitsFromVenture1591a2
    (p : Person) (v : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInParagraphOneViolation1591a2
    (v : Venture) (c : ComplaintText) : Prop




axiom IsVenture1591e6 (v : Venture) (c : ComplaintText) : Prop




axiom ParticipationInVenture1591e4
    (p : Person) (v : Venture) (c : ComplaintText) : Prop





axiom ThreatOfHarmAgainstPerson1591e2a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop



axiom PhysicalRestraintAgainstPerson1591e2a
    (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom SchemePlanOrPatternCausingBeliefOfHarm1591e2b
    (p : Person) (victim : Person) (c : ComplaintText) : Prop






axiom AbuseOrThreatenedAbuseOfLawOrLegalProcess1591e2c
    (p : Person) (victim : Person) (c : ComplaintText) : Prop






axiom HarmIsSufficientlySerious1591e5
    (p : Person) (victim : Person) (c : ComplaintText) : Prop






axiom AddresseeSentencingCourt1591b (court : Entity) (c : ComplaintText) : Prop




axiom ConvictedOfOffenseUnderSubsectionA1591b (p : Person) (c : ComplaintText) : Prop





axiom OffenseEffectedByForceThreatsFraudOrCoercion1591b1
    (p : Person) (victim : Person) (c : ComplaintText) : Prop




axiom VictimUnderAge14AtOffense1591b1 (victim : Person) (c : ComplaintText) : Prop




axiom VictimAtLeastAge14AndUnderAge18AtOffense1591b2
    (victim : Person) (c : ComplaintText) : Prop




axiom FineUnderThisTitleImposed1591b
    (court : Entity) (p : Person) (c : ComplaintText) : Prop




axiom LifeImprisonmentImposed1591b
    (court : Entity) (p : Person) (c : ComplaintText) : Prop





axiom yearsOfImprisonmentImposed1591b
    (court : Entity) (p : Person) (c : ComplaintText) : Nat






axiom AddresseeGovernmentInProsecution1591c (gov : Entity) (c : ComplaintText) : Prop




axiom ProsecutionUnderParagraphOne1591c
    (gov : Entity) (p : Person) (c : ComplaintText) : Prop





axiom ReasonableOpportunityToObserveVictim1591c
    (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom ProceedsWithoutProvingMinorityScienter1591c
    (gov : Entity) (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActObstructsEnforcement1591d (p : Person) (c : ComplaintText) : Prop




axiom ConvictedOfObstructionUnder1591d (p : Person) (c : ComplaintText) : Prop




axiom FineUnderThisTitleImposed1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Prop





axiom yearsOfImprisonmentImposed1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part2.Deontic
