











import Proving.USC.T29.LMRA.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.LMRA.Procedure

open Proving.USC.Common







axiom NationalEmergencyFound (pr : EmergencyProceeding) (c : ComplaintText) : Prop




axiom BoardOfInquiryAppointed (b : BoardOfInquiry) (c : ComplaintText) : Prop





axiom BoardReportFiled (b : BoardOfInquiry) (c : ComplaintText) : Prop





axiom AttorneyGeneralPetitioned (pr : EmergencyProceeding) (c : ComplaintText) : Prop





axiom EmergencyFindingsMade (cp : CourtProceeding) (c : ComplaintText) : Prop




axiom BoardReconvened (b : BoardOfInquiry) (c : ComplaintText) : Prop





axiom SixtyDayReportMade (b : BoardOfInquiry) (c : ComplaintText) : Prop




axiom BallotTakenWithinFifteenDays (pr : EmergencyProceeding) (c : ComplaintText) : Prop




axiom ResultsCertifiedWithinFiveDays (pr : EmergencyProceeding) (c : ComplaintText) : Prop




axiom DischargeMoved (pr : EmergencyProceeding) (c : ComplaintText) : Prop




axiom OrderReviewable (cp : CourtProceeding) (c : ComplaintText) : Prop






axiom HealthCareNoticeGiven (h : HealthCareImpasse) (c : ComplaintText) : Prop





axiom HealthCareBoardEstablishedTimely (h : HealthCareImpasse) (c : ComplaintText) : Prop




axiom HealthCareReportWithinFifteenDays (h : HealthCareImpasse) (c : ComplaintText) : Prop




axiom StatusQuoMaintained (h : HealthCareImpasse) (c : ComplaintText) : Prop







axiom DistrictCourtHasJurisdiction (cp : CourtProceeding) (c : ComplaintText) : Prop





axiom ProperVenue (p : Person) (c : ComplaintText) : Prop




axiom ServiceOnAgentEffected (p : Person) (c : ComplaintText) : Prop







axiom FelonyThresholdMet (p : Person) (c : ComplaintText) : Prop







axiom SecondaryBoycottSuitProperForum (cp : CourtProceeding) (c : ComplaintText) : Prop

end Proving.USC.T29.LMRA.Procedure
