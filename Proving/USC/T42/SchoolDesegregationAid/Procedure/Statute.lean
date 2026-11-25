










import Proving.USC.T42.SchoolDesegregationAid.Procedure.Predicates

namespace Proving.USC.T42.SchoolDesegregationAid.Procedure

open Proving.USC.Common


structure Transition where
  fromState : State
  toState   : State
  guard     : Prop



structure EntryApplied (a : Applicant) (c : ComplaintText) : Prop where
  eligible : IsEligibleApplicant a c
  filed    : AssistanceApplicationFiled a c




structure ConsiderationStep (p : AssistanceProceeding) (c : ComplaintText) : Prop where
  considered : MandatoryFactorsConsidered p c




structure AwardStep (p : AssistanceProceeding) (c : ComplaintText) : Prop where
  considered : MandatoryFactorsConsidered p c
  awarded    : AssistanceAwarded p c




structure PaymentStep (p : AssistanceProceeding) (c : ComplaintText) : Prop where
  awarded    : AssistanceAwarded p c
  adjusted   : PriorAdjustmentsApplied p c
  paid       : PaymentMade p c









structure PipelineCompleted (a : Applicant) (p : AssistanceProceeding) (c : ComplaintText) : Prop where
  eligible   : IsEligibleApplicant a c
  filed      : AssistanceApplicationFiled a c
  considered : MandatoryFactorsConsidered p c
  awarded    : AssistanceAwarded p c
  adjusted   : PriorAdjustmentsApplied p c
  paid       : PaymentMade p c




structure CostRuleApplied (q : CourtProceeding) (c : ComplaintText) : Prop where
  subchapter : IsSubchapterProceeding q c
  liable     : UnitedStatesLiableForCosts q c




inductive Reachable (a : Applicant) (p : AssistanceProceeding) (c : ComplaintText) : State → Prop
  | applied
      (h : EntryApplied a c) : Reachable a p c State.Applied
  | considered
      (prev : Reachable a p c State.Applied)
      (h : ConsiderationStep p c) : Reachable a p c State.ConsiderationMade
  | awarded
      (prev : Reachable a p c State.ConsiderationMade)
      (h : AwardStep p c) : Reachable a p c State.Awarded
  | paid
      (prev : Reachable a p c State.Awarded)
      (h : PaymentStep p c) : Reachable a p c State.Paid

end Proving.USC.T42.SchoolDesegregationAid.Procedure
