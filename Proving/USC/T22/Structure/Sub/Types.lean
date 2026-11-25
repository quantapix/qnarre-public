









import Proving.USC.Common.Types

namespace Proving.USC.T22.Structure.Sub




inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving Repr, DecidableEq




structure Ref where
  source : String
  target : String
  kind   : EdgeKind

end Proving.USC.T22.Structure.Sub
