
















import Proving.USC.T18.Ch77.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Procedure
open Proving.USC.Common








axiom OffenseConductOccurred (p : Person) (c : ComplaintText) : Prop





axiom ProsecutionCommenced (p : Person) (c : ComplaintText) : Prop







axiom ConvictionEntered (p : Person) (c : ComplaintText) : Prop








axiom AggravatingCircumstanceEstablished (p : Person) (c : ComplaintText) : Prop






axiom EnforcementObstructed (p : Person) (c : ComplaintText) : Prop






axiom VictimConductIncidentToTrafficking (p : Person) (c : ComplaintText) : Prop







axiom ReasonableOpportunityToObserveAge (p : Person) (c : ComplaintText) : Prop







axiom OffenseCommittedOnDay (c : ComplaintText) (d : Nat) : Prop







axiom ProsecutionCommencedOnDay (c : ComplaintText) (d : Nat) : Prop

end Proving.USC.T18.Ch77.Procedure
