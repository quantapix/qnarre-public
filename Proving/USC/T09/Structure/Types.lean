

























import Proving.USC.Common.Types

namespace Proving.USC.T09.Structure

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
  source     : String
  target     : String
  kind       : EdgeKind
  crossTitle : Bool := false
deriving Repr

end Proving.USC.T09.Structure
