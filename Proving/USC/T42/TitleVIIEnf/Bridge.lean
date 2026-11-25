

























import Proving.USC.T42.TitleVIIEnf.Elements.Statute
import Proving.USC.T42.TitleVIIEnf.Deontic.Statute
import Proving.USC.T42.TitleVIIEnf.Ontology.Statute
import Proving.USC.T42.TitleVIIEnf.Procedure.Statute
import Proving.USC.T42.TitleVIIEnf.Structure.Statute
import Proving.USC.T42.TitleVIIEnf.Remedy.Statute
import Proving.USC.T42.TitleVIIEnf.Sanction.Statute
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Bridge

open Proving.USC.Common









section S2000e5

variable (p : Person) (r : Elements.Respondent) (ch : Elements.Charge)
  (pr : Procedure.Respondent) (pch : Procedure.Charge) (pact : Procedure.CivilAction)
  (c : ComplaintText)










axiom corr_e5_elements_to_procedure :
    Elements.Section2000e5Private p r ch c →
      Procedure.TimelyTitleVIIPrivateAction p pch pr pact c



theorem s2000e5_elements_implies_procedure
    (h : Elements.Section2000e5Private p r ch c) :
    Procedure.TimelyTitleVIIPrivateAction p pch pr pact c :=
  corr_e5_elements_to_procedure p r ch pr pch pact c h







axiom corr_e5_elements_to_remedy :
    Elements.Section2000e5Private p r ch c → Remedy.StandingTitleVII p c


theorem s2000e5_elements_implies_remedy
    (h : Elements.Section2000e5Private p r ch c) :
    Remedy.StandingTitleVII p c :=
  corr_e5_elements_to_remedy p r ch c h





axiom corr_e5_procedure_to_remedy :
    Procedure.TimelyTitleVIIPrivateAction p pch pr pact c → Remedy.StandingTitleVII p c


theorem s2000e5_procedure_implies_remedy
    (h : Procedure.TimelyTitleVIIPrivateAction p pch pr pact c) :
    Remedy.StandingTitleVII p c :=
  corr_e5_procedure_to_remedy p pr pch pact c h

end S2000e5






section S2000e6

variable (pp : Elements.PatternOrPractice) (enforcer : Person)
  (pperson : Person) (pact : Procedure.CivilAction) (c : ComplaintText)





axiom corr_e6_elements_to_procedure :
    Elements.Section2000e6PatternOrPractice pp enforcer c →
      Procedure.PatternOrPracticeSuit pperson pact c


theorem s2000e6_elements_implies_procedure
    (h : Elements.Section2000e6PatternOrPractice pp enforcer c) :
    Procedure.PatternOrPracticeSuit pperson pact c :=
  corr_e6_elements_to_procedure pp enforcer pperson pact c h




axiom corr_e6_elements_to_remedy :
    Elements.Section2000e6PatternOrPractice pp enforcer c →
      Remedy.RemedyPatternPractice pperson c


theorem s2000e6_elements_implies_remedy
    (h : Elements.Section2000e6PatternOrPractice pp enforcer c) :
    Remedy.RemedyPatternPractice pperson c :=
  corr_e6_elements_to_remedy pp enforcer pperson c h

end S2000e6









section S2000e16

variable (p : Person) (r : Elements.Respondent) (pact : Procedure.CivilAction)
  (c : ComplaintText)





axiom corr_e16_elements_to_procedure :
    Elements.Section2000e16Federal p r c →
      Procedure.FederalSectorTimelySuit p pact c


theorem s2000e16_elements_implies_procedure
    (h : Elements.Section2000e16Federal p r c) :
    Procedure.FederalSectorTimelySuit p pact c :=
  corr_e16_elements_to_procedure p r pact c h

end S2000e16










section S2000e8

variable (r : Elements.Respondent) (c : ComplaintText)





axiom corr_e8_elements_to_evidentiary :
    Elements.Section2000e8Exemption r c → Evidentiary.Proof2000e8c c



theorem s2000e8_elements_implies_evidentiary
    (h : Elements.Section2000e8Exemption r c) :
    Evidentiary.Proof2000e8c c :=
  corr_e8_elements_to_evidentiary r c h

end S2000e8



























section S2000e12b

variable (p : Person) (r : Elements.Respondent) (c : ComplaintText)





axiom corr_e12_sanction_to_evidentiary :
    Sanction.NoSanction2000e12b c → Evidentiary.Proof2000e12b c



theorem s2000e12b_sanction_implies_evidentiary
    (h : Sanction.NoSanction2000e12b c) :
    Evidentiary.Proof2000e12b c :=
  corr_e12_sanction_to_evidentiary c h








axiom corr_e12_elements_iff_negBar :
    Elements.NoGoodFaithRelianceDefense r c ↔ ¬ Sanction.GoodFaithRelianceBar c






theorem s2000e12b_assertedBar_excludes_elements
    (hbar : Sanction.GoodFaithRelianceBar c) :
    ¬ Elements.NoGoodFaithRelianceDefense r c :=
  fun hne => (corr_e12_elements_iff_negBar r c |>.mp hne) hbar





theorem s2000e12b_elements_iff_no_assertedBar :
    Elements.NoGoodFaithRelianceDefense r c ↔ ¬ Sanction.GoodFaithRelianceBar c :=
  corr_e12_elements_iff_negBar r c

end S2000e12b









section SConfidentiality

variable (pers : Person) (c : ComplaintText)




axiom corr_conf_deontic_to_sanction :
    Deontic.ProhibitionDisclosure_Violated pers c →
      Sanction.OffenseTriggered .DiscloseConciliationInfo c



theorem confidentiality_deontic_implies_sanction
    (h : Deontic.ProhibitionDisclosure_Violated pers c) :
    Sanction.OffenseTriggered .DiscloseConciliationInfo c :=
  corr_conf_deontic_to_sanction pers c h

end SConfidentiality










section SCharge

variable (x : Ontology.Charge) (or : Ontology.Respondent) (op : Person)
  (ep : Person) (er : Elements.Respondent) (ech : Elements.Charge) (c : ComplaintText)



axiom corr_charge_ontology_to_elements :
    Ontology.ChargeMembership x or op c → Elements.IsAggrievedPerson ep c



theorem charge_ontology_implies_elements
    (h : Ontology.ChargeMembership x or op c) :
    Elements.IsAggrievedPerson ep c :=
  corr_charge_ontology_to_elements x or op ep c h

end SCharge







section SMerits

variable (p : Person) (c : ComplaintText)




axiom corr_merits_evidentiary_to_remedy :
    Evidentiary.Section2000e5g1Established c → Remedy.IntentionalViolationFound p c



theorem merits_evidentiary_implies_remedy
    (h : Evidentiary.Section2000e5g1Established c) :
    Remedy.IntentionalViolationFound p c :=
  corr_merits_evidentiary_to_remedy p c h

end SMerits

end Proving.USC.T42.TitleVIIEnf.Bridge
