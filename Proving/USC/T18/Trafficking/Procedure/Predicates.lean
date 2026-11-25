














import Proving.USC.T18.Trafficking.Procedure.Types

namespace Proving.USC.T18.Trafficking.Procedure
open Proving.USC.Common






axiom OffenseAccrued (p : Person) (c : ComplaintText) : Prop





axiom ProsecutionCommenced (p : Person) (c : ComplaintText) : Prop







axiom ChargingDatesPleaded (d : ChargingDates) (c : ComplaintText) : Prop






axiom ObstructedEnforcement (p : Person) (c : ComplaintText) : Prop







axiom ReasonableOpportunityToObserve (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Trafficking.Procedure
