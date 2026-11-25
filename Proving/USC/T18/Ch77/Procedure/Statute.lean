










import Proving.USC.T18.Ch77.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Procedure
open Proving.USC.Common



structure GuardedTransition where
  fromState : State
  toState   : State
  guard     : Prop



structure ProsecutionInitiated (p : Person) (c : ComplaintText) : Prop where
  conduct   : OffenseConductOccurred p c
  commenced : ProsecutionCommenced p c


structure ConvictionReached (p : Person) (c : ComplaintText) : Prop where
  commenced : ProsecutionCommenced p c
  convicted : ConvictionEntered p c



structure BasePenaltyTriggered (p : Person) (c : ComplaintText) : Prop where
  convicted : ConvictionEntered p c



structure EnhancedPenaltyTriggered (p : Person) (c : ComplaintText) : Prop where
  convicted   : ConvictionEntered p c
  aggravating : AggravatingCircumstanceEstablished p c








structure TimelyProsecution (c : ComplaintText) (offenseDay chargeDay windowDays : Nat) : Prop where
  offenseOn    : OffenseCommittedOnDay c offenseDay
  chargedOn    : ProsecutionCommencedOnDay c chargeDay
  withinWindow : chargeDay - offenseDay ≤ windowDays



structure ExemptionApplies (p : Person) (c : ComplaintText) : Prop where
  victimIncident : VictimConductIncidentToTrafficking p c



structure AgeKnowledgeBurdenRelieved (p : Person) (c : ComplaintText) : Prop where
  observed : ReasonableOpportunityToObserveAge p c





inductive ReachesPenalty (p : Person) (c : ComplaintText) : Prop
  | viaConviction  (h : ConvictionReached p c) : ReachesPenalty p c
  | viaObstruction (ho : EnforcementObstructed p c) (hc : ConvictionEntered p c) : ReachesPenalty p c

end Proving.USC.T18.Ch77.Procedure
