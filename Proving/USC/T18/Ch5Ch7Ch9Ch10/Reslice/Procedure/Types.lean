








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure

open Proving.USC.Common



opaque Proceeding : Type



opaque Seizure : Type




inductive CaseState
  | NotFiled
  | Contemplated
  | Filed
  | Pending
  | Dismissed
  | Closed
  deriving DecidableEq, Repr


inductive SeizureState
  | Subject
  | Seized
  | NoticeGiven
  | HearingHeld
  | Forfeited
  | Destroyed
  deriving DecidableEq, Repr




inductive OfficeState
  | Held
  | Forfeited
  | Vacant
  deriving DecidableEq, Repr



inductive JurisdictionalReach
  | Territorial
  | SpecialMaritimeAndTerritorial
  | IndianCountry
  | Extraterritorial
  deriving DecidableEq, Repr



structure GuardedTransition (α : Type) where
  source : α
  target : α
  guard : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure
