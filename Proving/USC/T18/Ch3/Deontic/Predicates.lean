import Proving.USC.Common.Types
import Proving.USC.T18.Ch3.Deontic.Types















namespace Proving.USC.T18.Ch3.Deontic

open Proving.USC.Common







axiom IsAddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom IsImporterOrConsignee (p : Person) (c : ComplaintText) : Prop








axiom InterstateOrForeignCommerceNexus (c : ComplaintText) : Prop







axiom RegulatedActOccurred41 (p : Person) (c : ComplaintText) : Prop





axiom ConditionMet41 (c : ComplaintText) : Prop






axiom RegulatedActOccurred42Import (p : Person) (c : ComplaintText) : Prop





axiom ConditionMet42Import (c : ComplaintText) : Prop







axiom RegulatedActOccurred42Export (p : Person) (c : ComplaintText) : Prop




axiom ConditionMet42Export (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActOccurred42Transport (p : Person) (c : ComplaintText) : Prop





axiom ConditionMet42Transport (c : ComplaintText) : Prop








axiom RegulatedActOccurred43 (p : Person) (e : AnimalEnterprise) (c : ComplaintText) : Prop




axiom ConditionMet43 (p : Person) (e : AnimalEnterprise) (c : ComplaintText) : Prop






axiom RegulatedActOccurred47a (p : Person) (c : ComplaintText) : Prop




axiom ConditionMet47a (c : ComplaintText) : Prop






axiom RegulatedActOccurred47b (p : Person) (c : ComplaintText) : Prop




axiom ConditionMet47b (c : ComplaintText) : Prop






axiom RegulatedActOccurred48Crush (p : Person) (c : ComplaintText) : Prop







axiom RegulatedActOccurred48Video (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActOccurred48Distribute (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActOccurred49 (p : Person) (c : ComplaintText) : Prop




axiom ConditionMet49 (c : ComplaintText) : Prop

end Proving.USC.T18.Ch3.Deontic
