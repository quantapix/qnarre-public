






















import Proving.USC.T18.Ch75.Elements.Statute
import Proving.USC.T18.Ch75.Deontic.Statute
import Proving.USC.T18.Ch75.Ontology.Statute
import Proving.USC.T18.Ch75.Scienter.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch75.Bridge
open Proving.USC.Common








axiom mapPassDoc  : Proving.USC.T18.Ch75.Elements.Passport      → Proving.USC.T18.Ch75.Deontic.TravelDocument
axiom mapEntryDoc : Proving.USC.T18.Ch75.Elements.EntryDocument → Proving.USC.T18.Ch75.Deontic.TravelDocument
axiom mapPassOnt  : Proving.USC.T18.Ch75.Elements.Passport      → Proving.USC.T18.Ch75.Ontology.Passport
axiom mapEntryOnt : Proving.USC.T18.Ch75.Elements.EntryDocument → Proving.USC.T18.Ch75.Ontology.EntryDocument




axiom corr_addressee_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Deontic.AddresseeInClass1542 p c

axiom corr_condition_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Deontic.ConditionMet1542 p c

axiom corr_act_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Deontic.RegulatedActOccurred1542 p (mapPassDoc pp) c

axiom corr_scienter_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1542 p c

axiom corr_o_passport_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Ontology.IsPassport (mapPassOnt pp) c
axiom corr_o_authority_1542 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Ontology.IssuedUnderUSAuthority (mapPassOnt pp) c


theorem s1542_elements_implies_deontic {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1542 p pp c) :
    Proving.USC.T18.Ch75.Deontic.Prohibition1542Violated p (mapPassDoc pp) c :=
  ⟨⟨corr_addressee_1542 h, corr_condition_1542 h⟩, corr_act_1542 h⟩


theorem s1542_elements_implies_scienter {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1542 p pp c) :
    Proving.USC.T18.Ch75.Scienter.Scienter1542 p c :=
  corr_scienter_1542 h


theorem s1542_elements_implies_ontology {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1542 p pp c) :
    Proving.USC.T18.Ch75.Ontology.PassportMembership (mapPassOnt pp) c :=
  ⟨corr_o_passport_1542 h, corr_o_authority_1542 h⟩



axiom corr_addressee_1543 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Deontic.AddresseeInClass1543 p c
axiom corr_condition_1543 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Deontic.ConditionMet1543 p c
axiom corr_act_1543 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Deontic.RegulatedActOccurred1543 p (mapPassDoc pp) c
axiom corr_scienter_1543 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1543 p c

axiom corr_o_instrument_1543 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Ontology.IsInstrumentPurportingToBePassport (mapPassOnt pp) c


theorem s1543_elements_implies_deontic {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1543 p pp c) :
    Proving.USC.T18.Ch75.Deontic.Prohibition1543Violated p (mapPassDoc pp) c :=
  ⟨⟨corr_addressee_1543 h, corr_condition_1543 h⟩, corr_act_1543 h⟩


theorem s1543_elements_implies_scienter {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1543 p pp c) :
    Proving.USC.T18.Ch75.Scienter.Scienter1543 p c :=
  corr_scienter_1543 h


theorem s1543_elements_implies_ontology {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1543 p pp c) :
    Proving.USC.T18.Ch75.Ontology.InstrumentPurportingMembership (mapPassOnt pp) c :=
  ⟨corr_o_instrument_1543 h⟩



axiom corr_addressee_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Deontic.AddresseeInClass1544 p c
axiom corr_condition_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Deontic.ConditionMet1544 p c
axiom corr_act_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Deontic.RegulatedActOccurred1544 p (mapPassDoc pp) c
axiom corr_scienter_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1544 p c
axiom corr_o_passport_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Ontology.IsPassport (mapPassOnt pp) c
axiom corr_o_authority_1544 {p : Person} {pp : Proving.USC.T18.Ch75.Elements.Passport} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Ontology.IssuedUnderUSAuthority (mapPassOnt pp) c


theorem s1544_elements_implies_deontic {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1544 p pp c) :
    Proving.USC.T18.Ch75.Deontic.Prohibition1544Violated p (mapPassDoc pp) c :=
  ⟨⟨corr_addressee_1544 h, corr_condition_1544 h⟩, corr_act_1544 h⟩


theorem s1544_elements_implies_scienter {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1544 p pp c) :
    Proving.USC.T18.Ch75.Scienter.Scienter1544 p c :=
  corr_scienter_1544 h


theorem s1544_elements_implies_ontology {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1544 p pp c) :
    Proving.USC.T18.Ch75.Ontology.PassportMembership (mapPassOnt pp) c :=
  ⟨corr_o_passport_1544 h, corr_o_authority_1544 h⟩








axiom corr_addressee_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Deontic.AddresseeInClass1546 p c
axiom corr_condition_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Deontic.ConditionMet1546 p c
axiom corr_act_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Deontic.RegulatedActOccurred1546 p (mapEntryDoc d) c


axiom corr_noLE_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → ¬ Proving.USC.T18.Ch75.Deontic.LawEnforcementException1546c p c

axiom corr_scienter_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Scienter.Scienter1546a p c
axiom corr_o_prescribed_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Ontology.PrescribedByStatuteOrRegulation (mapEntryOnt d) c
axiom corr_o_purpose_1546 {p : Person} {d : Proving.USC.T18.Ch75.Elements.EntryDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Ontology.ForEntryStayOrEmployment (mapEntryOnt d) c


theorem s1546_elements_implies_deontic {p d c}
    (h : Proving.USC.T18.Ch75.Elements.Section1546 p d c) :
    Proving.USC.T18.Ch75.Deontic.Prohibition1546Violated p (mapEntryDoc d) c :=
  ⟨⟨corr_addressee_1546 h, corr_condition_1546 h⟩, corr_act_1546 h, corr_noLE_1546 h⟩


theorem s1546_elements_implies_scienter {p d c}
    (h : Proving.USC.T18.Ch75.Elements.Section1546 p d c) :
    Proving.USC.T18.Ch75.Scienter.Scienter1546a p c :=
  corr_scienter_1546 h


theorem s1546_elements_implies_ontology {p d c}
    (h : Proving.USC.T18.Ch75.Elements.Section1546 p d c) :
    Proving.USC.T18.Ch75.Ontology.EntryDocumentMembership (mapEntryOnt d) c :=
  ⟨corr_o_prescribed_1546 h, corr_o_purpose_1546 h⟩








def s1542_tierA : Prop :=
  (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Deontic.Prohibition1542Violated p (mapPassDoc pp) c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1542 p c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1542 p pp c → Proving.USC.T18.Ch75.Ontology.PassportMembership (mapPassOnt pp) c)
theorem s1542_tierA_holds : s1542_tierA :=
  ⟨fun h => s1542_elements_implies_deontic h, fun h => s1542_elements_implies_scienter h, fun h => s1542_elements_implies_ontology h⟩

def s1543_tierA : Prop :=
  (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Deontic.Prohibition1543Violated p (mapPassDoc pp) c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1543 p c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1543 p pp c → Proving.USC.T18.Ch75.Ontology.InstrumentPurportingMembership (mapPassOnt pp) c)
theorem s1543_tierA_holds : s1543_tierA :=
  ⟨fun h => s1543_elements_implies_deontic h, fun h => s1543_elements_implies_scienter h, fun h => s1543_elements_implies_ontology h⟩

def s1544_tierA : Prop :=
  (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Deontic.Prohibition1544Violated p (mapPassDoc pp) c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Scienter.Scienter1544 p c)
  ∧ (∀ {p pp c}, Proving.USC.T18.Ch75.Elements.Section1544 p pp c → Proving.USC.T18.Ch75.Ontology.PassportMembership (mapPassOnt pp) c)
theorem s1544_tierA_holds : s1544_tierA :=
  ⟨fun h => s1544_elements_implies_deontic h, fun h => s1544_elements_implies_scienter h, fun h => s1544_elements_implies_ontology h⟩

def s1546_tierA : Prop :=
  (∀ {p d c}, Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Deontic.Prohibition1546Violated p (mapEntryDoc d) c)
  ∧ (∀ {p d c}, Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Scienter.Scienter1546a p c)
  ∧ (∀ {p d c}, Proving.USC.T18.Ch75.Elements.Section1546 p d c → Proving.USC.T18.Ch75.Ontology.EntryDocumentMembership (mapEntryOnt d) c)
theorem s1546_tierA_holds : s1546_tierA :=
  ⟨fun h => s1546_elements_implies_deontic h, fun h => s1546_elements_implies_scienter h, fun h => s1546_elements_implies_ontology h⟩

end Proving.USC.T18.Ch75.Bridge
