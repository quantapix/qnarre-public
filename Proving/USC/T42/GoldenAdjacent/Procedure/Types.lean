
















import Proving.USC.Common.Types

namespace Proving.USC.T42.GoldenAdjacent.Procedure

open Proving.USC.Common




opaque Proceeding : Type


opaque FeeRequest : Type





inductive State
  | JurisdictionExercised
  | Adjudicated
  | PartyPrevailed
  | FeeAwarded
  deriving DecidableEq, Repr

end Proving.USC.T42.GoldenAdjacent.Procedure
