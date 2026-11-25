










import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Procedure

open Proving.USC.Common



opaque Prosecution : Type





opaque ChargedAct : Type




inductive Stage

  | conductAlleged

  | charged


  | proofsDischarged

  | convicted

  | sentenced
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Part4.Procedure
