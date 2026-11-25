







import Proving.USC.T42.TitleVI.Procedure.Predicates

namespace Proving.USC.T42.TitleVI.Procedure

open Proving.USC.Common




structure Transition where
  frm   : State
  to    : State
  guard : Prop








structure AdviseStep (a : Agency) (p : Proceeding) (e : Entity) (c : ComplaintText) : Prop where
  covered  : IsCoveredRecipient e c
  ruleOk   : RuleIssuedAndApproved a p c
  advised  : RecipientAdvised a p c



structure VoluntaryStep (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop where
  advised   : RecipientAdvised a p c
  volFailed : VoluntaryComplianceFailed a p c



structure FindingStep (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop where
  volFailed : VoluntaryComplianceFailed a p c
  finding   : ExpressFindingOnRecord a p c



structure ReportStep (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop where
  finding : ExpressFindingOnRecord a p c
  report  : ReportFiledWithCongress a p c



structure EffectiveStep (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop where
  report     : ReportFiledWithCongress a p c
  windowDone : ThirtyDayReportWindowElapsed p c





structure LawfulFundTermination (a : Agency) (p : Proceeding) (e : Entity) (c : ComplaintText) : Prop where
  covered    : IsCoveredRecipient e c
  ruleOk     : RuleIssuedAndApproved a p c
  advised    : RecipientAdvised a p c
  volFailed  : VoluntaryComplianceFailed a p c
  finding    : ExpressFindingOnRecord a p c
  report     : ReportFiledWithCongress a p c
  windowDone : ThirtyDayReportWindowElapsed p c





structure AbrogationTimely (e : Entity) (c : ComplaintText) : Prop where
  afterCutoff : ViolationAfter1986Cutoff e c




inductive Reachable (a : Agency) (p : Proceeding) (e : Entity) (c : ComplaintText) : State → Prop where
  | start : Reachable a p e c State.Covered
  | advise   (h : AdviseStep a p e c)   : Reachable a p e c State.Advised
  | volStep  (h : VoluntaryStep a p c)  : Reachable a p e c State.VoluntaryFailed
  | finding  (h : FindingStep a p c)    : Reachable a p e c State.FindingOnRecord
  | report   (h : ReportStep a p c)     : Reachable a p e c State.ReportFiled
  | effective (h : EffectiveStep a p c) : Reachable a p e c State.Effective

end Proving.USC.T42.TitleVI.Procedure
