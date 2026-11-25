











import Proving.USC.T20.Ch38.Reearn.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Procedure

open Proving.USC.Common









axiom AgencyEmpoweredToExtendAssistance
    (a : FederalAgency) (prog : EducationProgram) (c : ComplaintText) : Prop





axiom AssistanceNotInsuranceOrGuaranty
    (a : FederalAgency) (prog : EducationProgram) (c : ComplaintText) : Prop




axiom RuleIssuedOfGeneralApplicability
    (a : FederalAgency) (r : AgencyRule) (c : ComplaintText) : Prop




axiom RuleConsistentWithStatutoryObjectives
    (r : AgencyRule) (c : ComplaintText) : Prop




axiom RuleApprovedByPresident (r : AgencyRule) (c : ComplaintText) : Prop








axiom RecipientAdvisedOfFailureToComply
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Prop




axiom VoluntaryComplianceDeterminedUnsecurable
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Prop








axiom OpportunityForHearingAfforded
    (h : AdministrativeHearing) (rc : Recipient) (c : ComplaintText) : Prop




axiom ExpressFindingOnRecordOfNoncompliance
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundRecipient
    (act : EnforcementAction) (rc : Recipient) (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundProgram
    (act : EnforcementAction) (prog : EducationProgram) (c : ComplaintText) : Prop




axiom EnforcementByOtherMeansAuthorizedByLaw
    (act : EnforcementAction) (c : ComplaintText) : Prop









axiom WrittenReportFiledWithCommittees
    (a : FederalAgency) (rep : ComplianceReport) (c : ComplaintText) : Prop




axiom ReportStatesCircumstancesAndGrounds
    (rep : ComplianceReport) (c : ComplaintText) : Prop




axiom EnforcementActionTakenEffect
    (act : EnforcementAction) (c : ComplaintText) : Prop




axiom dayOfReportFilingWithCommittees
    (rep : ComplianceReport) (c : ComplaintText) : Nat




axiom dayEnforcementActionEffective
    (act : EnforcementAction) (c : ComplaintText) : Nat








axiom ActionTakenPursuantToSection1682
    (act : EnforcementAction) (c : ComplaintText) : Prop





axiom ActionOtherwiseSubjectToJudicialReview
    (act : EnforcementAction) (c : ComplaintText) : Prop





axiom ActionTerminatingOrRefusingAssistance
    (act : EnforcementAction) (c : ComplaintText) : Prop





axiom PartyAggrievedByAction
    (pty : AggrievedParty) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom JudicialReviewSoughtUnderAPA
    (pet : JudicialReviewPetition) (act : EnforcementAction) (c : ComplaintText) : Prop








axiom AdmissionsActionChallenged
    (prog : EducationProgram) (c : ComplaintText) : Prop





axiom InstitutionBegunSingleSexToCoedTransition
    (prog : EducationProgram) (c : ComplaintText) : Prop




axiom TransitionPlanApprovedBySecretary
    (pl : TransitionPlan) (prog : EducationProgram) (c : ComplaintText) : Prop




axiom CarryingOutApprovedTransitionPlan
    (pl : TransitionPlan) (prog : EducationProgram) (c : ComplaintText) : Prop




axiom dayOfTitleIXEnactment (c : ComplaintText) : Nat




axiom dayTransitionProcessBegan (prog : EducationProgram) (c : ComplaintText) : Nat




axiom dayOfChallengedAdmissionsAction (prog : EducationProgram) (c : ComplaintText) : Nat








axiom ProceedingUnderThisChapter (pr : ChapterProceeding) (c : ComplaintText) : Prop





axiom StatisticalImbalanceEvidenceOffered
    (pr : ChapterProceeding) (c : ComplaintText) : Prop








axiom PenaltySoughtAgainstPerson (p : Person) (c : ComplaintText) : Prop





axiom PenaltyGroundIsAbortionRelatedBenefit (p : Person) (c : ComplaintText) : Prop









axiom TaskForceEstablishedJointly (tf : TaskForce) (c : ComplaintText) : Prop




axiom TaskForceRecommendationsSubmittedToCongress
    (tf : TaskForce) (rec : TaskForceRecommendations) (c : ComplaintText) : Prop




axiom AnnualReportSubmittedAndMadePublic
    (tf : TaskForce) (rep : AnnualReport) (c : ComplaintText) : Prop




axiom PersonnelDetailAgreedByComponentHeadAndTaskForce
    (d : PersonnelDetail) (tf : TaskForce) (c : ComplaintText) : Prop




axiom dayOfTaskForceStatutoryDeadline (c : ComplaintText) : Nat




axiom dayTaskForceEstablished (tf : TaskForce) (c : ComplaintText) : Nat




axiom dayRecommendationsSubmitted
    (rec : TaskForceRecommendations) (c : ComplaintText) : Nat




axiom daysOfPersonnelDetail (d : PersonnelDetail) (c : ComplaintText) : Nat

end Proving.USC.T20.Ch38.Reearn.Procedure
