import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Procedure.Types









namespace Proving.USC.T18.Ch1.Procedure

open Proving.USC.Common







axiom HadKnowledgeOfFelony (p : Person) (c : ComplaintText) : Prop





axiom DisclosureMade (p : Person) (c : ComplaintText) : Prop






axiom DisclosureTimely (p : Person) (c : ComplaintText) : Prop





axiom ConcealedFelony (p : Person) (c : ComplaintText) : Prop








axiom WithinSMTJ (loc : Location) (c : ComplaintText) : Prop








axiom WithinSection7Place (loc : Location) (c : ComplaintText) : Prop





axiom NotPunishableByFederalEnactment (p : Person) (c : ComplaintText) : Prop





axiom PunishableUnderStateLaw (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Procedure
