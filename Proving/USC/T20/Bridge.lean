










































import Proving.USC.T20.Elements.Statute
import Proving.USC.T20.Deontic.Statute
import Proving.USC.T20.Ontology.Statute
import Proving.USC.T20.Procedure.Statute
import Proving.USC.T20.Structure.Statute

namespace Proving.USC.T20.Bridge

open Proving.USC.Common (Person Entity ComplaintText)










axiom dProg : Elements.EducationProgram → Deontic.Program

axiom dAg : Elements.FundingAgency → Deontic.Agency

axiom dRec : Elements.Recipient → Entity

axiom dAgOfAct : Elements.AgencyAction → Deontic.Agency

axiom dEntOfAct : Elements.AgencyAction → Entity


axiom oProg : Elements.EducationProgram → Ontology.EducationProgramOrActivity

axiom oAsst : Elements.EducationProgram → Ontology.FederalAssistance

axiom oInst : Elements.EducationalInstitution → Ontology.EducationalInstitution

axiom oAgE : Elements.FundingAgency → Ontology.FederalAgency

axiom oActE : Elements.AgencyAction → Ontology.AgencyAction


axiom pAg : Elements.FundingAgency → Procedure.Agency

axiom pRec : Elements.Recipient → Procedure.Recipient

axiom pAct : Elements.AgencyAction → Procedure.EnforcementAction


axiom pRuleOf : Elements.FundingAgency → Procedure.Rule

axiom pProgOf : Elements.FundingAgency → Procedure.EducationProgram

axiom pAgOfAct : Elements.AgencyAction → Procedure.Agency


axiom oInstD : Entity → Ontology.EducationalInstitution

axiom oAgD : Deontic.Agency → Ontology.FederalAgency


axiom oActD : Deontic.Agency → Ontology.AgencyAction

axiom pAgD : Deontic.Agency → Procedure.Agency

axiom pRecD : Entity → Procedure.Recipient


axiom eInstP : Procedure.EducationalInstitution → Elements.EducationalInstitution


axiom dProgP : Procedure.EducationalInstitution → Deontic.Program

axiom dAgP : Procedure.Agency → Deontic.Agency

axiom dRecP : Procedure.Recipient → Entity

axiom dEntOfActP : Procedure.EnforcementAction → Entity

axiom oAgP : Procedure.Agency → Ontology.FederalAgency

axiom oActP : Procedure.EnforcementAction → Ontology.AgencyAction





axiom corr_1681_person_ed {p : Person} {c : ComplaintText} :
    Proving.USC.Common.IsPersonInUS p c → Deontic.IsPersonInUS p c

