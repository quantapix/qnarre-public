







import Proving.USC.T18.Ch77.Reslice.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Procedure

open Proving.USC.Common





structure Transition where
  fromStage : Stage
  toStage   : Stage
  guard     : Prop


structure TransitionTaken (t : Transition) : Prop where
  guardHolds : t.guard





noncomputable def victimAgeYearsAtOffense
    (v : Person) (pr : Prosecution) (c : ComplaintText) : Nat :=
  victimAgeYearsAt v (offenseTime pr c) c



def UnderFourteenAtOffense (v : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense v pr c < 14


def MinorAtOffense (v : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense v pr c < 18



def FourteenToSeventeenAtOffense (v : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  14 ≤ victimAgeYearsAtOffense v pr c ∧ victimAgeYearsAtOffense v pr c < 18




def inCourseOfEligible : Ch77PredicateSection → Bool
  | _ => true




def intentToViolateEligible : Ch77PredicateSection → Bool
  | Ch77PredicateSection.S1594a => false
  | _ => true










def obstructionBasePenaltyCeilingYears : Ch77ObstructionSection → Nat
  | Ch77ObstructionSection.S1590 => 20
  | Ch77ObstructionSection.S1591 => 25
  | Ch77ObstructionSection.S1592 => 5





def FederalJurisdictionalNexus1591 (d : Person) (c : ComplaintText) : Prop :=
  InOrAffectingInterstateOrForeignCommerce d c ∨
    WithinSpecialMaritimeAndTerritorialJurisdiction d c



inductive ChargingRoute1591 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | actUponPerson
      (hJurisdiction : FederalJurisdictionalNexus1591 d c)
      (hAct : PerformedListedActUponPerson d v c) : ChargingRoute1591 d v c
  | benefitFromVenture
      (hBenefit : BenefitedFromParticipationInVenture d c) : ChargingRoute1591 d v c




def MensReaProofObligationDischarged1591
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  GovernmentProvedKnowledgeOfMeansOrMinority pr d v c ∨
    (¬ AdvertisingIsTheChargedAct pr c ∧
      GovernmentProvedRecklessDisregardOfMeansOrMinority pr d v c)




def AgeKnowledgeProofObligationDischarged1591
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  (ProsecutionCommencedUnderSection1591a1 pr c ∧ ReasonableOpportunityToObserve pr d v c) ∨
    GovernmentProvedDefendantsKnowledgeOfMinority pr d v c



structure Section1591ProsecutionMadeOut
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop where
  route     : ChargingRoute1591 d v c
  mensRea   : MensReaProofObligationDischarged1591 pr d v c
  ageProof  : AgeKnowledgeProofObligationDischarged1591 pr d v c






structure Section1591TierOne
    (pr : Prosecution) (v : Person) (c : ComplaintText) : Prop where
  trigger : EffectedByForceThreatsFraudOrCoercion pr c ∨ UnderFourteenAtOffense v pr c



structure Section1591TierTwo
    (pr : Prosecution) (v : Person) (c : ComplaintText) : Prop where
  notEffected : ¬ EffectedByForceThreatsFraudOrCoercion pr c
  ageBand     : FourteenToSeventeenAtOffense v pr c



def Section1591TierOneSentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  FineImposedUnderThisTitle s c ∧
    (LifeSentenceImposed s c ∨ (ImprisonmentImposed s c ∧ 15 ≤ imposedImprisonmentYears s c))



def Section1591TierTwoSentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  FineImposedUnderThisTitle s c ∧
    (LifeSentenceImposed s c ∨ (ImprisonmentImposed s c ∧ 10 ≤ imposedImprisonmentYears s c))



def Section1591ObstructionSentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  (FineImposedUnderThisTitle s c ∨ ImprisonmentImposed s c) ∧
    ¬ LifeSentenceImposed s c ∧
    (ImprisonmentImposed s c → imposedImprisonmentYears s c ≤ 25)





structure Section1590ProsecutionMadeOut
    (d : Person) (v : Person) (c : ComplaintText) : Prop where
  conduct     : RecruitedOrObtainedForLaborOrServices d v c
  chapterLink : LaborOrServicesInViolationOfThisChapter d v c



def Section1590Aggravator (pr : Prosecution) (c : ComplaintText) : Prop :=
  DeathResultedFromViolation pr c ∨
    ViolationIncludedKidnappingOrAttempt pr c ∨
    ViolationIncludedAggravatedSexualAbuseOrAttempt pr c ∨
    ViolationIncludedAttemptToKill pr c




def Section1590BaseSentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  (FineImposedUnderThisTitle s c ∨ ImprisonmentImposed s c) ∧
    ¬ LifeSentenceImposed s c ∧
    (ImprisonmentImposed s c → imposedImprisonmentYears s c ≤ 20)




def Section1590AggravatedSentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  FineImposedUnderThisTitle s c ∨ ImprisonmentImposed s c ∨ LifeSentenceImposed s c



def Section1590SentenceLawful
    (pr : Prosecution) (s : SentenceRecord) (c : ComplaintText) : Prop :=
  (Section1590Aggravator pr c ∧ Section1590AggravatedSentenceLawful s c) ∨
    (¬ Section1590Aggravator pr c ∧ Section1590BaseSentenceLawful s c)






inductive DocumentOffenseRoute1592
    (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | inCourseOf
      (sec : Ch77PredicateSection)
      (hEligible : inCourseOfEligible sec = true)
      (h : InTheCourseOfPredicateViolation d sec c) : DocumentOffenseRoute1592 d v c
  | withIntent
      (sec : Ch77PredicateSection)
      (hEligible : intentToViolateEligible sec = true)
      (h : WithIntentToViolatePredicateSection d sec c) : DocumentOffenseRoute1592 d v c
  | toRestrictLiberty
      (hAuthority : WithoutLawfulAuthority d c)
      (hRestrict : ToPreventOrRestrictLibertyToMove d v c)
      (hVictim : VictimOfSevereFormOfTrafficking v c) : DocumentOffenseRoute1592 d v c





def Section1592VictimExemption (d : Person) (c : ComplaintText) : Prop :=
  VictimOfSevereFormOfTrafficking d c ∧ ConductCausedByOrIncidentToTrafficking d c




structure Section1592Chargeable
    (d : Person) (v : Person) (doc : IdentityDocument) (c : ComplaintText) : Prop where
  conduct   : KnowinglyHandledIdentityDocument d doc c
  route     : DocumentOffenseRoute1592 d v c
  notExempt : ¬ Section1592VictimExemption d c



def Section1592SentenceLawful (s : SentenceRecord) (c : ComplaintText) : Prop :=
  (FineImposedUnderThisTitle s c ∨ ImprisonmentImposed s c) ∧
    ¬ LifeSentenceImposed s c ∧
    (ImprisonmentImposed s c → imposedImprisonmentYears s c ≤ 5)




structure Ch77ObstructionMadeOut
    (sec : Ch77ObstructionSection) (d : Person) (c : ComplaintText) : Prop where
  obstructed : ObstructedEnforcement sec d c


def Ch77ObstructionBaseSentenceLawful
    (sec : Ch77ObstructionSection) (s : SentenceRecord) (c : ComplaintText) : Prop :=
  (FineImposedUnderThisTitle s c ∨ ImprisonmentImposed s c) ∧
    (ImprisonmentImposed s c →
      imposedImprisonmentYears s c ≤ obstructionBasePenaltyCeilingYears sec)




def transitionJurisdiction1591 (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.ConductCompleted
    toStage   := Stage.FederalJurisdictionEstablished
    guard     := FederalJurisdictionalNexus1591 d c }



def transitionCommence1591 (pr : Prosecution) (c : ComplaintText) : Transition :=
  { fromStage := Stage.FederalJurisdictionEstablished
    toStage   := Stage.ProsecutionCommenced
    guard     := ProsecutionCommencedUnderSection1591a1 pr c }


def transitionProve1591
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.ProsecutionCommenced
    toStage   := Stage.ElementsProven
    guard     := Section1591ProsecutionMadeOut pr d v c }


def transitionTier1591
    (pr : Prosecution) (v : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.ElementsProven
    toStage   := Stage.PenaltyTierDetermined
    guard     := Section1591TierOne pr v c ∨ Section1591TierTwo pr v c }


def transitionSentence1591 (s : SentenceRecord) (c : ComplaintText) : Transition :=
  { fromStage := Stage.PenaltyTierDetermined
    toStage   := Stage.SentenceImposed
    guard     := Section1591TierOneSentenceLawful s c ∨ Section1591TierTwoSentenceLawful s c }




def transitionExempt1592 (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := Stage.ConductCompleted
    toStage   := Stage.ExemptFromProsecution
    guard     := Section1592VictimExemption d c }






inductive Section1591Reached
    (pr : Prosecution) (d : Person) (v : Person) (s : SentenceRecord) (c : ComplaintText) :
    Stage → Prop where
  | conductCompleted
      (hRoute : ChargingRoute1591 d v c) :
      Section1591Reached pr d v s c Stage.ConductCompleted
  | prosecutionCommenced
      (prev : Section1591Reached pr d v s c Stage.ConductCompleted)
      (hCommenced : ProsecutionCommencedUnderSection1591a1 pr c) :
      Section1591Reached pr d v s c Stage.ProsecutionCommenced
  | elementsProven
      (prev : Section1591Reached pr d v s c Stage.ProsecutionCommenced)
      (hCase : Section1591ProsecutionMadeOut pr d v c) :
      Section1591Reached pr d v s c Stage.ElementsProven
  | penaltyTierDetermined
      (prev : Section1591Reached pr d v s c Stage.ElementsProven)
      (hTier : Section1591TierOne pr v c ∨ Section1591TierTwo pr v c) :
      Section1591Reached pr d v s c Stage.PenaltyTierDetermined
  | sentenceImposed
      (prev : Section1591Reached pr d v s c Stage.PenaltyTierDetermined)
      (hWindow : Section1591TierOneSentenceLawful s c ∨ Section1591TierTwoSentenceLawful s c) :
      Section1591Reached pr d v s c Stage.SentenceImposed

end Proving.USC.T18.Ch77.Reslice.Procedure
