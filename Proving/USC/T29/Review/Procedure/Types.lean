















import Proving.USC.Common.Types

namespace Proving.USC.T29.Review.Procedure

open Proving.USC.Common



opaque UlpProceeding : Type



opaque BoardOrder : Type





inductive State

  | Charged

  | Complaint

  | Heard

  | FinalOrder

  | BoardEnforcementPetition

  | AggrievedReviewPetition
  deriving DecidableEq, Repr

end Proving.USC.T29.Review.Procedure
