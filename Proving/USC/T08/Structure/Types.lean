










import Proving.USC.Common.Types

namespace Proving.USC.T08.Structure



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

end Proving.USC.T08.Structure
