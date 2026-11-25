











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Procedure

open Proving.USC.Common




opaque Proceeding : Type



opaque Court : Type




opaque PublicAccessOrder : Type












inductive AccessState where
  | instituted
  | rightsConsidered
  | openToPublic
  | closedToPublic
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch96.EchoReslice.Procedure
