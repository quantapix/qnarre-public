






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Deontic

open Proving.USC.Common





axiom AddresseeWhoever (p : Person) (c : ComplaintText) : Prop




axiom AddresseeSentencingAuthority (ct : SentencingCourt) (c : ComplaintText) : Prop




axiom AddresseeGovernmentProsecutor (g : Government) (p : Person) (c : ComplaintText) : Prop






axiom ActTraffickingConduct1591a1 (p q : Person) (c : ComplaintText) : Prop




axiom ActBenefitFromVenture1591a2 (p : Person) (v : Venture) (c : ComplaintText) : Prop




axiom ActProceedWithoutProvingAgeScienter1591c
    (g : Government) (p q : Person) (c : ComplaintText) : Prop




axiom ActObstructEnforcement1591d (p : Person) (c : ComplaintText) : Prop





axiom FineUnderThisTitleImposed (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop



axiom LifeImprisonmentImposed (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop




axiom yearsOfImprisonmentImposed (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Nat







axiom CommerceOrMaritimeNexus1591a1 (p q : Person) (c : ComplaintText) : Prop



axiom ActedKnowingly (p : Person) (c : ComplaintText) : Prop



axiom MeansOfForce1591a (m : Means) (c : ComplaintText) : Prop



axiom MeansOfThreatsOfForce1591a (m : Means) (c : ComplaintText) : Prop



axiom MeansOfFraud1591a (m : Means) (c : ComplaintText) : Prop




axiom MeansWillBeUsedToCauseCommercialSexAct1591a
    (q : Person) (m : Means) (c : ComplaintText) : Prop




axiom VictimUnderEighteenWillBeCaused1591a (q : Person) (c : ComplaintText) : Prop




axiom KnewMeansCondition1591a (p q : Person) (m : Means) (c : ComplaintText) : Prop



axiom RecklesslyDisregardedMeansCondition1591a
    (p q : Person) (m : Means) (c : ComplaintText) : Prop




axiom KnewUnderageCondition1591a (p q : Person) (c : ComplaintText) : Prop



axiom RecklesslyDisregardedUnderageCondition1591a (p q : Person) (c : ComplaintText) : Prop





axiom ActConstitutingViolationIsAdvertising1591a (p : Person) (c : ComplaintText) : Prop




axiom VentureEngagedInParagraphOneAct1591a2 (v : Venture) (c : ComplaintText) : Prop




axiom ConvictedOfOffenseUnder1591a (p : Person) (c : ComplaintText) : Prop





axiom OffenseEffectedByForceFraudOrCoercion1591b (p q : Person) (c : ComplaintText) : Prop




axiom VictimUnderFourteenAtOffense1591b1 (q : Person) (c : ComplaintText) : Prop




axiom VictimAtLeastFourteenAndUnderEighteenAtOffense1591b2
    (q : Person) (c : ComplaintText) : Prop



axiom ProsecutionUnder1591a1Pending (g : Government) (p : Person) (c : ComplaintText) : Prop



axiom DefendantHadReasonableOpportunityToObserve1591c
    (p q : Person) (c : ComplaintText) : Prop




axiom ConvictedOfObstructionUnder1591d (p : Person) (c : ComplaintText) : Prop












axiom AbuseOrThreatenedAbuseOfLegalProcess1591e1 (m : Means) (c : ComplaintText) : Prop



axiom ThreatOfSeriousHarm1591e2a (m : Means) (h : Harm) (c : ComplaintText) : Prop



axiom PhysicalRestraintAgainstPerson1591e2a (m : Means) (c : ComplaintText) : Prop





axiom SchemeToInduceBeliefOfSeriousHarmOrRestraint1591e2b
    (m : Means) (h : Harm) (c : ComplaintText) : Prop




axiom CommercialSexActUnder1591e3 (q : Person) (c : ComplaintText) : Prop




axiom ParticipationInVenture1591e4 (p : Person) (v : Venture) (c : ComplaintText) : Prop







axiom SeriousHarmUnder1591e5 (h : Harm) (c : ComplaintText) : Prop




axiom VentureUnder1591e6 (v : Venture) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part4.Deontic
