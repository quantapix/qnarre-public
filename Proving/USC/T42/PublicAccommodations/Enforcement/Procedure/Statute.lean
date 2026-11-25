














import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Predicates

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Procedure

open Proving.USC.Common



structure Transition where
  frm   : State
  to    : State
  guard : Prop






structure CRSProcessProper (r : ReferredComplaint) (c : ComplaintText) : Prop where
  referred   : ComplaintReferredToCRS r c
  investigated : CRSInvestigated r c
  confidential : CRSHearingConfidential r c
  settlement   : CRSSoughtVoluntarySettlement r c








structure AGActionWellFiled (p : Person) (a : AGComplaint) (c : ComplaintText) : Prop where
  cause      : AGReasonableCause p c
  venue      : Proving.USC.Common.VenueNexus p c
  jurisdiction : Proving.USC.Common.FederalJurisdictionalNexus c
  filed      : AGActionFiled p a c
  wellFormed : AGComplaintWellFormed a c








structure ThreeJudgeTrackProper (a : AGComplaint) (c : ComplaintText) : Prop where
  requested  : ThreeJudgeCourtRequested a c
  designated : ThreeJudgeCourtDesignated a c
  expedited  : CaseExpedited a c
  appeal     : AppealToSupremeCourt a c




structure AGEnforcementReachable (p : Person) (a : AGComplaint) (c : ComplaintText) : Prop where
  wellFiled  : AGActionWellFiled p a c
  threeJudge : ThreeJudgeTrackProper a c

end Proving.USC.T42.PublicAccommodations.Enforcement.Procedure
