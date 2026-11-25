import Proving.USC.Common.Types










namespace Proving.USC.T20.Structure


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

end Proving.USC.T20.Structure
