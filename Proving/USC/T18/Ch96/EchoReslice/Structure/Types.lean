import Proving.USC.Common.Types

set_option autoImplicit false





















namespace Proving.USC.T18.Ch96.EchoReslice.Structure

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
  deriving DecidableEq, Repr





opaque Proceeding : Type

end Proving.USC.T18.Ch96.EchoReslice.Structure
