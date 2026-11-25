













import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.Review.Elements.Types
import Proving.USC.T29.Review.Elements.Predicates

namespace Proving.USC.T29.Review.Elements

open Proving.USC.Common




structure Section160OrderAntecedent
    (o : BoardOrder) (u : UnfairLaborPractice) (c : ComplaintText) : Prop where
  coverage  : IsUnfairLaborPracticeAffectingCommerce u c
  timely    : ChargeFiledWithinSixMonths u c
  hearing   : ComplaintAndHearingAfforded u c
  ordered   : BoardOrderOnPreponderance o u c






structure Section160f
    (o : BoardOrder) (u : UnfairLaborPractice) (p : Person) (court : ReviewingCourt)
    (c : ComplaintText) : Prop where
  antecedent  : Section160OrderAntecedent o u c
  aggrieved   : AggrievedByAgencyAction p c
  finality    : FinalAgencyActionReviewable p c
  dispositive : OrderIsFinalGrantingOrDenying o c
  forum       : IsProperReviewingCourt court p u c
  petition    : FiledWrittenReviewPetition o p court c
  substantial : FindingsSupportedBySubstantialEvidence o c




structure Section160e
    (o : BoardOrder) (u : UnfairLaborPractice) (court : ReviewingCourt)
    (c : ComplaintText) : Prop where
  antecedent  : Section160OrderAntecedent o u c
  petitioned  : BoardPetitionedProperEnforcementCourt o court c
  substantial : FindingsSupportedBySubstantialEvidence o c
  exhausted   : ObjectionUrgedBeforeBoard o c




inductive ValidSection160JudicialReview
    (o : BoardOrder) (u : UnfairLaborPractice) (c : ComplaintText) : Prop where
  | review (p : Person) (court : ReviewingCourt)
      (h : Section160f o u p court c) : ValidSection160JudicialReview o u c
  | enforce (court : ReviewingCourt)
      (h : Section160e o u court c) : ValidSection160JudicialReview o u c

end Proving.USC.T29.Review.Elements
