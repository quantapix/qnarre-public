import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.Deontic.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch96.Deontic

open Proving.USC.Common








axiom AddresseeInClass (n : NormId) (p : Person) (c : ComplaintText) : Prop








axiom RegulatedActOccurred (n : NormId) (p : Person) (c : ComplaintText) : Prop









axiom ConditionMet (n : NormId) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.Deontic
