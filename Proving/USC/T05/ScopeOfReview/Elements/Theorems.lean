






import Proving.USC.T05.ScopeOfReview.Elements.Statute

namespace Proving.USC.T05.ScopeOfReview.Elements

open Proving.USC.Common


theorem section705_intro {p court a c}
    (hAggr : AggrievedByAgencyAction p c)
    (hRev : FinalAgencyActionReviewable p c)
    (hCourt : IsReviewingCourt court a c)
    (hIrr : NecessaryToPreventIrreparableInjury a c)
    (hRelief : ReliefPostponesOrPreservesPendingReview a c) :
    Section705 p court a c :=
  ⟨hAggr, hRev, hCourt, hIrr, hRelief⟩


theorem section706SetAside_intro {p a c}
    (hAggr : AggrievedByAgencyAction p c)
    (hRev : FinalAgencyActionReviewable p c)
    (hQ : RelevantQuestionOfLawPresented a c)
    (hGround : SetAsideTheory a c)
    (hWhole : WholeRecordReviewed a c)
    (hNotHarmless : ¬ HarmlessError a c) :
    Section706SetAside p a c :=
  ⟨hAggr, hRev, hQ, hGround, hWhole, hNotHarmless⟩


theorem section706Compel_intro {p a c}
    (hAggr : AggrievedByAgencyAction p c)
    (hRev : FinalAgencyActionReviewable p c)
    (hQ : RelevantQuestionOfLawPresented a c)
    (hWithheld : ActionUnlawfullyWithheldOrDelayed a c) :
    Section706Compel p a c :=
  ⟨hAggr, hRev, hQ, hWithheld⟩

end Proving.USC.T05.ScopeOfReview.Elements
