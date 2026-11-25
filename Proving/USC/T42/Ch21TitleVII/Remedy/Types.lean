import Proving.USC.Common.Types












set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Remedy

open Proving.USC.Common











inductive Enforcer
  | privateRight
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr








inductive Relief
  | injunction
  | temporaryOrPreliminaryRelief
  | declaratory
  | affirmativeAction
  | reinstatement
  | hiring
  | backPay
  | otherEquitableRelief
  | compensatoryDamages
  | punitiveDamages
  | delayInterest
  | attorneysFees
  | expertFees
  | costs
  | civilPenalty
  | criminalFine
  | imprisonment
  | complianceOrder
  deriving DecidableEq, Repr




abbrev Remedy := Relief


inductive Forum
  | stateOrLocalAgency
  | commissionAdministrative
  | federalDistrictCourt
  | threeJudgeDistrictCourt
  | courtOfAppeals
  | supremeCourt
  deriving DecidableEq, Repr






inductive RespondentClass
  | privateRespondent
  | governmentRespondent
  | federalEntity
  deriving DecidableEq, Repr




opaque Charge : Type



opaque ConsentJudgment : Type



opaque GovernmentContract : Type

end Proving.USC.T42.Ch21TitleVII.Remedy
