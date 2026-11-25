import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part2.Deontic.Types
import Proving.USC.T18.Ch77.Part2.Deontic.Predicates
import Proving.USC.T18.Ch77.Part2.Deontic.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part2.Deontic

open Proving.USC.Common



theorem coercion1591e2_intro {p victim : Person} {c : ComplaintText}
    (hThreat : ThreatOfHarmAgainstPerson1591e2a p victim c)
    (hSerious : HarmIsSufficientlySerious1591e5 p victim c) :
    Coercion1591e2 p victim c :=
  Or.inl ⟨hThreat, hSerious⟩

theorem coercion1591e2Restraint_intro {p victim : Person} {c : ComplaintText}
    (hRestraint : PhysicalRestraintAgainstPerson1591e2a p victim c) :
    Coercion1591e2 p victim c :=
  Or.inr (Or.inl hRestraint)

theorem coercion1591e2Scheme_intro {p victim : Person} {c : ComplaintText}
    (hScheme : SchemePlanOrPatternCausingBeliefOfHarm1591e2b p victim c)
    (hSerious : HarmIsSufficientlySerious1591e5 p victim c) :
    Coercion1591e2 p victim c :=
  Or.inr (Or.inr (Or.inl ⟨hScheme, hSerious⟩))

theorem coercion1591e2LegalProcess_intro {p victim : Person} {c : ComplaintText}
    (hAbuse : AbuseOrThreatenedAbuseOfLawOrLegalProcess1591e2c p victim c) :
    Coercion1591e2 p victim c :=
  Or.inr (Or.inr (Or.inr hAbuse))

theorem willBeCausedToEngageInCommercialSexAct1591a_intro
    {victim : Person} {c : ComplaintText}
    (hAct : WillBeCausedToEngageInSexAct1591a victim c)
    (hCommercial : SexActIsCommercial1591e3 victim c) :
    WillBeCausedToEngageInCommercialSexAct1591a victim c :=
  ⟨hAct, hCommercial⟩

theorem participationInQualifyingVenture1591e_intro
    {p : Person} {v : Venture} {c : ComplaintText}
    (hVenture : IsVenture1591e6 v c)
    (hParticipation : ParticipationInVenture1591e4 p v c) :
    ParticipationInQualifyingVenture1591e p v c :=
  ⟨hVenture, hParticipation⟩

theorem meansOfForceFraudOrCoercion1591a_intro {p victim : Person} {c : ComplaintText}
    (hCoercion : Coercion1591e2 p victim c) :
    MeansOfForceFraudOrCoercion1591a p victim c :=
  Or.inr (Or.inr hCoercion)



theorem mensReaAsToMeans1591a_intro {p victim : Person} {c : ComplaintText}
    (hKnew : ActuallyKnewMeansWillBeUsed1591a p victim c) :
    MensReaAsToMeans1591a p victim c :=
  Or.inl hKnew

theorem mensReaAsToMeans1591aReckless_intro {p victim : Person} {c : ComplaintText}
    (hNotAdvertising : ¬ ActConstitutingViolationIsAdvertising1591a p victim c)
    (hReckless : RecklesslyDisregardedMeansWillBeUsed1591a p victim c) :
    MensReaAsToMeans1591a p victim c :=
  Or.inr ⟨hNotAdvertising, hReckless⟩

theorem mensReaAsToMinority1591a_intro {p victim : Person} {c : ComplaintText}
    (hKnew : ActuallyKnewVictimUnderStatutoryAge1591a p victim c) :
    MensReaAsToMinority1591a p victim c :=
  Or.inl hKnew

theorem mensReaAsToMinority1591aReckless_intro {p victim : Person} {c : ComplaintText}
    (hNotAdvertising : ¬ ActConstitutingViolationIsAdvertising1591a p victim c)
    (hReckless : RecklesslyDisregardedVictimUnderStatutoryAge1591a p victim c) :
    MensReaAsToMinority1591a p victim c :=
  Or.inr ⟨hNotAdvertising, hReckless⟩

theorem mensReaTheory1591aByMeans_intro {p victim : Person} {c : ComplaintText}
    (hMeans : MeansOfForceFraudOrCoercion1591a p victim c)
    (hMens : MensReaAsToMeans1591a p victim c)
    (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c) :
    MensReaTheory1591a p victim c :=
  .byMeans hMeans hMens hCause

theorem mensReaTheory1591aByMinority_intro {p victim : Person} {c : ComplaintText}
    (hAge : VictimUnderStatutoryAge1591a victim c)
    (hMens : MensReaAsToMinority1591a p victim c)
    (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c) :
    MensReaTheory1591a p victim c :=
  .byMinority hAge hMens hCause



