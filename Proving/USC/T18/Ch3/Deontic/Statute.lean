import Proving.USC.Common.Types
import Proving.USC.T18.Ch3.Deontic.Types
import Proving.USC.T18.Ch3.Deontic.Predicates










namespace Proving.USC.T18.Ch3.Deontic

open Proving.USC.Common



structure Prohibition41 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet41 c



def ProhibitionViolated41 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition41 p c ∧ RegulatedActOccurred41 p c



structure Prohibition42Import (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet42Import c

def ProhibitionViolated42Import (p : Person) (c : ComplaintText) : Prop :=
  Prohibition42Import p c ∧ RegulatedActOccurred42Import p c



structure Obligation42Export (p : Person) (c : ComplaintText) : Prop where
  addressee : IsImporterOrConsignee p c
  condition : ConditionMet42Export p c



def Obligation42ExportBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation42Export p c ∧ ¬ RegulatedActOccurred42Export p c



structure Prohibition42Transport (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet42Transport c

def ProhibitionViolated42Transport (p : Person) (c : ComplaintText) : Prop :=
  Prohibition42Transport p c ∧ RegulatedActOccurred42Transport p c



structure Prohibition43 (p : Person) (e : AnimalEnterprise) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  commerce  : InterstateOrForeignCommerceNexus c
  condition : ConditionMet43 p e c

def ProhibitionViolated43 (p : Person) (e : AnimalEnterprise) (c : ComplaintText) : Prop :=
  Prohibition43 p e c ∧ RegulatedActOccurred43 p e c



structure Prohibition47a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet47a c

def ProhibitionViolated47a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition47a p c ∧ RegulatedActOccurred47a p c



structure Prohibition47b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet47b c

def ProhibitionViolated47b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition47b p c ∧ RegulatedActOccurred47b p c



structure Prohibition48Crush (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  commerce  : InterstateOrForeignCommerceNexus c

def ProhibitionViolated48Crush (p : Person) (c : ComplaintText) : Prop :=
  Prohibition48Crush p c ∧ RegulatedActOccurred48Crush p c



structure Prohibition48Video (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  commerce  : InterstateOrForeignCommerceNexus c

def ProhibitionViolated48Video (p : Person) (c : ComplaintText) : Prop :=
  Prohibition48Video p c ∧ RegulatedActOccurred48Video p c



structure Prohibition48Distribute (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  commerce  : InterstateOrForeignCommerceNexus c

def ProhibitionViolated48Distribute (p : Person) (c : ComplaintText) : Prop :=
  Prohibition48Distribute p c ∧ RegulatedActOccurred48Distribute p c



structure Prohibition49 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAddresseeAnyPerson p c
  condition : ConditionMet49 c

def ProhibitionViolated49 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition49 p c ∧ RegulatedActOccurred49 p c

end Proving.USC.T18.Ch3.Deontic
