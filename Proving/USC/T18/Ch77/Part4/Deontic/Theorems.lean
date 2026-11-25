





import Proving.USC.T18.Ch77.Part4.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Deontic

open Proving.USC.Common





theorem coercionUnder1591e2_intro {m h c}
    (hb : (ThreatOfSeriousHarm1591e2a m h c ∧ SeriousHarmUnder1591e5 h c)
        ∨ PhysicalRestraintAgainstPerson1591e2a m c
        ∨ (SchemeToInduceBeliefOfSeriousHarmOrRestraint1591e2b m h c ∧
            SeriousHarmUnder1591e5 h c)
        ∨ AbuseOrThreatenedAbuseOfLegalProcess1591e1 m c) :
    CoercionUnder1591e2 m h c :=
  hb.elim
    (fun x => CoercionUnder1591e2.byThreatOfSeriousHarm x.1 x.2)
    (fun r1 => r1.elim
      (fun x => CoercionUnder1591e2.byPhysicalRestraint x)
      (fun r2 => r2.elim
        (fun x => CoercionUnder1591e2.byScheme x.1 x.2)
        (fun x => CoercionUnder1591e2.byAbuseOfLegalProcess x)))




theorem proscribedMeans1591a_intro {m h c}
    (hb : MeansOfForce1591a m c
        ∨ MeansOfThreatsOfForce1591a m c
        ∨ MeansOfFraud1591a m c
        ∨ CoercionUnder1591e2 m h c) :
    ProscribedMeans1591a m h c :=
  hb.elim
    (fun x => ProscribedMeans1591a.byForce x)
    (fun r1 => r1.elim
      (fun x => ProscribedMeans1591a.byThreatsOfForce x)
      (fun r2 => r2.elim
        (fun x => ProscribedMeans1591a.byFraud x)
        (fun x => ProscribedMeans1591a.byCoercion x)))


theorem meansWillCauseCommercialSexAct1591a_intro {q m h c}
    (hMeans : ProscribedMeans1591a m h c)
    (hCause : MeansWillBeUsedToCauseCommercialSexAct1591a q m c) :
    MeansWillCauseCommercialSexAct1591a q m h c :=
  ⟨hMeans, hCause⟩


theorem meansConditionSatisfied1591a_intro {p q m h c}
    (hFact : MeansWillCauseCommercialSexAct1591a q m h c)
    (hMind : KnewMeansCondition1591a p q m c
        ∨ (¬ ActConstitutingViolationIsAdvertising1591a p c ∧
            RecklesslyDisregardedMeansCondition1591a p q m c)) :
    MeansConditionSatisfied1591a p q m h c :=
  ⟨hFact, hMind⟩



theorem underageConditionSatisfied1591a_intro {p q c}
    (hFact : VictimUnderEighteenWillBeCaused1591a q c)
    (hMind : KnewUnderageCondition1591a p q c
        ∨ (¬ ActConstitutingViolationIsAdvertising1591a p c ∧
            RecklesslyDisregardedUnderageCondition1591a p q c)) :
    UnderageConditionSatisfied1591a p q c :=
  ⟨hFact, hMind⟩


theorem traffickingMensRea1591a_intro {p q m h c}
    (hb : MeansConditionSatisfied1591a p q m h c ∨ UnderageConditionSatisfied1591a p q c) :
    TraffickingMensRea1591a p q m h c :=
  hb.elim
    (fun x => TraffickingMensRea1591a.byForceFraudOrCoercion x)
    (fun x => TraffickingMensRea1591a.byVictimMinority x)


theorem prohibition1591a1_intro {p q m h c}
    (hAddr : AddresseeWhoever p c)
    (hJur : CommerceOrMaritimeNexus1591a1 p q c)
    (hKnow : ActedKnowingly p c)
    (hMens : TraffickingMensRea1591a p q m h c) :
    Prohibition1591a1 p q m h c :=
  ⟨hAddr, hJur, hKnow, hMens⟩



theorem prohibition1591a1Violated_intro {p q m h c}
    (hNorm : Prohibition1591a1 p q m h c)
    (hAct : ActTraffickingConduct1591a1 p q c) :
    Prohibition1591a1Violated p q m h c :=
  ⟨hNorm, hAct⟩


theorem prohibition1591a2_intro {p q v m h c}
    (hAddr : AddresseeWhoever p c)
    (hKnow : ActedKnowingly p c)
    (hVenture : VentureUnder1591e6 v c)
    (hPart : ParticipationInVenture1591e4 p v c)
    (hPredicate : VentureEngagedInParagraphOneAct1591a2 v c)
    (hMens : TraffickingMensRea1591a p q m h c) :
    Prohibition1591a2 p q v m h c :=
  ⟨hAddr, hKnow, hVenture, hPart, hPredicate, hMens⟩


theorem prohibition1591a2Violated_intro {p q v m h c}
    (hNorm : Prohibition1591a2 p q v m h c)
    (hAct : ActBenefitFromVenture1591a2 p v c) :
    Prohibition1591a2Violated p q v m h c :=
  ⟨hNorm, hAct⟩


theorem prohibition1591aViolated_intro {p q v m h c}
    (hb : Prohibition1591a1Violated p q m h c ∨ Prohibition1591a2Violated p q v m h c) :
    Prohibition1591aViolated p q v m h c :=
  hb.elim
    (fun x => Prohibition1591aViolated.byTrafficking x)
    (fun x => Prohibition1591aViolated.byBenefiting x)




