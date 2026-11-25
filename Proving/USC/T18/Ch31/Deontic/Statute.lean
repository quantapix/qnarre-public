import Proving.USC.T18.Ch31.Deontic.Predicates

namespace Proving.USC.T18.Ch31.Deontic
open Proving.USC.Common








structure Prohibition659 (p : Person) (s : Shipment) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass659 p c
  condition : ConditionMet659 s c



def ProhibitionViolated659 (p : Person) (s : Shipment) (c : ComplaintText) : Prop :=
  Prohibition659 p s c ∧ RegulatedActOccurred659 p s c



structure Prohibition664 (p : Person) (b : BenefitPlan) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass664 p c
  condition : ConditionMet664 b c



def ProhibitionViolated664 (p : Person) (b : BenefitPlan) (c : ComplaintText) : Prop :=
  Prohibition664 p b c ∧ RegulatedActOccurred664 p b c

end Proving.USC.T18.Ch31.Deontic
