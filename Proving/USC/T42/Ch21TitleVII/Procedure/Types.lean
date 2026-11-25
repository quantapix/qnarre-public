import Proving.USC.Common.Types










set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Procedure

open Proving.USC.Common








abbrev Day := Nat


opaque Charge : Type




opaque Respondent : Type



opaque StateProceeding : Type


opaque CivilAction : Type


opaque JudicialDistrict : Type



opaque AgencyComplaint : Type



opaque GeraComplaint : Type



opaque Judgment : Type


opaque AffirmativeActionPlan : Type



opaque GovernmentContract : Type


inductive Stage where

  | practiceOccurred

  | stateProceedingCommenced

  | chargeFiled

  | chargeServed

  | investigated

  | reasonableCauseFound

  | conciliationFailed

  | chargeDismissed

  | rightToSueIssued

  | civilActionFiled

  | adjudicated

  | timeBarred
  deriving DecidableEq


inductive Track where

  | privateSector

  | federalSector

  | governmentEmployee

  | patternOrPractice
  deriving DecidableEq


inductive Enforcer where

  | commission

  | attorneyGeneral

  | aggrievedPerson
  deriving DecidableEq



structure Transition where
  source : Stage
  target : Stage
  guard : Prop

end Proving.USC.T42.Ch21TitleVII.Procedure
