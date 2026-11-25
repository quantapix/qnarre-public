















import Proving.USC.Common.Types

namespace Proving.USC.T42.GoldenAdjacent.Deontic

open Proving.USC.Common




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
deriving DecidableEq, Repr




opaque Court : Type

end Proving.USC.T42.GoldenAdjacent.Deontic
