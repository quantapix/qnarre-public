import Proving.USC.T18.Ch77.Part2.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)














def VictimUnder18AtOffense (victim : Person) (o : Offense) (c : ComplaintText) : Prop :=
  ageOfVictimAtOffense victim o c < 18



def VictimUnder14AtOffense (victim : Person) (o : Offense) (c : ComplaintText) : Prop :=
  ageOfVictimAtOffense victim o c < 14



def VictimAtLeast14AndUnder18AtOffense
    (victim : Person) (o : Offense) (c : ComplaintText) : Prop :=
  14 ≤ ageOfVictimAtOffense victim o c ∧ ageOfVictimAtOffense victim o c < 18






noncomputable instance (victim : Person) (o : Offense) (c : ComplaintText) :
    Decidable (VictimUnder18AtOffense victim o c) :=
  inferInstanceAs (Decidable (ageOfVictimAtOffense victim o c < 18))

noncomputable instance (victim : Person) (o : Offense) (c : ComplaintText) :
    Decidable (VictimUnder14AtOffense victim o c) :=
  inferInstanceAs (Decidable (ageOfVictimAtOffense victim o c < 14))

noncomputable instance (victim : Person) (o : Offense) (c : ComplaintText) :
    Decidable (VictimAtLeast14AndUnder18AtOffense victim o c) :=
  inferInstanceAs (Decidable (14 ≤ ageOfVictimAtOffense victim o c ∧
    ageOfVictimAtOffense victim o c < 18))



theorem victimUnder14_implies_under18
    {victim : Person} {o : Offense} {c : ComplaintText}
    (h : VictimUnder14AtOffense victim o c) : VictimUnder18AtOffense victim o c := by
  unfold VictimUnder14AtOffense at h
  unfold VictimUnder18AtOffense
  omega


theorem tier_age_bands_disjoint
    {victim : Person} {o : Offense} {c : ComplaintText}
    (h₁ : VictimUnder14AtOffense victim o c)
    (h₂ : VictimAtLeast14AndUnder18AtOffense victim o c) : False := by
  unfold VictimUnder14AtOffense at h₁
  unfold VictimAtLeast14AndUnder18AtOffense at h₂
  omega





def TierOneImprisonmentSatisfied (pr : Prosecution) (c : ComplaintText) : Prop :=
  LifeImprisonmentImposed pr c ∨ 15 ≤ imprisonmentYearsImposed pr c



def TierTwoImprisonmentSatisfied (pr : Prosecution) (c : ComplaintText) : Prop :=
  LifeImprisonmentImposed pr c ∨ 10 ≤ imprisonmentYearsImposed pr c


def ObstructionImprisonmentWithinCap (pr : Prosecution) (c : ComplaintText) : Prop :=
  imprisonmentYearsImposed pr c ≤ 25



theorem tierOne_floor_implies_tierTwo_floor
    {pr : Prosecution} {c : ComplaintText}
    (h : TierOneImprisonmentSatisfied pr c) : TierTwoImprisonmentSatisfied pr c := by
  unfold TierOneImprisonmentSatisfied at h
  unfold TierTwoImprisonmentSatisfied
  cases h with
  | inl hLife => exact Or.inl hLife
  | inr hYears => exact Or.inr (by omega)






inductive FederalJurisdictionAttaches (o : Offense) (c : ComplaintText) : Prop where

  | commerce : InterstateOrForeignCommerceNexus o c → FederalJurisdictionAttaches o c


  | maritimeTerritorial :
      WithinSpecialMaritimeAndTerritorialJurisdiction o c →
      FederalJurisdictionAttaches o c








inductive MeansScienterProved (pr : Prosecution) (o : Offense) (c : ComplaintText) : Prop where

  | actualKnowledge :
      GovernmentProvedKnowledgeOfCoerciveMeans pr c → MeansScienterProved pr o c


  | recklessDisregard :
      ¬ ActConstitutingViolationIsAdvertising o c →
      GovernmentProvedRecklessDisregardOfCoerciveMeans pr c →
      MeansScienterProved pr o c






