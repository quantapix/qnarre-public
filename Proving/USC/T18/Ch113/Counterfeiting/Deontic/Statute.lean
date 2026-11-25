













import Proving.USC.T18.Ch113.Counterfeiting.Deontic.Predicates

namespace Proving.USC.T18.Ch113.Counterfeiting.Deontic

open Proving.USC.Common





structure Prohibition2318 (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2318 p c
  condition : ConditionMet2318 a c



def Prohibition2318Violated (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop :=
  Prohibition2318 p a c ∧ RegulatedActOccurred2318 p a c



structure Prohibition2319 (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2319 p c
  condition : ConditionMet2319 a c



def Prohibition2319Violated (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop :=
  Prohibition2319 p a c ∧ RegulatedActOccurred2319 p a c



structure Prohibition2320 (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2320 p c
  condition : ConditionMet2320 a c



def Prohibition2320Violated (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop :=
  Prohibition2320 p a c ∧ RegulatedActOccurred2320 p a c



structure Prohibition2320i (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2320i p c
  condition : ConditionMet2320i a c



def Prohibition2320iViolated (p : Person) (a : CounterfeitArticle) (c : ComplaintText) : Prop :=
  Prohibition2320i p a c ∧ RegulatedActOccurred2320i p a c



structure Obligation2320h (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2320h p c
  condition : ConditionMet2320h c



def Obligation2320hBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation2320h p c ∧ ¬ RegulatedActOccurred2320h p c



structure Permission2318e (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2318e p c
  condition : ConditionMet2318e c



def Permission2318eGranted (p : Person) (c : ComplaintText) : Prop :=
  Permission2318e p c

end Proving.USC.T18.Ch113.Counterfeiting.Deontic
