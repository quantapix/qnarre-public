



















import Proving.USC.T42.Procedure.Types

namespace Proving.USC.T42.Procedure

open Proving.USC.Common








axiom ClaimAccrued (p : Person) (c : ComplaintText) : Prop






axiom ActionCommenced (p : Person) (c : ComplaintText) : Prop






axiom WithinOneYearWindow (p : Person) (c : ComplaintText) : Prop





axiom OvertActInjured (p : Person) (c : ComplaintText) : Prop








axiom NoticeAndVoluntaryAttempt (ag : Agency) (prog : Program) (c : ComplaintText) : Prop






axiom HearingAndFinding (ag : Agency) (prog : Program) (c : ComplaintText) : Prop





axiom ReportFiled (ag : Agency) (prog : Program) (c : ComplaintText) : Prop






axiom ThirtyDayReportWindow (ag : Agency) (prog : Program) (c : ComplaintText) : Prop







axiom JuryDemanded (p : Person) (c : ComplaintText) : Prop





axiom ViolationAfterEffectiveDate (e : Entity) (c : ComplaintText) : Prop





axiom IsStateDefendant (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Procedure
