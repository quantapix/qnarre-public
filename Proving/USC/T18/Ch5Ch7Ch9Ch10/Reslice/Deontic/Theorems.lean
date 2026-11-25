import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false















open Proving.USC.Common

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic



theorem violatedS111_a1_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS111_a1 o c)
    (hAct : RegulatedActOccurredS111_a1 p o c) : ViolatedS111_a1 p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS111_a2_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS111_a2 o c)
    (hAct : RegulatedActOccurredS111_a2 p o c) : ViolatedS111_a2 p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS111_b_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionS111_b p o c)
    (hAct : RegulatedActOccurredS111_b p c) : ViolatedS111_b p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem conditionS111_b_of_a1 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS111_a1 p o c) : ConditionS111_b p o c := Or.inl h

theorem conditionS111_b_of_a2 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS111_a2 p o c) : ConditionS111_b p o c := Or.inr h

theorem violatedS111_intro_a1 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS111_a1 p o c) : ViolatedS111 p o c := Or.inl h

theorem violatedS111_intro_a2 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS111_a2 p o c) : ViolatedS111 p o c := Or.inr (Or.inl h)

theorem violatedS111_intro_b {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS111_b p o c) : ViolatedS111 p o c := Or.inr (Or.inr h)

theorem jurisdictionS111_c_intro {c : ComplaintText}
    (h : WithinExtraterritorialJurisdiction c) : JurisdictionS111_c c := h

theorem violatedS112_a_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS112_a o c)
    (hAct : RegulatedActOccurredS112_a p o c) : ViolatedS112_a p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS112_b1_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS112_a o c)
    (hWill : ActedWillfully p c) (hAct : RegulatedActOccurredS112_b1 p o c) :
    ViolatedS112_b1 p o c :=
  ⟨⟨hAddr, hCond, hWill⟩, hAct⟩

theorem violatedS112_b3_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS112_b3 c)
    (hWill : ActedWillfully p c) (hAct : RegulatedActOccurredS112_b3 p c) :
    ViolatedS112_b3 p c :=
  ⟨⟨hAddr, hCond, hWill⟩, hAct⟩

theorem violatedS112_d_intro {g : PublicOfficer} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : ConditionMetS112_d p c)
    (hAct : RegulatedActOccurredS112_d g c) : ViolatedS112_d g p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem availableS112_e_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : ConditionMetS112_e c) :
    AvailableS112_e g c :=
  ⟨hAddr, hCond⟩

theorem exercisedS112_e_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : ConditionMetS112_e c)
    (hAct : RegulatedActOccurredS112_e g c) : ExercisedS112_e g c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem availableS112_f_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS112_f c) :
    AvailableS112_f g c :=
  ⟨hAddr, hCond⟩

theorem exercisedS112_f_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS112_f c)
    (hAct : RegulatedActOccurredS112_f g c) : ExercisedS112_f g c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS113_a_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c)
    (hJur : WithinSpecialMaritimeTerritorialJurisdiction c)
    (hAct : RegulatedActOccurredS113_a p c) : ViolatedS113_a p c :=
  ⟨⟨hAddr, hJur⟩, hAct⟩

theorem violatedS114_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c)
    (hJur : WithinSpecialMaritimeTerritorialJurisdiction c)
    (hCond : ConditionMetS114 p c) (hAct : RegulatedActOccurredS114 p c) :
    ViolatedS114 p c :=
  ⟨⟨hAddr, hJur, hCond⟩, hAct⟩

theorem violatedS115_a1A_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS115_a1 p o c)
    (hAct : RegulatedActOccurredS115_a1A p o c) : ViolatedS115_a1A p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS115_a1B_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS115_a1 p o c)
    (hAct : RegulatedActOccurredS115_a1B p o c) : ViolatedS115_a1B p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS115_a2_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS115_a2 p o c)
    (hAct : RegulatedActOccurredS115_a2 p o c) : ViolatedS115_a2 p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS115_d_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hAct : RegulatedActOccurredS115_d g c) :
    ViolatedS115_d g c :=
  ⟨⟨hAddr⟩, hAct⟩

