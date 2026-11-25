











import Proving.USC.T18.Ch77.Part4.Procedure.Types
import Proving.USC.T18.Ch77.Part4.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Procedure

open Proving.USC.Common




def tierOneMinimumYears : Nat := 15


def tierTwoMinimumYears : Nat := 10


def obstructionMaximumYears : Nat := 25



abbrev UnderFourteenAtOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense pr c < 14



abbrev AtLeastFourteenAndUnderEighteenAtOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  14 ≤ victimAgeYearsAtOffense pr c ∧ victimAgeYearsAtOffense pr c < 18




inductive FederalJurisdictionEstablished (pr : Prosecution) (c : ComplaintText) : Prop

  | commerce : InOrAffectingInterstateOrForeignCommerce pr c → FederalJurisdictionEstablished pr c

  | enclave : WithinSpecialMaritimeAndTerritorialJurisdiction pr c → FederalJurisdictionEstablished pr c















inductive ScienterProofObligationDischarged
    (pr : Prosecution) (d : Person) (v : Person) (ca : ChargedAct) (c : ComplaintText) : Prop

  | meansKnowledge :
      GovernmentProvedKnowledgeOfMeansTheory pr c →
      ScienterProofObligationDischarged pr d v ca c


  | meansReckless :
      ChargedActIsNonAdvertisingEnumeratedAct ca c →
      GovernmentProvedRecklessDisregardOfMeansTheory pr c →
      ScienterProofObligationDischarged pr d v ca c

  | minorityKnowledge :
      GovernmentProvedKnowledgeOfMinorityTheory pr c →
      ScienterProofObligationDischarged pr d v ca c


  | minorityReckless :
      ChargedActIsNonAdvertisingEnumeratedAct ca c →
      GovernmentProvedRecklessDisregardOfMinorityTheory pr c →
      ScienterProofObligationDischarged pr d v ca c


  | subsectionCRelief :
      ProsecutionUnderSubsectionA1 pr c →
      ReasonableOpportunityToObserve d v c →
      ScienterProofObligationDischarged pr d v ca c



structure Section1591ProofObligationsDischarged
    (pr : Prosecution) (d : Person) (v : Person) (ca : ChargedAct) (c : ComplaintText) : Prop where

  charged : ChargeFiledUnderSection1591 pr c

  jurisdiction : FederalJurisdictionEstablished pr c

  knowingActusReus : GovernmentProvedKnowingActusReus pr c

  scienter : ScienterProofObligationDischarged pr d v ca c





inductive Section1591TierOneTrigger (pr : Prosecution) (c : ComplaintText) : Prop


  | byProscribedMeans :
      OffenseEffectedByForceFraudOrCoercion pr c → Section1591TierOneTrigger pr c

  | underFourteen :
      UnderFourteenAtOffense pr c → Section1591TierOneTrigger pr c





structure Section1591TierTwoTrigger (pr : Prosecution) (c : ComplaintText) : Prop where

  notEffectedByProscribedMeans : ¬ OffenseEffectedByForceFraudOrCoercion pr c


  ageBand : AtLeastFourteenAndUnderEighteenAtOffense pr c


inductive Section1591TierOneSentenceLawful (pr : Prosecution) (c : ComplaintText) : Prop

  | life : LifeSentenceImposed pr c → Section1591TierOneSentenceLawful pr c


  | termOfYears :
      tierOneMinimumYears ≤ sentenceImposedYears pr c →
      Section1591TierOneSentenceLawful pr c


inductive Section1591TierTwoSentenceLawful (pr : Prosecution) (c : ComplaintText) : Prop

  | life : LifeSentenceImposed pr c → Section1591TierTwoSentenceLawful pr c

  | termOfYears :
      tierTwoMinimumYears ≤ sentenceImposedYears pr c →
      Section1591TierTwoSentenceLawful pr c


structure Section1591TierOneSentencing (pr : Prosecution) (c : ComplaintText) : Prop where

  conviction : ConvictionEnteredUnderSection1591 pr c

  trigger : Section1591TierOneTrigger pr c

  sentenceLawful : Section1591TierOneSentenceLawful pr c


structure Section1591TierTwoSentencing (pr : Prosecution) (c : ComplaintText) : Prop where

  conviction : ConvictionEnteredUnderSection1591 pr c

  trigger : Section1591TierTwoTrigger pr c

  sentenceLawful : Section1591TierTwoSentenceLawful pr c


inductive Section1591SentencingComplete (pr : Prosecution) (c : ComplaintText) : Prop

  | tierOne : Section1591TierOneSentencing pr c → Section1591SentencingComplete pr c

  | tierTwo : Section1591TierTwoSentencing pr c → Section1591SentencingComplete pr c





inductive Section1591dObstructiveConduct (p : Person) (c : ComplaintText) : Prop

  | completed : ObstructsOrInterferesWithEnforcement p c → Section1591dObstructiveConduct p c

  | attempted : AttemptsToObstructEnforcement p c → Section1591dObstructiveConduct p c



abbrev Section1591dSentenceWithinCap (pr : Prosecution) (c : ComplaintText) : Prop :=
  sentenceImposedYears pr c ≤ obstructionMaximumYears



structure Section1591dObstructionCase
    (p : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  conduct : Section1591dObstructiveConduct p c

  sentenceWithinCap : Section1591dSentenceWithinCap pr c





structure Transition where

  source : Stage

  target : Stage

  guard : Prop



def section1591ChargeTransition (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.conductAlleged
    target := Stage.charged
    guard := ChargeFiledUnderSection1591 pr c ∧
             (ProsecutionUnderSubsectionA1 pr c ∨ ProsecutionUnderSubsectionA2 pr c) }



def section1591ProofTransition
    (pr : Prosecution) (d : Person) (v : Person) (ca : ChargedAct) (c : ComplaintText) : Transition :=
  { source := Stage.charged
    target := Stage.proofsDischarged
    guard := Section1591ProofObligationsDischarged pr d v ca c }


def section1591ConvictionTransition (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.proofsDischarged
    target := Stage.convicted
    guard := ConvictionEnteredUnderSection1591 pr c }


def section1591SentencingTransition (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.convicted
    target := Stage.sentenced
    guard := Section1591SentencingComplete pr c }





inductive Section1591Reaches
    (pr : Prosecution) (d : Person) (v : Person) (ca : ChargedAct) (c : ComplaintText) :
    Stage → Prop

  | initial : Section1591Reaches pr d v ca c Stage.conductAlleged

  | charge :
      Section1591Reaches pr d v ca c Stage.conductAlleged →
      ChargeFiledUnderSection1591 pr c →
      (ProsecutionUnderSubsectionA1 pr c ∨ ProsecutionUnderSubsectionA2 pr c) →
      Section1591Reaches pr d v ca c Stage.charged

  | proofs :
      Section1591Reaches pr d v ca c Stage.charged →
      Section1591ProofObligationsDischarged pr d v ca c →
      Section1591Reaches pr d v ca c Stage.proofsDischarged

  | convict :
      Section1591Reaches pr d v ca c Stage.proofsDischarged →
      ConvictionEnteredUnderSection1591 pr c →
      Section1591Reaches pr d v ca c Stage.convicted

  | sentence :
      Section1591Reaches pr d v ca c Stage.convicted →
      Section1591SentencingComplete pr c →
      Section1591Reaches pr d v ca c Stage.sentenced

end Proving.USC.T18.Ch77.Part4.Procedure
