















import Proving.USC.Common.Types

namespace Proving.USC.T09.Procedure

open Proving.USC.Common



opaque Agreement : Type



opaque Application : Type



opaque Award : Type














inductive State
  | Disputed
  | Compelled
  | Stayed
  | Constituted
  | Awarded
  | Confirmed
  | Vacated
  | Modified
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T09.Procedure
