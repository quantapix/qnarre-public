














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Procedure

open Proving.USC.Common







inductive State
  | Committed
  | Prosecuted
  | Adjudicated
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch25.Procedure
