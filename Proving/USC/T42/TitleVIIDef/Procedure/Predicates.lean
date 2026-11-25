










import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Procedure.Types

namespace Proving.USC.T42.TitleVIIDef.Procedure

open Proving.USC.Common












axiom ImpactClaimRaised (pr : Proceeding) (c : ComplaintText) : Prop






axiom ComplainantDemonstratedImpact (pr : Proceeding) (c : ComplaintText) : Prop






axiom RespondentDemonstratedJustification (pr : Proceeding) (c : ComplaintText) : Prop






axiom ComplainantDemonstratedAlternative (pr : Proceeding) (c : ComplaintText) : Prop








axiom EmploymentJudgmentEntered (pr : Proceeding) (c : ComplaintText) : Prop






axiom ActualNoticeAndOpportunity (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop






axiom ChallengePrecluded (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop






axiom ProperVenueEnteringCourt (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIDef.Procedure
