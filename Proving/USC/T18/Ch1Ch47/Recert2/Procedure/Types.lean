import Proving.USC.Common.Types

set_option autoImplicit false


















namespace Proving.USC.T18.Ch1Ch47.Recert2.Procedure

open Proving.USC.Common



opaque Offense : Type


opaque OffenseLocus : Type



opaque Property : Type


opaque OfficialRepresentation : Type



opaque Court : Type



opaque Entity : Type



opaque AccessDevice : Type


opaque Agency : Type


opaque InteragencyAgreement : Type











inductive ProceedingStage where

  | conductOccurred


  | jurisdictionEstablished

  | charged


  | elementEstablished

  | convicted

  | dispositionOrdered

  | exempted
  deriving DecidableEq, Repr



structure GuardedTransition where
  source : ProceedingStage
  target : ProceedingStage
  guard  : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Procedure
