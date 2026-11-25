import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false



















open Proving.USC.Common

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic





def norm111a1 : Norm := ⟨Modality.Prohibition, "18 USC § 111(a)(1)"⟩

structure NormS111_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS111_a1 o c

def ViolatedS111_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS111_a1 p o c ∧ RegulatedActOccurredS111_a1 p o c

def norm111a2 : Norm := ⟨Modality.Prohibition, "18 USC § 111(a)(2)"⟩

structure NormS111_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS111_a2 o c

def ViolatedS111_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS111_a2 p o c ∧ RegulatedActOccurredS111_a2 p o c

def norm111b : Norm := ⟨Modality.Prohibition, "18 USC § 111(b)"⟩



def ConditionS111_b (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  ViolatedS111_a1 p o c ∨ ViolatedS111_a2 p o c

structure NormS111_b (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionS111_b p o c

def ViolatedS111_b (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS111_b p o c ∧ RegulatedActOccurredS111_b p c

def norm111c : Norm := ⟨Modality.Power, "18 USC § 111(c)"⟩


def JurisdictionS111_c (c : ComplaintText) : Prop :=
  WithinExtraterritorialJurisdiction c


def ViolatedS111 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  ViolatedS111_a1 p o c ∨ ViolatedS111_a2 p o c ∨ ViolatedS111_b p o c



def norm112a : Norm := ⟨Modality.Prohibition, "18 USC § 112(a)"⟩

structure NormS112_a (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS112_a o c

def ViolatedS112_a (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS112_a p o c ∧ RegulatedActOccurredS112_a p o c

def norm112b1 : Norm := ⟨Modality.Prohibition, "18 USC § 112(b)(1)–(2)"⟩

structure NormS112_b1 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS112_a o c
  willfully : ActedWillfully p c

def ViolatedS112_b1 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS112_b1 p o c ∧ RegulatedActOccurredS112_b1 p o c

def norm112b3 : Norm := ⟨Modality.Prohibition, "18 USC § 112(b)(3)"⟩

structure NormS112_b3 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS112_b3 c
  willfully : ActedWillfully p c

def ViolatedS112_b3 (p : Person) (c : ComplaintText) : Prop :=
  NormS112_b3 p c ∧ RegulatedActOccurredS112_b3 p c

def norm112d : Norm := ⟨Modality.Prohibition, "18 USC § 112(d)"⟩



structure NormS112_d (g : PublicOfficer) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c
  condition : ConditionMetS112_d p c

def ViolatedS112_d (g : PublicOfficer) (p : Person) (c : ComplaintText) : Prop :=
  NormS112_d g p c ∧ RegulatedActOccurredS112_d g c

def norm112e : Norm := ⟨Modality.Permission, "18 USC § 112(e)"⟩

structure NormS112_e (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c
  condition : ConditionMetS112_e c

def AvailableS112_e (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS112_e g c

def ExercisedS112_e (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS112_e g c ∧ RegulatedActOccurredS112_e g c

def norm112f : Norm := ⟨Modality.Power, "18 USC § 112(f)"⟩

structure NormS112_f (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral g c
  condition : ConditionMetS112_f c

def AvailableS112_f (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS112_f g c

def ExercisedS112_f (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS112_f g c ∧ RegulatedActOccurredS112_f g c



def norm113a : Norm := ⟨Modality.Prohibition, "18 USC § 113(a)"⟩

structure NormS113_a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : WithinSpecialMaritimeTerritorialJurisdiction c

def ViolatedS113_a (p : Person) (c : ComplaintText) : Prop :=
  NormS113_a p c ∧ RegulatedActOccurredS113_a p c



def norm114 : Norm := ⟨Modality.Prohibition, "18 USC § 114"⟩

structure NormS114 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  jurisdiction : WithinSpecialMaritimeTerritorialJurisdiction c
  condition : ConditionMetS114 p c

def ViolatedS114 (p : Person) (c : ComplaintText) : Prop :=
  NormS114 p c ∧ RegulatedActOccurredS114 p c



def norm115a1A : Norm := ⟨Modality.Prohibition, "18 USC § 115(a)(1)(A)"⟩

structure NormS115_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS115_a1 p o c

def ViolatedS115_a1A (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS115_a1 p o c ∧ RegulatedActOccurredS115_a1A p o c

def norm115a1B : Norm := ⟨Modality.Prohibition, "18 USC § 115(a)(1)(B)"⟩

def ViolatedS115_a1B (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS115_a1 p o c ∧ RegulatedActOccurredS115_a1B p o c

def norm115a2 : Norm := ⟨Modality.Prohibition, "18 USC § 115(a)(2)"⟩

structure NormS115_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS115_a2 p o c

def ViolatedS115_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS115_a2 p o c ∧ RegulatedActOccurredS115_a2 p o c

def norm115d : Norm := ⟨Modality.Prohibition, "18 USC § 115(d)"⟩



structure NormS115_d (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c

def ViolatedS115_d (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS115_d g c ∧ RegulatedActOccurredS115_d g c

def norm115e : Norm := ⟨Modality.Power, "18 USC § 115(e)"⟩

def JurisdictionS115_e (c : ComplaintText) : Prop :=
  WithinExtraterritorialJurisdiction c

def ViolatedS115 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  ViolatedS115_a1A p o c ∨ ViolatedS115_a1B p o c ∨ ViolatedS115_a2 p o c



def norm116a1 : Norm := ⟨Modality.Prohibition, "18 USC § 116(a)(1)"⟩

structure NormS116_a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS116_d c

def ViolatedS116_a1 (p : Person) (c : ComplaintText) : Prop :=
  NormS116_a1 p c ∧ RegulatedActOccurredS116_a1 p c

def norm116a2 : Norm := ⟨Modality.Prohibition, "18 USC § 116(a)(2)"⟩

structure NormS116_a2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsParentGuardianOrCaretaker p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS116_d c

def ViolatedS116_a2 (p : Person) (c : ComplaintText) : Prop :=
  NormS116_a2 p c ∧ RegulatedActOccurredS116_a2 p c

def norm116a3 : Norm := ⟨Modality.Prohibition, "18 USC § 116(a)(3)"⟩

structure NormS116_a3 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS116_d c

def ViolatedS116_a3 (p : Person) (c : ComplaintText) : Prop :=
  NormS116_a3 p c ∧ RegulatedActOccurredS116_a3 p c

def norm116b : Norm := ⟨Modality.Permission, "18 USC § 116(b)"⟩

structure NormS116_b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS116_b p c

def PermittedS116_b (p : Person) (c : ComplaintText) : Prop :=
  NormS116_b p c ∧ RegulatedActOccurredS116_b p c


def ViolatedS116_a (p : Person) (c : ComplaintText) : Prop :=
  (ViolatedS116_a1 p c ∨ ViolatedS116_a2 p c ∨ ViolatedS116_a3 p c)
    ∧ ¬ PermittedS116_b p c

def norm116c : Norm := ⟨Modality.Prohibition, "18 USC § 116(c)"⟩



structure NormS116_c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c

def ViolatedS116_c (p : Person) (c : ComplaintText) : Prop :=
  NormS116_c p c ∧ RegulatedActOccurredS116_c p c



def norm117a : Norm := ⟨Modality.Prohibition, "18 USC § 117(a)"⟩

structure NormS117_a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  jurisdiction : ConditionMetS117_juris c
  condition : ConditionMetS117_a p c

def ViolatedS117_a (p : Person) (c : ComplaintText) : Prop :=
  NormS117_a p c ∧ RegulatedActOccurredS117_a p c



def norm118 : Norm := ⟨Modality.Prohibition, "18 USC § 118"⟩

structure NormS118 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  willfully : ActedWillfully p c
  condition : ConditionMetS118 o c

def ViolatedS118 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS118 p o c ∧ RegulatedActOccurredS118 p o c



def norm119a1 : Norm := ⟨Modality.Prohibition, "18 USC § 119(a)(1)"⟩

structure NormS119_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS119_a1 p o c

def ViolatedS119_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS119_a1 p o c ∧ RegulatedActOccurredS119_a p o c

def norm119a2 : Norm := ⟨Modality.Prohibition, "18 USC § 119(a)(2)"⟩

structure NormS119_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS119_a2 p o c

def ViolatedS119_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  NormS119_a2 p o c ∧ RegulatedActOccurredS119_a p o c

def ViolatedS119 (p : Person) (o : Official) (c : ComplaintText) : Prop :=
  ViolatedS119_a1 p o c ∨ ViolatedS119_a2 p o c





def norm152 : Norm := ⟨Modality.Prohibition, "18 USC § 152"⟩

structure NormS152 (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  fraudulently : ActedFraudulently p c
  condition : ConditionMetS152 k c


inductive ViolatedS152 (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  | concealsEstateProperty (e : EstateProperty)
      (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p1 p e c)
  | falseOath (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p2 p c)
  | falseDeclaration (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p3 p c)
  | falseClaim (e : EstateProperty)
      (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p4 p e c)
  | receivesPostPetitionProperty (e : EstateProperty)
      (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p5 p e c)
  | bribery (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p6 p c)
  | transferInContemplation (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p7 p c)
  | falsifiesRecords (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p8 p c)
  | withholdsRecords (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p9 p c)



def norm153a : Norm := ⟨Modality.Prohibition, "18 USC § 153(a)"⟩

structure NormS153_a (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEstateAdministrationOfficer p c
  knowingly : ActedKnowingly p c
  fraudulently : ActedFraudulently p c
  condition : ConditionMetS153 e c

def ViolatedS153_a (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop :=
  NormS153_a p e c ∧ RegulatedActOccurredS153_a p e c



def norm154 : Norm := ⟨Modality.Prohibition, "18 USC § 154"⟩

structure NormS154 (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCourtOfficerInCase p k c
  knowingly : ActedKnowingly p c

inductive ViolatedS154 (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  | purchasesEstateProperty (e : EstateProperty)
      (hn : NormS154 p k c) (ha : RegulatedActOccurredS154_p1 p e c)
  | refusesPartyInspection
      (hn : NormS154 p k c) (hc : ConditionMetS154_p2 c)
      (ha : RegulatedActOccurredS154_p2 p c)
  | refusesTrusteeInspection
      (hn : NormS154 p k c) (ha : RegulatedActOccurredS154_p3 p c)



def norm155 : Norm := ⟨Modality.Prohibition, "18 USC § 155"⟩

structure NormS155 (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPartyInInterest p k c
  knowingly : ActedKnowingly p c
  fraudulently : ActedFraudulently p c
  condition : ConditionMetS155 k c

def ViolatedS155 (p : Person) (k : Case11) (c : ComplaintText) : Prop :=
  NormS155 p k c ∧ RegulatedActOccurredS155 p k c



def norm156b : Norm := ⟨Modality.Prohibition, "18 USC § 156(b)"⟩

structure NormS156_b (p : Person) (k : Case11) (c : ComplaintText) : Prop where
  addressee : AddresseeIsBankruptcyPetitionPreparer p c
  condition : ConditionMetS156_b k c

def ViolatedS156_b (p : Person) (k : Case11) (c : ComplaintText) : Prop :=
  NormS156_b p k c ∧ RegulatedActOccurredS156_b p k c



def norm157 : Norm := ⟨Modality.Prohibition, "18 USC § 157"⟩

structure NormS157 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS157 p c


def ActS157 (p : Person) (c : ComplaintText) : Prop :=
  RegulatedActOccurredS157_p1 p c ∨ RegulatedActOccurredS157_p2 p c
    ∨ RegulatedActOccurredS157_p3 p c

def ViolatedS157 (p : Person) (c : ComplaintText) : Prop :=
  NormS157 p c ∧ ActS157 p c



def norm158a : Norm := ⟨Modality.Obligation, "18 USC § 158(a)"⟩

structure NormS158_a (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral g c

def FulfilledS158_a (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_a g c ∧ RegulatedActOccurredS158_a g c

def BreachedS158_a (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_a g c ∧ ¬ RegulatedActOccurredS158_a g c

def norm158c : Norm := ⟨Modality.Obligation, "18 USC § 158(c)"⟩

structure NormS158_c (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsDesignatedUnitedStatesAttorney g c

def FulfilledS158_c (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_c g c ∧ RegulatedActOccurredS158_c g c

def BreachedS158_c (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_c g c ∧ ¬ RegulatedActOccurredS158_c g c

def norm158d : Norm := ⟨Modality.Obligation, "18 USC § 158(d)"⟩

structure NormS158_d (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsBankruptcyCourt g c

def FulfilledS158_d (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_d g c ∧ RegulatedActOccurredS158_d g c

def BreachedS158_d (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS158_d g c ∧ ¬ RegulatedActOccurredS158_d g c





def norm175a : Norm := ⟨Modality.Prohibition, "18 USC § 175(a)"⟩

structure NormS175_a (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS175_a b c

def ViolatedS175_a (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175_a p b c ∧ RegulatedActOccurredS175_a p b c

def norm175b : Norm := ⟨Modality.Prohibition, "18 USC § 175(b)"⟩

structure NormS175_b (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS175_b b c

def ViolatedS175_b (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175_b p b c ∧ RegulatedActOccurredS175_b p b c

def ViolatedS175 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  ViolatedS175_a p b c ∨ ViolatedS175_b p b c



def norm175aSec : Norm := ⟨Modality.Power, "18 USC § 175a"⟩

structure NormS175a (g : PublicOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral g c
  condition : ConditionMetS175a c

def AvailableS175a (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS175a g c

def ExercisedS175a (g : PublicOfficer) (c : ComplaintText) : Prop :=
  NormS175a g c ∧ RegulatedActOccurredS175a g c



def norm175b_a : Norm := ⟨Modality.Prohibition, "18 USC § 175b(a)(1)"⟩



def AppliesS175b (c : ComplaintText) : Prop :=
  ¬ ConditionMetS175b_exempt c

structure NormS175b_a (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsRestrictedPerson p c
  knowingly : ActedKnowingly p c
  applies : AppliesS175b c
  condition : ConditionMetS175b_a2 b c

inductive ViolatedS175b_a (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  | shipTransportOrPossess
      (hn : NormS175b_a p b c) (ha : RegulatedActOccurredS175b_a1A p b c)
  | receive
      (hn : NormS175b_a p b c) (ha : RegulatedActOccurredS175b_a1B p b c)

def norm175b_b1 : Norm := ⟨Modality.Prohibition, "18 USC § 175b(b)(1)"⟩

structure NormS175b_b1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS175b_b1 p b c

def ViolatedS175b_b1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175b_b1 p b c ∧ RegulatedActOccurredS175b_b1 p b c

def norm175b_b2 : Norm := ⟨Modality.Prohibition, "18 USC § 175b(b)(2)"⟩

structure NormS175b_b2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  condition : ConditionMetS175b_b2 p b c

def ViolatedS175b_b2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175b_b2 p b c ∧ RegulatedActOccurredS175b_b2 p b c

def norm175b_c1 : Norm := ⟨Modality.Prohibition, "18 USC § 175b(c)(1)"⟩

structure NormS175b_c1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS175b_c1 p b c

def ViolatedS175b_c1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175b_c1 p b c ∧ RegulatedActOccurredS175b_c1 p b c

def norm175b_c2 : Norm := ⟨Modality.Prohibition, "18 USC § 175b(c)(2)"⟩

structure NormS175b_c2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  condition : ConditionMetS175b_c2 p b c

def ViolatedS175b_c2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS175b_c2 p b c ∧ RegulatedActOccurredS175b_c2 p b c



def norm175c_a1 : Norm := ⟨Modality.Prohibition, "18 USC § 175c(a)(1)"⟩



def AppliesS175c (p : Person) (c : ComplaintText) : Prop :=
  ¬ ConditionMetS175c_a2 p c

structure NormS175c_a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  knowingly : ActedKnowingly p c
  applies : AppliesS175c p c
  jurisdiction : ConditionMetS175c_b c

def ViolatedS175c_a1 (p : Person) (c : ComplaintText) : Prop :=
  NormS175c_a1 p c ∧ RegulatedActOccurredS175c_a1 p c



def norm176a1 : Norm := ⟨Modality.Power, "18 USC § 176(a)(1)"⟩

structure NormS176_a1 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral g c
  condition : ConditionMetS176_a1 b c

def AvailableS176_a1 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS176_a1 g b c

def ExercisedS176_a1 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS176_a1 g b c ∧ RegulatedActOccurredS176_a1 g b c

def norm176a2 : Norm := ⟨Modality.Power, "18 USC § 176(a)(2)"⟩

structure NormS176_a2 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c
  subject : ConditionMetS176_a1 b c
  condition : ConditionMetS176_a2 c

def ExercisedS176_a2 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS176_a2 g b c ∧ RegulatedActOccurredS176_a2 g b c

def norm176b : Norm := ⟨Modality.Obligation, "18 USC § 176(b)"⟩

structure NormS176_b (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c
  condition : ConditionMetS176_b b c

def FulfilledS176_b (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS176_b g b c ∧ RegulatedActOccurredS176_b g b c

def BreachedS176_b (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS176_b g b c ∧ ¬ RegulatedActOccurredS176_b g b c

def norm176c : Norm := ⟨Modality.Permission, "18 USC § 176(c)"⟩


def DefenceS176_c (b : BioMaterial) (c : ComplaintText) : Prop :=
  ConditionMetS176_c b c



def norm177a : Norm := ⟨Modality.Permission, "18 USC § 177(a)"⟩


def GroundS177_a (b : BioMaterial) (c : ComplaintText) : Prop :=
  ConditionMetS177_a1 c ∨ ConditionMetS177_a2 c ∨ ConditionMetS177_a3 b c

structure NormS177_a (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates g c
  condition : GroundS177_a b c

def AvailableS177_a (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS177_a g b c

def ExercisedS177_a (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop :=
  NormS177_a g b c ∧ RegulatedActOccurredS177_a g c

def norm177b : Norm := ⟨Modality.Permission, "18 USC § 177(b)"⟩


def DefenceS177_b (b : BioMaterial) (c : ComplaintText) : Prop :=
  ConditionMetS177_b b c



inductive DefinitionalProvision where
  | s112c | s113b | s115c | s116e | s117b | s119b
  | s151 | s156a | s158b
  | s175c | s175bd | s175cd | s178

def definitionalNorm : DefinitionalProvision → Norm
  | .s112c  => ⟨Modality.Definition, "18 USC § 112(c)"⟩
  | .s113b  => ⟨Modality.Definition, "18 USC § 113(b)"⟩
  | .s115c  => ⟨Modality.Definition, "18 USC § 115(c)"⟩
  | .s116e  => ⟨Modality.Definition, "18 USC § 116(e)"⟩
  | .s117b  => ⟨Modality.Definition, "18 USC § 117(b)"⟩
  | .s119b  => ⟨Modality.Definition, "18 USC § 119(b)"⟩
  | .s151   => ⟨Modality.Definition, "18 USC § 151"⟩
  | .s156a  => ⟨Modality.Definition, "18 USC § 156(a)"⟩
  | .s158b  => ⟨Modality.Definition, "18 USC § 158(b)"⟩
  | .s175c  => ⟨Modality.Definition, "18 USC § 175(c)"⟩
  | .s175bd => ⟨Modality.Definition, "18 USC § 175b(d)"⟩
  | .s175cd => ⟨Modality.Definition, "18 USC § 175c(d)"⟩
  | .s178   => ⟨Modality.Definition, "18 USC § 178"⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic
