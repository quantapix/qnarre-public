import Proving.USC.T42.Ch21Tail.Procedure.Predicates













set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Procedure

open Proving.USC.Common





structure Transition (σ : Type) where

  src : σ

  dst : σ

  guard : Prop


def Transition.Enabled {σ : Type} (t : Transition σ) : Prop := t.guard









def ReportPrecedesAdverseAction (reportDay adverseDay : Nat) : Prop :=
  reportDay ≤ adverseDay

instance (reportDay adverseDay : Nat) :
    Decidable (ReportPrecedesAdverseAction reportDay adverseDay) :=
  inferInstanceAs (Decidable (reportDay ≤ adverseDay))




def tReport (p : Person) (c : ComplaintText) (reportDay : Nat) :
    Transition RetaliationState :=
  { src := .Unreported, dst := .Reported
    guard := ReportStepOccurred p c ∧ ReportOccurredOnDay p c reportDay }



def tProtect (p : Person) (c : ComplaintText) : Transition RetaliationState :=
  { src := .Reported, dst := .ProtectedReport
    guard := ReportedConditionsWithinSubchapter p c }



def tAdverseAction (p : Person) (c : ComplaintText) (adverseDay : Nat) :
    Transition RetaliationState :=
  { src := .ProtectedReport, dst := .AdverseActionTaken
    guard := AdverseActionStepOccurred p c ∧ AdverseActionOccurredOnDay p c adverseDay }



def tRetaliation (p : Person) (c : ComplaintText) (reportDay adverseDay : Nat) :
    Transition RetaliationState :=
  { src := .AdverseActionTaken, dst := .RetaliationEstablished
    guard := AdverseActionBecauseOfReport p c
      ∧ ReportPrecedesAdverseAction reportDay adverseDay }


def retaliationTransitions (p : Person) (c : ComplaintText) (reportDay adverseDay : Nat) :
    List (Transition RetaliationState) :=
  [tReport p c reportDay, tProtect p c, tAdverseAction p c adverseDay,
   tRetaliation p c reportDay adverseDay]




inductive ReachableUnder1997d
    (p : Person) (c : ComplaintText) (reportDay adverseDay : Nat) :
    RetaliationState → Prop

  | start : ReachableUnder1997d p c reportDay adverseDay .Unreported

  | reported :
      ReachableUnder1997d p c reportDay adverseDay .Unreported →
      ReportStepOccurred p c →
      ReportOccurredOnDay p c reportDay →
      ReachableUnder1997d p c reportDay adverseDay .Reported

  | protectedReport :
      ReachableUnder1997d p c reportDay adverseDay .Reported →
      ReportedConditionsWithinSubchapter p c →
      ReachableUnder1997d p c reportDay adverseDay .ProtectedReport

  | adverseAction :
      ReachableUnder1997d p c reportDay adverseDay .ProtectedReport →
      AdverseActionStepOccurred p c →
      AdverseActionOccurredOnDay p c adverseDay →
      ReachableUnder1997d p c reportDay adverseDay .AdverseActionTaken

  | established :
      ReachableUnder1997d p c reportDay adverseDay .AdverseActionTaken →
      AdverseActionBecauseOfReport p c →
      ReportPrecedesAdverseAction reportDay adverseDay →
      ReachableUnder1997d p c reportDay adverseDay .RetaliationEstablished




structure Section1997dRetaliationEstablished
    (p : Person) (c : ComplaintText) (reportDay adverseDay : Nat) : Prop where

  reported : ReportStepOccurred p c

  reportDate : ReportOccurredOnDay p c reportDay

  withinSubchapter : ReportedConditionsWithinSubchapter p c

  adverseAction : AdverseActionStepOccurred p c

  adverseDate : AdverseActionOccurredOnDay p c adverseDay

  forSoReporting : AdverseActionBecauseOfReport p c

  ordered : ReportPrecedesAdverseAction reportDay adverseDay






inductive CorrectionTrackTaken (i : Institution) (c : ComplaintText) : Prop

  | litigation : LitigationTrackInitiated i c → CorrectionTrackTaken i c

  | voluntary (agency : Entity) :
      IsGovernmentAgency agency c →
      VoluntaryGoodFaithEffortsUndertaken agency i c →
      CorrectionTrackTaken i c







inductive ReachableUnder1997g (i : Institution) (c : ComplaintText) :
    CorrectionState → Prop

  | conditionsExist :
      IsCoveredInstitution i c →
      DeplorableConditionsExist i c →
      ReachableUnder1997g i c .ConditionsExist

  | correctionInitiated :
      ReachableUnder1997g i c .ConditionsExist →
      CorrectionTrackTaken i c →
      ReachableUnder1997g i c .CorrectionInitiated

  | priorityAssigned :
      ReachableUnder1997g i c .CorrectionInitiated →
      FederalFundsAvailableForImprovement i c →
      PriorityGivenToCorrection i c →
      ReachableUnder1997g i c .PriorityAssigned

  | conditionsCorrected :
      ReachableUnder1997g i c .PriorityAssigned →
      UnconstitutionalConditionsCorrected i c →
      ReachableUnder1997g i c .ConditionsCorrected




structure Section1997gPriorityRecommended (i : Institution) (c : ComplaintText) : Prop where

  covered : IsCoveredInstitution i c

  conditions : DeplorableConditionsExist i c

  track : CorrectionTrackTaken i c

  fundsAvailable : FederalFundsAvailableForImprovement i c

  priority : PriorityGivenToCorrection i c

end Proving.USC.T42.Ch21Tail.Procedure
