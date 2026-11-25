



















import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter

open Proving.USC.Common








axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop








axiom SpecificPurposeProven (p : Person) (purpose : StatutoryPurpose)
    (c : ComplaintText) : Prop








axiom FraudulentIntentProven (p : Person) (c : ComplaintText) : Prop







axiom WillfulnessProven (p : Person) (c : ComplaintText) : Prop








axiom ReasonableCauseToBelieveProven (p : Person) (c : ComplaintText) : Prop









axiom KnowsOwnRestrictedPersonStatus (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter
