



















import Proving.USC.Common.Types

namespace Proving.USC.T29.Procedure

open Proving.USC.Common



inductive State

  | Charged


  | ComplaintIssued


  | HeardAndAdjudicated


  | OrderIssued


  | InCourtReview

  | TimeBarred
  deriving DecidableEq, Repr



opaque Charge : Type



opaque BoardOrder : Type



opaque Subpena : Type

end Proving.USC.T29.Procedure
