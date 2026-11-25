


















import Proving.USC.Common.Types

namespace Proving.USC.T42.CRIPA.Procedure

open Proving.USC.Common



opaque Institution : Type




opaque Action : Type



opaque Subpoena : Type




inductive State

  | ReasonableCause

  | Noticed

  | Certified

  | Filed

  | Intervened

  | Exhausted

  | Dismissed
  deriving DecidableEq, Repr

end Proving.USC.T42.CRIPA.Procedure
