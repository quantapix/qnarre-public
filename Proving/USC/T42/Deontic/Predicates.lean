




















import Proving.USC.T42.Deontic.Types

namespace Proving.USC.T42.Deontic

open Proving.USC.Common






axiom AddresseeInClass1981 (p : Person) (k : Contract) (c : ComplaintText) : Prop



axiom RegulatedActOccurred1981 (p : Person) (k : Contract) (c : ComplaintText) : Prop



axiom ConditionMet1981 (p : Person) (k : Contract) (c : ComplaintText) : Prop





axiom AddresseeInClass1981a (p : Person) (c : ComplaintText) : Prop



axiom ConditionMet1981a (p : Person) (c : ComplaintText) : Prop






axiom AddresseeInClass1983 (p : Person) (c : ComplaintText) : Prop



axiom RegulatedActOccurred1983 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop


axiom ConditionMet1983 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop





axiom AddresseeInClass1985 (a : Agreement) (c : ComplaintText) : Prop



axiom RegulatedActOccurred1985 (a : Agreement) (p : Person) (c : ComplaintText) : Prop



axiom ConditionMet1985 (a : Agreement) (c : ComplaintText) : Prop






axiom AddresseeInClass1986 (p : Person) (a : Agreement) (c : ComplaintText) : Prop



axiom RegulatedActOccurred1986 (p : Person) (a : Agreement) (c : ComplaintText) : Prop



axiom ConditionMet1986 (p : Person) (a : Agreement) (c : ComplaintText) : Prop





axiom AddresseeInClass2000d (p : Person) (prog : Program) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2000d (p : Person) (prog : Program) (c : ComplaintText) : Prop


axiom ConditionMet2000d (prog : Program) (c : ComplaintText) : Prop





axiom AddresseeInClass2000d1 (e : Entity) (prog : Program) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2000d1 (e : Entity) (prog : Program) (c : ComplaintText) : Prop




axiom ConditionMet2000d1 (e : Entity) (prog : Program) (c : ComplaintText) : Prop






axiom AddresseeInClass2000d7 (e : Entity) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2000d7 (e : Entity) (c : ComplaintText) : Prop



axiom ConditionMet2000d7 (e : Entity) (t : Time) (c : ComplaintText) : Prop

end Proving.USC.T42.Deontic
