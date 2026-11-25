







import Proving.USC.T18.Ch77.Part4.Procedure.Types
import Proving.USC.T18.Ch77.Part4.Procedure.Predicates
import Proving.USC.T18.Ch77.Part4.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Procedure

open Proving.USC.Common




theorem federalJurisdictionEstablished_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : InOrAffectingInterstateOrForeignCommerce pr c ∨
         WithinSpecialMaritimeAndTerritorialJurisdiction pr c) :
    FederalJurisdictionEstablished pr c :=
  h.elim FederalJurisdictionEstablished.commerce FederalJurisdictionEstablished.enclave






theorem scienterProofObligationDischarged_intro
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (hTrack : ProsecutionUnderSubsectionA1 pr c)
    (hObserve : ReasonableOpportunityToObserve d v c) :
    ScienterProofObligationDischarged pr d v ca c :=
  ScienterProofObligationDischarged.subsectionCRelief hTrack hObserve


theorem scienterProofObligationDischarged_meansKnowledge
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (h : GovernmentProvedKnowledgeOfMeansTheory pr c) :
    ScienterProofObligationDischarged pr d v ca c :=
  ScienterProofObligationDischarged.meansKnowledge h



theorem scienterProofObligationDischarged_meansReckless
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (hNotAd : ChargedActIsNonAdvertisingEnumeratedAct ca c)
    (h : GovernmentProvedRecklessDisregardOfMeansTheory pr c) :
    ScienterProofObligationDischarged pr d v ca c :=
  ScienterProofObligationDischarged.meansReckless hNotAd h


theorem scienterProofObligationDischarged_minorityKnowledge
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (h : GovernmentProvedKnowledgeOfMinorityTheory pr c) :
    ScienterProofObligationDischarged pr d v ca c :=
  ScienterProofObligationDischarged.minorityKnowledge h



theorem scienterProofObligationDischarged_minorityReckless
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (hNotAd : ChargedActIsNonAdvertisingEnumeratedAct ca c)
    (h : GovernmentProvedRecklessDisregardOfMinorityTheory pr c) :
    ScienterProofObligationDischarged pr d v ca c :=
  ScienterProofObligationDischarged.minorityReckless hNotAd h




theorem section1591ProofObligationsDischarged_intro
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (hCharged : ChargeFiledUnderSection1591 pr c)
    (hJur : FederalJurisdictionEstablished pr c)
    (hKnowing : GovernmentProvedKnowingActusReus pr c)
    (hScienter : ScienterProofObligationDischarged pr d v ca c) :
    Section1591ProofObligationsDischarged pr d v ca c :=
  ⟨hCharged, hJur, hKnowing, hScienter⟩




theorem section1591TierOneTrigger_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : OffenseEffectedByForceFraudOrCoercion pr c ∨ UnderFourteenAtOffense pr c) :
    Section1591TierOneTrigger pr c :=
  h.elim Section1591TierOneTrigger.byProscribedMeans Section1591TierOneTrigger.underFourteen


theorem section1591TierTwoTrigger_intro
    {pr : Prosecution} {c : ComplaintText}
    (hNotEffected : ¬ OffenseEffectedByForceFraudOrCoercion pr c)
    (hBand : AtLeastFourteenAndUnderEighteenAtOffense pr c) :
    Section1591TierTwoTrigger pr c :=
  ⟨hNotEffected, hBand⟩


theorem section1591TierOneSentenceLawful_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : LifeSentenceImposed pr c ∨ tierOneMinimumYears ≤ sentenceImposedYears pr c) :
    Section1591TierOneSentenceLawful pr c :=
  h.elim Section1591TierOneSentenceLawful.life Section1591TierOneSentenceLawful.termOfYears


theorem section1591TierTwoSentenceLawful_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : LifeSentenceImposed pr c ∨ tierTwoMinimumYears ≤ sentenceImposedYears pr c) :
    Section1591TierTwoSentenceLawful pr c :=
  h.elim Section1591TierTwoSentenceLawful.life Section1591TierTwoSentenceLawful.termOfYears


theorem section1591TierOneSentencing_intro
    {pr : Prosecution} {c : ComplaintText}
    (hConv : ConvictionEnteredUnderSection1591 pr c)
    (hTrigger : Section1591TierOneTrigger pr c)
    (hLawful : Section1591TierOneSentenceLawful pr c) :
    Section1591TierOneSentencing pr c :=
  ⟨hConv, hTrigger, hLawful⟩


