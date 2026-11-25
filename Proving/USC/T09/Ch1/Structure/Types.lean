









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Structure

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

  kind : EdgeKind
  deriving DecidableEq, Repr




def Ref.leavesTitle9 (r : Ref) : Bool :=
  ! (r.target.startsWith "9 USC")

end Proving.USC.T09.Ch1.Structure
