







import Proving.USC.T29.LMRA.Procedure.Types
import Proving.USC.T29.LMRA.Procedure.Predicates
import Proving.USC.T29.LMRA.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.LMRA.Procedure

open Proving.USC.Common



theorem appointBoardStep_intro {pr b c}
    (hEmer : NationalEmergencyFound pr c)
    (hApp : BoardOfInquiryAppointed b c) :
    AppointBoardStep pr b c :=
  ⟨hEmer, hApp⟩

theorem enterInjunctionStep_intro {pr b cp c}
    (hRep : BoardReportFiled b c)
    (hPet : AttorneyGeneralPetitioned pr c)
    (hFind : EmergencyFindingsMade cp c) :
    EnterInjunctionStep pr b cp c :=
  ⟨hRep, hPet, hFind⟩

theorem certifyBallotStep_intro {pr b c}
    (hReconv : BoardReconvened b c)
    (hSixty : SixtyDayReportMade b c)
    (hBallot : BallotTakenWithinFifteenDays pr c)
    (hCert : ResultsCertifiedWithinFiveDays pr c) :
    CertifyBallotStep pr b c :=
  ⟨hReconv, hSixty, hBallot, hCert⟩

theorem dischargeStep_intro {pr c}
    (hMoved : DischargeMoved pr c) :
    DischargeStep pr c :=
  ⟨hMoved⟩

theorem emergencyProcedureTimely_intro {pr b cp c}
    (hAppoint : AppointBoardStep pr b c)
    (hEnter : EnterInjunctionStep pr b cp c)
    (hCertify : CertifyBallotStep pr b c)
    (hDischarge : DischargeStep pr c) :
    EmergencyProcedureTimely pr b cp c :=
  ⟨hAppoint, hEnter, hCertify, hDischarge⟩



theorem healthCareProcedureTimely_intro {h c}
    (hNotice : HealthCareNoticeGiven h c)
    (hBoard : HealthCareBoardEstablishedTimely h c)
    (hReport : HealthCareReportWithinFifteenDays h c)
    (hStatus : StatusQuoMaintained h c) :
    HealthCareProcedureTimely h c :=
  ⟨hNotice, hBoard, hReport, hStatus⟩



theorem properlyCommencedSuit_intro {cp p c}
    (hJur : DistrictCourtHasJurisdiction cp c)
    (hVenue : ProperVenue p c)
    (hService : ServiceOnAgentEffected p c) :
    ProperlyCommencedSuit cp p c :=
  ⟨hJur, hVenue, hService⟩

theorem secondaryBoycottForum_intro {cp c}
    (hJur : DistrictCourtHasJurisdiction cp c)
    (hForum : SecondaryBoycottSuitProperForum cp c) :
    SecondaryBoycottForum cp c :=
  ⟨hJur, hForum⟩

end Proving.USC.T29.LMRA.Procedure
