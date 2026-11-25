import Proving.USC.Common.Types









namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure



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

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure
