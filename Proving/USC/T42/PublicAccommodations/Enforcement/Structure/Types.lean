import Proving.USC.Common.Types










namespace Proving.USC.T42.PublicAccommodations.Enforcement.Structure

open Proving.USC.Common (ComplaintText)


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

end Proving.USC.T42.PublicAccommodations.Enforcement.Structure
