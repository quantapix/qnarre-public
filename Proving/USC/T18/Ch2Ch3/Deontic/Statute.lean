import Proving.USC.T18.Ch2Ch3.Deontic.Predicates
set_option autoImplicit false
















namespace Proving.USC.T18.Ch2Ch3.Deontic

open Proving.USC.Common



structure Prohibition32 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass32 p c
  condition : ConditionMet32 c

def modality32 : Modality := Modality.prohibition


def ProhibitionViolated32 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition32 p c ∧ ProhibitedActOccurred32 p c



structure Prohibition36 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass36 p c
  condition : ConditionMet36 c

def modality36 : Modality := Modality.prohibition


def ProhibitionViolated36 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition36 p c ∧ ProhibitedActOccurred36 p c



structure Prohibition37 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass37 p c
  condition : ConditionMet37 c

def modality37 : Modality := Modality.prohibition


def ProhibitionViolated37 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition37 p c ∧ ProhibitedActOccurred37 p c





structure Prohibition38 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass38 p c
  condition : ConditionMet38 c
  commerce  : AffectsInterstateCommerce c

def modality38 : Modality := Modality.prohibition


def ProhibitionViolated38 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition38 p c ∧ ProhibitedActOccurred38 p c



structure Prohibition39B (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass39B p c
  condition : ConditionMet39B c

def modality39B : Modality := Modality.prohibition


def ProhibitionViolated39B (p : Person) (c : ComplaintText) : Prop :=
  Prohibition39B p c ∧ ProhibitedActOccurred39B p c



structure Prohibition40A (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass40A p c
  condition : ConditionMet40A c

def modality40A : Modality := Modality.prohibition


def ProhibitionViolated40A (p : Person) (c : ComplaintText) : Prop :=
  Prohibition40A p c ∧ ProhibitedActOccurred40A p c



structure Prohibition42 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass42 p c
  condition : ConditionMet42 c

def modality42 : Modality := Modality.prohibition


def ProhibitionViolated42 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition42 p c ∧ ProhibitedActOccurred42 p c






structure Prohibition43 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass43 p c
  condition : ConditionMet43 c
  commerce  : AffectsInterstateCommerce c

def modality43 : Modality := Modality.prohibition


def ProhibitionViolated43 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition43 p c ∧ ProhibitedActOccurred43 p c






structure Obligation42Dispose (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass42Dispose p c
  condition : ConditionMet42Dispose c

def modality42Dispose : Modality := Modality.obligation




def ObligationBreached42Dispose (p : Person) (c : ComplaintText) : Prop :=
  Obligation42Dispose p c ∧ ¬ DisposalActOccurred42 p c

end Proving.USC.T18.Ch2Ch3.Deontic