theorem jurisdictionS115_e_intro {c : ComplaintText}
    (h : WithinExtraterritorialJurisdiction c) : JurisdictionS115_e c := h

theorem violatedS115_intro_a1A {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS115_a1A p o c) : ViolatedS115 p o c := Or.inl h

theorem violatedS115_intro_a1B {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS115_a1B p o c) : ViolatedS115 p o c := Or.inr (Or.inl h)

theorem violatedS115_intro_a2 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS115_a2 p o c) : ViolatedS115 p o c := Or.inr (Or.inr h)

theorem violatedS116_a1_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS116_d c) (hAct : RegulatedActOccurredS116_a1 p c) :
    ViolatedS116_a1 p c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS116_a2_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsParentGuardianOrCaretaker p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS116_d c) (hAct : RegulatedActOccurredS116_a2 p c) :
    ViolatedS116_a2 p c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS116_a3_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS116_d c) (hAct : RegulatedActOccurredS116_a3 p c) :
    ViolatedS116_a3 p c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem permittedS116_b_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS116_b p c)
    (hAct : RegulatedActOccurredS116_b p c) : PermittedS116_b p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS116_a_intro_a1 {p : Person} {c : ComplaintText}
    (h : ViolatedS116_a1 p c) (hNoDefence : ¬ PermittedS116_b p c) :
    ViolatedS116_a p c :=
  ⟨Or.inl h, hNoDefence⟩

theorem violatedS116_a_intro_a2 {p : Person} {c : ComplaintText}
    (h : ViolatedS116_a2 p c) (hNoDefence : ¬ PermittedS116_b p c) :
    ViolatedS116_a p c :=
  ⟨Or.inr (Or.inl h), hNoDefence⟩

theorem violatedS116_a_intro_a3 {p : Person} {c : ComplaintText}
    (h : ViolatedS116_a3 p c) (hNoDefence : ¬ PermittedS116_b p c) :
    ViolatedS116_a p c :=
  ⟨Or.inr (Or.inr h), hNoDefence⟩

theorem violatedS116_c_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hAct : RegulatedActOccurredS116_c p c) :
    ViolatedS116_c p c :=
  ⟨⟨hAddr⟩, hAct⟩

theorem violatedS117_a_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hJur : ConditionMetS117_juris c)
    (hCond : ConditionMetS117_a p c) (hAct : RegulatedActOccurredS117_a p c) :
    ViolatedS117_a p c :=
  ⟨⟨hAddr, hJur, hCond⟩, hAct⟩

theorem violatedS118_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hWill : ActedWillfully p c) (hCond : ConditionMetS118 o c)
    (hAct : RegulatedActOccurredS118 p o c) : ViolatedS118 p o c :=
  ⟨⟨hAddr, hKnow, hWill, hCond⟩, hAct⟩

theorem violatedS119_a1_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS119_a1 p o c) (hAct : RegulatedActOccurredS119_a p o c) :
    ViolatedS119_a1 p o c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS119_a2_intro {p : Person} {o : Official} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS119_a2 p o c) (hAct : RegulatedActOccurredS119_a p o c) :
    ViolatedS119_a2 p o c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS119_intro_a1 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS119_a1 p o c) : ViolatedS119 p o c := Or.inl h

theorem violatedS119_intro_a2 {p : Person} {o : Official} {c : ComplaintText}
    (h : ViolatedS119_a2 p o c) : ViolatedS119 p o c := Or.inr h



theorem normS152_intro {p : Person} {k : Case11} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hFraud : ActedFraudulently p c) (hCond : ConditionMetS152 k c) :
    NormS152 p k c :=
  ⟨hAddr, hKnow, hFraud, hCond⟩

