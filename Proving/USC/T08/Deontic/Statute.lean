














import Proving.USC.T08.Deontic.Predicates

namespace Proving.USC.T08.Deontic

open Proving.USC.Common





structure Prohibition1324 (p : Person) (a : Alien) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1324 p c
  condition : ConditionMet1324 a c


def ProhibitionViolated1324 (p : Person) (a : Alien) (c : ComplaintText) : Prop :=
  Prohibition1324 p a c ∧ RegulatedActOccurred1324 p a c





structure Prohibition1327 (p : Person) (a : Alien) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1327 p c
  condition : ConditionMet1327 a c


def ProhibitionViolated1327 (p : Person) (a : Alien) (c : ComplaintText) : Prop :=
  Prohibition1327 p a c ∧ RegulatedActOccurred1327 p a c





structure Prohibition1328 (p : Person) (a : Alien) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1328 p c
  condition : ConditionMet1328 a c


def ProhibitionViolated1328 (p : Person) (a : Alien) (c : ComplaintText) : Prop :=
  Prohibition1328 p a c ∧ RegulatedActOccurred1328 p a c

end Proving.USC.T08.Deontic
