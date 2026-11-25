import Proving.USC.Common.Types
set_option autoImplicit false
open Proving.USC.Common

namespace Proving.USC.T18.Ch2Ch3.Structure




inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis




structure Ref where
  source : String
  target : String
  kind   : EdgeKind

end Proving.USC.T18.Ch2Ch3.Structure