axiom corr_1681_prog_ed {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsEducationProgramOrActivity prog c → Deontic.IsEducationProgram (dProg prog) c

axiom corr_1681_ffa_ed {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Deontic.ReceivesFederalFinancialAssistance (dProg prog) c


axiom corr_1681_discr_ed {p : Person} {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.OnBasisOfSex p prog c → Elements.Exclusion1681a p prog c →
    Deontic.SubjectedToSexDiscrimination p (dProg prog) c



axiom corr_1681_exemption_de {prog : Elements.EducationProgram}
    {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Deontic.ExemptionApplies1681a (dProg prog) c → ¬ Elements.NoExemptionApplies prog inst c


axiom corr_1681c_inst_eo {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.IsEducationalInstitution inst c → Ontology.IsEducationalInstitution (oInst inst) c

axiom corr_1681_prog_eo {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsEducationProgramOrActivity prog c → Ontology.IsEducationProgramOrActivity (oProg prog) c


axiom corr_1681_ffa_eo {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Ontology.IsFederalFinancialAssistance (oAsst prog) c


axiom corr_1681c_inst_do {e : Entity} {c : ComplaintText} :
    Deontic.IsEducationalInstitution e c → Ontology.IsEducationalInstitution (oInstD e) c




axiom corr_1681c_os {i : Ontology.EducationalInstitution} {c : ComplaintText} :
    Ontology.EducationalInstitutionDefinition i c →
    Structure.IncorporationHonored Structure.edge_1681a_incorporates_1681c c



axiom corr_1681a2_pe {inst : Procedure.EducationalInstitution} {c : ComplaintText} :
    Procedure.BeganTransitionToCoeducation inst c →
    Procedure.TransitionPlanApprovedBySecretary inst c →
    Procedure.CarryingOutApprovedPlan inst c →
    Procedure.WithinTransitionExemptionWindow inst c →
    Elements.TransitionPlanExemption (eInstP inst) c

axiom corr_1681a2_pd {inst : Procedure.EducationalInstitution} {c : ComplaintText} :
    Procedure.BeganTransitionToCoeducation inst c →
    Procedure.TransitionPlanApprovedBySecretary inst c →
    Procedure.CarryingOutApprovedPlan inst c →
    Procedure.WithinTransitionExemptionWindow inst c →
    Deontic.ExemptionApplies1681a (dProgP inst) c

axiom corr_1681a2_ps {inst : Procedure.EducationalInstitution} {c : ComplaintText} :
    Procedure.BeganTransitionToCoeducation inst c →
    Procedure.TransitionPlanApprovedBySecretary inst c →
    Procedure.CarryingOutApprovedPlan inst c →
    Procedure.WithinTransitionExemptionWindow inst c →
    Structure.ExceptionApplies Structure.edge_1681a_except_2 c



axiom corr_1681_exceptions_es {prog : Elements.EducationProgram}
    {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.NoExemptionApplies prog inst c →
    ∀ r, r ∈ Structure.exceptions_1681a → ¬ Structure.ExceptionApplies r c


axiom corr_1681_exemption_ds {prog : Deontic.Program} {c : ComplaintText} :
    Deontic.ExemptionApplies1681a prog c →
    ∃ r, r ∈ Structure.exceptions_1681a ∧ Structure.ExceptionApplies r c





theorem s1681_elements_implies_deontic {p : Person} {prog : Elements.EducationProgram}
    {inst : Elements.EducationalInstitution} {c : ComplaintText}
    (h : Elements.Section1681a p prog inst c) :
    Deontic.ProhibitionViolated1681a p (dProg prog) c :=
  ⟨⟨corr_1681_person_ed h.personInUS,
    corr_1681_prog_ed h.educationProgram,
    corr_1681_ffa_ed h.federalAssistance,
    fun hEx => corr_1681_exemption_de hEx h.noExemption⟩,
   corr_1681_discr_ed h.onBasisOfSex h.exclusion⟩



theorem s1681_elements_implies_ontology {prog : Elements.EducationProgram} {c : ComplaintText}
    (hProg : Elements.IsEducationProgramOrActivity prog c)
    (hFFA : Elements.ReceivesFederalFinancialAssistance prog c) :
    Ontology.CoveredProgramMembership (oProg prog) (oAsst prog) c :=
  ⟨corr_1681_prog_eo hProg, corr_1681_ffa_eo hFFA⟩


theorem s1681c_elements_implies_ontology {inst : Elements.EducationalInstitution}
    {c : ComplaintText} (h : Elements.IsEducationalInstitution inst c) :
    Ontology.IsEducationalInstitution (oInst inst) c :=
  corr_1681c_inst_eo h


theorem s1681c_deontic_implies_ontology {e : Entity} {c : ComplaintText}
    (h : Deontic.IsEducationalInstitution e c) :
    Ontology.IsEducationalInstitution (oInstD e) c :=
  corr_1681c_inst_do h



theorem s1681c_ontology_implies_structure {i : Ontology.EducationalInstitution}
    {c : ComplaintText} (h : Ontology.EducationalInstitutionDefinition i c) :
    Structure.IncorporationHonored Structure.edge_1681a_incorporates_1681c c :=
  corr_1681c_os h



theorem s1681a2_procedure_implies_elements {inst : Procedure.EducationalInstitution}
    {c : ComplaintText} (h : Procedure.TransitionExemption1681 inst c) :
    Elements.TransitionPlanExemption (eInstP inst) c :=
  corr_1681a2_pe h.began h.planApproved h.carryingOut h.inWindow



theorem s1681a2_procedure_implies_deontic {inst : Procedure.EducationalInstitution}
    {c : ComplaintText} (h : Procedure.TransitionExemption1681 inst c) :
    Deontic.ExemptionApplies1681a (dProgP inst) c :=
  corr_1681a2_pd h.began h.planApproved h.carryingOut h.inWindow



theorem s1681a2_procedure_implies_structure {inst : Procedure.EducationalInstitution}
    {c : ComplaintText} (h : Procedure.TransitionExemption1681 inst c) :
    Structure.Applicability1681a c :=
  .exempted Structure.edge_1681a_except_2
    (List.Mem.tail _ (List.Mem.head _))
    (corr_1681a2_ps h.began h.planApproved h.carryingOut h.inWindow)



theorem s1681_elements_implies_structure {prog : Elements.EducationProgram}
    {inst : Elements.EducationalInstitution} {c : ComplaintText}
    (h : Elements.NoExemptionApplies prog inst c) :
    Structure.Applicability1681a c :=
  .governed (corr_1681_exceptions_es h)


theorem s1681_deontic_implies_structure {prog : Deontic.Program} {c : ComplaintText}
    (h : Deontic.ExemptionApplies1681a prog c) :
    Structure.Applicability1681a c :=
  match corr_1681_exemption_ds h with
  | ⟨r, hMem, hApp⟩ => .exempted r hMem hApp




axiom corr_1682_agency_ed {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.EmpoweredToExtendFederalAssistance ag c →
    Deontic.IsFederalAgencyEmpoweredToAssist (dAg ag) c


axiom corr_1682_finding_ed {ag : Elements.FundingAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.OpportunityForHearingAfforded r c →
    Elements.ExpressFindingOfNoncomplianceOnRecord r c →
    Deontic.ExpressFindingAfterHearing (dAg ag) (dRec r) c

axiom corr_1682_other_ed {ag : Elements.FundingAgency} {act : Elements.AgencyAction}
    {c : ComplaintText} :
    Elements.OtherMeansAuthorizedByLaw act c → Deontic.OtherMeansAuthorizedByLaw (dAg ag) c


axiom corr_1682_empowered_ep {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.EmpoweredToExtendFederalAssistance ag c →
    Procedure.EmpoweredToExtendAssistance (pAg ag) (pProgOf ag) c

axiom corr_1682_issued_ep {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.IssuedRuleOfGeneralApplicability ag c →
    Procedure.RuleIssuedUnder1682 (pAg ag) (pRuleOf ag) c

axiom corr_1682_consistent_ep {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.RuleConsistentWithStatutoryObjectives ag c →
    Procedure.RuleConsistentWithStatuteObjectives (pRuleOf ag) c

axiom corr_1682_approved_ep {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.RuleApprovedByPresident ag c → Procedure.PresidentApprovedRule (pRuleOf ag) c

axiom corr_1682_advised_ep {ag : Elements.FundingAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.AdvisedPersonsOfNoncompliance ag r c →
    Procedure.AdvisedOfNoncompliance (pAg ag) (pRec r) c

axiom corr_1682_voluntary_ep {ag : Elements.FundingAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.DeterminedVoluntaryComplianceUnavailable ag r c →
    Procedure.VoluntaryComplianceUnsecurable (pAg ag) (pRec r) c

axiom corr_1682_hearing_ep {r : Elements.Recipient} {c : ComplaintText} :
    Elements.OpportunityForHearingAfforded r c → Procedure.OpportunityForHearing (pRec r) c

axiom corr_1682_finding_ep {ag : Elements.FundingAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.ExpressFindingOfNoncomplianceOnRecord r c →
    Procedure.ExpressFindingOnRecord (pAg ag) (pRec r) c

axiom corr_1682_scopeR_ep {act : Elements.AgencyAction} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundRecipient act r c →
    Procedure.TerminationLimitedToFoundRecipient (pAct act) (pRec r) c

axiom corr_1682_scopeP_ep {ag : Elements.FundingAgency} {act : Elements.AgencyAction}
    {c : ComplaintText} :
    Elements.TerminationLimitedToParticularProgram act c →
    Procedure.TerminationLimitedToFoundProgram (pAct act) (pProgOf ag) c

axiom corr_1682_report_ep {ag : Elements.FundingAgency} {act : Elements.AgencyAction}
    {c : ComplaintText} :
    Elements.FiledFullWrittenReportWithCommittees act c →
    Procedure.ReportFiledWithCommittees (pAg ag) (pAct act) c



axiom corr_1682_thirty_ep {act : Elements.AgencyAction} {c : ComplaintText} {n : Nat} :
    Elements.DaysElapsedSinceReportFiling act c n → 30 ≤ n →
    Procedure.ThirtyDaysElapsedAfterReport (pAct act) c


axiom corr_1682_finding_pd {a : Procedure.Agency} {r : Procedure.Recipient}
    {c : ComplaintText} :
    Procedure.ExpressFindingOnRecord a r c → Procedure.OpportunityForHearing r c →
    Deontic.ExpressFindingAfterHearing (dAgP a) (dRecP r) c


axiom corr_1682_other_pd {a : Procedure.Agency} {act : Procedure.EnforcementAction}
    {c : ComplaintText} :
    Procedure.OtherMeansAuthorizedByLaw a act c → Deontic.OtherMeansAuthorizedByLaw (dAgP a) c



axiom corr_1682_hearing_dp {a : Deontic.Agency} {e : Entity} {c : ComplaintText} :
    Deontic.ExpressFindingAfterHearing a e c → Procedure.OpportunityForHearing (pRecD e) c

axiom corr_1682_finding_dp {a : Deontic.Agency} {e : Entity} {c : ComplaintText} :
    Deontic.ExpressFindingAfterHearing a e c →
    Procedure.ExpressFindingOnRecord (pAgD a) (pRecD e) c

axiom corr_1682_other_dp {a : Deontic.Agency} {act : Procedure.EnforcementAction}
    {c : ComplaintText} :
    Deontic.OtherMeansAuthorizedByLaw a c → Procedure.OtherMeansAuthorizedByLaw (pAgD a) act c


axiom corr_1682_agency_eo {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.EmpoweredToExtendFederalAssistance ag c → Ontology.IsFederalAgency (oAgE ag) c

axiom corr_1682_agency_do {a : Deontic.Agency} {c : ComplaintText} :
    Deontic.IsFederalAgencyEmpoweredToAssist a c → Ontology.IsFederalAgency (oAgD a) c

axiom corr_1682_agency_po {a : Procedure.Agency} {prog : Procedure.EducationProgram}
    {c : ComplaintText} :
    Procedure.EmpoweredToExtendAssistance a prog c → Ontology.IsFederalAgency (oAgP a) c




axiom corr_1682_effectuates_es {ag : Elements.FundingAgency} {c : ComplaintText} :
    Elements.IssuedRuleOfGeneralApplicability ag c →
    Elements.RuleConsistentWithStatutoryObjectives ag c →
    Structure.IncorporationHonored Structure.edge_1682_incorporates_1681 c

axiom corr_1682_other_ds {a : Deontic.Agency} {c : ComplaintText} :
    Deontic.OtherMeansAuthorizedByLaw a c →
    Structure.SavingsPreserved Structure.edge_1682_savings_otherLaw c

axiom corr_1682_other_ps {a : Procedure.Agency} {act : Procedure.EnforcementAction}
    {c : ComplaintText} :
    Procedure.OtherMeansAuthorizedByLaw a act c →
    Structure.SavingsPreserved Structure.edge_1682_savings_otherLaw c


axiom corr_1682_requirement_os {q : Ontology.AdministrativeRequirement} {c : ComplaintText} :
    Ontology.IsSection1682Requirement q c →
    Structure.IncorporationHonored Structure.edge_1682_incorporates_1681 c





theorem s1682_elements_implies_deontic {ag : Elements.FundingAgency}
    {act : Elements.AgencyAction} {r : Elements.Recipient} {c : ComplaintText}
    (h : Elements.Compliance1682 ag act r c) :
    Deontic.ComplianceMeans1682 (dAg ag) (dRec r) c :=
  match h with
  | .termination ht => .termination (corr_1682_finding_ed ht.hearing ht.expressFinding)
  | .otherMeans _ _ _ hOther => .otherMeans (corr_1682_other_ed hOther)



theorem s1682_terminate_elements_implies_deontic {ag : Elements.FundingAgency}
    {act : Elements.AgencyAction} {r : Elements.Recipient} {c : ComplaintText}
    (h : Elements.LawfulTermination1682 ag act r c) :
    Deontic.Permission1682Terminate (dAg ag) (dRec r) c :=
  ⟨corr_1682_agency_ed h.rulemaking.empowered,
   corr_1682_finding_ed h.hearing h.expressFinding⟩



theorem s1682_rulemaking_elements_implies_procedure {ag : Elements.FundingAgency}
    {c : ComplaintText} (h : Elements.LawfulRulemaking1682 ag c) :
    Procedure.EffectiveRule1682 (pAg ag) (pProgOf ag) (pRuleOf ag) c :=
  ⟨corr_1682_empowered_ep h.empowered, corr_1682_issued_ep h.generalRule,
   corr_1682_consistent_ep h.consistent, corr_1682_approved_ep h.presidentialApproval⟩




theorem s1682_elements_implies_procedure {ag : Elements.FundingAgency}
    {act : Elements.AgencyAction} {r : Elements.Recipient} {c : ComplaintText}
    (h : Elements.LawfulTermination1682 ag act r c) :
    Procedure.TerminationEffective1682 (pAg ag) (pRec r) (pProgOf ag) (pAct act) c :=
  ⟨⟨corr_1682_advised_ep h.advised,
    corr_1682_voluntary_ep h.voluntaryUnavailable,
    corr_1682_hearing_ep h.hearing,
    corr_1682_finding_ep h.expressFinding,
    corr_1682_scopeR_ep h.limitedToRecipient,
    corr_1682_scopeP_ep h.limitedToProgram⟩,
   corr_1682_report_ep h.reportFiled,
   match h.thirtyDaysElapsed with
   | ⟨_, hDays, hGe⟩ => corr_1682_thirty_ep hDays hGe⟩



theorem s1682_procedure_implies_deontic {a : Procedure.Agency} {r : Procedure.Recipient}
    {prog : Procedure.EducationProgram} {act : Procedure.EnforcementAction}
    {c : ComplaintText}
    (h : Procedure.ComplianceMeans1682 a r prog act c) :
    Deontic.ComplianceMeans1682 (dAgP a) (dRecP r) c :=
  match h with
  | .termination ht => .termination (corr_1682_finding_pd ht.finding ht.hearing)
  | .otherMeans _ _ hAuth => .otherMeans (corr_1682_other_pd hAuth)








theorem s1682_deontic_implies_procedure_modulo_gaps {a : Deontic.Agency} {e : Entity}
    {prog : Procedure.EducationProgram} {act : Procedure.EnforcementAction}
    {c : ComplaintText}
    (h : Deontic.ComplianceMeans1682 a e c)
    (gap_advised : Procedure.AdvisedOfNoncompliance (pAgD a) (pRecD e) c)
    (gap_voluntaryUnsecurable : Procedure.VoluntaryComplianceUnsecurable (pAgD a) (pRecD e) c)
    (gap_scopeRecipient : Procedure.TerminationLimitedToFoundRecipient act (pRecD e) c)
    (gap_scopeProgram : Procedure.TerminationLimitedToFoundProgram act prog c) :
    Procedure.ComplianceMeans1682 (pAgD a) (pRecD e) prog act c :=
  match h with
  | .termination hf =>
      .termination ⟨gap_advised, gap_voluntaryUnsecurable,
        corr_1682_hearing_dp hf, corr_1682_finding_dp hf,
        gap_scopeRecipient, gap_scopeProgram⟩
  | .otherMeans hAuth =>
      .otherMeans gap_advised gap_voluntaryUnsecurable (corr_1682_other_dp hAuth)



theorem s1682_elements_implies_ontology {ag : Elements.FundingAgency} {c : ComplaintText}
    (h : Elements.EmpoweredToExtendFederalAssistance ag c) :
    Ontology.IsFederalAgency (oAgE ag) c :=
  corr_1682_agency_eo h



theorem s1682_deontic_implies_ontology {a : Deontic.Agency} {c : ComplaintText}
    (h : Deontic.IsFederalAgencyEmpoweredToAssist a c) :
    Ontology.IsFederalAgency (oAgD a) c :=
  corr_1682_agency_do h



theorem s1682_procedure_implies_ontology {a : Procedure.Agency}
    {prog : Procedure.EducationProgram} {c : ComplaintText}
    (h : Procedure.EmpoweredToExtendAssistance a prog c) :
    Ontology.IsFederalAgency (oAgP a) c :=
  corr_1682_agency_po h



theorem s1682_elements_implies_structure {ag : Elements.FundingAgency} {c : ComplaintText}
    (h : Elements.LawfulRulemaking1682 ag c) :
    Structure.IncorporationHonored Structure.edge_1682_incorporates_1681 c :=
  corr_1682_effectuates_es h.generalRule h.consistent


theorem s1682_deontic_implies_structure {a : Deontic.Agency} {c : ComplaintText}
    (h : Deontic.OtherMeansAuthorizedByLaw a c) :
    Structure.SavingsPreserved Structure.edge_1682_savings_otherLaw c :=
  corr_1682_other_ds h


theorem s1682_procedure_implies_structure {a : Procedure.Agency}
    {act : Procedure.EnforcementAction} {c : ComplaintText}
    (h : Procedure.OtherMeansAuthorizedByLaw a act c) :
    Structure.SavingsPreserved Structure.edge_1682_savings_otherLaw c :=
  corr_1682_other_ps h



theorem s1682_ontology_implies_structure {q : Ontology.AdministrativeRequirement}
    {c : ComplaintText} (h : Ontology.IsSection1682Requirement q c) :
    Structure.IncorporationHonored Structure.edge_1682_incorporates_1681 c :=
  corr_1682_requirement_os h





axiom corr_1683_aggr_ed {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrieved p act c → Deontic.IsPersonAggrieved p c

axiom corr_1683_term_ed {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionTerminatesOrRefusesAssistance act c →
    Deontic.TerminatedOrRefusedAssistance (dAgOfAct act) (dEntOfAct act) c

axiom corr_1683_notrev_ed {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.NotOtherwiseSubjectToJudicialReview act c →
    Deontic.ActionNotOtherwiseReviewable (dAgOfAct act) c


axiom corr_1683_under_ep {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionPursuantToSection1682 act c →
    Procedure.ActionUnder1682 (pAct act) (pAgOfAct act) c

axiom corr_1683_term_ep {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionTerminatesOrRefusesAssistance act c →
    Procedure.TerminatesOrRefusesAssistance (pAct act) c


axiom corr_1683_polarity_ep {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.NotOtherwiseSubjectToJudicialReview act c →
    ¬ Procedure.OtherwiseSubjectToJudicialReview (pAct act) c

axiom corr_1683_aggr_ep {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrieved p act c → Procedure.PersonAggrieved p (pAct act) c


axiom corr_1683_aggr_pd {p : Person} {act : Procedure.EnforcementAction} {c : ComplaintText} :
    Procedure.PersonAggrieved p act c → Deontic.IsPersonAggrieved p c


axiom corr_1683_term_pd {act : Procedure.EnforcementAction} {a : Procedure.Agency}
    {c : ComplaintText} :
    Procedure.ActionUnder1682 act a c → Procedure.TerminatesOrRefusesAssistance act c →
    Deontic.TerminatedOrRefusedAssistance (dAgP a) (dEntOfActP act) c

axiom corr_1683_notrev_pd {act : Procedure.EnforcementAction} {a : Procedure.Agency}
    {c : ComplaintText} :
    Procedure.ActionUnder1682 act a c → ¬ Procedure.OtherwiseSubjectToJudicialReview act c →
    Deontic.ActionNotOtherwiseReviewable (dAgP a) c



axiom corr_1683_action_eo {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionPursuantToSection1682 act c →
    Ontology.IsSection1682EnforcementAction (oActE act) c

axiom corr_1683_aggr_eo {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrieved p act c → Ontology.IsPersonAggrieved p (oActE act) c


axiom corr_1683_action_po {act : Procedure.EnforcementAction} {a : Procedure.Agency}
    {c : ComplaintText} :
    Procedure.ActionUnder1682 act a c → Ontology.IsSection1682EnforcementAction (oActP act) c

axiom corr_1683_aggr_po {p : Person} {act : Procedure.EnforcementAction} {c : ComplaintText} :
    Procedure.PersonAggrieved p act c → Ontology.IsPersonAggrieved p (oActP act) c



axiom corr_1683_do {p : Person} {a : Deontic.Agency} {e : Entity} {c : ComplaintText} :
    Deontic.IsPersonAggrieved p c → Deontic.TerminatedOrRefusedAssistance a e c →
    Ontology.AggrievedPersonMembership p (oActD a) c



axiom corr_1683_ordinary_es {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.OtherwiseReviewableByLaw act c →
    Structure.SavingsPreserved Structure.edge_1683_savings_otherReview c


axiom corr_1683_ch7_es {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.NotOtherwiseSubjectToJudicialReview act c →
    Structure.ReferencedSectionExists Structure.edge_1683_incorporates_5ch7 c


axiom corr_1683_override_es {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.NotOtherwiseSubjectToJudicialReview act c →
    Structure.OverrideTriggered Structure.edge_1683_notwithstanding_5s701 c

axiom corr_1683_ch7_ps {act : Procedure.EnforcementAction} {c : ComplaintText} :
    ¬ Procedure.OtherwiseSubjectToJudicialReview act c →
    Structure.ReferencedSectionExists Structure.edge_1683_incorporates_5ch7 c

axiom corr_1683_override_ps {act : Procedure.EnforcementAction} {c : ComplaintText} :
    ¬ Procedure.OtherwiseSubjectToJudicialReview act c →
    Structure.OverrideTriggered Structure.edge_1683_notwithstanding_5s701 c

axiom corr_1683_ch7_ds {a : Deontic.Agency} {c : ComplaintText} :
    Deontic.ActionNotOtherwiseReviewable a c →
    Structure.ReferencedSectionExists Structure.edge_1683_incorporates_5ch7 c

axiom corr_1683_override_ds {a : Deontic.Agency} {c : ComplaintText} :
    Deontic.ActionNotOtherwiseReviewable a c →
    Structure.OverrideTriggered Structure.edge_1683_notwithstanding_5s701 c


axiom corr_1683_action_os {act : Ontology.AgencyAction} {c : ComplaintText} :
    Ontology.IsSection1682EnforcementAction act c →
    Structure.IncorporationHonored Structure.edge_1683_incorporates_1682 c





theorem s1683_elements_implies_deontic {p : Person} {act : Elements.AgencyAction}
    {c : ComplaintText} (h : Elements.Section1683Review p act c) :
    Deontic.Permission1683Review p (dAgOfAct act) (dEntOfAct act) c :=
  ⟨corr_1683_aggr_ed h.aggrieved,
   corr_1683_term_ed h.terminatesAssistance,
   corr_1683_notrev_ed h.notOtherwiseReviewable⟩



theorem s1683_elements_implies_procedure {p : Person} {act : Elements.AgencyAction}
    {c : ComplaintText} (h : Elements.Section1683Review p act c) :
    Procedure.ApaReviewAvailable1683 p (pAct act) (pAgOfAct act) c :=
  ⟨corr_1683_under_ep h.pursuantTo1682,
   corr_1683_term_ep h.terminatesAssistance,
   corr_1683_polarity_ep h.notOtherwiseReviewable,
   corr_1683_aggr_ep h.aggrieved⟩


theorem s1683_procedure_implies_deontic {p : Person} {act : Procedure.EnforcementAction}
    {a : Procedure.Agency} {c : ComplaintText}
    (h : Procedure.ApaReviewAvailable1683 p act a c) :
    Deontic.Permission1683Review p (dAgP a) (dEntOfActP act) c :=
  ⟨corr_1683_aggr_pd h.aggrieved,
   corr_1683_term_pd h.under1682 h.terminating,
   corr_1683_notrev_pd h.under1682 h.notOtherwise⟩



theorem s1683_elements_implies_ontology {p : Person} {act : Elements.AgencyAction}
    {c : ComplaintText} (h : Elements.Section1683Review p act c) :
    Ontology.AggrievedPersonMembership p (oActE act) c :=
  ⟨corr_1683_action_eo h.pursuantTo1682, corr_1683_aggr_eo h.aggrieved⟩



theorem s1683_procedure_implies_ontology {p : Person} {act : Procedure.EnforcementAction}
    {a : Procedure.Agency} {c : ComplaintText}
    (h : Procedure.ApaReviewAvailable1683 p act a c) :
    Ontology.AggrievedPersonMembership p (oActP act) c :=
  ⟨corr_1683_action_po h.under1682, corr_1683_aggr_po h.aggrieved⟩



theorem s1683_deontic_implies_ontology {p : Person} {a : Deontic.Agency} {e : Entity}
    {c : ComplaintText} (h : Deontic.Permission1683Review p a e c) :
    Ontology.AggrievedPersonMembership p (oActD a) c :=
  corr_1683_do h.addressee h.enforcementAction



theorem s1683_elements_implies_structure {p : Person} {act : Elements.AgencyAction}
    {c : ComplaintText} (h : Elements.JudicialReview1683 p act c) :
    Structure.ReviewPath1683 c :=
  match h with
  | .ordinary _ hRev => .otherwiseProvided (corr_1683_ordinary_es hRev)
  | .apa hr => .apaDefault (corr_1683_ch7_es hr.notOtherwiseReviewable)
      (corr_1683_override_es hr.notOtherwiseReviewable)


theorem s1683_procedure_implies_structure {p : Person} {act : Procedure.EnforcementAction}
    {a : Procedure.Agency} {c : ComplaintText}
    (h : Procedure.ApaReviewAvailable1683 p act a c) :
    Structure.ReviewPath1683 c :=
  .apaDefault (corr_1683_ch7_ps h.notOtherwise) (corr_1683_override_ps h.notOtherwise)



theorem s1683_deontic_implies_structure {p : Person} {a : Deontic.Agency} {e : Entity}
    {c : ComplaintText} (h : Deontic.Permission1683Review p a e c) :
    Structure.ReviewPath1683 c :=
  .apaDefault (corr_1683_ch7_ds h.condition) (corr_1683_override_ds h.condition)



theorem s1683_ontology_implies_structure {act : Ontology.AgencyAction} {c : ComplaintText}
    (h : Ontology.IsSection1682EnforcementAction act c) :
    Structure.IncorporationHonored Structure.edge_1683_incorporates_1682 c :=
  corr_1683_action_os h

end Proving.USC.T20.Bridge
