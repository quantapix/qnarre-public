














import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Procedure

open Proving.USC.Common


opaque Prosecution : Type


opaque Certification : Type



opaque Offense : Type


opaque Sentencing : Type


opaque CivilAction : Type



opaque CriminalJudgment : Type




opaque Designation : Type



opaque AssistanceRequest : Type



opaque Regulation : Type



opaque ForeignState : Type



opaque Asset : Type









inductive State where
  | ConductAlleged
  | UnderInvestigation
  | Certified
  | ProsecutionCommenced
  | Convicted
  | Sentenced
  | InjuryAccrued
  | CivilActionFiled
  | CivilJudgmentEntered
  | BlockedAssetsAttached
  deriving DecidableEq, Repr




structure Transition where
  source : State
  target : State
  guard  : Prop

end Proving.USC.T18.Ch113B.Procedure
