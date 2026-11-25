













import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Structure

open Proving.USC.Common













inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr






structure Ref where
  source : String
  target : String
  kind   : EdgeKind

end Proving.USC.T18.Ch11.Reslice.Structure
