




































import Proving.TitleIIEnf.Statute
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.GoldenBridge
open Proving.USC.Common (ComplaintText)



axiom mapC    : ComplaintText → Proving.TitleIIEnf.ComplaintText
axiom mapProc : Procedure.AGComplaint → Proving.TitleIIEnf.Proceeding
axiom mapDes  : Procedure.AGComplaint → Proving.TitleIIEnf.Designation






axiom corr_pending {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtRequested a c →
    Proving.TitleIIEnf.PendingEnforcementProceeding (mapProc a) (mapC c)


axiom corr_agRequested {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtRequested a c →
    Proving.TitleIIEnf.AGRequestedThreeJudgeCourt (mapProc a) (mapC c)




axiom corr_certificate {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtRequested a c →
    Proving.TitleIIEnf.AccompaniedByPublicImportanceCertificate (mapProc a) (mapC c)




axiom corr_furnishedChief {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtDesignated a c →
    Proving.TitleIIEnf.RequestFurnishedToChiefJudge (mapProc a) (mapC c)


axiom corr_designated {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtDesignated a c →
    Proving.TitleIIEnf.ThreeJudgesDesignated (mapDes a) (mapProc a) (mapC c)



axiom corr_composition {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.ThreeJudgeCourtDesignated a c →
    Proving.TitleIIEnf.PanelCompositionProper (mapDes a) (mapC c)


axiom corr_expedited {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.CaseExpedited a c →
    Proving.TitleIIEnf.CaseExpeditedAtEarliestDate (mapProc a) (mapC c)


axiom corr_scotusAppeal {a : Procedure.AGComplaint} {c : ComplaintText} :
    Procedure.AppealToSupremeCourt a c →
    Proving.TitleIIEnf.AppealLiesToSupremeCourt (mapProc a) (mapC c)








theorem cand_implies_golden
    {a : Procedure.AGComplaint} {c : ComplaintText}
    (h : Procedure.ThreeJudgeTrackProper a c) :
    Proving.TitleIIEnf.ValidSection2000a5bConvening (mapProc a) (mapC c) :=
  Proving.TitleIIEnf.ValidSection2000a5bConvening.viaThreeJudge (mapDes a)
    { pending        := corr_pending h.requested
      agRequested    := corr_agRequested h.requested
      certificate    := corr_certificate h.requested
      furnishedChief := corr_furnishedChief h.designated
      designated     := corr_designated h.designated
      composition    := corr_composition h.designated
      expedited      := corr_expedited h.expedited
      scotusAppeal   := corr_scotusAppeal h.appeal }

end Proving.USC.T42.PublicAccommodations.Enforcement.GoldenBridge