theorem section1591TierTwoSentencing_intro
    {pr : Prosecution} {c : ComplaintText}
    (hConv : ConvictionEnteredUnderSection1591 pr c)
    (hTrigger : Section1591TierTwoTrigger pr c)
    (hLawful : Section1591TierTwoSentenceLawful pr c) :
    Section1591TierTwoSentencing pr c :=
  ⟨hConv, hTrigger, hLawful⟩


theorem section1591SentencingComplete_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : Section1591TierOneSentencing pr c ∨ Section1591TierTwoSentencing pr c) :
    Section1591SentencingComplete pr c :=
  h.elim Section1591SentencingComplete.tierOne Section1591SentencingComplete.tierTwo




theorem section1591dObstructiveConduct_intro
    {p : Person} {c : ComplaintText}
    (h : ObstructsOrInterferesWithEnforcement p c ∨ AttemptsToObstructEnforcement p c) :
    Section1591dObstructiveConduct p c :=
  h.elim Section1591dObstructiveConduct.completed Section1591dObstructiveConduct.attempted


theorem section1591dObstructionCase_intro
    {p : Person} {pr : Prosecution} {c : ComplaintText}
    (hConduct : Section1591dObstructiveConduct p c)
    (hCap : Section1591dSentenceWithinCap pr c) :
    Section1591dObstructionCase p pr c :=
  ⟨hConduct, hCap⟩




theorem section1591ChargeTransition_guard
    {pr : Prosecution} {c : ComplaintText}
    (hCharge : ChargeFiledUnderSection1591 pr c)
    (hTrack : ProsecutionUnderSubsectionA1 pr c ∨ ProsecutionUnderSubsectionA2 pr c) :
    (section1591ChargeTransition pr c).guard :=
  ⟨hCharge, hTrack⟩


theorem section1591ProofTransition_guard
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (h : Section1591ProofObligationsDischarged pr d v ca c) :
    (section1591ProofTransition pr d v ca c).guard :=
  h


theorem section1591ConvictionTransition_guard
    {pr : Prosecution} {c : ComplaintText}
    (h : ConvictionEnteredUnderSection1591 pr c) :
    (section1591ConvictionTransition pr c).guard :=
  h


theorem section1591SentencingTransition_guard
    {pr : Prosecution} {c : ComplaintText}
    (h : Section1591SentencingComplete pr c) :
    (section1591SentencingTransition pr c).guard :=
  h





theorem section1591Reaches_intro
    {pr : Prosecution} {d v : Person} {ca : ChargedAct} {c : ComplaintText}
    (hCharge : ChargeFiledUnderSection1591 pr c)
    (hTrack : ProsecutionUnderSubsectionA1 pr c ∨ ProsecutionUnderSubsectionA2 pr c)
    (hProofs : Section1591ProofObligationsDischarged pr d v ca c)
    (hConv : ConvictionEnteredUnderSection1591 pr c)
    (hSent : Section1591SentencingComplete pr c) :
    Section1591Reaches pr d v ca c Stage.sentenced :=
  Section1591Reaches.sentence
    (Section1591Reaches.convict
      (Section1591Reaches.proofs
        (Section1591Reaches.charge Section1591Reaches.initial hCharge hTrack) hProofs)
      hConv)
    hSent





theorem section1591AgeBands_disjoint (pr : Prosecution) (c : ComplaintText) :
    ¬ (UnderFourteenAtOffense pr c ∧ AtLeastFourteenAndUnderEighteenAtOffense pr c) := by
  rintro ⟨h1, h2, -⟩
  omega




theorem section1591Tiers_mutuallyExclusive (pr : Prosecution) (c : ComplaintText) :
    ¬ (Section1591TierOneTrigger pr c ∧ Section1591TierTwoTrigger pr c) := by
  rintro ⟨h1, h2⟩
  cases h1 with
  | byProscribedMeans hm => exact h2.notEffectedByProscribedMeans hm
  | underFourteen hu =>
      obtain ⟨hLow, -⟩ := h2.ageBand
      omega

end Proving.USC.T18.Ch77.Part4.Procedure
