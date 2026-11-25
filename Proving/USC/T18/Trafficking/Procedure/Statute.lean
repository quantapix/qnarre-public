



















import Proving.USC.T18.Trafficking.Procedure.Predicates

namespace Proving.USC.T18.Trafficking.Procedure
open Proving.USC.Common





def ChargingDates.timely (d : ChargingDates) : Prop :=
  d.accrualDay ≤ d.chargingDay ∧ d.chargingDay - d.accrualDay ≤ d.windowDays

instance (d : ChargingDates) : Decidable d.timely := by
  unfold ChargingDates.timely; exact inferInstance




structure TimelyProsecution (p : Person) (d : ChargingDates) (c : ComplaintText) : Prop where
  accrued   : OffenseAccrued p c
  commenced : ProsecutionCommenced p c
  dates     : ChargingDatesPleaded d c
  inWindow  : d.timely





structure EnforcementObstruction (p : Person) (c : ComplaintText) : Prop where
  obstructed : ObstructedEnforcement p c



structure AgeProofRelieved (p : Person) (c : ComplaintText) : Prop where
  observed : ReasonableOpportunityToObserve p c




def reachedState (d : ChargingDates) : State :=
  if d.timely then State.charged else State.timeBarred

end Proving.USC.T18.Trafficking.Procedure
