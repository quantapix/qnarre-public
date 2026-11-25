




























import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Procedure

open Proving.USC.Common




opaque Proceeding : Type




inductive ImpactStage

  | Raised


  | ImpactShown


  | JustificationShown


  | AlternativeShown
  deriving DecidableEq, Repr


inductive PreclusionStage


  | JudgmentEntered


  | NoticeAndOpportunityGiven

  | ChallengePrecluded
  deriving DecidableEq, Repr

end Proving.USC.T42.TitleVIIDef.Procedure