theorem violatedS152_intro_p1 {p : Person} {k : Case11} {e : EstateProperty}
    {c : ComplaintText} (hn : NormS152 p k c)
    (ha : RegulatedActOccurredS152_p1 p e c) : ViolatedS152 p k c :=
  .concealsEstateProperty e hn ha

theorem violatedS152_intro_p2 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p2 p c) :
    ViolatedS152 p k c := .falseOath hn ha

theorem violatedS152_intro_p3 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p3 p c) :
    ViolatedS152 p k c := .falseDeclaration hn ha

theorem violatedS152_intro_p4 {p : Person} {k : Case11} {e : EstateProperty}
    {c : ComplaintText} (hn : NormS152 p k c)
    (ha : RegulatedActOccurredS152_p4 p e c) : ViolatedS152 p k c :=
  .falseClaim e hn ha

theorem violatedS152_intro_p5 {p : Person} {k : Case11} {e : EstateProperty}
    {c : ComplaintText} (hn : NormS152 p k c)
    (ha : RegulatedActOccurredS152_p5 p e c) : ViolatedS152 p k c :=
  .receivesPostPetitionProperty e hn ha

theorem violatedS152_intro_p6 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p6 p c) :
    ViolatedS152 p k c := .bribery hn ha

theorem violatedS152_intro_p7 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p7 p c) :
    ViolatedS152 p k c := .transferInContemplation hn ha

theorem violatedS152_intro_p8 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p8 p c) :
    ViolatedS152 p k c := .falsifiesRecords hn ha

theorem violatedS152_intro_p9 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS152 p k c) (ha : RegulatedActOccurredS152_p9 p c) :
    ViolatedS152 p k c := .withholdsRecords hn ha

theorem violatedS153_a_intro {p : Person} {e : EstateProperty} {c : ComplaintText}
    (hAddr : AddresseeIsEstateAdministrationOfficer p c) (hKnow : ActedKnowingly p c)
    (hFraud : ActedFraudulently p c) (hCond : ConditionMetS153 e c)
    (hAct : RegulatedActOccurredS153_a p e c) : ViolatedS153_a p e c :=
  ⟨⟨hAddr, hKnow, hFraud, hCond⟩, hAct⟩

theorem normS154_intro {p : Person} {k : Case11} {c : ComplaintText}
    (hAddr : AddresseeIsCourtOfficerInCase p k c) (hKnow : ActedKnowingly p c) :
    NormS154 p k c :=
  ⟨hAddr, hKnow⟩

theorem violatedS154_intro_p1 {p : Person} {k : Case11} {e : EstateProperty}
    {c : ComplaintText} (hn : NormS154 p k c)
    (ha : RegulatedActOccurredS154_p1 p e c) : ViolatedS154 p k c :=
  .purchasesEstateProperty e hn ha

theorem violatedS154_intro_p2 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS154 p k c) (hc : ConditionMetS154_p2 c)
    (ha : RegulatedActOccurredS154_p2 p c) : ViolatedS154 p k c :=
  .refusesPartyInspection hn hc ha

theorem violatedS154_intro_p3 {p : Person} {k : Case11} {c : ComplaintText}
    (hn : NormS154 p k c) (ha : RegulatedActOccurredS154_p3 p c) :
    ViolatedS154 p k c := .refusesTrusteeInspection hn ha

theorem violatedS155_intro {p : Person} {k : Case11} {c : ComplaintText}
    (hAddr : AddresseeIsPartyInInterest p k c) (hKnow : ActedKnowingly p c)
    (hFraud : ActedFraudulently p c) (hCond : ConditionMetS155 k c)
    (hAct : RegulatedActOccurredS155 p k c) : ViolatedS155 p k c :=
  ⟨⟨hAddr, hKnow, hFraud, hCond⟩, hAct⟩

