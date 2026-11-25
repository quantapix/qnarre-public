import Proving.USC.T18.Ch3.Procedure.Types
import Proving.USC.Common.Types













namespace Proving.USC.T18.Ch3.Procedure

open Proving.USC.Common








axiom ViolationOccurred (p : Person) (c : ComplaintText) : Prop





axiom ProsecutionCommenced (p : Person) (c : ComplaintText) : Prop





axiom ConvictionEntered (p : Person) (c : ComplaintText) : Prop





axiom RestitutionOrderEntered (p : Person) (c : ComplaintText) : Prop









axiom PromulgationIssued (c : ComplaintText) : Prop





axiom PromulgationTriggerDay (c : ComplaintText) : Nat





axiom PromulgationActionDay (c : ComplaintText) : Nat

end Proving.USC.T18.Ch3.Procedure
