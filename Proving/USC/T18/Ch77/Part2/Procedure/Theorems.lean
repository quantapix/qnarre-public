import Proving.USC.T18.Ch77.Part2.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)









theorem federalJurisdictionAttaches_intro
    {o : Offense} {c : ComplaintText}
    (hNexus : InterstateOrForeignCommerceNexus o c) :
    FederalJurisdictionAttaches o c :=
  .commerce hNexus


theorem federalJurisdictionAttaches_maritime_intro
    {o : Offense} {c : ComplaintText}
    (hSMTJ : WithinSpecialMaritimeAndTerritorialJurisdiction o c) :
    FederalJurisdictionAttaches o c :=
  .maritimeTerritorial hSMTJ




theorem meansScienterProved_intro
    {pr : Prosecution} {o : Offense} {c : ComplaintText}
    (hKnew : GovernmentProvedKnowledgeOfCoerciveMeans pr c) :
    MeansScienterProved pr o c :=
  .actualKnowledge hKnew




theorem meansScienterProved_reckless_intro
    {pr : Prosecution} {o : Offense} {c : ComplaintText}
    (hNotAdvertising : ¬ ActConstitutingViolationIsAdvertising o c)
    (hReckless : GovernmentProvedRecklessDisregardOfCoerciveMeans pr c) :
    MeansScienterProved pr o c :=
  .recklessDisregard hNotAdvertising hReckless


theorem minorityScienterProved_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hKnew : GovernmentProvedKnowledgeOfMinority pr c) :
    MinorityScienterProved pr dfn victim o c :=
  .actualKnowledge hKnew


theorem minorityScienterProved_reckless_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hNotAdvertising : ¬ ActConstitutingViolationIsAdvertising o c)
    (hReckless : GovernmentProvedRecklessDisregardOfMinority pr c) :
    MinorityScienterProved pr dfn victim o c :=
  .recklessDisregard hNotAdvertising hReckless





theorem minorityScienterProved_subsectionC_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hUnderA1 : ProsecutionUnderSubsectionA1 pr c)
    (hObserve : DefendantHadReasonableOpportunityToObserve dfn victim c) :
    MinorityScienterProved pr dfn victim o c :=
  .subsectionCRelief hUnderA1 hObserve


theorem chapeauScienterBurdenDischarged_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hMeans : MeansScienterProved pr o c) :
    ChapeauScienterBurdenDischarged pr dfn victim o c :=
  .meansTheory hMeans



theorem chapeauScienterBurdenDischarged_minority_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hMinorityScienter : MinorityScienterProved pr dfn victim o c)
    (hUnder18 : VictimUnder18AtOffense victim o c) :
    ChapeauScienterBurdenDischarged pr dfn victim o c :=
  .minorityTheory hMinorityScienter hUnder18




theorem tierOneTrigger_intro
    {victim : Person} {o : Offense} {c : ComplaintText}
    (hMeans : OffenseEffectedByForceThreatsFraudOrCoercion o c) :
    TierOneTrigger victim o c :=
  .byMeans hMeans


theorem tierOneTrigger_ageUnder14_intro
    {victim : Person} {o : Offense} {c : ComplaintText}
    (hAge : VictimUnder14AtOffense victim o c) :
    TierOneTrigger victim o c :=
  .byAgeUnder14 hAge


theorem tierTwoTrigger_intro
    {victim : Person} {o : Offense} {c : ComplaintText}
    (hNotSoEffected : ¬ OffenseEffectedByForceThreatsFraudOrCoercion o c)
    (hAgeBand : VictimAtLeast14AndUnder18AtOffense victim o c) :
    TierTwoTrigger victim o c :=
  ⟨hNotSoEffected, hAgeBand⟩


theorem tierOneSentenceLawful_intro
    {pr : Prosecution} {victim : Person} {o : Offense} {c : ComplaintText}
    (hTrigger : TierOneTrigger victim o c)
    (hFine : FineImposedUnderThisTitle pr c)
    (hPrison : TierOneImprisonmentSatisfied pr c) :
    TierOneSentenceLawful pr victim o c :=
  ⟨hTrigger, hFine, hPrison⟩


