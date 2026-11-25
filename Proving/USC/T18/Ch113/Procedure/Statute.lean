






import Proving.USC.T18.Ch113.Procedure.Predicates

namespace Proving.USC.T18.Ch113.Procedure
open Proving.USC.Common



structure Transition where
  fromState : State
  toState   : State
  guard     : Prop




structure TransportationPenaltyReached (p : Person) (c : ComplaintText) : Prop where
  stolen      : PropertyStolen p c
  transported : TransportedInInterstateCommerce p c




structure ReceiptPenaltyReached (p : Person) (c : ComplaintText) : Prop where
  stolen         : PropertyStolen p c
  crossedInOrder : CrossedBoundaryAfterTheft c
  possessed      : PossessoryActOccurred p c

end Proving.USC.T18.Ch113.Procedure
