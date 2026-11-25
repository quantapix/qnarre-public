







import Proving.USC.T05.Procedure.Types
import Proving.USC.T05.Procedure.Predicates
import Proving.USC.T05.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T05.Procedure

open Proving.USC.Common


theorem timelyNotice_intro {proc c}
    (hReq : AdjudicationRequiredOnRecord proc c)
    (hNotice : NoticeTimelyGiven proc c) :
    TimelyNotice proc c :=
  ⟨hReq, hNotice⟩


theorem properHearing_intro {proc c}
    (hHeard : HearingHeldBeforePresider proc c)
    (hBurden : BurdenOfProofMet proc c)
    (hRecord : DecisionOnExclusiveRecord proc c) :
    ProperHearing proc c :=
  ⟨hHeard, hBurden, hRecord⟩


theorem properDecision_intro {proc c}
    (hExParte : ExParteProhibitionHonored proc c)
    (hDecided : InitialDecisionRendered proc c)
    (hFinal : BecameFinalAgencyAction proc c) :
    ProperDecision proc c :=
  ⟨hExParte, hDecided, hFinal⟩


theorem lawfulFormalAdjudication_intro {proc c}
    (hNotice : TimelyNotice proc c)
    (hHearing : ProperHearing proc c)
    (hDecision : ProperDecision proc c) :
    LawfulFormalAdjudication proc c :=
  ⟨hNotice, hHearing, hDecision⟩


theorem reviewableAgencyAction_intro {p act c}
    (hNotPrecluded : ReviewNotPrecluded act c)
    (hFinal : FinalAndNoAdequateRemedy act c)
    (hAggrieved : PersonAggrieved p act c)
    (hReview : JudicialReviewObtained p act c) :
    ReviewableAgencyAction p act c :=
  ⟨hNotPrecluded, hFinal, hAggrieved, hReview⟩

end Proving.USC.T05.Procedure
