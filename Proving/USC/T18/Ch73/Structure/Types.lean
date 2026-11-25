import Proving.USC.Common.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch73.Structure

open Proving.USC.Common



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

end Proving.USC.T18.Ch73.Structure