theorem violatedS156_b_intro {p : Person} {k : Case11} {c : ComplaintText}
    (hAddr : AddresseeIsBankruptcyPetitionPreparer p c)
    (hCond : ConditionMetS156_b k c) (hAct : RegulatedActOccurredS156_b p k c) :
    ViolatedS156_b p k c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem actS157_intro_p1 {p : Person} {c : ComplaintText}
    (h : RegulatedActOccurredS157_p1 p c) : ActS157 p c := Or.inl h

theorem actS157_intro_p2 {p : Person} {c : ComplaintText}
    (h : RegulatedActOccurredS157_p2 p c) : ActS157 p c := Or.inr (Or.inl h)

theorem actS157_intro_p3 {p : Person} {c : ComplaintText}
    (h : RegulatedActOccurredS157_p3 p c) : ActS157 p c := Or.inr (Or.inr h)

theorem violatedS157_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS157 p c)
    (hAct : ActS157 p c) : ViolatedS157 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem fulfilledS158_a_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c)
    (hAct : RegulatedActOccurredS158_a g c) : FulfilledS158_a g c :=
  ⟨⟨hAddr⟩, hAct⟩

theorem breachedS158_a_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c)
    (hOmit : ¬ RegulatedActOccurredS158_a g c) : BreachedS158_a g c :=
  ⟨⟨hAddr⟩, hOmit⟩

theorem fulfilledS158_c_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsDesignatedUnitedStatesAttorney g c)
    (hAct : RegulatedActOccurredS158_c g c) : FulfilledS158_c g c :=
  ⟨⟨hAddr⟩, hAct⟩

theorem breachedS158_c_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsDesignatedUnitedStatesAttorney g c)
    (hOmit : ¬ RegulatedActOccurredS158_c g c) : BreachedS158_c g c :=
  ⟨⟨hAddr⟩, hOmit⟩

theorem fulfilledS158_d_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsBankruptcyCourt g c)
    (hAct : RegulatedActOccurredS158_d g c) : FulfilledS158_d g c :=
  ⟨⟨hAddr⟩, hAct⟩

theorem breachedS158_d_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsBankruptcyCourt g c)
    (hOmit : ¬ RegulatedActOccurredS158_d g c) : BreachedS158_d g c :=
  ⟨⟨hAddr⟩, hOmit⟩



theorem violatedS175_a_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS175_a b c) (hAct : RegulatedActOccurredS175_a p b c) :
    ViolatedS175_a p b c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS175_b_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS175_b b c) (hAct : RegulatedActOccurredS175_b p b c) :
    ViolatedS175_b p b c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS175_intro_a {p : Person} {b : BioMaterial} {c : ComplaintText}
    (h : ViolatedS175_a p b c) : ViolatedS175 p b c := Or.inl h

theorem violatedS175_intro_b {p : Person} {b : BioMaterial} {c : ComplaintText}
    (h : ViolatedS175_b p b c) : ViolatedS175 p b c := Or.inr h

theorem availableS175a_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS175a c) :
    AvailableS175a g c :=
  ⟨hAddr, hCond⟩

theorem exercisedS175a_intro {g : PublicOfficer} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS175a c)
    (hAct : RegulatedActOccurredS175a g c) : ExercisedS175a g c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem appliesS175b_intro {c : ComplaintText}
    (h : ¬ ConditionMetS175b_exempt c) : AppliesS175b c := h

theorem normS175b_a_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsRestrictedPerson p c) (hKnow : ActedKnowingly p c)
    (hApplies : AppliesS175b c) (hCond : ConditionMetS175b_a2 b c) :
    NormS175b_a p b c :=
  ⟨hAddr, hKnow, hApplies, hCond⟩

theorem violatedS175b_a_intro_A {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hn : NormS175b_a p b c) (ha : RegulatedActOccurredS175b_a1A p b c) :
    ViolatedS175b_a p b c := .shipTransportOrPossess hn ha

