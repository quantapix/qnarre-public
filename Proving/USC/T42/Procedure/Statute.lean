









import Proving.USC.T42.Procedure.Predicates

namespace Proving.USC.T42.Procedure

open Proving.USC.Common



structure Transition where
  source : State
  target : State
  guard  : Prop






structure TimelyFiling1986 (p : Person) (c : ComplaintText) : Prop where
  accrued   : ClaimAccrued p c
  commenced : ActionCommenced p c
  inWindow  : WithinOneYearWindow p c




structure RipeAction1985 (p : Person) (c : ComplaintText) : Prop where
  overtAct  : OvertActInjured p c
  commenced : ActionCommenced p c









structure EffectiveTermination (ag : Agency) (prog : Program) (c : ComplaintText) : Prop where
  noticed     : NoticeAndVoluntaryAttempt ag prog c
  heard       : HearingAndFinding ag prog c
  reported    : ReportFiled ag prog c
  windowPast  : ThirtyDayReportWindow ag prog c







structure SuitAgainstStateMaintainable (e : Entity) (c : ComplaintText) : Prop where
  isState     : IsStateDefendant e c
  afterCutoff : ViolationAfterEffectiveDate e c







inductive Reachable (ag : Agency) (prog : Program) (c : ComplaintText) : State → Prop
  | start
      : Reachable ag prog c State.Noticed
  | toHearing
      (h : Reachable ag prog c State.Noticed)
      (g : NoticeAndVoluntaryAttempt ag prog c)
      : Reachable ag prog c State.HearingHeld
  | toTerminated
      (h : Reachable ag prog c State.HearingHeld)
      (g : HearingAndFinding ag prog c)
      : Reachable ag prog c State.Terminated
  | toReported
      (h : Reachable ag prog c State.Terminated)
      (g : ReportFiled ag prog c)
      : Reachable ag prog c State.Reported
  | toEffective
      (h : Reachable ag prog c State.Reported)
      (g : ThirtyDayReportWindow ag prog c)
      : Reachable ag prog c State.Effective

end Proving.USC.T42.Procedure