theorem prohibition1591a1_intro {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever1591 p c)
    (hJurisdiction :
      InterstateOrForeignCommerceNexus1591a1 p c
        ∨ SpecialMaritimeOrTerritorialJurisdiction1591a1 p c)
    (hKnowingly : ActedKnowingly1591a p c) :
    Prohibition1591a1 p c :=
  ⟨hAddressee, hJurisdiction, hKnowingly⟩

theorem prohibitionViolated1591a1_intro {p victim : Person} {c : ComplaintText}
    (hNorm : Prohibition1591a1 p c)
    (hAct : RegulatedActTraffickingPerson1591a1 p victim c)
    (hMens : MensReaTheory1591a p victim c) :
    ProhibitionViolated1591a1 p victim c :=
  ⟨hNorm, hAct, hMens⟩



theorem prohibition1591a2_intro {p : Person} {v : Venture} {c : ComplaintText}
    (hAddressee : AddresseeWhoever1591 p c)
    (hKnowingly : ActedKnowingly1591a p c)
    (hParticipation : ParticipationInQualifyingVenture1591e p v c)
    (hPredicate : VentureEngagedInParagraphOneViolation1591a2 v c) :
    Prohibition1591a2 p v c :=
  ⟨hAddressee, hKnowingly, hParticipation, hPredicate⟩

theorem prohibitionViolated1591a2_intro
    {p victim : Person} {v : Venture} {c : ComplaintText}
    (hNorm : Prohibition1591a2 p v c)
    (hAct : RegulatedActBenefitsFromVenture1591a2 p v c)
    (hMens : MensReaTheory1591a p victim c) :
    ProhibitionViolated1591a2 p victim v c :=
  ⟨hNorm, hAct, hMens⟩



theorem prohibition1591d_intro {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever1591 p c) :
    Prohibition1591d p c :=
  ⟨hAddressee⟩

theorem prohibitionViolated1591d_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1591d p c)
    (hAct : RegulatedActObstructsEnforcement1591d p c) :
    ProhibitionViolated1591d p c :=
  ⟨hNorm, hAct⟩



theorem sentenceSatisfiesGradeOne1591b1_intro
    {court : Entity} {p : Person} {c : ComplaintText}
    (hFine : FineUnderThisTitleImposed1591b court p c)
    (hTerm :
      LifeImprisonmentImposed1591b court p c
        ∨ 15 ≤ yearsOfImprisonmentImposed1591b court p c) :
    SentenceSatisfiesGradeOne1591b1 court p c :=
  ⟨hFine, hTerm⟩

theorem sentenceSatisfiesGradeTwo1591b2_intro
    {court : Entity} {p : Person} {c : ComplaintText}
    (hFine : FineUnderThisTitleImposed1591b court p c)
    (hTerm :
      LifeImprisonmentImposed1591b court p c
        ∨ 10 ≤ yearsOfImprisonmentImposed1591b court p c) :
    SentenceSatisfiesGradeTwo1591b2 court p c :=
  ⟨hFine, hTerm⟩

theorem gradeOneCondition1591b1_intro {p victim : Person} {c : ComplaintText}
    (hMeans : OffenseEffectedByForceThreatsFraudOrCoercion1591b1 p victim c) :
    GradeOneCondition1591b1 p victim c :=
  Or.inl hMeans

theorem gradeOneCondition1591b1ByAge_intro {p victim : Person} {c : ComplaintText}
    (hAge : VictimUnderAge14AtOffense1591b1 victim c) :
    GradeOneCondition1591b1 p victim c :=
  Or.inr hAge

theorem gradeTwoCondition1591b2_intro {p victim : Person} {c : ComplaintText}
    (hNotEffected : ¬ OffenseEffectedByForceThreatsFraudOrCoercion1591b1 p victim c)
    (hAge : VictimAtLeastAge14AndUnderAge18AtOffense1591b2 victim c) :
    GradeTwoCondition1591b2 p victim c :=
  ⟨hNotEffected, hAge⟩

theorem obligation1591b1_intro
    {court : Entity} {p victim : Person} {c : ComplaintText}
    (hAddressee : AddresseeSentencingCourt1591b court c)
    (hConviction : ConvictedOfOffenseUnderSubsectionA1591b p c)
    (hCondition : GradeOneCondition1591b1 p victim c) :
    Obligation1591b1 court p victim c :=
  ⟨hAddressee, hConviction, hCondition⟩

