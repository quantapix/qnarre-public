













import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Procedure

open Proving.USC.Common






axiom ComplaintReferredToCRS (r : ReferredComplaint) (c : ComplaintText) : Prop




axiom CRSInvestigated (r : ReferredComplaint) (c : ComplaintText) : Prop





axiom CRSHearingConfidential (r : ReferredComplaint) (c : ComplaintText) : Prop




axiom CRSSoughtVoluntarySettlement (r : ReferredComplaint) (c : ComplaintText) : Prop








axiom AGReasonableCause (p : Person) (c : ComplaintText) : Prop




axiom AGActionFiled (p : Person) (a : AGComplaint) (c : ComplaintText) : Prop





axiom AGComplaintWellFormed (a : AGComplaint) (c : ComplaintText) : Prop







axiom ThreeJudgeCourtRequested (a : AGComplaint) (c : ComplaintText) : Prop




axiom ThreeJudgeCourtDesignated (a : AGComplaint) (c : ComplaintText) : Prop






axiom CaseExpedited (a : AGComplaint) (c : ComplaintText) : Prop





axiom AppealToSupremeCourt (a : AGComplaint) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Enforcement.Procedure
