



























import Proving.USC.T20.Ch38.Reearn.Elements.Statute
import Proving.USC.T20.Ch38.Reearn.Deontic.Statute
import Proving.USC.T20.Ch38.Reearn.Ontology.Statute
import Proving.USC.T20.Ch38.Reearn.Procedure.Statute
import Proving.USC.T20.Ch38.Reearn.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Bridge

open Proving.USC.Common









axiom dRecipient : Elements.Recipient → Deontic.Recipient

axiom dRecipientOfInst : Elements.EducationalInstitution → Deontic.Recipient

axiom dProg : Elements.EducationProgram → Deontic.EducationProgramOrActivity

axiom dCourse : Elements.CourseOfStudy → Deontic.CourseOfStudy

axiom dAgency : Elements.FederalAgency → Deontic.FederalAgency

axiom dAction : Elements.AgencyAction → Deontic.EnforcementAction

axiom dReport : Elements.AgencyAction → Deontic.CongressionalReport

axiom dTaskForce : Elements.TaskForce → Deontic.TaskForce

axiom dAnnualReport : Elements.TaskForce → Deontic.CongressionalReport

axiom dFacility : Elements.EducationalInstitution → Deontic.LivingFacility

axiom entOf : Elements.EducationProgram → Entity


axiom oProg : Elements.EducationProgram → Ontology.ProgramOrActivity

axiom oEntity : Elements.EducationProgram → Ontology.CoveredEntity

axiom oInst : Elements.EducationalInstitution → Ontology.EducationalInstitution

axiom oRecipient : Elements.Recipient → Ontology.Recipient

axiom oCourse : Elements.CourseOfStudy → Ontology.CourseOfStudy

axiom oGroundOf : Person → Ontology.ProtectedGround

axiom oFacility : Elements.EducationalInstitution → Ontology.LivingFacility

axiom oTaskForce : Elements.TaskForce → Ontology.TaskForce

axiom oAgency : Elements.FederalAgency → Ontology.FederalAgency


axiom doProg : Deontic.EducationProgramOrActivity → Ontology.ProgramOrActivity

axiom doEntity : Entity → Ontology.CoveredEntity

axiom doEntityOfRecipient : Deontic.Recipient → Ontology.CoveredEntity

axiom doInst : Deontic.Recipient → Ontology.EducationalInstitution

axiom doRecipient : Deontic.Recipient → Ontology.Recipient

axiom doCourse : Deontic.CourseOfStudy → Ontology.CourseOfStudy

axiom doFacility : Deontic.LivingFacility → Ontology.LivingFacility

axiom doService : Deontic.AbortionRelatedService → Ontology.BenefitOrService


axiom pAgency : Elements.FederalAgency → Procedure.FederalAgency

axiom pRecipient : Elements.Recipient → Procedure.Recipient

axiom pProg : Elements.EducationProgram → Procedure.EducationProgram

axiom pRule : Elements.FederalAgency → Procedure.AgencyRule

axiom pHearing : Elements.AgencyAction → Procedure.AdministrativeHearing

axiom pAction : Elements.AgencyAction → Procedure.EnforcementAction

axiom pReport : Elements.AgencyAction → Procedure.ComplianceReport

axiom pPetition : Elements.AgencyAction → Procedure.JudicialReviewPetition

axiom pParty : Person → Procedure.AggrievedParty

axiom pTaskForce : Elements.TaskForce → Procedure.TaskForce

axiom pRecommendations : Elements.TaskForce → Procedure.TaskForceRecommendations

axiom pAnnualReport : Elements.TaskForce → Procedure.AnnualReport


axiom epInst : Procedure.EducationProgram → Elements.EducationalInstitution

axiom dpRecipient : Procedure.EducationProgram → Deontic.Recipient

axiom dpPerson : Procedure.AggrievedParty → Person

axiom dpAction : Procedure.EnforcementAction → Deontic.EnforcementAction

axiom dpTaskForce : Deontic.TaskForce → Procedure.TaskForce

axiom dpService : Person → Deontic.AbortionRelatedService

axiom opService : Person → Ontology.BenefitOrService

axiom penalizingRecipient : Person → Elements.Recipient











