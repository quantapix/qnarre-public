











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Procedure

open Proving.USC.Common



opaque FederalAgency : Type




opaque Recipient : Type



opaque EducationProgram : Type



opaque AgencyRule : Type




opaque EnforcementAction : Type




opaque ComplianceReport : Type



opaque AdministrativeHearing : Type



opaque JudicialReviewPetition : Type



opaque AggrievedParty : Type




opaque TransitionPlan : Type



opaque ChapterProceeding : Type



opaque TaskForce : Type




opaque TaskForceRecommendations : Type



opaque AnnualReport : Type



opaque PersonnelDetail : Type


















inductive EnforcementState
  | RuleProposed
  | RuleEffective
  | RecipientAdvised
  | VoluntaryComplianceFailed
  | HearingAfforded
  | FindingOnRecord
  | ActionOrdered
  | ReportFiled
  | ActionEffective
  | UnderJudicialReview
  deriving DecidableEq, Repr



structure Transition where
  src : EnforcementState
  dst : EnforcementState
  guard : Prop

end Proving.USC.T20.Ch38.Reearn.Procedure
