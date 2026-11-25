







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Structure

open Proving.USC.Common
















inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr




inductive RefScope

  | Internal

  | InTitle

  | CrossTitle


  | ExternalAct



  | Open
  deriving DecidableEq, Repr







structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  scope  : RefScope
  signal : String
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch1Ch47.Recert.Structure
