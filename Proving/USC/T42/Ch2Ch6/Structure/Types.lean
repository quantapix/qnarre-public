











import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch2Ch6.Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis



structure Ref where
  source     : String
  target     : String
  kind       : EdgeKind
  crossTitle : Bool := false

end Proving.USC.T42.Ch2Ch6.Structure
