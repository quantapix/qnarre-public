










import Proving.USC.T18.Ch75.Deontic.Predicates

namespace Proving.USC.T18.Ch75.Deontic

open Proving.USC.Common





structure Prohibition1542 (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1542 p c
  condition : ConditionMet1542 p c


def Prohibition1542Violated (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop :=
  Prohibition1542 p d c ∧ RegulatedActOccurred1542 p d c




structure Prohibition1543 (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1543 p c
  condition : ConditionMet1543 p c


def Prohibition1543Violated (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop :=
  Prohibition1543 p d c ∧ RegulatedActOccurred1543 p d c




structure Prohibition1544 (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1544 p c
  condition : ConditionMet1544 p c


def Prohibition1544Violated (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop :=
  Prohibition1544 p d c ∧ RegulatedActOccurred1544 p d c




structure Prohibition1546 (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1546 p c
  condition : ConditionMet1546 p c



def Prohibition1546Violated (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop :=
  Prohibition1546 p d c ∧ RegulatedActOccurred1546 p d c ∧ ¬ LawEnforcementException1546c p c





inductive Ch75DocumentFraudViolated (p : Person) (d : TravelDocument) (c : ComplaintText) : Prop
  | falseStatement1542 : Prohibition1542Violated p d c → Ch75DocumentFraudViolated p d c
  | forgery1543        : Prohibition1543Violated p d c → Ch75DocumentFraudViolated p d c
  | misuse1544         : Prohibition1544Violated p d c → Ch75DocumentFraudViolated p d c
  | visaFraud1546      : Prohibition1546Violated p d c → Ch75DocumentFraudViolated p d c

end Proving.USC.T18.Ch75.Deontic