theorem obligation1591b1Breached_intro
    {court : Entity} {p victim : Person} {c : ComplaintText}
    (hNorm : Obligation1591b1 court p victim c)
    (hNoAct : ¬ SentenceSatisfiesGradeOne1591b1 court p c) :
    Obligation1591b1Breached court p victim c :=
  ⟨hNorm, hNoAct⟩

theorem obligation1591b2_intro
    {court : Entity} {p victim : Person} {c : ComplaintText}
    (hAddressee : AddresseeSentencingCourt1591b court c)
    (hConviction : ConvictedOfOffenseUnderSubsectionA1591b p c)
    (hCondition : GradeTwoCondition1591b2 p victim c) :
    Obligation1591b2 court p victim c :=
  ⟨hAddressee, hConviction, hCondition⟩

theorem obligation1591b2Breached_intro
    {court : Entity} {p victim : Person} {c : ComplaintText}
    (hNorm : Obligation1591b2 court p victim c)
    (hNoAct : ¬ SentenceSatisfiesGradeTwo1591b2 court p c) :
    Obligation1591b2Breached court p victim c :=
  ⟨hNorm, hNoAct⟩



theorem permission1591c_intro
    {gov : Entity} {p victim : Person} {c : ComplaintText}
    (hAddressee : AddresseeGovernmentInProsecution1591c gov c)
    (hProsecution : ProsecutionUnderParagraphOne1591c gov p c)
    (hOpportunity : ReasonableOpportunityToObserveVictim1591c p victim c) :
    Permission1591c gov p victim c :=
  ⟨hAddressee, hProsecution, hOpportunity⟩

theorem permissionExercised1591c_intro
    {gov : Entity} {p victim : Person} {c : ComplaintText}
    (hNorm : Permission1591c gov p victim c)
    (hAct : ProceedsWithoutProvingMinorityScienter1591c gov p c) :
    PermissionExercised1591c gov p victim c :=
  ⟨hNorm, hAct⟩

theorem minorityTheoryEstablished1591_intro
    {gov : Entity} {p victim : Person} {c : ComplaintText}
    (hAge : VictimUnderStatutoryAge1591a victim c)
    (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c)
    (hMens : MensReaAsToMinority1591a p victim c) :
    MinorityTheoryEstablished1591 gov p victim c :=
  ⟨hAge, hCause, Or.inl hMens⟩

theorem minorityTheoryEstablished1591ViaSubsecC_intro
    {gov : Entity} {p victim : Person} {c : ComplaintText}
    (hAge : VictimUnderStatutoryAge1591a victim c)
    (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c)
    (hPermission : Permission1591c gov p victim c) :
    MinorityTheoryEstablished1591 gov p victim c :=
  ⟨hAge, hCause, Or.inr hPermission⟩



theorem prohibitionOnSentencer1591d_intro
    {court : Entity} {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeSentencingCourt1591b court c)
    (hCondition : ConvictedOfObstructionUnder1591d p c) :
    ProhibitionOnSentencer1591d court p c :=
  ⟨hAddressee, hCondition⟩

theorem prohibitionViolatedSentencingCeiling1591d_intro
    {court : Entity} {p : Person} {c : ComplaintText}
    (hNorm : ProhibitionOnSentencer1591d court p c)
    (hExceeded : SentencingCeilingExceeded1591d court p c) :
    ProhibitionViolatedSentencingCeiling1591d court p c :=
  ⟨hNorm, hExceeded⟩

theorem sentenceWithinCeiling1591d_intro
    {court : Entity} {p : Person} {c : ComplaintText}
    (hSentence :
      FineUnderThisTitleImposed1591d court p c
        ∨ 0 < yearsOfImprisonmentImposed1591d court p c)
    (hWithin : ¬ SentencingCeilingExceeded1591d court p c) :
    SentenceWithinCeiling1591d court p c :=
  ⟨hSentence, hWithin⟩



theorem section1591Violated_intro
    {p victim : Person} {v : Venture} {c : ComplaintText}
    (h : ProhibitionViolated1591a1 p victim c) :
    Section1591Violated p victim v c :=
  .trafficking h

theorem section1591ViolatedBeneficiary_intro
    {p victim : Person} {v : Venture} {c : ComplaintText}
    (h : ProhibitionViolated1591a2 p victim v c) :
    Section1591Violated p victim v c :=
  .beneficiary h

theorem section1591ViolatedObstruction_intro
    {p victim : Person} {v : Venture} {c : ComplaintText}
    (h : ProhibitionViolated1591d p c) :
    Section1591Violated p victim v c :=
  .obstruction h

end Proving.USC.T18.Ch77.Part2.Deontic