axiom corr_o_operations {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.CoveredEntity1687 prog c → Ontology.IsAllOperationsOf (oProg prog) (oEntity prog) c


axiom corr_o_class_govInstr {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsStateOrLocalGovernmentInstrumentality prog c →
    Ontology.IsStateOrLocalGovernmentInstrumentality (oEntity prog) c

axiom corr_o_class_distributor {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsStateOrLocalAssistanceDistributingEntity prog c →
    Ontology.IsDistributingStateOrLocalGovernmentEntity (oEntity prog) c

axiom corr_o_class_postsecondary {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsPostsecondaryInstitutionOrSystem prog c →
    Ontology.IsCollegeUniversityOrPostsecondaryInstitution (oEntity prog) c

axiom corr_o_class_schoolSystem {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsLocalEducationalAgencyOrSchoolSystem prog c →
    Ontology.IsLocalEducationalAgencyOrSchoolSystem (oEntity prog) c

axiom corr_o_class_whollyAssisted {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsWhollyAssistedPrivateOrganization prog c →
    Ontology.IsWholePrivateOrganizationExtendedAssistance (oEntity prog) c

axiom corr_o_class_eduBusiness {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsEducationOrSocialServicePrivateOrganization prog c →
    Ontology.IsPrincipallyEngagedInCoveredBusiness (oEntity prog) c

axiom corr_o_class_separateFacility {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsAssistedGeographicallySeparateFacility prog c →
    Ontology.IsGeographicallySeparateFacilityExtendedAssistance (oEntity prog) c

axiom corr_o_class_joint {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsJointEntityOfCoveredEntities prog c →
    Ontology.IsEntityEstablishedByTwoOrMoreCoveredEntities (oEntity prog) c



theorem corr_o_entityClass {prog : Elements.EducationProgram} {c : ComplaintText}
    (h : Elements.CoveredEntity1687 prog c) : Ontology.CoveredEntityClass (oEntity prog) c := by
  cases h with
  | stateInstrumentality h => exact .governmentInstrumentality (corr_o_class_govInstr h)
  | stateDistributor h => exact .distributingGovernmentEntity (corr_o_class_distributor h)
  | postsecondary h => exact .postsecondaryInstitution (corr_o_class_postsecondary h)
  | schoolSystem h => exact .schoolSystem (corr_o_class_schoolSystem h)
  | whollyAssistedPrivate h => exact .privateOrganization (.assistedAsWhole (corr_o_class_whollyAssisted h))
  | educationBusinessPrivate h => exact .privateOrganization (.principallyEngaged (corr_o_class_eduBusiness h))
  | separateFacility h => exact .separateFacility (corr_o_class_separateFacility h)
  | jointEntity h => exact .jointlyEstablishedEntity (corr_o_class_joint h)



axiom corr_o_funded {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Ontology.SomePartExtendedFederalFinancialAssistance (oEntity prog) c




axiom corr_o_relig_rev {prog : Elements.EducationProgram} {c : ComplaintText} :
    Ontology.IsReligiouslyControlledExemptOperation (oProg prog) c →
    Elements.ReligiouslyControlledOperationInconsistentWithTenets prog c




axiom corr_o_member_of_definiens {po : Ontology.ProgramOrActivity}
    {eo : Ontology.CoveredEntity} {c : ComplaintText} :
    Ontology.IsAllOperationsOf po eo c → Ontology.CoveredEntityClass eo c →
    Ontology.SomePartExtendedFederalFinancialAssistance eo c →
    ¬ Ontology.IsReligiouslyControlledExemptOperation po c →
    Ontology.IsProgramOrActivity po c


theorem s1687_elements_implies_ontology {prog : Elements.EducationProgram} {c : ComplaintText}
    (h : Elements.ProgramOrActivity1687 prog c) :
    Ontology.ProgramOrActivityMembership (oProg prog) (oEntity prog) c :=
  let hops := corr_o_operations h.entity
  let hcls := corr_o_entityClass h.entity
  let hfun := corr_o_funded h.funded
  let hrel : ¬ Ontology.IsReligiouslyControlledExemptOperation (oProg prog) c :=
    fun hx => h.notReligiouslyExempt (corr_o_relig_rev hx)
  ⟨hops, hcls, hfun, hrel, corr_o_member_of_definiens hops hcls hfun hrel⟩



axiom corr_ed_coveredOps {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.CoveredEntity1687 prog c →
    Deontic.IsCoveredEntityOperations1687 (entOf prog) (dProg prog) c

axiom corr_ed_anyPart {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Deontic.AnyPartExtendedFederalFinancialAssistance1687 (entOf prog) c

axiom corr_ed_relig_rev {prog : Elements.EducationProgram} {c : ComplaintText} :
    Deontic.ReligiousControlledOperationExcluded1687 (entOf prog) (dProg prog) c →
    Elements.ReligiouslyControlledOperationInconsistentWithTenets prog c


theorem s1687_elements_implies_deontic {prog : Elements.EducationProgram} {c : ComplaintText}
    (h : Elements.ProgramOrActivity1687 prog c) :
    Deontic.IsProgramOrActivity1687 (entOf prog) (dProg prog) c :=
  ⟨⟨corr_ed_coveredOps h.entity, corr_ed_anyPart h.funded⟩,
   fun hx => h.notReligiouslyExempt (corr_ed_relig_rev hx)⟩



axiom corr_do_operations {e : Entity} {prog : Deontic.EducationProgramOrActivity}
    {c : ComplaintText} :
    Deontic.IsCoveredEntityOperations1687 e prog c →
    Ontology.IsAllOperationsOf (doProg prog) (doEntity e) c


axiom corr_do_class {e : Entity} {prog : Deontic.EducationProgramOrActivity}
    {c : ComplaintText} :
    Deontic.IsCoveredEntityOperations1687 e prog c → Ontology.CoveredEntityClass (doEntity e) c

axiom corr_do_funded {e : Entity} {c : ComplaintText} :
    Deontic.AnyPartExtendedFederalFinancialAssistance1687 e c →
    Ontology.SomePartExtendedFederalFinancialAssistance (doEntity e) c

axiom corr_do_relig_rev {e : Entity} {prog : Deontic.EducationProgramOrActivity}
    {c : ComplaintText} :
    Ontology.IsReligiouslyControlledExemptOperation (doProg prog) c →
    Deontic.ReligiousControlledOperationExcluded1687 e prog c


theorem s1687_deontic_implies_ontology {e : Entity}
    {prog : Deontic.EducationProgramOrActivity} {c : ComplaintText}
    (h : Deontic.IsProgramOrActivity1687 e prog c) :
    Ontology.ProgramOrActivityMembership (doProg prog) (doEntity e) c :=
  let hops := corr_do_operations h.1.coveredOperations
  let hcls := corr_do_class h.1.coveredOperations
  let hfun := corr_do_funded h.1.anyPartAssisted
  let hrel : ¬ Ontology.IsReligiouslyControlledExemptOperation (doProg prog) c :=
    fun hx => h.2 (corr_do_relig_rev hx)
  ⟨hops, hcls, hfun, hrel, corr_o_member_of_definiens hops hcls hfun hrel⟩












axiom corr_s_chapterScope {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ProgramOrActivity1687 prog c →
    Structure.DefinitionalScopeSatisfied Structure.edge_1687_incorporates_ch38 c


axiom corr_s_leaHonored {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsLocalEducationalAgencyOrSchoolSystem prog c →
    Structure.IncorporationHonored Structure.edge_1687_incorporates_20usc7801 c

axiom corr_s_leaExists {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsLocalEducationalAgencyOrSchoolSystem prog c →
    Structure.ReferencedSectionExists Structure.edge_1687_incorporates_20usc7801 c


axiom corr_s_religCarve {prog : Elements.EducationProgram} {c : ComplaintText} :
    ¬ Elements.ReligiouslyControlledOperationInconsistentWithTenets prog c →
    Structure.ExceptionHonored Structure.edge_1687_exceptAsProvided_1681 c

axiom corr_s_s1681Exists {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ProgramOrActivity1687 prog c →
    Structure.ReferencedSectionExists Structure.edge_1687_exceptAsProvided_1681 c




theorem s1687_elements_lea_implies_structure {prog : Elements.EducationProgram}
    {c : ComplaintText}
    (hlea : Elements.IsLocalEducationalAgencyOrSchoolSystem prog c)
    (h : Elements.ProgramOrActivity1687 prog c) :
    Structure.Section1687IncorporationsResolve c :=
  ⟨corr_s_chapterScope h, corr_s_leaHonored hlea, corr_s_leaExists hlea,
   corr_s_religCarve h.notReligiouslyExempt, corr_s_s1681Exists h⟩










axiom corr_1681_person {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Deontic.IsPersonInUnitedStates p c


axiom corr_1681_addressee {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.DefendantIsFundingRecipient r c → Elements.IsEducationProgram prog c →
    Deontic.OperatesEducationProgramOrActivity1681a (dRecipient r) (dProg prog) c

axiom corr_1681_condition {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Deontic.ReceivesFederalFinancialAssistance (dProg prog) c


axiom corr_1681_act {p : Person} {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.DiscriminationTheory1681a p r prog c → Elements.OnTheBasisOfSex p prog c →
    Deontic.SexBasedExclusionDenialOrDiscrimination1681a p (dRecipient r) (dProg prog) c








axiom corr_1681a1_rev {p : Person} {r : Elements.Recipient}
    {inst : Elements.EducationalInstitution} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Deontic.AdmissionsClauseInapplicableInstitution1681a1 (dRecipient r) (dProg prog) c →
    Elements.Exemption1681a1 p inst c

axiom corr_1681a2_rev {p : Person} {r : Elements.Recipient}
    {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Deontic.AdmissionsTransitionPlanPeriod1681a2 (dRecipient r) c →
    Elements.Exemption1681a2 p inst c

axiom corr_1681a3_rev {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {c : ComplaintText} :
    Deontic.ReligiousOrganizationControlInconsistent1681a3 (dRecipient r) c →
    Elements.ReligiouslyControlledInstitutionInconsistentWithTenets inst c

axiom corr_1681a4_rev {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {c : ComplaintText} :
    Deontic.MilitaryOrMerchantMarineTrainingPurpose1681a4 (dRecipient r) c →
    Elements.MilitaryOrMerchantMarineTrainingInstitution inst c

axiom corr_1681a5_rev {p : Person} {r : Elements.Recipient}
    {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Deontic.TraditionallySingleSexPublicUndergraduateAdmissions1681a5 (dRecipient r) c →
    Elements.Exemption1681a5 p inst c

axiom corr_1681a6_rev {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Deontic.ExemptMembershipPractices1681a6 (dRecipient r) c →
    Elements.MembershipPracticeExemption1681a6 prog c

axiom corr_1681a7_rev {prog : Elements.EducationProgram} {c : ComplaintText} :
    Deontic.YouthConferenceProgramOrActivity1681a7 (dProg prog) c →
    Elements.ConferenceActivityExemption1681a7 prog c

axiom corr_1681a9_rev {p : Person} {r : Elements.Recipient} {c : ComplaintText} :
    Deontic.SingleSexPageantScholarship1681a9 (dRecipient r) c → Elements.Exemption1681a9 p c










theorem s1681_elements_implies_deontic_modulo_gaps
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (gap_s1681_a8_escape_unconditional :
      (∃ act : Deontic.SexSeparateActivity,
        Deontic.FatherSonOrMotherDaughterActivity1681a8 act c) →
      Elements.Exemption1681a8 prog c)
    (h : Elements.Section1681a p r inst prog c) :
    Deontic.Prohibition1681aViolated p (dRecipient r) (dProg prog) c :=
  ⟨⟨corr_1681_person h.personInUS,
    corr_1681_addressee h.recipientDefendant h.coverage.educational,
    corr_1681_condition h.coverage.scope.funded⟩,
   corr_1681_act h.theory h.basisOfSex,
   fun hx =>
     match hx with
     | .inl h1 => h.notAdmissionsUncovered (corr_1681a1_rev h1)
     | .inr (.inl h2) => h.notTransitional (corr_1681a2_rev h2)
     | .inr (.inr (.inl h3)) => h.notReligiouslyControlled (corr_1681a3_rev h3)
     | .inr (.inr (.inr (.inl h4))) => h.notMilitaryTraining (corr_1681a4_rev h4)
     | .inr (.inr (.inr (.inr (.inl h5)))) => h.notTraditionalSingleSex (corr_1681a5_rev h5)
     | .inr (.inr (.inr (.inr (.inr (.inl h6))))) =>
         h.notMembershipPractice (corr_1681a6_rev h6)
     | .inr (.inr (.inr (.inr (.inr (.inr (.inl h7)))))) =>
         h.notConferenceActivity (corr_1681a7_rev h7)
     | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl h9))))))) =>
         h.notPageantScholarship (corr_1681a9_rev h9)
     | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr h8))))))) =>
         h.notParentChildActivity (gap_s1681_a8_escape_unconditional h8)⟩


axiom corr_o_educational {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.IsEducationProgram prog c → Ontology.IsEducationProgramOrActivity (oProg prog) c

axiom corr_o_receiving {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance prog c →
    Ontology.ReceivesFederalFinancialAssistance (oProg prog) c


theorem s1681_elements_implies_ontology
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (h : Elements.Section1681a p r inst prog c) :
    Ontology.CoveredEducationProgram (oProg prog) (oEntity prog) c :=
  ⟨s1687_elements_implies_ontology h.coverage.scope,
   corr_o_educational h.coverage.educational,
   corr_o_receiving h.coverage.scope.funded⟩



axiom corr_do1681_membership {r : Deontic.Recipient}
    {prog : Deontic.EducationProgramOrActivity} {c : ComplaintText} :
    Deontic.OperatesEducationProgramOrActivity1681a r prog c →
    Ontology.ProgramOrActivityMembership (doProg prog) (doEntityOfRecipient r) c

axiom corr_do1681_educational {r : Deontic.Recipient}
    {prog : Deontic.EducationProgramOrActivity} {c : ComplaintText} :
    Deontic.OperatesEducationProgramOrActivity1681a r prog c →
    Ontology.IsEducationProgramOrActivity (doProg prog) c

axiom corr_do1681_receiving {prog : Deontic.EducationProgramOrActivity} {c : ComplaintText} :
    Deontic.ReceivesFederalFinancialAssistance prog c →
    Ontology.ReceivesFederalFinancialAssistance (doProg prog) c


theorem s1681_deontic_implies_ontology
    {p : Person} {r : Deontic.Recipient} {prog : Deontic.EducationProgramOrActivity}
    {c : ComplaintText} (h : Deontic.Prohibition1681aViolated p r prog c) :
    Ontology.CoveredEducationProgram (doProg prog) (doEntityOfRecipient r) c :=
  ⟨corr_do1681_membership h.1.addressee,
   corr_do1681_educational h.1.addressee,
   corr_do1681_receiving h.1.condition⟩





axiom corr_pe_admissions {p : Person} {prog : Procedure.EducationProgram}
    {c : ComplaintText} :
    Procedure.AdmissionsActionChallenged prog c → Elements.ClaimConcernsAdmissions p c


axiom corr_pe_window {pl : Procedure.TransitionPlan} {prog : Procedure.EducationProgram}
    {c : ComplaintText} :
    Procedure.TransitionPlanApprovedBySecretary pl prog c →
    Procedure.CarryingOutApprovedTransitionPlan pl prog c →
    Procedure.WithinAdmissionsTransitionExemption prog c →
    Elements.WithinAdmissionsTransitionPlanExemption (epInst prog) c

axiom corr_pd_window {pl : Procedure.TransitionPlan} {prog : Procedure.EducationProgram}
    {c : ComplaintText} :
    Procedure.TransitionPlanApprovedBySecretary pl prog c →
    Procedure.CarryingOutApprovedTransitionPlan pl prog c →
    Procedure.WithinAdmissionsTransitionExemption prog c →
    Deontic.AdmissionsTransitionPlanPeriod1681a2 (dpRecipient prog) c


theorem s1681a2_procedure_implies_elements
    {p : Person} {pl : Procedure.TransitionPlan} {prog : Procedure.EducationProgram}
    {c : ComplaintText} (h : Procedure.AdmissionsTransitionExemption pl prog c) :
    Elements.Exemption1681a2 p (epInst prog) c :=
  ⟨corr_pe_admissions h.admissionsAction,
   corr_pe_window h.planApproved h.carryingOutPlan h.withinWindow⟩


theorem s1681a2_procedure_implies_deontic
    {pl : Procedure.TransitionPlan} {prog : Procedure.EducationProgram} {c : ComplaintText}
    (h : Procedure.AdmissionsTransitionExemption pl prog c) :
    Deontic.AdmissionsTransitionPlanPeriod1681a2 (dpRecipient prog) c :=
  corr_pd_window h.planApproved h.carryingOutPlan h.withinWindow










axiom corr_1682_empowered {ag : Elements.FederalAgency} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.AgencyEmpoweredToExtendAssistance ag prog c →
    Deontic.EmpoweredToExtendFederalFinancialAssistance (dAgency ag) (dProg prog) c


axiom corr_1682_termination {act : Elements.AgencyAction} {ag : Elements.FederalAgency}
    {c : ComplaintText} :
    Elements.ExpressFindingOnRecordAfterHearing act c →
    Deontic.ComplianceEffectedByTerminationOrRefusal1682 (dAgency ag) (dAction act) c

axiom corr_1682_limitR {act : Elements.AgencyAction} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundRecipient act c →
    Deontic.TerminationLimitedToFoundRecipient1682 (dAction act) (dRecipient r) c

axiom corr_1682_limitP {act : Elements.AgencyAction} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.TerminationLimitedToNoncompliantProgram act c →
    Deontic.TerminationLimitedToNoncompliantProgram1682 (dAction act) (dProg prog) c

axiom corr_1682_report {act : Elements.AgencyAction} {ag : Elements.FederalAgency}
    {c : ComplaintText} :
    Elements.WrittenReportFiledWithCongressionalCommittees act c →
    Deontic.WrittenReportFiledWithCommittees1682 (dAgency ag) (dAction act) (dReport act) c


axiom corr_1682_days30 {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ThirtyDaysElapsedAfterReport act c →
    30 ≤ Deontic.daysFromReportFilingToActionEffective1682 (dAction act) (dReport act) c




theorem s1682_elements_implies_deontic
    {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {prog : Elements.EducationProgram} {act : Elements.AgencyAction} {c : ComplaintText}
    (h : Elements.FundTerminationAction1682 ag r prog act c) :
    Deontic.Power1682EnforcementExercised (dAgency ag) (dProg prog) (dAction act) c
    ∧ ¬ Deontic.Obligation1682TerminationLimitsBreached
          (dAgency ag) (dRecipient r) (dProg prog) (dAction act) c
    ∧ ¬ Deontic.Obligation1682CongressionalReportBreached (dAgency ag) (dAction act) c
    ∧ ¬ Deontic.Prohibition1682ThirtyDayBarViolated
          (dAgency ag) (dAction act) (dReport act) c :=
  ⟨⟨⟨corr_1682_empowered h.prerequisites.empowered⟩,
    Or.inl (corr_1682_termination h.expressFinding)⟩,
   fun hb => hb.2 ⟨corr_1682_limitR h.limitedToRecipient, corr_1682_limitP h.limitedToProgram⟩,
   fun hb => hb.2 ⟨dReport act, corr_1682_report h.reportFiled⟩,
   fun hb => absurd hb.1.withinThirtyDays (Nat.not_lt.mpr (corr_1682_days30 h.thirtyDays))⟩


axiom corr_o1682_agency {ag : Elements.FederalAgency} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.AgencyEmpoweredToExtendAssistance ag prog c →
    Ontology.IsFederalDepartmentOrAgency (oAgency ag) c

axiom corr_o1682_empowered {ag : Elements.FederalAgency} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.AgencyEmpoweredToExtendAssistance ag prog c →
    Ontology.IsEmpoweredToExtendFederalFinancialAssistance (oAgency ag) c

axiom corr_o1682_recipient {r : Elements.Recipient} {c : ComplaintText} :
    Elements.DefendantIsFundingRecipient r c →
    Ontology.IsRecipientOfFederalFinancialAssistance (oRecipient r) c


theorem s1682_elements_implies_ontology
    {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (h : Elements.EnforcementPrerequisites1682 ag r prog c) :
    Ontology.EnforcingAgencyMembership (oAgency ag) c :=
  ⟨corr_o1682_agency h.empowered, corr_o1682_empowered h.empowered⟩


axiom corr_p1682_empowered {ag : Elements.FederalAgency} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.AgencyEmpoweredToExtendAssistance ag prog c →
    Procedure.AgencyEmpoweredToExtendAssistance (pAgency ag) (pProg prog) c

axiom corr_p1682_notInsurance {ag : Elements.FederalAgency}
    {prog : Elements.EducationProgram} {c : ComplaintText} :
    ¬ Elements.AssistanceExtendedByInsuranceOrGuarantyContract prog c →
    Procedure.AssistanceNotInsuranceOrGuaranty (pAgency ag) (pProg prog) c


axiom corr_p1682_generalRule {ag : Elements.FederalAgency} {c : ComplaintText} :
    Elements.RequirementAdoptedByGeneralRule ag c →
    Procedure.RuleIssuedOfGeneralApplicability (pAgency ag) (pRule ag) c

axiom corr_p1682_president {ag : Elements.FederalAgency} {c : ComplaintText} :
    Elements.RuleApprovedByPresident ag c → Procedure.RuleApprovedByPresident (pRule ag) c

axiom corr_p1682_advised {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.AdvisedOfFailureToComply ag r c →
    Procedure.RecipientAdvisedOfFailureToComply (pAgency ag) (pRecipient r) c

axiom corr_p1682_voluntary {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.DeterminedVoluntaryComplianceUnavailable ag r c →
    Procedure.VoluntaryComplianceDeterminedUnsecurable (pAgency ag) (pRecipient r) c


axiom corr_p1682_hearing {act : Elements.AgencyAction} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.ExpressFindingOnRecordAfterHearing act c →
    Procedure.OpportunityForHearingAfforded (pHearing act) (pRecipient r) c


axiom corr_p1682_finding {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ExpressFindingOnRecordAfterHearing act c →
    Elements.RecipientFailedToComplyWithRequirement r c →
    Procedure.ExpressFindingOnRecordOfNoncompliance (pAgency ag) (pRecipient r) c

axiom corr_p1682_limitR {act : Elements.AgencyAction} {r : Elements.Recipient}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundRecipient act c →
    Procedure.TerminationLimitedToFoundRecipient (pAction act) (pRecipient r) c

axiom corr_p1682_limitP {act : Elements.AgencyAction} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.TerminationLimitedToNoncompliantProgram act c →
    Procedure.TerminationLimitedToFoundProgram (pAction act) (pProg prog) c

axiom corr_p1682_filed {ag : Elements.FederalAgency} {act : Elements.AgencyAction}
    {c : ComplaintText} :
    Elements.WrittenReportFiledWithCongressionalCommittees act c →
    Procedure.WrittenReportFiledWithCommittees (pAgency ag) (pReport act) c


axiom corr_p1682_grounds {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.WrittenReportFiledWithCongressionalCommittees act c →
    Procedure.ReportStatesCircumstancesAndGrounds (pReport act) c

axiom corr_p1682_days30 {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ThirtyDaysElapsedAfterReport act c →
    Procedure.ThirtyDayReportWaitElapsed (pReport act) (pAction act) c














theorem s1682_elements_implies_procedure_modulo_gaps
    {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {prog : Elements.EducationProgram} {act : Elements.AgencyAction} {c : ComplaintText}
    (gap_s1682_rule_consistent_with_objectives :
      Procedure.RuleConsistentWithStatutoryObjectives (pRule ag) c)
    (gap_s1682_action_took_effect :
      Procedure.EnforcementActionTakenEffect (pAction act) c)
    (h : Elements.FundTerminationAction1682 ag r prog act c) :
    Procedure.TimelyTerminationOfAssistance (pAgency ag) (pRecipient r) (pProg prog)
      (pRule ag) (pHearing act) (pAction act) (pReport act) c :=
  ⟨⟨corr_p1682_empowered h.prerequisites.empowered,
    corr_p1682_notInsurance h.prerequisites.notInsuranceOrGuaranty,
    corr_p1682_generalRule h.prerequisites.generalRule,
    gap_s1682_rule_consistent_with_objectives,
    corr_p1682_president h.prerequisites.presidentialApproval⟩,
   ⟨corr_p1682_advised h.prerequisites.advised,
    corr_p1682_voluntary h.prerequisites.voluntaryComplianceUnavailable⟩,
   ⟨corr_p1682_hearing h.expressFinding,
    corr_p1682_finding h.expressFinding h.prerequisites.noncompliance⟩,
   ⟨corr_p1682_limitR h.limitedToRecipient, corr_p1682_limitP h.limitedToProgram⟩,
   ⟨corr_p1682_filed h.reportFiled, corr_p1682_grounds h.reportFiled⟩,
   gap_s1682_action_took_effect,
   corr_p1682_days30 h.thirtyDays⟩












axiom corr_1683_pursuant_d {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionTakenPursuantToSection1682 act c →
    Deontic.ActionTakenPursuantToSection1682 (dAction act) c

axiom corr_1683_aggrieved_d {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrievedByAgencyAction p act c →
    Deontic.IsPersonAggrievedByAgencyAction p (dAction act) c

axiom corr_1683_notOtherwise_d {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionNotOtherwiseSubjectToJudicialReview act c →
    Deontic.ActionNotOtherwiseSubjectToJudicialReview1683 (dAction act) c




theorem s1683_apa_elements_implies_deontic
    {p : Person} {act : Elements.AgencyAction} {c : ComplaintText}
    (haggr : Elements.IsPersonAggrievedByAgencyAction p act c)
    (h : Elements.ApaReviewRoute1683 act c) :
    Deontic.Permission1683JudicialReview p (dAction act) c :=
  ⟨corr_1683_pursuant_d h.pursuantTo1682, corr_1683_aggrieved_d haggr,
   corr_1683_notOtherwise_d h.notOtherwiseReviewable⟩


axiom corr_1683_pursuant_p {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionTakenPursuantToSection1682 act c →
    Procedure.ActionTakenPursuantToSection1682 (pAction act) c

axiom corr_1683_otherwise_p {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.SimilarActionOtherwiseSubjectToJudicialReview act c →
    Procedure.ActionOtherwiseSubjectToJudicialReview (pAction act) c

axiom corr_1683_notOtherwise_p {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionNotOtherwiseSubjectToJudicialReview act c →
    ¬ Procedure.ActionOtherwiseSubjectToJudicialReview (pAction act) c

axiom corr_1683_terminating_p {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.ActionTerminatesOrRefusesFinancialAssistance act c →
    Procedure.ActionTerminatingOrRefusingAssistance (pAction act) c

axiom corr_1683_aggrieved_p {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrievedByAgencyAction p act c →
    Procedure.PartyAggrievedByAction (pParty p) (pAction act) c









theorem s1683_elements_implies_procedure_modulo_gaps
    {p : Person} {act : Elements.AgencyAction} {c : ComplaintText}
    (gap_s1683_review_petition_invoked :
      Procedure.JudicialReviewSoughtUnderAPA (pPetition act) (pAction act) c)
    (h : Elements.Section1683Claim p act c) :
    Procedure.JudicialReviewAvailability (pParty p) (pPetition act) (pAction act) c := by
  cases h.route with
  | existingLaw hr =>
      exact .otherwiseProvidedByLaw (corr_1683_pursuant_p hr.pursuantTo1682)
        (corr_1683_otherwise_p hr.otherwiseReviewable)
  | apa hr =>
      exact .residualAPAReview (corr_1683_pursuant_p hr.pursuantTo1682)
        (corr_1683_notOtherwise_p hr.notOtherwiseReviewable)
        (corr_1683_terminating_p hr.terminationOrRefusal)
        ⟨corr_1683_pursuant_p hr.pursuantTo1682, corr_1683_aggrieved_p h.aggrieved,
         gap_s1683_review_petition_invoked⟩


axiom corr_pd1683_pursuant {act : Procedure.EnforcementAction} {c : ComplaintText} :
    Procedure.ActionTakenPursuantToSection1682 act c →
    Deontic.ActionTakenPursuantToSection1682 (dpAction act) c

axiom corr_pd1683_aggrieved {pty : Procedure.AggrievedParty}
    {act : Procedure.EnforcementAction} {c : ComplaintText} :
    Procedure.PartyAggrievedByAction pty act c →
    Deontic.IsPersonAggrievedByAgencyAction (dpPerson pty) (dpAction act) c

axiom corr_pd1683_notOtherwise {act : Procedure.EnforcementAction} {c : ComplaintText} :
    ¬ Procedure.ActionOtherwiseSubjectToJudicialReview act c →
    Deontic.ActionNotOtherwiseSubjectToJudicialReview1683 (dpAction act) c

axiom corr_pd1683_obtained {pty : Procedure.AggrievedParty}
    {pet : Procedure.JudicialReviewPetition} {act : Procedure.EnforcementAction}
    {c : ComplaintText} :
    Procedure.JudicialReviewSoughtUnderAPA pet act c →
    Deontic.JudicialReviewObtained1683 (dpPerson pty) (dpAction act) c


theorem s1683_procedure_residual_implies_deontic
    {pty : Procedure.AggrievedParty} {pet : Procedure.JudicialReviewPetition}
    {act : Procedure.EnforcementAction} {c : ComplaintText}
    (hnot : ¬ Procedure.ActionOtherwiseSubjectToJudicialReview act c)
    (h : Procedure.JudicialReviewInvoked pty pet act c) :
    Deontic.Permission1683JudicialReviewExercised (dpPerson pty) (dpAction act) c :=
  ⟨⟨corr_pd1683_pursuant h.pursuantTo1682, corr_pd1683_aggrieved h.aggrieved,
    corr_pd1683_notOtherwise hnot⟩,
   corr_pd1683_obtained (pty := pty) h.reviewSought⟩


axiom corr_o1683_aggrieved {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsPersonAggrievedByAgencyAction p act c → Ontology.IsPersonAggrieved p c


theorem s1683_elements_implies_ontology
    {p : Person} {act : Elements.AgencyAction} {c : ComplaintText}
    (h : Elements.Section1683Claim p act c) : Ontology.PersonAggrievedBasis p c :=
  .aggrieved (corr_o1683_aggrieved h.aggrieved)






axiom corr_1684_addressee_d {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.RecipientOfFederalAssistanceForEducationProgram r prog c →
    Deontic.IsRecipientOfFederalFinancialAssistance1684 (dRecipient r) (dProg prog) c

axiom corr_1684_ground_d {p : Person} {c : ComplaintText} :
    Elements.OnGroundOfBlindnessOrSeverelyImpairedVision p c →
    Deontic.BlindOrSeverelyVisuallyImpaired1684 p c

axiom corr_1684_denied_d {p : Person} {r : Elements.Recipient}
    {crs : Elements.CourseOfStudy} {c : ComplaintText} :
    Elements.DeniedAdmissionToCourseOfStudy p crs c →
    Deontic.AdmissionToCourseOfStudyDenied1684 p (dRecipient r) (dCourse crs) c


theorem s1684_elements_implies_deontic
    {p : Person} {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {crs : Elements.CourseOfStudy} {c : ComplaintText}
    (h : Elements.Section1684 p r prog crs c) :
    Deontic.Prohibition1684Violated p (dRecipient r) (dProg prog) (dCourse crs) c :=
  ⟨⟨corr_1681_person h.personInUS,
    corr_1684_addressee_d h.recipientDefendant,
    corr_1684_ground_d h.ground⟩,
   corr_1684_denied_d (r := r) h.deniedAdmission⟩


axiom corr_o1684_person {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Ontology.IsPersonInUnitedStates p c

axiom corr_o1684_ground {p : Person} {c : ComplaintText} :
    Elements.OnGroundOfBlindnessOrSeverelyImpairedVision p c →
    Ontology.IsBlindnessOrSeverelyImpairedVisionGround (oGroundOf p) c

axiom corr_o1684_course {p : Person} {crs : Elements.CourseOfStudy} {c : ComplaintText} :
    Elements.DeniedAdmissionToCourseOfStudy p crs c → Ontology.IsCourseOfStudy (oCourse crs) c

axiom corr_o1684_recipient {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.RecipientOfFederalAssistanceForEducationProgram r prog c →
    Ontology.IsRecipientOfFederalFinancialAssistance (oRecipient r) c


theorem s1684_elements_implies_ontology
    {p : Person} {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {crs : Elements.CourseOfStudy} {c : ComplaintText}
    (h : Elements.Section1684 p r prog crs c) :
    Ontology.Section1684Subject p (oGroundOf p) (oCourse crs) (oRecipient r) c :=
  ⟨corr_o1684_person h.personInUS, corr_o1684_ground h.ground,
   corr_o1684_course h.deniedAdmission, ⟨corr_o1684_recipient h.recipientDefendant⟩⟩


axiom corr_do1684_person {p : Person} {c : ComplaintText} :
    Deontic.IsPersonInUnitedStates p c → Ontology.IsPersonInUnitedStates p c

axiom corr_do1684_ground {p : Person} {c : ComplaintText} :
    Deontic.BlindOrSeverelyVisuallyImpaired1684 p c →
    Ontology.IsBlindnessOrSeverelyImpairedVisionGround (oGroundOf p) c

axiom corr_do1684_course {p : Person} {r : Deontic.Recipient} {cs : Deontic.CourseOfStudy}
    {c : ComplaintText} :
    Deontic.AdmissionToCourseOfStudyDenied1684 p r cs c →
    Ontology.IsCourseOfStudy (doCourse cs) c

axiom corr_do1684_recipient {r : Deontic.Recipient}
    {prog : Deontic.EducationProgramOrActivity} {c : ComplaintText} :
    Deontic.IsRecipientOfFederalFinancialAssistance1684 r prog c →
    Ontology.IsRecipientOfFederalFinancialAssistance (doRecipient r) c


theorem s1684_deontic_implies_ontology
    {p : Person} {r : Deontic.Recipient} {prog : Deontic.EducationProgramOrActivity}
    {cs : Deontic.CourseOfStudy} {c : ComplaintText}
    (h : Deontic.Prohibition1684Violated p r prog cs c) :
    Ontology.Section1684Subject p (oGroundOf p) (doCourse cs) (doRecipient r) c :=
  ⟨corr_do1684_person h.1.personInUnitedStates, corr_do1684_ground h.1.ground,
   corr_do1684_course h.2, ⟨corr_do1684_recipient h.1.addressee⟩⟩











axiom corr_1685_trigger {prog : Elements.EducationProgram} {c : ComplaintText} :
    Elements.AssistanceExtendedByInsuranceOrGuarantyContract prog c →
    Deontic.AssistanceExtendedByInsuranceOrGuarantyContract1685 (dProg prog) c





theorem s1685_elements_implies_deontic_modulo_gaps
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (gap_s1685_chapter_construed_to_add_or_detract :
      Deontic.ChapterConstruedToAddToOrDetractFromAuthority1685 (dProg prog) c)
    (h : Elements.InsuranceOrGuarantyCarveOut1685 prog c) :
    Deontic.Prohibition1685ConstructionViolated (dProg prog) c :=
  ⟨⟨corr_1685_trigger h.insuranceOrGuarantyOnly⟩,
   gap_s1685_chapter_construed_to_add_or_detract⟩






axiom corr_1686_addressee_d {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.InstitutionReceivesFundsUnderThisAct inst c →
    Deontic.EducationalInstitutionReceivingFunds1686 (dRecipientOfInst inst) c

axiom corr_1686_maintained_d {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.MaintainsSeparateLivingFacilitiesForSexes inst c →
    Deontic.SeparateLivingFacilitiesForDifferentSexesMaintained1686
      (dRecipientOfInst inst) (dFacility inst) c


theorem s1686_elements_implies_deontic
    {inst : Elements.EducationalInstitution} {c : ComplaintText}
    (h : Elements.SeparateLivingFacilitiesPermitted1686 inst c) :
    Deontic.Permission1686SeparateLivingFacilitiesExercised
      (dRecipientOfInst inst) (dFacility inst) c :=
  ⟨⟨corr_1686_addressee_d h.funded⟩, corr_1686_maintained_d h.separateFacilities⟩


axiom corr_o1686_institution {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.InstitutionReceivesFundsUnderThisAct inst c →
    Ontology.IsEducationalInstitution (oInst inst) c

axiom corr_o1686_funded {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.InstitutionReceivesFundsUnderThisAct inst c →
    Ontology.ReceivesFundsUnderTheEducationAmendmentsOf1972 (oInst inst) c

axiom corr_o1686_facility {inst : Elements.EducationalInstitution} {c : ComplaintText} :
    Elements.MaintainsSeparateLivingFacilitiesForSexes inst c →
    Ontology.IsSeparateLivingFacilityForDifferentSexes (oFacility inst) c


theorem s1686_elements_implies_ontology
    {inst : Elements.EducationalInstitution} {c : ComplaintText}
    (h : Elements.SeparateLivingFacilitiesPermitted1686 inst c) :
    Ontology.LivingFacilitiesInterpretation (oInst inst) (oFacility inst) c :=
  ⟨corr_o1686_institution h.funded, corr_o1686_funded h.funded,
   corr_o1686_facility h.separateFacilities⟩


axiom corr_do1686_institution {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.EducationalInstitutionReceivingFunds1686 r c →
    Ontology.IsEducationalInstitution (doInst r) c

axiom corr_do1686_funded {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.EducationalInstitutionReceivingFunds1686 r c →
    Ontology.ReceivesFundsUnderTheEducationAmendmentsOf1972 (doInst r) c

axiom corr_do1686_facility {r : Deontic.Recipient} {f : Deontic.LivingFacility}
    {c : ComplaintText} :
    Deontic.SeparateLivingFacilitiesForDifferentSexesMaintained1686 r f c →
    Ontology.IsSeparateLivingFacilityForDifferentSexes (doFacility f) c


theorem s1686_deontic_implies_ontology
    {r : Deontic.Recipient} {f : Deontic.LivingFacility} {c : ComplaintText}
    (h : Deontic.Permission1686SeparateLivingFacilitiesExercised r f c) :
    Ontology.LivingFacilitiesInterpretation (doInst r) (doFacility f) c :=
  ⟨corr_do1686_institution h.1.addressee, corr_do1686_funded h.1.addressee,
   corr_do1686_facility h.2⟩









axiom corr_1688_penalty_e {p : Person} {s : Deontic.AbortionRelatedService}
    {c : ComplaintText} :
    Deontic.PenaltyImposedForSeekingOrReceivingLegalAbortionService1688 p s c →
    Elements.PenaltyImposedForSeekingOrReceivingLegalAbortion p (penalizingRecipient p) c




theorem s1688_deontic_violation_refutes_elements_floor
    {p : Person} {s : Deontic.AbortionRelatedService} {c : ComplaintText}
    (h : Deontic.Prohibition1688PenaltyViolated p s c) :
    ¬ Elements.Section1688NoPenaltyFloor p (penalizingRecipient p) c :=
  fun hf => hf.noPenalty (corr_1688_penalty_e h.2)



axiom corr_o1688_subject {p : Person} {s : Deontic.AbortionRelatedService}
    {c : ComplaintText} :
    Deontic.PenaltyImposedForSeekingOrReceivingLegalAbortionService1688 p s c →
    Ontology.IsPersonInUnitedStates p c

axiom corr_o1688_item {p : Person} {s : Deontic.AbortionRelatedService}
    {c : ComplaintText} :
    Deontic.PenaltyImposedForSeekingOrReceivingLegalAbortionService1688 p s c →
    Ontology.IsBenefitOrServiceRelatedToLegalAbortion (doService s) c


theorem s1688_deontic_implies_ontology
    {p : Person} {s : Deontic.AbortionRelatedService} {c : ComplaintText}
    (h : Deontic.Prohibition1688PenaltyViolated p s c) :
    Ontology.LegalAbortionNoPenaltyScope p (doService s) c :=
  ⟨corr_o1688_subject h.2, corr_o1688_item h.2⟩


axiom corr_pd1688_service {p : Person} {c : ComplaintText} :
    Procedure.PenaltyGroundIsAbortionRelatedBenefit p c →
    Deontic.IsAbortionRelatedBenefitOrService1688 (dpService p) c

axiom corr_po1688_item {p : Person} {c : ComplaintText} :
    Procedure.PenaltyGroundIsAbortionRelatedBenefit p c →
    Ontology.IsBenefitOrServiceRelatedToLegalAbortion (opService p) c

axiom corr_po1688_subject {p : Person} {c : ComplaintText} :
    Procedure.PenaltySoughtAgainstPerson p c → Ontology.IsPersonInUnitedStates p c


theorem s1688_procedure_implies_deontic {p : Person} {c : ComplaintText}
    (h : Procedure.Section1688PenaltyBarTriggered p c) :
    Deontic.Prohibition1688Penalty (dpService p) c :=
  ⟨corr_pd1688_service h.abortionRelatedGrd⟩


theorem s1688_procedure_implies_ontology {p : Person} {c : ComplaintText}
    (h : Procedure.Section1688PenaltyBarTriggered p c) :
    Ontology.LegalAbortionNoPenaltyScope p (opService p) c :=
  ⟨corr_po1688_subject h.penaltySought, corr_po1688_item h.abortionRelatedGrd⟩








axiom corr_1689_established_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c →
    Deontic.JointInteragencyTaskForceEstablished1689a (dTaskForce tf) c

axiom corr_1689_deadline_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.TaskForceEstablishedByStatutoryDeadline tf c →
    Deontic.TaskForceEstablishedByStatutoryDeadline1689a (dTaskForce tf) c

axiom corr_1689a1_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.ProvidesCampusSexualViolenceInformation tf c →
    Deontic.CampusSexualViolenceInformationProvided1689a1 (dTaskForce tf) c

axiom corr_1689a2_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.RecommendsPreventionAndResponseTeams tf c →
    Deontic.RecommendationsDevelopedForEducationalInstitutions1689a2 (dTaskForce tf) c

axiom corr_1689a7_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.SolicitsPeriodicSurvivorAndStakeholderInput tf c →
    Deontic.PeriodicStakeholderInputSolicited1689a7 (dTaskForce tf) c

axiom corr_1689a8_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.AssessesIntermediateFineAuthority tf c →
    Deontic.IntermediateFineAuthorityAssessed1689a8 (dTaskForce tf) c

axiom corr_1689a9_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.CreatesWorkforcePlan tf c →
    Deontic.WorkforcePlanCreated1689a9 (dTaskForce tf) c

axiom corr_1689c_submitted_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.WorkforcePlanSubmittedToCongress tf c →
    Deontic.WorkforceRecommendationsSubmittedToCongress1689c (dTaskForce tf) c

axiom corr_1689c_days_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.PlanSubmittedWithinNinetyDays tf c →
    Deontic.daysFromEstablishmentToRecommendations1689c (dTaskForce tf) c ≤ 90

axiom corr_1689d_submitted_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.AnnualReportSubmittedAndMadePublic tf c →
    Deontic.AnnualReportSubmittedAndMadePubliclyAvailable1689d
      (dTaskForce tf) (dAnnualReport tf) c

axiom corr_1689d_contents_d {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.AnnualReportContents1689d tf c →
    Deontic.AnnualReportContainsRequiredComplaintStatistics1689d
      (dTaskForce tf) (dAnnualReport tf) c



theorem s1689_elements_implies_deontic
    {p : Person} {tf : Elements.TaskForce} {c : ComplaintText}
    (h : Elements.Section1689Compliance tf c) :
    ¬ Deontic.Obligation1689aEstablishBreached p c
    ∧ ¬ Deontic.Obligation1689aDutiesBreached (dTaskForce tf) c
    ∧ ¬ Deontic.Obligation1689cRecommendationsBreached (dTaskForce tf) c
    ∧ ¬ Deontic.Obligation1689dAnnualReportBreached (dTaskForce tf) c :=
  ⟨fun hb => hb.2 ⟨dTaskForce tf, corr_1689_established_d h.establishment.jointly,
                   corr_1689_deadline_d h.establishment.timely⟩,
   fun hb => hb.2 ⟨corr_1689a1_d h.establishment.duties.information,
                   corr_1689a2_d h.establishment.duties.responseTeams,
                   corr_1689a7_d h.establishment.duties.stakeholderInput,
                   corr_1689a8_d h.establishment.duties.fineAuthority,
                   corr_1689a9_d h.establishment.duties.plan⟩,
   fun hb => hb.2 ⟨corr_1689c_submitted_d h.plan.submitted,
                   corr_1689c_days_d h.plan.timely⟩,
   fun hb => hb.2 ⟨dAnnualReport tf, corr_1689d_submitted_d h.report.submitted,
                   corr_1689d_contents_d h.report.contents⟩⟩


axiom corr_1689_established_p {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c →
    Procedure.TaskForceEstablishedJointly (pTaskForce tf) c

axiom corr_1689_deadline_p {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.TaskForceEstablishedByStatutoryDeadline tf c →
    Procedure.TaskForceEstablishedByDeadline (pTaskForce tf) c

axiom corr_1689c_submitted_p {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.WorkforcePlanSubmittedToCongress tf c →
    Procedure.TaskForceRecommendationsSubmittedToCongress
      (pTaskForce tf) (pRecommendations tf) c

axiom corr_1689c_days_p {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.PlanSubmittedWithinNinetyDays tf c →
    Procedure.RecommendationsWithinNinetyDays (pTaskForce tf) (pRecommendations tf) c

axiom corr_1689d_submitted_p {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.AnnualReportSubmittedAndMadePublic tf c →
    Procedure.AnnualReportSubmittedAndMadePublic (pTaskForce tf) (pAnnualReport tf) c


theorem s1689_elements_implies_procedure
    {tf : Elements.TaskForce} {c : ComplaintText}
    (h : Elements.Section1689Compliance tf c) :
    Procedure.TaskForceEstablishmentTimely (pTaskForce tf) c
    ∧ Procedure.TaskForcePlanSubmissionTimely (pTaskForce tf) (pRecommendations tf) c
    ∧ Procedure.TaskForceAnnualReporting (pTaskForce tf) (pAnnualReport tf) c :=
  ⟨⟨corr_1689_established_p h.establishment.jointly,
    corr_1689_deadline_p h.establishment.timely⟩,
   ⟨corr_1689_established_p h.establishment.jointly,
    corr_1689c_submitted_p h.plan.submitted,
    corr_1689c_days_p h.plan.timely⟩,
   ⟨corr_1689_established_p h.establishment.jointly,
    corr_1689d_submitted_p h.report.submitted⟩⟩



axiom corr_o1689_joint {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c →
    Ontology.IsJointInteragencyTaskForce (oTaskForce tf) c

axiom corr_o1689_established {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c →
    Ontology.EstablishedBySecretariesAndAttorneyGeneral (oTaskForce tf) c

axiom corr_o1689_named {tf : Elements.TaskForce} {c : ComplaintText} :
    Elements.JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c →
    Ontology.IsTaskForceOnSexualViolenceInEducation (oTaskForce tf) c


theorem s1689_elements_implies_ontology
    {tf : Elements.TaskForce} {c : ComplaintText}
    (h : Elements.Section1689Compliance tf c) :
    Ontology.TaskForceMembership (oTaskForce tf) c :=
  ⟨corr_o1689_joint h.establishment.jointly,
   corr_o1689_established h.establishment.jointly,
   corr_o1689_named h.establishment.jointly⟩


axiom corr_dp1689_established {tf : Deontic.TaskForce} {c : ComplaintText} :
    Deontic.JointInteragencyTaskForceEstablished1689a tf c →
    Procedure.TaskForceEstablishedJointly (dpTaskForce tf) c

axiom corr_dp1689_deadline {tf : Deontic.TaskForce} {c : ComplaintText} :
    Deontic.TaskForceEstablishedByStatutoryDeadline1689a tf c →
    Procedure.TaskForceEstablishedByDeadline (dpTaskForce tf) c


theorem s1689_deontic_implies_procedure
    {tf : Deontic.TaskForce} {c : ComplaintText}
    (hEst : Deontic.JointInteragencyTaskForceEstablished1689a tf c)
    (hDl : Deontic.TaskForceEstablishedByStatutoryDeadline1689a tf c) :
    Procedure.TaskForceEstablishmentTimely (dpTaskForce tf) c :=
  ⟨corr_dp1689_established hEst, corr_dp1689_deadline hDl⟩







def s1684_tierA_pairwise : Prop :=
  (∀ {p r prog crs c}, Elements.Section1684 p r prog crs c →
      Deontic.Prohibition1684Violated p (dRecipient r) (dProg prog) (dCourse crs) c)
  ∧ (∀ {p r prog crs c}, Elements.Section1684 p r prog crs c →
      Ontology.Section1684Subject p (oGroundOf p) (oCourse crs) (oRecipient r) c)
  ∧ (∀ {p r prog cs c}, Deontic.Prohibition1684Violated p r prog cs c →
      Ontology.Section1684Subject p (oGroundOf p) (doCourse cs) (doRecipient r) c)

theorem s1684_tierA : s1684_tierA_pairwise :=
  ⟨fun h => s1684_elements_implies_deontic h,
   fun h => s1684_elements_implies_ontology h,
   fun h => s1684_deontic_implies_ontology h⟩


def s1686_tierA_pairwise : Prop :=
  (∀ {inst c}, Elements.SeparateLivingFacilitiesPermitted1686 inst c →
      Deontic.Permission1686SeparateLivingFacilitiesExercised
        (dRecipientOfInst inst) (dFacility inst) c)
  ∧ (∀ {inst c}, Elements.SeparateLivingFacilitiesPermitted1686 inst c →
      Ontology.LivingFacilitiesInterpretation (oInst inst) (oFacility inst) c)
  ∧ (∀ {r f c}, Deontic.Permission1686SeparateLivingFacilitiesExercised r f c →
      Ontology.LivingFacilitiesInterpretation (doInst r) (doFacility f) c)

theorem s1686_tierA : s1686_tierA_pairwise :=
  ⟨fun h => s1686_elements_implies_deontic h,
   fun h => s1686_elements_implies_ontology h,
   fun h => s1686_deontic_implies_ontology h⟩





def s1687_tierA_pairwise : Prop :=
  (∀ {prog c}, Elements.ProgramOrActivity1687 prog c →
      Deontic.IsProgramOrActivity1687 (entOf prog) (dProg prog) c)
  ∧ (∀ {prog c}, Elements.ProgramOrActivity1687 prog c →
      Ontology.ProgramOrActivityMembership (oProg prog) (oEntity prog) c)
  ∧ (∀ {e prog c}, Deontic.IsProgramOrActivity1687 e prog c →
      Ontology.ProgramOrActivityMembership (doProg prog) (doEntity e) c)

theorem s1687_tierA : s1687_tierA_pairwise :=
  ⟨fun h => s1687_elements_implies_deontic h,
   fun h => s1687_elements_implies_ontology h,
   fun h => s1687_deontic_implies_ontology h⟩


def s1688_tierA_pairwise : Prop :=
  (∀ {p s c}, Deontic.Prohibition1688PenaltyViolated p s c →
      ¬ Elements.Section1688NoPenaltyFloor p (penalizingRecipient p) c)
  ∧ (∀ {p s c}, Deontic.Prohibition1688PenaltyViolated p s c →
      Ontology.LegalAbortionNoPenaltyScope p (doService s) c)
  ∧ (∀ {p c}, Procedure.Section1688PenaltyBarTriggered p c →
      Deontic.Prohibition1688Penalty (dpService p) c)
  ∧ (∀ {p c}, Procedure.Section1688PenaltyBarTriggered p c →
      Ontology.LegalAbortionNoPenaltyScope p (opService p) c)

theorem s1688_tierA : s1688_tierA_pairwise :=
  ⟨fun h => s1688_deontic_violation_refutes_elements_floor h,
   fun h => s1688_deontic_implies_ontology h,
   fun h => s1688_procedure_implies_deontic h,
   fun h => s1688_procedure_implies_ontology h⟩


def s1689_tierA_pairwise : Prop :=
  (∀ {p tf c}, Elements.Section1689Compliance tf c →
      ¬ Deontic.Obligation1689aEstablishBreached p c
      ∧ ¬ Deontic.Obligation1689aDutiesBreached (dTaskForce tf) c
      ∧ ¬ Deontic.Obligation1689cRecommendationsBreached (dTaskForce tf) c
      ∧ ¬ Deontic.Obligation1689dAnnualReportBreached (dTaskForce tf) c)
  ∧ (∀ {tf c}, Elements.Section1689Compliance tf c →
      Procedure.TaskForceEstablishmentTimely (pTaskForce tf) c
      ∧ Procedure.TaskForcePlanSubmissionTimely (pTaskForce tf) (pRecommendations tf) c
      ∧ Procedure.TaskForceAnnualReporting (pTaskForce tf) (pAnnualReport tf) c)
  ∧ (∀ {tf c}, Elements.Section1689Compliance tf c →
      Ontology.TaskForceMembership (oTaskForce tf) c)

theorem s1689_tierA : s1689_tierA_pairwise :=
  ⟨fun h => s1689_elements_implies_deontic h,
   fun h => s1689_elements_implies_procedure h,
   fun h => s1689_elements_implies_ontology h⟩

end Proving.USC.T20.Ch38.Reearn.Bridge