inductive MinorityScienterProved (pr : Prosecution) (dfn victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where

  | actualKnowledge :
      GovernmentProvedKnowledgeOfMinority pr c →
      MinorityScienterProved pr dfn victim o c

  | recklessDisregard :
      ¬ ActConstitutingViolationIsAdvertising o c →
      GovernmentProvedRecklessDisregardOfMinority pr c →
      MinorityScienterProved pr dfn victim o c



  | subsectionCRelief :
      ProsecutionUnderSubsectionA1 pr c →
      DefendantHadReasonableOpportunityToObserve dfn victim c →
      MinorityScienterProved pr dfn victim o c



inductive ChapeauScienterBurdenDischarged (pr : Prosecution) (dfn victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where

  | meansTheory :
      MeansScienterProved pr o c →
      ChapeauScienterBurdenDischarged pr dfn victim o c


  | minorityTheory :
      MinorityScienterProved pr dfn victim o c →
      VictimUnder18AtOffense victim o c →
      ChapeauScienterBurdenDischarged pr dfn victim o c





inductive TierOneTrigger (victim : Person) (o : Offense) (c : ComplaintText) : Prop where



  | byMeans : OffenseEffectedByForceThreatsFraudOrCoercion o c → TierOneTrigger victim o c


  | byAgeUnder14 : VictimUnder14AtOffense victim o c → TierOneTrigger victim o c



structure TierTwoTrigger (victim : Person) (o : Offense) (c : ComplaintText) : Prop where

  notSoEffected : ¬ OffenseEffectedByForceThreatsFraudOrCoercion o c


  ageInBand : VictimAtLeast14AndUnder18AtOffense victim o c



structure TierOneSentenceLawful (pr : Prosecution) (victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where
  trigger : TierOneTrigger victim o c
  fine : FineImposedUnderThisTitle pr c
  imprisonment : TierOneImprisonmentSatisfied pr c



structure TierTwoSentenceLawful (pr : Prosecution) (victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where
  trigger : TierTwoTrigger victim o c
  fine : FineImposedUnderThisTitle pr c
  imprisonment : TierTwoImprisonmentSatisfied pr c



inductive LawfulSentenceImposed (pr : Prosecution) (victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where
  | tierOne : TierOneSentenceLawful pr victim o c → LawfulSentenceImposed pr victim o c
  | tierTwo : TierTwoSentenceLawful pr victim o c → LawfulSentenceImposed pr victim o c




def SentenceConformsToTier (pr : Prosecution) (victim : Person)
    (o : Offense) (c : ComplaintText) : PenaltyTier → Prop
  | PenaltyTier.tierOne => TierOneSentenceLawful pr victim o c
  | PenaltyTier.tierTwo => TierTwoSentenceLawful pr victim o c





structure Transition where
  fromStage : Stage
  toStage : Stage
  guard : Prop


def Transition.Enabled (t : Transition) : Prop := t.guard



def jurisdictionStep (o : Offense) (c : ComplaintText) : Transition :=
  { fromStage := Stage.conductAlleged
    toStage := Stage.jurisdictionAttached
    guard := FederalJurisdictionAttaches o c }


def chargingStep (pr : Prosecution) (dfn : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.jurisdictionAttached
    toStage := Stage.charged
    guard := ChargesFiled pr dfn c }



def proofBurdenStep (pr : Prosecution) (dfn victim : Person)
    (o : Offense) (c : ComplaintText) : Transition :=
  { fromStage := Stage.charged
    toStage := Stage.proofBurdenDischarged
    guard := ChapeauScienterBurdenDischarged pr dfn victim o c }


def convictionStep (pr : Prosecution) (dfn : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.proofBurdenDischarged
    toStage := Stage.convicted
    guard := ConvictionEntered pr dfn c }


def sentencingStep (pr : Prosecution) (victim : Person)
    (o : Offense) (c : ComplaintText) : Transition :=
  { fromStage := Stage.convicted
    toStage := Stage.sentenced
    guard := LawfulSentenceImposed pr victim o c }



inductive ProsecutionReaches (pr : Prosecution) (dfn victim : Person)
    (o : Offense) (c : ComplaintText) : Stage → Prop where
  | conductAlleged :
      ChargedConductAlleged o c →
      ProsecutionReaches pr dfn victim o c Stage.conductAlleged
  | jurisdictionAttached :
      ProsecutionReaches pr dfn victim o c Stage.conductAlleged →
      (jurisdictionStep o c).Enabled →
      ProsecutionReaches pr dfn victim o c Stage.jurisdictionAttached
  | charged :
      ProsecutionReaches pr dfn victim o c Stage.jurisdictionAttached →
      (chargingStep pr dfn c).Enabled →
      ProsecutionReaches pr dfn victim o c Stage.charged
  | proofBurdenDischarged :
      ProsecutionReaches pr dfn victim o c Stage.charged →
      (proofBurdenStep pr dfn victim o c).Enabled →
      ProsecutionReaches pr dfn victim o c Stage.proofBurdenDischarged
  | convicted :
      ProsecutionReaches pr dfn victim o c Stage.proofBurdenDischarged →
      (convictionStep pr dfn c).Enabled →
      ProsecutionReaches pr dfn victim o c Stage.convicted
  | sentenced :
      ProsecutionReaches pr dfn victim o c Stage.convicted →
      (sentencingStep pr victim o c).Enabled →
      ProsecutionReaches pr dfn victim o c Stage.sentenced





structure Section1591Prosecution (pr : Prosecution) (dfn victim : Person)
    (o : Offense) (c : ComplaintText) : Prop where
  conduct : ChargedConductAlleged o c
  jurisdiction : FederalJurisdictionAttaches o c
  charged : ChargesFiled pr dfn c
  scienterBurden : ChapeauScienterBurdenDischarged pr dfn victim o c
  conviction : ConvictionEntered pr dfn c
  sentence : LawfulSentenceImposed pr victim o c






structure ObstructionProsecution (pr : Prosecution) (dfn : Person)
    (c : ComplaintText) : Prop where
  obstructed : ObstructsEnforcementOfSection1591 dfn c
  charged : ChargesFiled pr dfn c
  conviction : ConvictionEntered pr dfn c

  penaltyImposed : FineImposedUnderThisTitle pr c ∨ ImprisonmentImposed pr c

  withinCap : ObstructionImprisonmentWithinCap pr c

end Proving.USC.T18.Ch77.Part2.Procedure
