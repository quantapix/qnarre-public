




























import Proving.USC.T42.SchoolDesegregationAid.Elements.Statute
import Proving.USC.T42.SchoolDesegregationAid.Deontic.Statute
import Proving.USC.T42.SchoolDesegregationAid.Ontology.Statute
import Proving.USC.T42.SchoolDesegregationAid.Procedure.Statute
import Proving.USC.T42.SchoolDesegregationAid.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Bridge

open Proving.USC.Common
open Proving.USC.T42
open Proving.USC.T42.SchoolDesegregationAid










axiom corr_unit_entity :
    Elements.PublicEducationalUnit → Entity




axiom corr_c_board {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.IsSchoolBoard u c → Ontology.IsSchoolBoard (corr_unit_entity u) c




theorem s2000c_elements_implies_ontology
    {u : Elements.PublicEducationalUnit} {tp : Elements.TrainingProgram}
    {c : ComplaintText}
    (h : Elements.InserviceTrainingGrantClaim u tp c)
    : Ontology.IsSchoolBoard (corr_unit_entity u) c :=
  corr_c_board h.schoolBoard










axiom corr_unit_board : Elements.PublicEducationalUnit → Deontic.SchoolBoard
axiom corr_unit_applicant : Elements.PublicEducationalUnit → Procedure.Applicant



axiom corr_resp_addressee {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.LegallyResponsibleForPublicSchool u c →
    Deontic.ApplicantInClass (corr_unit_board u) c



axiom corr_applied_appMade {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.ApplicationSubmitted u c → Deontic.ApplicationMade (corr_unit_board u) c



theorem s2000c2_elements_implies_deontic
    {u : Elements.PublicEducationalUnit} {pl : Elements.DesegregationPlan}
    {c : ComplaintText}
    (h : Elements.TechnicalAssistanceClaim u pl c)
    : Deontic.Power2000c2 (corr_unit_board u) c :=
  ⟨corr_resp_addressee h.responsible, corr_applied_appMade h.applied⟩



axiom corr_resp_eligible {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.LegallyResponsibleForPublicSchool u c →
    Procedure.IsEligibleApplicant (corr_unit_applicant u) c



axiom corr_applied_filed {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.ApplicationSubmitted u c →
    Procedure.AssistanceApplicationFiled (corr_unit_applicant u) c



theorem s2000c2_elements_implies_procedure
    {u : Elements.PublicEducationalUnit} {pl : Elements.DesegregationPlan}
    {c : ComplaintText}
    (h : Elements.TechnicalAssistanceClaim u pl c)
    : Procedure.EntryApplied (corr_unit_applicant u) c :=
  ⟨corr_resp_eligible h.responsible, corr_applied_filed h.applied⟩








axiom corr_board_addressee4 {u : Elements.PublicEducationalUnit} {c : ComplaintText} :
    Elements.IsSchoolBoard u c → Deontic.ApplicantInClass (corr_unit_board u) c



theorem s2000c4_elements_implies_deontic
    {u : Elements.PublicEducationalUnit} {tp : Elements.TrainingProgram}
    {c : ComplaintText}
    (h : Elements.InserviceTrainingGrantClaim u tp c)
    : Deontic.Power2000c4a (corr_unit_board u) c :=
  ⟨corr_board_addressee4 h.schoolBoard, corr_applied_appMade h.applied⟩












axiom corr_action_deontic {c : ComplaintText} :
    Elements.IsActionUnderSubchapter c → Deontic.ActionUnderSubchapter c



axiom corr_action_proc {c : ComplaintText} (q : Procedure.CourtProceeding) :
    Elements.IsActionUnderSubchapter c → Procedure.IsSubchapterProceeding q c






theorem s2000c7_elements_implies_deontic_modulo_gaps
    {c : ComplaintText}
    (h : Elements.UnitedStatesCostLiability c)
    (gap_usLiable : Deontic.UnitedStatesLiableForCosts c)
    : Deontic.Obligation2000c7Satisfied c :=
  ⟨corr_action_deontic h.underSubchapter, gap_usLiable⟩











axiom corr_savings {c : ComplaintText} :
    Deontic.NonProtectedBasis c → Deontic.ClassificationAndAssignmentMade c →
    Structure.SavingsClauseHonored Structure.edge_2000c9_savings_subchapter c




theorem s2000c9_deontic_implies_structure_modulo_gaps
    {c : ComplaintText}
    (h : Deontic.Permission2000c9Exercised c)
    (gap_scopeExists :
      Structure.ReferencedSectionExists Structure.edge_2000c9_savings_subchapter c)
    : Structure.Coherent2000c9 c :=
  ⟨gap_scopeExists, corr_savings h.1 h.2⟩

end Proving.USC.T42.SchoolDesegregationAid.Bridge
