














import Proving.USC.T22.Procedure.Sub.Types
import Proving.USC.Common.Types

namespace Proving.USC.T22.Procedure.Sub

open Proving.USC.Common






axiom TaskForceEstablished (c : ComplaintText) : Prop




axiom OfficeEstablished (c : ComplaintText) : Prop




axiom OperatingGroupEstablished (c : ComplaintText) : Prop





axiom DirectorConfirmedBySenate (p : Person) (c : ComplaintText) : Prop







axiom AnnualReportSubmitted (c : ComplaintText) : Prop




axiom RegulationsPromulgated (c : ComplaintText) : Prop





axiom RegionalGoalsSubmitted (c : ComplaintText) : Prop









axiom RegulationsPromulgationDelayDays (c : ComplaintText) : Nat






axiom AnnualReportSubmissionDayOfYear (c : ComplaintText) : Nat







axiom DataRequestIssued (p : Person) (c : ComplaintText) : Prop





axiom DataProvided (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T22.Procedure.Sub
