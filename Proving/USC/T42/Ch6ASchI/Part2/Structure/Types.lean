import Proving.USC.Common.Types






namespace Proving.USC.T42.Ch6ASchI.Part2.Structure


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

end Proving.USC.T42.Ch6ASchI.Part2.Structure
