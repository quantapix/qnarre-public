








import Proving.USC.T18.Ch113.Procedure.Types

namespace Proving.USC.T18.Ch113.Procedure
open Proving.USC.Common







axiom PropertyStolen (p : Person) (c : ComplaintText) : Prop





axiom TransportedInInterstateCommerce (p : Person) (c : ComplaintText) : Prop





axiom PossessoryActOccurred (p : Person) (c : ComplaintText) : Prop










axiom theftDay : ComplaintText → Nat





axiom boundaryCrossingDay : ComplaintText → Nat






def CrossedBoundaryAfterTheft (c : ComplaintText) : Prop :=
  theftDay c ≤ boundaryCrossingDay c

end Proving.USC.T18.Ch113.Procedure
