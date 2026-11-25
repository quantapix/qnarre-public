import Proving.USC.T18.Ch77.Part5.Scienter.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Part5.Scienter

open Proving.USC.Common







axiom MentalStateProvenAsTo
    (d : Person) (el : ScienterElement1591) (rung : MentalState) (c : ComplaintText) : Prop








axiom actIsAdvertising (d : Person) (c : ComplaintText) : Bool






axiom chargedUnderParagraph1 (d : Person) (c : ComplaintText) : Bool





axiom hadReasonableOpportunityToObserve (d v : Person) (c : ComplaintText) : Bool








axiom UnspecifiedScienterSatisfied
    (d : Person) (el : ScienterElement1591) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part5.Scienter
