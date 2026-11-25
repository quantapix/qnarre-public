import Proving.USC.T05.ScopeOfReview.Procedure.Predicates









namespace Proving.USC.T05.ScopeOfReview.Procedure

open Proving.USC.Common



structure Transition where
  «from» : State
  to     : State
  guard  : Prop








structure ReliefPendingReview (a : AgencyAction) (c : ComplaintText) : Prop where
  necessary : NecessaryToPreventIrreparableInjury a c
  issued    : CourtIssuedPreservingProcess a c



def reliefPendingReviewTransition (a : AgencyAction) (c : ComplaintText) : Transition :=
  { «from» := State.ActionTaken
    to     := State.StatusPreserved
    guard  := ReliefPendingReview a c }







structure ProperScopeOfReview
    (a : AgencyAction) (r : AdminRecord) (c : ComplaintText) : Prop where
  presented     : QuestionProperlyPresented a c
  wholeRecord   : WholeRecordReviewed r c
  prejudicialOk : DueAccountOfPrejudicialError c





structure SubstantialEvidenceReviewAvailable
    (a : AgencyAction) (r : AdminRecord) (c : ComplaintText) : Prop where
  properScope : ProperScopeOfReview a r c
  recordBasis : ReviewedOnAgencyHearingRecord r c




def adjudicationReachable (a : AgencyAction) (r : AdminRecord) (c : ComplaintText) : Prop :=
  ProperScopeOfReview a r c

end Proving.USC.T05.ScopeOfReview.Procedure
