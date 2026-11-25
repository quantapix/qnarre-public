
















import Proving.USC.T18.Ch1.Part2.Deontic.Predicates

namespace Proving.USC.T18.Ch1.Part2.Deontic

open Proving.USC.Common





structure Permission17 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass17 p c
  condition : ConditionMet17 p c


def PermissionAvailable17 (p : Person) (c : ComplaintText) : Prop :=
  Permission17 p c





structure Prohibition25 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass25 p c
  condition : ConditionMet25 p c



def ProhibitionViolated25 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition25 p c ∧ RegulatedActOccurred25 p c





structure Permission28b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass28b p c
  condition : ConditionMet28b p c


def PermissionAvailable28b (p : Person) (c : ComplaintText) : Prop :=
  Permission28b p c





structure Obligation28c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass28c p c
  condition : ConditionMet28c p c



def ObligationBreached28c (p : Person) (c : ComplaintText) : Prop :=
  Obligation28c p c ∧ ¬ RegulatedActOccurred28c p c





structure Prohibition28d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass28d p c
  condition : ConditionMet28d p c



def ProhibitionViolated28d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition28d p c ∧ RegulatedActOccurred28d p c





structure Prohibition28e (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass28e p c
  condition : ConditionMet28e p c



def ProhibitionViolated28e (p : Person) (c : ComplaintText) : Prop :=
  Prohibition28e p c ∧ RegulatedActOccurred28e p c






inductive Chapter1DeonticBreach (p : Person) (c : ComplaintText) : Prop where
  | useOfMinor25    : ProhibitionViolated25 p c  → Chapter1DeonticBreach p c
  | sealDuty28c     : ObligationBreached28c p c  → Chapter1DeonticBreach p c
  | mitigationBar28d : ProhibitionViolated28d p c → Chapter1DeonticBreach p c
  | disqualBar28e   : ProhibitionViolated28e p c  → Chapter1DeonticBreach p c

end Proving.USC.T18.Ch1.Part2.Deontic
