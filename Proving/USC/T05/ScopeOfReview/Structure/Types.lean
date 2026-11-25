












import Proving.USC.Common.Types

namespace Proving.USC.T05.ScopeOfReview.Structure

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
  deriving Repr

end Proving.USC.T05.ScopeOfReview.Structure
