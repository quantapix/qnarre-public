















import Proving.USC.T09.Procedure.Types
import Proving.USC.T09.Procedure.Predicates

namespace Proving.USC.T09.Procedure

open Proving.USC.Common



structure Transition where
  «from» : State
  to     : State





structure CompelStep (p : Person) (a : Agreement) (app : Application)
    (c : ComplaintText) : Prop where
  aggrieved   : AggrievedByFailureToArbitrate p a c
  petitioned  : PetitionToCompelFiled p app c
  noticed     : FiveDayNoticeServed p app c
  ordered     : OrderToCompelIssued p c




structure StayStep (p : Person) (a : Agreement) (c : ComplaintText) : Prop where
  applied  : StayApplicationMade p a c



structure ConstituteStep (a : Agreement) (c : ComplaintText) : Prop where
  appointed : ArbitratorsAppointed a c





structure ConfirmTimely (p : Person) (aw : Award) (app : Application)
    (c : ComplaintText) : Prop where
  made      : AwardMade aw c
  applied   : ConfirmationApplied p aw app c
  inWindow  : WithinOneYearWindow aw app c
  noticed   : ConfirmationNoticeServed p app c





structure VacateTimely (p : Person) (aw : Award) (app : Application)
    (c : ComplaintText) : Prop where
  made      : AwardMade aw c
  ground    : VacaturGroundShown aw c
  served    : VacaturMotionServed p app c
  inWindow  : WithinThreeMonthWindow aw app c




structure ModifyTimely (p : Person) (aw : Award) (app : Application)
    (c : ComplaintText) : Prop where
  made      : AwardMade aw c
  ground    : ModificationGroundShown aw c
  served    : VacaturMotionServed p app c
  inWindow  : WithinThreeMonthWindow aw app c



structure AppealAvailable (c : ComplaintText) : Prop where
  appealable : OrderAppealable c





inductive Reachable (p : Person) (a : Agreement) (aw : Award)
    (app : Application) (c : ComplaintText) : State → Prop
  | start : Reachable p a aw app c State.Disputed
  | compelled (h : Reachable p a aw app c State.Disputed)
      (g : CompelStep p a app c) : Reachable p a aw app c State.Compelled
  | stayed (h : Reachable p a aw app c State.Disputed)
      (g : StayStep p a c) : Reachable p a aw app c State.Stayed
  | constituted (h : Reachable p a aw app c State.Compelled)
      (g : ConstituteStep a c) : Reachable p a aw app c State.Constituted
  | awarded (h : Reachable p a aw app c State.Constituted)
      (g : AwardMade aw c) : Reachable p a aw app c State.Awarded
  | confirmed (h : Reachable p a aw app c State.Awarded)
      (g : ConfirmTimely p aw app c) : Reachable p a aw app c State.Confirmed
  | vacated (h : Reachable p a aw app c State.Awarded)
      (g : VacateTimely p aw app c) : Reachable p a aw app c State.Vacated
  | modified (h : Reachable p a aw app c State.Awarded)
      (g : ModifyTimely p aw app c) : Reachable p a aw app c State.Modified

end Proving.USC.T09.Procedure