theorem violatedS175b_a_intro_B {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hn : NormS175b_a p b c) (ha : RegulatedActOccurredS175b_a1B p b c) :
    ViolatedS175b_a p b c := .receive hn ha

theorem violatedS175b_b1_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS175b_b1 p b c)
    (hAct : RegulatedActOccurredS175b_b1 p b c) : ViolatedS175b_b1 p b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS175b_b2_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hCond : ConditionMetS175b_b2 p b c)
    (hAct : RegulatedActOccurredS175b_b2 p b c) : ViolatedS175b_b2 p b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem violatedS175b_c1_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS175b_c1 p b c)
    (hAct : RegulatedActOccurredS175b_c1 p b c) : ViolatedS175b_c1 p b c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem violatedS175b_c2_intro {p : Person} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hCond : ConditionMetS175b_c2 p b c)
    (hAct : RegulatedActOccurredS175b_c2 p b c) : ViolatedS175b_c2 p b c :=
  ⟨⟨hAddr, hKnow, hCond⟩, hAct⟩

theorem appliesS175c_intro {p : Person} {c : ComplaintText}
    (h : ¬ ConditionMetS175c_a2 p c) : AppliesS175c p c := h

theorem violatedS175c_a1_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hKnow : ActedKnowingly p c)
    (hApplies : AppliesS175c p c) (hJur : ConditionMetS175c_b c)
    (hAct : RegulatedActOccurredS175c_a1 p c) : ViolatedS175c_a1 p c :=
  ⟨⟨hAddr, hKnow, hApplies, hJur⟩, hAct⟩

theorem availableS176_a1_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS176_a1 b c) :
    AvailableS176_a1 g b c :=
  ⟨hAddr, hCond⟩

theorem exercisedS176_a1_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral g c) (hCond : ConditionMetS176_a1 b c)
    (hAct : RegulatedActOccurredS176_a1 g b c) : ExercisedS176_a1 g b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem exercisedS176_a2_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hSubj : ConditionMetS176_a1 b c)
    (hCond : ConditionMetS176_a2 c) (hAct : RegulatedActOccurredS176_a2 g b c) :
    ExercisedS176_a2 g b c :=
  ⟨⟨hAddr, hSubj, hCond⟩, hAct⟩

theorem fulfilledS176_b_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : ConditionMetS176_b b c)
    (hAct : RegulatedActOccurredS176_b g b c) : FulfilledS176_b g b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem breachedS176_b_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : ConditionMetS176_b b c)
    (hOmit : ¬ RegulatedActOccurredS176_b g b c) : BreachedS176_b g b c :=
  ⟨⟨hAddr, hCond⟩, hOmit⟩

theorem defenceS176_c_intro {b : BioMaterial} {c : ComplaintText}
    (h : ConditionMetS176_c b c) : DefenceS176_c b c := h

theorem groundS177_a_intro_1 {b : BioMaterial} {c : ComplaintText}
    (h : ConditionMetS177_a1 c) : GroundS177_a b c := Or.inl h

theorem groundS177_a_intro_2 {b : BioMaterial} {c : ComplaintText}
    (h : ConditionMetS177_a2 c) : GroundS177_a b c := Or.inr (Or.inl h)

theorem groundS177_a_intro_3 {b : BioMaterial} {c : ComplaintText}
    (h : ConditionMetS177_a3 b c) : GroundS177_a b c := Or.inr (Or.inr h)

theorem availableS177_a_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : GroundS177_a b c) :
    AvailableS177_a g b c :=
  ⟨hAddr, hCond⟩

theorem exercisedS177_a_intro {g : PublicOfficer} {b : BioMaterial} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates g c) (hCond : GroundS177_a b c)
    (hAct : RegulatedActOccurredS177_a g c) : ExercisedS177_a g b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem defenceS177_b_intro {b : BioMaterial} {c : ComplaintText}
    (h : ConditionMetS177_b b c) : DefenceS177_b b c := h

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic
