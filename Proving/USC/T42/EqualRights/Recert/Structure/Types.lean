













import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Recert.Structure

open Proving.USC.Common


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
  deriving Repr, DecidableEq




inductive TargetClass

  | InSliceSection

  | Internal

  | CrossTitle

  | SameTitleOutsideSlice

  | Uncodified

  | OpenEnded
  deriving Repr, DecidableEq




structure ScopedRef where
  ref     : Ref
  cls     : TargetClass
  context : ComplaintText

end Proving.USC.T42.EqualRights.Recert.Structure
