













import Proving.USC.T18.Ch77TailCompletion.Deontic.Types
import Proving.USC.T18.Ch77TailCompletion.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Deontic

open Proving.USC.Common



structure Prohibition1583 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1583 p c
  condition : ConditionMet1583 p c



def Prohibition1583Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1583 p c ∧ RegulatedActOccurred1583 p c

def modality1583 : Modality := .Prohibition



structure Prohibition1584 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1584 p c
  condition : ConditionMet1584 p c



def Prohibition1584Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1584 p c ∧ RegulatedActOccurred1584 p c

def modality1584 : Modality := .Prohibition



structure Obligation1593 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1593 p c
  condition : ConditionMet1593 p c



def Obligation1593Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation1593 p c ∧ ¬ RegulatedActOccurred1593 p c

def modality1593 : Modality := .Obligation



structure Prohibition1593A (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1593A p c
  condition : ConditionMet1593A p c



def Prohibition1593AViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1593A p c ∧ RegulatedActOccurred1593A p c

def modality1593A : Modality := .Prohibition



structure Prohibition1594 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1594 p c
  condition : ConditionMet1594 p c



def Prohibition1594Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1594 p c ∧ RegulatedActOccurred1594 p c

def modality1594 : Modality := .Prohibition



structure Permission1595 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1595 p c
  condition : ConditionMet1595 p c



def Permission1595Exercisable (p : Person) (c : ComplaintText) : Prop :=
  Permission1595 p c

def modality1595 : Modality := .Permission



structure Power1595A (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1595A p c
  condition : ConditionMet1595A p c



def Power1595AExercisable (p : Person) (c : ComplaintText) : Prop :=
  Power1595A p c

def modality1595A : Modality := .Power



structure Prohibition1596 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1596 p c
  condition : ConditionMet1596 p c




def Prohibition1596Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1596 p c ∧ RegulatedActOccurred1596 p c

def modality1596 : Modality := .Prohibition



structure Prohibition1597 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1597 p c
  condition : ConditionMet1597 p c



def Prohibition1597Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1597 p c ∧ RegulatedActOccurred1597 p c

def modality1597 : Modality := .Prohibition

end Proving.USC.T18.Ch77TailCompletion.Deontic
