







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.Review.Elements.Types
import Proving.USC.T29.Review.Elements.Predicates
import Proving.USC.T29.Review.Elements.Statute

namespace Proving.USC.T29.Review.Elements

open Proving.USC.Common


theorem section160Antecedent_intro
    {o : BoardOrder} {u : UnfairLaborPractice} {c : ComplaintText}
    (hCov : IsUnfairLaborPracticeAffectingCommerce u c)
    (hTime : ChargeFiledWithinSixMonths u c)
    (hHear : ComplaintAndHearingAfforded u c)
    (hOrd : BoardOrderOnPreponderance o u c) :
    Section160OrderAntecedent o u c :=
  ⟨hCov, hTime, hHear, hOrd⟩


theorem section160f_intro
    {o : BoardOrder} {u : UnfairLaborPractice} {p : Person} {court : ReviewingCourt}
    {c : ComplaintText}
    (hAnt : Section160OrderAntecedent o u c)
    (hAggr : AggrievedByAgencyAction p c)
    (hFin : FinalAgencyActionReviewable p c)
    (hDisp : OrderIsFinalGrantingOrDenying o c)
    (hForum : IsProperReviewingCourt court p u c)
    (hPet : FiledWrittenReviewPetition o p court c)
    (hSub : FindingsSupportedBySubstantialEvidence o c) :
    Section160f o u p court c :=
  ⟨hAnt, hAggr, hFin, hDisp, hForum, hPet, hSub⟩


theorem section160e_intro
    {o : BoardOrder} {u : UnfairLaborPractice} {court : ReviewingCourt}
    {c : ComplaintText}
    (hAnt : Section160OrderAntecedent o u c)
    (hPet : BoardPetitionedProperEnforcementCourt o court c)
    (hSub : FindingsSupportedBySubstantialEvidence o c)
    (hExh : ObjectionUrgedBeforeBoard o c) :
    Section160e o u court c :=
  ⟨hAnt, hPet, hSub, hExh⟩


theorem validSection160JudicialReview_review_intro
    {o : BoardOrder} {u : UnfairLaborPractice} {c : ComplaintText}
    (p : Person) (court : ReviewingCourt) (h : Section160f o u p court c) :
    ValidSection160JudicialReview o u c :=
  .review p court h


theorem validSection160JudicialReview_enforce_intro
    {o : BoardOrder} {u : UnfairLaborPractice} {c : ComplaintText}
    (court : ReviewingCourt) (h : Section160e o u court c) :
    ValidSection160JudicialReview o u c :=
  .enforce court h

end Proving.USC.T29.Review.Elements
