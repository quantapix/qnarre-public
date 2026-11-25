import Proving.USC.T05.ScopeOfReview.Procedure.Types










namespace Proving.USC.T05.ScopeOfReview.Procedure

open Proving.USC.Common






axiom AgencyPostponedEffectiveDate (a : AgencyAction) (c : ComplaintText) : Prop




axiom NecessaryToPreventIrreparableInjury (a : AgencyAction) (c : ComplaintText) : Prop





axiom CourtIssuedPreservingProcess (a : AgencyAction) (c : ComplaintText) : Prop







axiom QuestionProperlyPresented (a : AgencyAction) (c : ComplaintText) : Prop




axiom WholeRecordReviewed (r : AdminRecord) (c : ComplaintText) : Prop





axiom DueAccountOfPrejudicialError (c : ComplaintText) : Prop





axiom ReviewedOnAgencyHearingRecord (r : AdminRecord) (c : ComplaintText) : Prop

end Proving.USC.T05.ScopeOfReview.Procedure
