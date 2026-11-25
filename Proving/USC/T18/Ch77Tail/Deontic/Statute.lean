










import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Deontic.Types
import Proving.USC.T18.Ch77Tail.Deontic.Predicates

namespace Proving.USC.T18.Ch77Tail.Deontic

open Proving.USC.Common





structure Prohibition1582 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1582 p c
  condition : ConditionMet1582 p c


def ProhibitionViolated1582 (p : Person) (v : Vessel) (c : ComplaintText) : Prop :=
  Prohibition1582 p v c ∧ RegulatedActOccurred1582 p v c



structure Prohibition1585 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1585 p c
  condition : ConditionMet1585 p c


def ProhibitionViolated1585 (p : Person) (v : Vessel) (c : ComplaintText) : Prop :=
  Prohibition1585 p v c ∧ RegulatedActOccurred1585 p v c



structure Prohibition1586 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1586 p c
  condition : ConditionMet1586 p v c


def ProhibitionViolated1586 (p : Person) (v : Vessel) (c : ComplaintText) : Prop :=
  Prohibition1586 p v c ∧ RegulatedActOccurred1586 p v c



structure Prohibition1587 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1587 p v c
  condition : ConditionMet1587 p c


def ProhibitionViolated1587 (p : Person) (v : Vessel) (c : ComplaintText) : Prop :=
  Prohibition1587 p v c ∧ RegulatedActOccurred1587 p v c



structure Prohibition1588 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1588 p v c
  condition : ConditionMet1588 p c


def ProhibitionViolated1588 (p : Person) (v : Vessel) (c : ComplaintText) : Prop :=
  Prohibition1588 p v c ∧ RegulatedActOccurred1588 p v c





structure Prohibition1592 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1592 p c
  condition : ConditionMet1592 p c




def ProhibitionViolated1592 (p : Person) (d : Document) (c : ComplaintText) : Prop :=
  Prohibition1592 p d c ∧ RegulatedActOccurred1592 p d c ∧ ¬ VictimException1592 p c


structure Prohibition1592c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1592c p c


def ProhibitionViolated1592c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1592c p c ∧ RegulatedActOccurred1592c p c

end Proving.USC.T18.Ch77Tail.Deontic
