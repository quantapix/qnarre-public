import Proving.USC.T18.Ch73.Deontic.Types
import Proving.USC.T18.Ch73.Deontic.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false










namespace Proving.USC.T18.Ch73.Deontic

open Proving.USC.Common



structure Prohibition1503a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1503a p c



def ProhibitionViolated1503a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1503a p c ∧ RegulatedActOccurred1503a p c

def modality1503a : Modality := .prohibition



structure Prohibition1512a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512a1 p c

def ProhibitionViolated1512a1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512a1 p c ∧ RegulatedActOccurred1512a1 p c

def modality1512a1 : Modality := .prohibition



structure Prohibition1512a2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512a2 p c

def ProhibitionViolated1512a2 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512a2 p c ∧ RegulatedActOccurred1512a2 p c

def modality1512a2 : Modality := .prohibition



structure Prohibition1512b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512b p c

def ProhibitionViolated1512b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512b p c ∧ RegulatedActOccurred1512b p c

def modality1512b : Modality := .prohibition



structure Prohibition1512c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512c p c

def ProhibitionViolated1512c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512c p c ∧ RegulatedActOccurred1512c p c

def modality1512c : Modality := .prohibition



structure Prohibition1512d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512d p c

def ProhibitionViolated1512d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512d p c ∧ RegulatedActOccurred1512d p c

def modality1512d : Modality := .prohibition



structure Prohibition1512k (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1512k p c

def ProhibitionViolated1512k (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512k p c ∧ RegulatedActOccurred1512k p c

def modality1512k : Modality := .prohibition





def Permission1512e (p : Person) (c : ComplaintText) : Prop :=
  LawfulConductAffirmativeDefense1512e p c

def modality1512e : Modality := .permission




def ProhibitionViolated1512bAbsentDefense (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionViolated1512b p c ∧ ¬ Permission1512e p c



structure Prohibition1513a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1513a1 p c

def ProhibitionViolated1513a1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1513a1 p c ∧ RegulatedActOccurred1513a1 p c

def modality1513a1 : Modality := .prohibition



structure Prohibition1513b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1513b p c

def ProhibitionViolated1513b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1513b p c ∧ RegulatedActOccurred1513b p c

def modality1513b : Modality := .prohibition



structure Prohibition1513e (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1513e p c

def ProhibitionViolated1513e (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1513e p c ∧ RegulatedActOccurred1513e p c

def modality1513e : Modality := .prohibition



structure Prohibition1513f (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : ConditionMet1513f p c

def ProhibitionViolated1513f (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1513f p c ∧ RegulatedActOccurred1513f p c

def modality1513f : Modality := .prohibition

end Proving.USC.T18.Ch73.Deontic
