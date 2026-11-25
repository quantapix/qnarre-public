













import Proving.USC.T42.SchoolDesegregationAid.Procedure.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Procedure

open Proving.USC.Common







axiom IsEligibleApplicant (a : Applicant) (c : ComplaintText) : Prop






axiom AssistanceApplicationFiled (a : Applicant) (c : ComplaintText) : Prop








axiom MandatoryFactorsConsidered (p : AssistanceProceeding) (c : ComplaintText) : Prop




axiom AssistanceAwarded (p : AssistanceProceeding) (c : ComplaintText) : Prop







axiom PriorAdjustmentsApplied (p : AssistanceProceeding) (c : ComplaintText) : Prop





axiom PaymentMade (p : AssistanceProceeding) (c : ComplaintText) : Prop






axiom IsSubchapterProceeding (q : CourtProceeding) (c : ComplaintText) : Prop





axiom UnitedStatesLiableForCosts (q : CourtProceeding) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregationAid.Procedure