theorem sentenceOfImprisonmentAtLeast_intro {ct p c} {n : Nat}
    (hb : LifeImprisonmentImposed ct p c ∨ n ≤ yearsOfImprisonmentImposed ct p c) :
    SentenceOfImprisonmentAtLeast ct p c n :=
  hb


theorem actImposeFifteenYearMinimum1591b1_intro {ct p c}
    (hFine : FineUnderThisTitleImposed ct p c)
    (hTerm : SentenceOfImprisonmentAtLeast ct p c 15) :
    ActImposeFifteenYearMinimum1591b1 ct p c :=
  ⟨hFine, hTerm⟩


theorem actImposeTenYearMinimum1591b2_intro {ct p c}
    (hFine : FineUnderThisTitleImposed ct p c)
    (hTerm : SentenceOfImprisonmentAtLeast ct p c 10) :
    ActImposeTenYearMinimum1591b2 ct p c :=
  ⟨hFine, hTerm⟩


theorem obligation1591b1_intro {ct p q c}
    (hAddr : AddresseeSentencingAuthority ct c)
    (hOffense : ConvictedOfOffenseUnder1591a p c)
    (hAgg : OffenseEffectedByForceFraudOrCoercion1591b p q c
        ∨ VictimUnderFourteenAtOffense1591b1 q c) :
    Obligation1591b1 ct p q c :=
  ⟨hAddr, hOffense, hAgg⟩



theorem obligation1591b1Breached_intro {ct p q c}
    (hNorm : Obligation1591b1 ct p q c)
    (hOmission : ¬ ActImposeFifteenYearMinimum1591b1 ct p c) :
    Obligation1591b1Breached ct p q c :=
  ⟨hNorm, hOmission⟩


theorem obligation1591b2_intro {ct p q c}
    (hAddr : AddresseeSentencingAuthority ct c)
    (hOffense : ConvictedOfOffenseUnder1591a p c)
    (hNotAgg : ¬ OffenseEffectedByForceFraudOrCoercion1591b p q c)
    (hAge : VictimAtLeastFourteenAndUnderEighteenAtOffense1591b2 q c) :
    Obligation1591b2 ct p q c :=
  ⟨hAddr, hOffense, hNotAgg, hAge⟩


theorem obligation1591b2Breached_intro {ct p q c}
    (hNorm : Obligation1591b2 ct p q c)
    (hOmission : ¬ ActImposeTenYearMinimum1591b2 ct p c) :
    Obligation1591b2Breached ct p q c :=
  ⟨hNorm, hOmission⟩


theorem obligation1591bBreached_intro {ct p q c}
    (hb : Obligation1591b1Breached ct p q c ∨ Obligation1591b2Breached ct p q c) :
    Obligation1591bBreached ct p q c :=
  hb.elim
    (fun x => Obligation1591bBreached.tierOne x)
    (fun x => Obligation1591bBreached.tierTwo x)




theorem permission1591c_intro {g p q c}
    (hAddr : AddresseeGovernmentProsecutor g p c)
    (hProsecution : ProsecutionUnder1591a1Pending g p c)
    (hObserve : DefendantHadReasonableOpportunityToObserve1591c p q c) :
    Permission1591c g p q c :=
  ⟨hAddr, hProsecution, hObserve⟩


theorem permission1591cExercised_intro {g p q c}
    (hNorm : Permission1591c g p q c)
    (hAct : ActProceedWithoutProvingAgeScienter1591c g p q c) :
    Permission1591cExercised g p q c :=
  ⟨hNorm, hAct⟩




theorem prohibition1591d_intro {p c}
    (hAddr : AddresseeWhoever p c) :
    Prohibition1591d p c :=
  ⟨hAddr⟩


theorem prohibition1591dViolated_intro {p c}
    (hNorm : Prohibition1591d p c)
    (hAct : ActObstructEnforcement1591d p c) :
    Prohibition1591dViolated p c :=
  ⟨hNorm, hAct⟩


theorem sanctionWithinCeiling1591d_intro {ct p c}
    (hSanction : FineUnderThisTitleImposed ct p c ∨ 0 < yearsOfImprisonmentImposed ct p c)
    (hNotLife : ¬ LifeImprisonmentImposed ct p c)
    (hCeiling : yearsOfImprisonmentImposed ct p c ≤ 25) :
    SanctionWithinCeiling1591d ct p c :=
  ⟨hSanction, hNotLife, hCeiling⟩


theorem power1591dSanction_intro {ct p c}
    (hAddr : AddresseeSentencingAuthority ct c)
    (hConviction : ConvictedOfObstructionUnder1591d p c) :
    Power1591dSanction ct p c :=
  ⟨hAddr, hConviction⟩


theorem power1591dSanctionExercised_intro {ct p c}
    (hNorm : Power1591dSanction ct p c)
    (hWithin : SanctionWithinCeiling1591d ct p c) :
    Power1591dSanctionExercised ct p c :=
  ⟨hNorm, hWithin⟩




theorem section1591Violated_intro {p q v m h c}
    (hb : Prohibition1591aViolated p q v m h c ∨ Prohibition1591dViolated p c) :
    Section1591Violated p q v m h c :=
  hb.elim
    (fun x => Section1591Violated.bySubsectionA x)
    (fun x => Section1591Violated.bySubsectionD x)

end Proving.USC.T18.Ch77.Part4.Deontic
