import Proving.USC.Common.Types

set_option autoImplicit false


























namespace Proving.USC.T42.Ch21CivilRights.Recert.Procedure

open Proving.USC.Common (Person ComplaintText Time)




opaque FederalAgency : Type




opaque Recipient : Type




opaque ProgramOrActivity : Type



opaque AgencyRule : Type



opaque EnforcementAction : Type




opaque CongressionalReport : Type



opaque AttorneyGeneralAction : Type



opaque DistrictCourt : Type



opaque ThreeJudgeCourt : Type



opaque ServiceReferral : Type



opaque StateDefendant : Type


inductive AdminEnforcementState


  | AssistanceExtended


  | RuleIssued

  | RuleEffective


  | NoncomplianceFound


  | VoluntaryComplianceExhausted

  | ReportFiled


  | ActionEffective
  deriving DecidableEq, Repr


inductive PatternPracticeState


  | ReasonableCauseFormed

  | ComplaintFiled

  | CourtConstituted

  | HeardAndDetermined

  | AppealedToSupremeCourt
  deriving DecidableEq, Repr


inductive ServiceReferralState

  | ReferredByCourt

  | InvestigationComplete

  | HearingsHeld

  | SettlementEndeavored
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch21CivilRights.Recert.Procedure
