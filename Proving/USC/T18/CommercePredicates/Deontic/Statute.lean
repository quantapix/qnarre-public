











import Proving.USC.T18.CommercePredicates.Deontic.Predicates

namespace Proving.USC.T18.CommercePredicates.Deontic

open Proving.USC.Common






structure Prohibition1958 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1958 p c
  condition : ConditionMet1958 p c



def Prohibition1958Violated (p : Person) (f : CommerceFacility) (c : ComplaintText) : Prop :=
  Prohibition1958 p c ∧ RegulatedActOccurred1958 p f c







structure Prohibition1960 (p : Person) (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1960 p b c
  condition : ConditionMet1960 b c



def Prohibition1960Violated (p : Person) (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop :=
  Prohibition1960 p b c ∧ RegulatedActOccurred1960 p b c

end Proving.USC.T18.CommercePredicates.Deontic
