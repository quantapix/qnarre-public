








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Statute

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Procedure

open Proving.USC.Common


theorem cRSProcessProper_intro {r : ReferredComplaint} {c : ComplaintText}
    (hRef : ComplaintReferredToCRS r c)
    (hInv : CRSInvestigated r c)
    (hConf : CRSHearingConfidential r c)
    (hSet : CRSSoughtVoluntarySettlement r c) :
    CRSProcessProper r c :=
  ⟨hRef, hInv, hConf, hSet⟩


theorem aGActionWellFiled_intro {p : Person} {a : AGComplaint} {c : ComplaintText}
    (hCause : AGReasonableCause p c)
    (hVenue : Proving.USC.Common.VenueNexus p c)
    (hJur : Proving.USC.Common.FederalJurisdictionalNexus c)
    (hFiled : AGActionFiled p a c)
    (hWF : AGComplaintWellFormed a c) :
    AGActionWellFiled p a c :=
  ⟨hCause, hVenue, hJur, hFiled, hWF⟩


theorem threeJudgeTrackProper_intro {a : AGComplaint} {c : ComplaintText}
    (hReq : ThreeJudgeCourtRequested a c)
    (hDes : ThreeJudgeCourtDesignated a c)
    (hExp : CaseExpedited a c)
    (hApp : AppealToSupremeCourt a c) :
    ThreeJudgeTrackProper a c :=
  ⟨hReq, hDes, hExp, hApp⟩



theorem aGEnforcementReachable_intro {p : Person} {a : AGComplaint} {c : ComplaintText}
    (hWF : AGActionWellFiled p a c)
    (hTJ : ThreeJudgeTrackProper a c) :
    AGEnforcementReachable p a c :=
  ⟨hWF, hTJ⟩

end Proving.USC.T42.PublicAccommodations.Enforcement.Procedure
