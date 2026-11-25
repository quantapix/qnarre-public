















import Proving.USC.T18.Sec1961BPredicates.Deontic.Predicates

namespace Proving.USC.T18.Sec1961BPredicates.Deontic

open Proving.USC.Common


structure Prohibition2314 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2314 p c
  scienter  : ActedKnowingly p c
  commerce  : AffectsInterstateCommerce c
  condition : ConditionMet2314 c



def ProhibitionViolated2314 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2314 p c ∧ RegulatedActOccurred2314 p c


structure Prohibition2315 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2315 p c
  scienter  : ActedKnowingly p c
  commerce  : AffectsInterstateCommerce c
  condition : ConditionMet2315 c

def ProhibitionViolated2315 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2315 p c ∧ RegulatedActOccurred2315 p c




structure Prohibition1028 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1028 p c
  scienter  : ActedKnowingly p c
  condition : ConditionMet1028 c

def ProhibitionViolated1028 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028 p c ∧ RegulatedActOccurred1028 p c


structure Prohibition1029 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1029 p c
  scienter  : ActedKnowingly p c
  condition : ConditionMet1029 c

def ProhibitionViolated1029 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029 p c ∧ RegulatedActOccurred1029 p c




structure Prohibition1955 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1955 p c
  condition : ConditionMet1955 c

def ProhibitionViolated1955 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1955 p c ∧ RegulatedActOccurred1955 p c


structure Prohibition1084a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1084a p c
  scienter  : ActedKnowingly p c
  commerce  : AffectsInterstateCommerce c
  condition : ConditionMet1084a c

def ProhibitionViolated1084a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1084a p c ∧ RegulatedActOccurred1084a p c


structure Obligation1084d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1084d p c
  condition : ConditionMet1084d c



def ObligationBreached1084d (p : Person) (c : ComplaintText) : Prop :=
  Obligation1084d p c ∧ ¬ RequiredActPerformed1084d p c



def ObligationDischarged1084d (p : Person) (c : ComplaintText) : Prop :=
  Obligation1084d p c ∧ RequiredActPerformed1084d p c


structure Permission1028e (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1028e p c
  condition : ConditionMet1028e c




def PermissionExercised1028e (p : Person) (c : ComplaintText) : Prop :=
  Permission1028e p c ∧ RegulatedActOccurred1028e p c

end Proving.USC.T18.Sec1961BPredicates.Deontic
