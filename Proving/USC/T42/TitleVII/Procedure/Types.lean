import Proving.USC.Common.Types












namespace Proving.USC.T42.TitleVII.Procedure

open Proving.USC.Common



inductive PrivateState
  | Accrued
  | StateProceeding
  | ChargeFiled
  | RightToSueIssued
  | SuitFiled
  | TimeBarred
  deriving DecidableEq, Repr


inductive FederalState
  | Accrued
  | AdminFinalAction
  | SuitFiled
  | TimeBarred
  deriving DecidableEq, Repr


opaque AggrievedParty : Type


opaque Charge : Type


opaque RightToSueNotice : Type

end Proving.USC.T42.TitleVII.Procedure
