
















import Proving.USC.Common.Types
import Proving.USC.T05.Deontic.Types
import Proving.USC.T05.Deontic.Predicates

namespace Proving.USC.T05.Deontic

open Proving.USC.Common






structure Obligation554b (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass554b p c
  condition : ConditionMet554 c



def Obligation554bBreached (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Obligation554b p a c ∧ ¬ RegulatedActOccurred554b p a c






structure Prohibition554d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass554d p c
  condition : ConditionMet554 c



def Prohibition554dViolated (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Prohibition554d p c ∧ RegulatedActOccurred554d p a c






structure Obligation556d (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass556d p c
  condition : ConditionMet556 c



def Obligation556dBreached (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Obligation556d p a c ∧ ¬ RegulatedActOccurred556d p a c






structure Prohibition557d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass557d p c
  condition : ConditionMet557d c


def Prohibition557dViolated (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Prohibition557d p c ∧ RegulatedActOccurred557d p a c







structure Obligation557dC (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass557d p c
  condition : ConditionMet557d c



def Obligation557dCBreached (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Obligation557dC p a c ∧ ¬ RegulatedActOccurred557dC p a c





structure Permission702 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass702 p c



def Permission702Available (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Permission702 p c ∧ PermittedActAvailable702 p a c ∧ ConditionMet704 a c






structure Power706 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass706 p c



def Power706Exercisable (p : Person) (a : AgencyAct) (c : ComplaintText) : Prop :=
  Power706 p c ∧ RegulatedActOccurred706 p a c

end Proving.USC.T05.Deontic
