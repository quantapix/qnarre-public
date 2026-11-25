











import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Procedure.Types
import Proving.USC.T18.Ch77.Part5.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Procedure

open Proving.USC.Common





def ChargedConductProved (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  (ChargedUnderSubsectionA1 d pr c ∧ ProhibitedTraffickingActProved d pr c) ∨
  (ChargedUnderSubsectionA2 d pr c ∧ VentureBenefitProved d pr c)




def MeansScienterProved (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  KnowledgeOfMeansProved d pr c ∨
  (¬ ChargedConductIsAdvertising d pr c ∧ RecklessDisregardOfMeansProved d pr c)



def MinorityScienterProved (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  KnowledgeOfMinorityProved d pr c ∨
  (¬ ChargedConductIsAdvertising d pr c ∧ RecklessDisregardOfMinorityProved d pr c)




def MinorityScienterProofExcused (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  ChargedUnderSubsectionA1 d pr c ∧ ReasonableOpportunityToObserveProved d pr c



def MinorityScienterProofSatisfied (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  MinorityScienterProved d pr c ∨ MinorityScienterProofExcused d pr c



def SubsectionAScienterSatisfied (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  MeansScienterProved d pr c ∨ MinorityScienterProofSatisfied d pr c









def VictimUnderFourteenAtOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense pr c < 14



def VictimFourteenToSeventeenAtOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  14 ≤ victimAgeYearsAtOffense pr c ∧ victimAgeYearsAtOffense pr c < 18



def VictimMinorAtOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense pr c < 18




def TierOneTrigger (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  OffenseEffectedByForceFraudOrCoercion d pr c ∨ VictimUnderFourteenAtOffense pr c




def TierTwoTrigger (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  ¬ OffenseEffectedByForceFraudOrCoercion d pr c ∧ VictimFourteenToSeventeenAtOffense pr c




def TierOneSentenceLawful (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  FineImposedUnderThisTitle d pr c ∧
  (LifeSentenceImposed d pr c ∨ 15 ≤ imprisonmentTermYearsImposed pr c)




def TierTwoSentenceLawful (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  FineImposedUnderThisTitle d pr c ∧
  (LifeSentenceImposed d pr c ∨ 10 ≤ imprisonmentTermYearsImposed pr c)





def ObstructionSentenceLawful (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  imprisonmentTermYearsImposed pr c ≤ 25 ∧
  (FineImposedUnderThisTitle d pr c ∨ 0 < imprisonmentTermYearsImposed pr c)



def TierOneDisposition (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  TierOneTrigger d pr c ∧ TierOneSentenceLawful d pr c


def TierTwoDisposition (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  TierTwoTrigger d pr c ∧ TierTwoSentenceLawful d pr c







structure GovernmentProofUnderSubsectionA
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  commenced : ProsecutionCommencedUnderSection1591 d pr c

  jurisdiction : FederalJurisdictionalNexusProved d pr c

  conduct : ChargedConductProved d pr c

  scienter : SubsectionAScienterSatisfied d pr c




structure ConvictionUnderSubsectionA
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  proof : GovernmentProofUnderSubsectionA d pr c

  adjudicated : AdjudicationOfGuiltEntered d pr c



structure TierOneSentencing
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  conviction : ConvictionUnderSubsectionA d pr c

  trigger : TierOneTrigger d pr c

  lawful : TierOneSentenceLawful d pr c


structure TierTwoSentencing
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  conviction : ConvictionUnderSubsectionA d pr c

  trigger : TierTwoTrigger d pr c

  lawful : TierTwoSentenceLawful d pr c





structure ObstructionConviction
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  commenced : ProsecutionCommencedUnderSection1591 d pr c

  charged : ChargedUnderSubsectionD d pr c

  obstruction : EnforcementObstructionProved d pr c

  adjudicated : AdjudicationOfGuiltEntered d pr c



structure ObstructionSentencing
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  conviction : ObstructionConviction d pr c

  lawful : ObstructionSentenceLawful d pr c





structure Transition where

  source : Stage

  target : Stage

  guard : Prop


def TransitionEnabled (t : Transition) : Prop := t.guard



def proofTransition (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.charged, target := Stage.proofCarried,
    guard := GovernmentProofUnderSubsectionA d pr c }



def convictionTransition (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.proofCarried, target := Stage.convicted,
    guard := AdjudicationOfGuiltEntered d pr c }



def sentencingTransition (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.convicted, target := Stage.sentenced,
    guard := TierOneDisposition d pr c ∨ TierTwoDisposition d pr c }


def obstructionSentencingTransition
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.convicted, target := Stage.sentenced,
    guard := ObstructionSentenceLawful d pr c }




inductive Reaches (d : Person) (pr : Prosecution) (c : ComplaintText) : Stage → Prop where

  | charged :
      ProsecutionCommencedUnderSection1591 d pr c → Reaches d pr c Stage.charged

  | proofCarried :
      Reaches d pr c Stage.charged →
      GovernmentProofUnderSubsectionA d pr c →
      Reaches d pr c Stage.proofCarried

  | convicted :
      Reaches d pr c Stage.proofCarried →
      AdjudicationOfGuiltEntered d pr c →
      Reaches d pr c Stage.convicted

  | convictedOfObstruction :
      Reaches d pr c Stage.charged →
      ObstructionConviction d pr c →
      Reaches d pr c Stage.convicted

  | sentenced :
      Reaches d pr c Stage.convicted →
      (TierOneDisposition d pr c ∨ TierTwoDisposition d pr c) →
      Reaches d pr c Stage.sentenced

  | sentencedForObstruction :
      Reaches d pr c Stage.convicted →
      ObstructionSentenceLawful d pr c →
      Reaches d pr c Stage.sentenced




inductive Section1591Disposition
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where

  | tierOne : TierOneSentencing d pr c → Section1591Disposition d pr c

  | tierTwo : TierTwoSentencing d pr c → Section1591Disposition d pr c

  | obstruction : ObstructionSentencing d pr c → Section1591Disposition d pr c

end Proving.USC.T18.Ch77.Part5.Procedure
