











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Procedure

open Proving.USC.Common





opaque Prosecution : Type











inductive Stage where

  | charged

  | proofCarried

  | convicted

  | sentenced
deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Part5.Procedure
