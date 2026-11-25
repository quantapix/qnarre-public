










import Proving.USC.T42.TitleVI.Procedure.Types

namespace Proving.USC.T42.TitleVI.Procedure

open Proving.USC.Common







axiom IsCoveredRecipient (e : Entity) (c : ComplaintText) : Prop






axiom RuleIssuedAndApproved (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop






axiom RecipientAdvised (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop






axiom VoluntaryComplianceFailed (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop







axiom ExpressFindingOnRecord (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop





axiom ReportFiledWithCongress (a : Agency) (p : Proceeding) (c : ComplaintText) : Prop








axiom ThirtyDayReportWindowElapsed (p : Proceeding) (c : ComplaintText) : Prop







axiom ViolationAfter1986Cutoff (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVI.Procedure
