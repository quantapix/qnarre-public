




















import Proving.USC.Common.Types

namespace Proving.USC.T42.Procedure

open Proving.USC.Common



opaque Program : Type



opaque Agency : Type













inductive State
  | Accrued
  | Filed
  | TimeBarred
  | Noticed
  | HearingHeld
  | Terminated
  | Reported
  | Effective
  | SuitMaintainable
  deriving DecidableEq, Repr

end Proving.USC.T42.Procedure
