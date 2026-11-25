











import Proving.USC.T18.Ch11.Deontic.Predicates

namespace Proving.USC.T18.Ch11.Deontic

open Proving.USC.Common





structure Prohibition201 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass201 p c


def Prohibition201BriberyViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition201 p c ∧ RegulatedActOccurred201Bribery p c


def Prohibition201GratuityViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition201 p c ∧ RegulatedActOccurred201Gratuity p c



structure Prohibition203 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass203 p c

def Prohibition203Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition203 p c ∧ RegulatedActOccurred203 p c



def Prohibition204Violated (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurred204 p c



structure Prohibition205 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass205 p c

def Prohibition205Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition205 p c ∧ RegulatedActOccurred205 p c




def Permission206 (p : Person) (c : ComplaintText) : Prop :=
  ExemptionApplies206 p c





structure Prohibition207 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass207 p c
  condition : ConditionMet207 c


def Prohibition207Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition207 p c ∧ RegulatedActOccurred207 p c



def Prohibition207ForeignViolated (p : Person) (c : ComplaintText) : Prop :=
  AddresseeInClass207 p c ∧ RegulatedActOccurred207Foreign p c



structure Prohibition208 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass208 p c

def Prohibition208Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition208 p c ∧ RegulatedActOccurred208 p c



structure Prohibition209 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass209 p c

def Prohibition209Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition209 p c ∧ RegulatedActOccurred209 p c



def Prohibition210Violated (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurred210 p c

def Prohibition211Violated (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurred211 p c



structure Prohibition212 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass212 p c

def Prohibition212Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition212 p c ∧ RegulatedActOccurred212 p c

structure Prohibition213 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass213 p c

def Prohibition213Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition213 p c ∧ RegulatedActOccurred213 p c



def Prohibition214Violated (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurred214 p c



structure Prohibition215 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass215 p c

def Prohibition215Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition215 p c ∧ RegulatedActOccurred215 p c



def Obligation215Breached (c : ComplaintText) : Prop :=
  ¬ GuidelinesEstablished215 c



structure Prohibition217 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass217 p c

def Prohibition217Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition217 p c ∧ RegulatedActOccurred217 p c



structure Prohibition219 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass219 p c

def Prohibition219Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition219 p c ∧ RegulatedActOccurred219 p c



structure Prohibition220 (c : ComplaintText) : Prop where
  condition : ConditionMet220 c

def Prohibition220Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition220 c ∧ RegulatedActOccurred220 p c



def Prohibition224Violated (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurred224 p c



structure Prohibition225 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass225 p c
  condition : ConditionMet225 c

def Prohibition225Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition225 p c ∧ RegulatedActOccurred225 p c



structure Prohibition226 (c : ComplaintText) : Prop where
  condition : ConditionMet226 c

def Prohibition226Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition226 c ∧ RegulatedActOccurred226 p c



structure Prohibition227 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass227 p c

def Prohibition227Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition227 p c ∧ RegulatedActOccurred227 p c




def Power216 (p : Person) (c : ComplaintText) : Prop :=
  IsAuthorizedToEnforce216 p c


def Power218 (p : Person) (c : ComplaintText) : Prop :=
  IsAuthorizedToVoid218 p c

end Proving.USC.T18.Ch11.Deontic
