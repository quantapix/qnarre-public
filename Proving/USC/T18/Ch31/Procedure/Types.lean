















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch31.Procedure

open Proving.USC.Common




opaque District : Type





inductive State
  | OffenseCommitted
  | Prosecutable
  | Barred
  | PenaltyEligible
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch31.Procedure
