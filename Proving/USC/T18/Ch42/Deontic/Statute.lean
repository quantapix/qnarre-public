







import Proving.USC.T18.Ch42.Deontic.Predicates

namespace Proving.USC.T18.Ch42.Deontic
open Proving.USC.Common





structure Prohibition892 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass892 p c
  condition : ConditionMet892 c



def ProhibitionViolated892 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition892 p c ∧ RegulatedActOccurred892 p c






structure Prohibition893 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass893 p c
  condition : ConditionMet893 p c



def ProhibitionViolated893 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition893 p c ∧ RegulatedActOccurred893 p c





structure Prohibition894 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass894 p c
  condition : ConditionMet894 c



def ProhibitionViolated894 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition894 p c ∧ RegulatedActOccurred894 p c

end Proving.USC.T18.Ch42.Deontic
