











import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Procedure.Types
import Proving.USC.T42.TitleVIIDef.Procedure.Predicates

namespace Proving.USC.T42.TitleVIIDef.Procedure

open Proving.USC.Common



structure ImpactTransition (pr : Proceeding) (c : ComplaintText) where
  fromStage : ImpactStage
  toStage   : ImpactStage
  guard     : Prop





structure ImpactEstablishedPrimary (pr : Proceeding) (c : ComplaintText) : Prop where
  raised          : ImpactClaimRaised pr c
  impactShown     : ComplainantDemonstratedImpact pr c
  notJustified    : ¬ RespondentDemonstratedJustification pr c





structure ImpactEstablishedAlternative (pr : Proceeding) (c : ComplaintText) : Prop where
  raised          : ImpactClaimRaised pr c
  impactShown     : ComplainantDemonstratedImpact pr c
  justified       : RespondentDemonstratedJustification pr c
  alternativeShown : ComplainantDemonstratedAlternative pr c



inductive ImpactBurdenShiftComplete (pr : Proceeding) (c : ComplaintText) : Prop

  | primary     : ImpactEstablishedPrimary pr c → ImpactBurdenShiftComplete pr c

  | alternative : ImpactEstablishedAlternative pr c → ImpactBurdenShiftComplete pr c





structure PreclusionGateFires (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  judgmentEntered     : EmploymentJudgmentEntered pr c
  noticeAndOpportunity : ActualNoticeAndOpportunity p pr c
  precluded           : ChallengePrecluded p pr c





structure SurvivingChallengeProperlyVenued (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  judgmentEntered : EmploymentJudgmentEntered pr c
  notPrecluded    : ¬ ChallengePrecluded p pr c
  properVenue     : ProperVenueEnteringCourt p pr c

end Proving.USC.T42.TitleVIIDef.Procedure
