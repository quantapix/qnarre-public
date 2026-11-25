import Proving.USC.T42.TitleVII.Elements.Statute
import Proving.USC.T42.TitleVII.Deontic.Statute
import Proving.USC.T42.TitleVII.Ontology.Statute
import Proving.USC.T42.TitleVII.Procedure.Statute
import Proving.USC.T42.TitleVII.Structure.Statute


































namespace Proving.USC.T42.TitleVII.Bridge

open Proving.USC.Common












theorem s2000e2_elements_implies_ontology
    {r : Elements.Respondent} {p : Person} {g : Elements.ProtectedGround}
    {pr : Elements.Practice} {c : ComplaintText}
    {e : Ontology.Employer} {x : Ontology.EmploymentPractice}
    (cov : Elements.Coverage r p c)
    (dt : Elements.DisparateTreatment r p g pr c)
    (corr_respondent :
      Elements.IsCoveredRespondent r c → Ontology.IsEmployer e c)
    (corr_unlawful :
      Elements.AdverseEmploymentAction r p pr c →
      Elements.BecauseOfProtectedGround r p g c →
      Ontology.IsUnlawfulEmploymentPractice x c) :
    Ontology.UnlawfulPractice x c :=
  { respondent := .employer e (corr_respondent cov.respondent)
    isUnlawful := corr_unlawful dt.adverseAction dt.causation }



















theorem s2000e2_elements_implies_deontic_modulo_gaps
    {r : Elements.Respondent} {p : Person} {g : Elements.ProtectedGround}
    {pr : Elements.Practice} {c : ComplaintText}
    (subject victim : Deontic.LegalPerson)
    (dt : Elements.DisparateTreatment r p g pr c)
    (corr_because :
      Elements.BecauseOfProtectedGround r p g c →
      Deontic.BecauseOfProtectedTrait subject victim)
    (gap_deontic_employer_act :
      Deontic.IsEmployer subject ∧ Deontic.DiscriminatesInEmployment subject victim) :



    Nonempty Deontic.EmployerProhibition :=
  ⟨{ subject, victim
     isEmployer := gap_deontic_employer_act.1
     becauseOfTrait := corr_because dt.causation
     discriminates := gap_deontic_employer_act.2 }⟩













theorem s2000e3_elements_implies_ontology_modulo_gaps
    {r : Elements.Respondent} {p : Person} {pr : Elements.Practice}
    {c : ComplaintText} {a : Ontology.ProtectedActivity} {x : Ontology.EmploymentPractice}
    (ret : Elements.Retaliation r p pr c)
    (corr_activity :
      Elements.EngagedInProtectedActivity p c → Ontology.IsProtectedActivity a c)
    (gap_respondent_unlawful :
      Ontology.RespondentKind c ∧ Ontology.IsUnlawfulEmploymentPractice x c) :
    Ontology.RetaliationPractice x a c :=
  { respondent := gap_respondent_unlawful.1
    protected_ := corr_activity ret.protectedActivity
    isUnlawful := gap_respondent_unlawful.2 }










theorem s2000e3_elements_implies_deontic_modulo_gaps
    {r : Elements.Respondent} {p : Person} {pr : Elements.Practice} {c : ComplaintText}
    (subject victim : Deontic.LegalPerson)
    (ret : Elements.Retaliation r p pr c)
    (corr_activity :
      Elements.EngagedInProtectedActivity p c →
      Deontic.EngagedInProtectedActivity victim)
    (gap_retaliates : Deontic.RetaliatesAgainst subject victim) :

    Nonempty Deontic.RetaliationProhibition :=
  ⟨{ subject, victim
     protectedActivity := corr_activity ret.protectedActivity
     retaliates := gap_retaliates }⟩












theorem s2000e5_procedure_implies_elements
    {p : Person} {c : ComplaintText} {ch : Elements.Charge}
    {pp : Procedure.AggrievedParty}
    (pat : Procedure.PrivateActionTimely pp c)
    (corr_charge :
      Procedure.UnlawfulPracticeOccurred pp c →
      Procedure.ChargeFiledWithEEOC pp c →
      Elements.TimelyChargeFiled p ch c)
    (corr_rts :
      Procedure.RightToSueIssued pp c →
      Procedure.CivilActionCommenced pp c →
      Elements.RightToSueAndTimelySuit p c) :
    Elements.Exhaustion p ch c :=
  { timelyCharge := corr_charge pat.charge.practice pat.charge.filed
    rightToSue := corr_rts pat.suit.rightToSue pat.suit.commenced }

end Proving.USC.T42.TitleVII.Bridge
