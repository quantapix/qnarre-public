




















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Procedure

open Proving.USC.Common



inductive PenaltyStage
  | ConductCommitted
  | ViolationEstablished
  | PenaltyImposed
  | NotApplicable
  deriving DecidableEq, Repr



abbrev Years := Nat

end Proving.USC.T18.Ch77Tail.Procedure
