















import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Procedure

open Proving.USC.Common




opaque DamagesAction : Type





inductive State
  | Accrued
  | Exhausted
  | Filed
  | TimeBarred
  deriving Repr, DecidableEq

end Proving.USC.T42.EqualRights.Procedure
