














import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113.Reslice.Procedure












inductive State
  | Accrued
  | Filed
  | Pending
  | Adjudicated
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch113.Reslice.Procedure
