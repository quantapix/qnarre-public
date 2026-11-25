import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T42.Ch21Tail.Structure

open Proving.USC.Common










inductive EdgeKind where
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
  clause : String
  deriving DecidableEq, Repr




inductive TargetScope where
  | SameSubchapter
  | SameTitle
  | CrossTitle
  | ExternalLaw
  deriving DecidableEq, Repr


structure ScopedRef where
  ref   : Ref
  scope : TargetScope
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch21Tail.Structure
