
















import Proving.USC.Common.Types
import Proving.USC.T18.Trafficking.Deontic.Types
import Proving.USC.T18.Trafficking.Deontic.Predicates

namespace Proving.USC.T18.Trafficking.Deontic

open Proving.USC.Common





structure Prohibition1581 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1581 p c



def ProhibitionViolated1581 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1581 p c ∧ RegulatedActOccurred1581 p c



def ProhibitionViolated1581b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1581 p c ∧ ObstructedEnforcement1581 p c





structure Prohibition1589 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1589 p c
  condition : ConditionMet1589 p c



def ProhibitionViolated1589 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1589 p c ∧ RegulatedActOccurred1589 p c



def ProhibitionViolated1589b (p : Person) (v : Entity) (c : ComplaintText) : Prop :=
  AddresseeInClass1589 p c ∧ BenefitedFromVenture1589 p v c





structure Prohibition1590 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1590 p c
  condition : ConditionMet1590 p c



def ProhibitionViolated1590 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1590 p c ∧ RegulatedActOccurred1590 p c


def ProhibitionViolated1590b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1590 p c ∧ ObstructedEnforcement1590 p c





structure Prohibition1591 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1591 p c
  condition : ConditionMet1591 p c



def ProhibitionViolated1591 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591 p c ∧ RegulatedActOccurred1591 p c


def ProhibitionViolated1591d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591 p c ∧ ObstructedEnforcement1591 p c







inductive Chapter77ProhibitionViolated (p : Person) (c : ComplaintText) : Prop
  | peonage          (h : ProhibitionViolated1581 p c)
  | forcedLabor      (h : ProhibitionViolated1589 p c)
  | trafficking      (h : ProhibitionViolated1590 p c)
  | sexTrafficking   (h : ProhibitionViolated1591 p c)

end Proving.USC.T18.Trafficking.Deontic