theorem tierTwoSentenceLawful_intro
    {pr : Prosecution} {victim : Person} {o : Offense} {c : ComplaintText}
    (hTrigger : TierTwoTrigger victim o c)
    (hFine : FineImposedUnderThisTitle pr c)
    (hPrison : TierTwoImprisonmentSatisfied pr c) :
    TierTwoSentenceLawful pr victim o c :=
  ⟨hTrigger, hFine, hPrison⟩


theorem lawfulSentenceImposed_intro
    {pr : Prosecution} {victim : Person} {o : Offense} {c : ComplaintText}
    (hTierOne : TierOneSentenceLawful pr victim o c) :
    LawfulSentenceImposed pr victim o c :=
  .tierOne hTierOne


theorem lawfulSentenceImposed_tierTwo_intro
    {pr : Prosecution} {victim : Person} {o : Offense} {c : ComplaintText}
    (hTierTwo : TierTwoSentenceLawful pr victim o c) :
    LawfulSentenceImposed pr victim o c :=
  .tierTwo hTierTwo






theorem prosecutionReaches_sentenced_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hConduct : ChargedConductAlleged o c)
    (hJurisdiction : FederalJurisdictionAttaches o c)
    (hCharged : ChargesFiled pr dfn c)
    (hBurden : ChapeauScienterBurdenDischarged pr dfn victim o c)
    (hConviction : ConvictionEntered pr dfn c)
    (hSentence : LawfulSentenceImposed pr victim o c) :
    ProsecutionReaches pr dfn victim o c Stage.sentenced :=
  .sentenced
    (.convicted
      (.proofBurdenDischarged
        (.charged
          (.jurisdictionAttached (.conductAlleged hConduct) hJurisdiction)
          hCharged)
        hBurden)
      hConviction)
    hSentence


theorem section1591Prosecution_intro
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (hConduct : ChargedConductAlleged o c)
    (hJurisdiction : FederalJurisdictionAttaches o c)
    (hCharged : ChargesFiled pr dfn c)
    (hBurden : ChapeauScienterBurdenDischarged pr dfn victim o c)
    (hConviction : ConvictionEntered pr dfn c)
    (hSentence : LawfulSentenceImposed pr victim o c) :
    Section1591Prosecution pr dfn victim o c :=
  ⟨hConduct, hJurisdiction, hCharged, hBurden, hConviction, hSentence⟩


theorem section1591Prosecution_reaches_sentenced
    {pr : Prosecution} {dfn victim : Person} {o : Offense} {c : ComplaintText}
    (h : Section1591Prosecution pr dfn victim o c) :
    ProsecutionReaches pr dfn victim o c Stage.sentenced :=
  prosecutionReaches_sentenced_intro h.conduct h.jurisdiction h.charged
    h.scienterBurden h.conviction h.sentence


theorem obstructionProsecution_intro
    {pr : Prosecution} {dfn : Person} {c : ComplaintText}
    (hObstructed : ObstructsEnforcementOfSection1591 dfn c)
    (hCharged : ChargesFiled pr dfn c)
    (hConviction : ConvictionEntered pr dfn c)
    (hPenalty : FineImposedUnderThisTitle pr c ∨ ImprisonmentImposed pr c)
    (hCap : ObstructionImprisonmentWithinCap pr c) :
    ObstructionProsecution pr dfn c :=
  ⟨hObstructed, hCharged, hConviction, hPenalty, hCap⟩




theorem tierOneSentence_meets_tierTwo_floor
    {pr : Prosecution} {victim : Person} {o : Offense} {c : ComplaintText}
    (h : TierOneSentenceLawful pr victim o c) :
    TierTwoImprisonmentSatisfied pr c :=
  tierOne_floor_implies_tierTwo_floor h.imprisonment

end Proving.USC.T18.Ch77.Part2.Procedure
