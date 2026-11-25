














import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch21Misc.Procedure

open Proving.USC.Common




opaque CoveredEntity : Type






inductive CoverageState
  | pending
  | withinCoverage
  | outsideCoverage
  deriving DecidableEq




opaque GovernmentContract : Type




opaque AffirmativeActionPlan : Type





inductive ContractActionState
  | PlanAccepted
  | PlanDeemedAccepted
  | Protected
  | HearingAccorded
  | ActionTaken
  deriving DecidableEq




inductive PostingState
  | DutyAttached
  | Posted
  | WillfulViolation
  | PenaltyTriggered
  deriving DecidableEq

end Proving.USC.T42.Ch21Misc.Procedure
