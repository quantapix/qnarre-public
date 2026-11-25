








import Proving.USC.T18.Ch117.Recert.Procedure.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Procedure

open Proving.USC.Common





structure Transition (S : Type) where
  source : S
  target : S
  guard  : Prop











def WithinLimitationsWindow (plaintiff : Person) (c : ComplaintText) (windowDays : Nat) : Prop :=
  AccrualDay plaintiff c ≤ FilingDay plaintiff c ∧
    FilingDay plaintiff c ≤ AccrualDay plaintiff c + windowDays




noncomputable instance (plaintiff : Person) (c : ComplaintText) (windowDays : Nat) :
    Decidable (WithinLimitationsWindow plaintiff c windowDays) := by
  unfold WithinLimitationsWindow; infer_instance






def IntentContemporaneousWithTravel (defendant : Person) (c : ComplaintText) : Prop :=
  TravelStartDay defendant c ≤ IntentHeldDay defendant c ∧
    IntentHeldDay defendant c ≤ TravelEndDay defendant c



noncomputable instance (defendant : Person) (c : ComplaintText) :
    Decidable (IntentContemporaneousWithTravel defendant c) := by
  unfold IntentContemporaneousWithTravel; infer_instance





def accruedToFiled (plaintiff : Person) (c : ComplaintText) (windowDays : Nat) :
    Transition CivilStage :=
  { source := CivilStage.Accrued
    target := CivilStage.Filed
    guard  := FiledInUnitedStatesDistrictCourt plaintiff c ∧
                WithinLimitationsWindow plaintiff c windowDays }


def accruedToTimeBarred (plaintiff : Person) (c : ComplaintText) (windowDays : Nat) :
    Transition CivilStage :=
  { source := CivilStage.Accrued
    target := CivilStage.TimeBarred
    guard  := ¬ WithinLimitationsWindow plaintiff c windowDays }




structure Section2421AcTimelyCivilFiling (plaintiff defendant : Person) (c : ComplaintText)
    (windowDays : Nat) : Prop where
  predicateViolation : ViolationOfSubsectionB defendant c
  injured            : InjuredByReasonOfViolation plaintiff defendant c
  forum              : FiledInUnitedStatesDistrictCourt plaintiff c
  inWindow           : WithinLimitationsWindow plaintiff c windowDays




inductive CivilReachable (plaintiff defendant : Person) (c : ComplaintText) (windowDays : Nat) :
    CivilStage → Prop
  | injured :
      InjuredByReasonOfViolation plaintiff defendant c →
      CivilReachable plaintiff defendant c windowDays CivilStage.Injured
  | accrued :
      CivilReachable plaintiff defendant c windowDays CivilStage.Injured →
      ViolationOfSubsectionB defendant c →
      CivilReachable plaintiff defendant c windowDays CivilStage.Accrued
  | filed :
      CivilReachable plaintiff defendant c windowDays CivilStage.Accrued →
      FiledInUnitedStatesDistrictCourt plaintiff c →
      WithinLimitationsWindow plaintiff c windowDays →
      CivilReachable plaintiff defendant c windowDays CivilStage.Filed
  | timeBarred :
      CivilReachable plaintiff defendant c windowDays CivilStage.Accrued →
      FiledInUnitedStatesDistrictCourt plaintiff c →
      ¬ WithinLimitationsWindow plaintiff c windowDays →
      CivilReachable plaintiff defendant c windowDays CivilStage.TimeBarred




def convictedToRestitutionOrdered (defendant : Person) (c : ComplaintText) :
    Transition RestitutionStage :=
  { source := RestitutionStage.Convicted
    target := RestitutionStage.RestitutionOrdered
    guard  := ConvictedUnderSubsectionB2 defendant c }


structure Section2421AdMandatoryRestitution (defendant : Person) (c : ComplaintText) : Prop where
  convicted       : ConvictedUnderSubsectionB2 defendant c
  ordered         : RestitutionOrdered defendant c
  scopeConsistent : RestitutionScopeConsistentWithSection2327b defendant c





def raisedToEstablished2421Ae (defendant : Person) (c : ComplaintText) :
    Transition DefenseStage :=
  { source := DefenseStage.DefenseRaised
    target := DefenseStage.DefenseEstablished
    guard  := ChargeUnderSubsectionAOrB1 defendant c ∧ ProvedByPreponderance defendant c }





structure Section2421AeDefense (defendant : Person) (c : ComplaintText) : Prop where
  chargeGate : ChargeUnderSubsectionAOrB1 defendant c
  legality   : PromotionLegalInTargetedJurisdiction defendant c
  burdenMet  : ProvedByPreponderance defendant c





structure Section2423hTimelyIntent (defendant : Person) (c : ComplaintText) : Prop where
  intention       : IntentionToEngageInProscribedActivity defendant c
  contemporaneous : IntentContemporaneousWithTravel defendant c





structure Section2423fInchoateStep (defendant : Person) (c : ComplaintText) : Prop where
  inchoateAct   : AttemptedOrConspiredToViolate defendant c
  targetInScope : TargetSubsectionWithinAToE defendant c





def raisedToEstablished2423i (defendant : Person) (c : ComplaintText) :
    Transition DefenseStage :=
  { source := DefenseStage.DefenseRaised
    target := DefenseStage.DefenseEstablished
    guard  := ProsecutionBasedOnCommercialSexActProng defendant c ∧
                EstablishedByClearAndConvincingEvidence defendant c }


structure Section2423iDefense (defendant : Person) (c : ComplaintText) : Prop where
  prongGate        : ProsecutionBasedOnCommercialSexActProng defendant c
  reasonableBelief : ReasonableBeliefVictimAtLeast18 defendant c
  burdenMet        : EstablishedByClearAndConvincingEvidence defendant c




inductive Ch117ProceduralPosture (defendant : Person) (c : ComplaintText) : Prop
  | civilAction (plaintiff : Person) (windowDays : Nat)
      (h : Section2421AcTimelyCivilFiling plaintiff defendant c windowDays)
  | mandatoryRestitution (h : Section2421AdMandatoryRestitution defendant c)
  | inchoate (h : Section2423fInchoateStep defendant c)



inductive Ch117DefenseCarried (defendant : Person) (c : ComplaintText) : Prop
  | section2421Ae (quantum : BurdenQuantum) (h : Section2421AeDefense defendant c)
  | section2423i (quantum : BurdenQuantum) (h : Section2423iDefense defendant c)

end Proving.USC.T18.Ch117.Recert.Procedure
