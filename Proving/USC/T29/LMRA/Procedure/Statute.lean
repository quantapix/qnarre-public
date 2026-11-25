









import Proving.USC.T29.LMRA.Procedure.Types
import Proving.USC.T29.LMRA.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.LMRA.Procedure

open Proving.USC.Common



structure Transition where
  fromState : EmergencyState
  toState   : EmergencyState
  guard     : Prop





structure AppointBoardStep (pr : EmergencyProceeding) (b : BoardOfInquiry)
    (c : ComplaintText) : Prop where
  emergency : NationalEmergencyFound pr c
  appointed : BoardOfInquiryAppointed b c



structure EnterInjunctionStep (pr : EmergencyProceeding) (b : BoardOfInquiry)
    (cp : CourtProceeding) (c : ComplaintText) : Prop where
  reportFiled : BoardReportFiled b c
  agPetition  : AttorneyGeneralPetitioned pr c
  findings    : EmergencyFindingsMade cp c





structure CertifyBallotStep (pr : EmergencyProceeding) (b : BoardOfInquiry)
    (c : ComplaintText) : Prop where
  reconvened : BoardReconvened b c
  sixtyDay   : SixtyDayReportMade b c
  ballot15   : BallotTakenWithinFifteenDays pr c
  certify5   : ResultsCertifiedWithinFiveDays pr c



structure DischargeStep (pr : EmergencyProceeding) (c : ComplaintText) : Prop where
  moved : DischargeMoved pr c




structure EmergencyProcedureTimely (pr : EmergencyProceeding) (b : BoardOfInquiry)
    (cp : CourtProceeding) (c : ComplaintText) : Prop where
  appoint   : AppointBoardStep pr b c
  enter     : EnterInjunctionStep pr b cp c
  certify   : CertifyBallotStep pr b c
  discharge : DischargeStep pr c






structure HealthCareProcedureTimely (h : HealthCareImpasse) (c : ComplaintText) : Prop where
  notice    : HealthCareNoticeGiven h c
  boardTimely : HealthCareBoardEstablishedTimely h c
  report15  : HealthCareReportWithinFifteenDays h c
  statusQuo : StatusQuoMaintained h c






structure ProperlyCommencedSuit (cp : CourtProceeding) (p : Person)
    (c : ComplaintText) : Prop where
  jurisdiction : DistrictCourtHasJurisdiction cp c
  venue        : ProperVenue p c
  service      : ServiceOnAgentEffected p c



structure SecondaryBoycottForum (cp : CourtProceeding) (c : ComplaintText) : Prop where
  jurisdiction : DistrictCourtHasJurisdiction cp c
  forum        : SecondaryBoycottSuitProperForum cp c

end Proving.USC.T29.LMRA.Procedure
