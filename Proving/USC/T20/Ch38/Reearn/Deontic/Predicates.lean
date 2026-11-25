






import Proving.USC.T20.Ch38.Reearn.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Deontic

open Proving.USC.Common






axiom IsPersonInUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ReceivesFederalFinancialAssistance
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop





axiom EmpoweredToExtendFederalFinancialAssistance
    (a : FederalAgency) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom IsPersonAggrievedByAgencyAction
    (p : Person) (act : EnforcementAction) (c : ComplaintText) : Prop






axiom OperatesEducationProgramOrActivity1681a
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop





axiom SexBasedExclusionDenialOrDiscrimination1681a
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop





axiom AdmissionsClauseInapplicableInstitution1681a1
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop





axiom AdmissionsTransitionPlanPeriod1681a2 (r : Recipient) (c : ComplaintText) : Prop





axiom ReligiousOrganizationControlInconsistent1681a3
    (r : Recipient) (c : ComplaintText) : Prop





axiom MilitaryOrMerchantMarineTrainingPurpose1681a4
    (r : Recipient) (c : ComplaintText) : Prop





axiom TraditionallySingleSexPublicUndergraduateAdmissions1681a5
    (r : Recipient) (c : ComplaintText) : Prop




axiom ExemptMembershipPractices1681a6 (r : Recipient) (c : ComplaintText) : Prop





axiom YouthConferenceProgramOrActivity1681a7
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom FatherSonOrMotherDaughterActivity1681a8
    (act : SexSeparateActivity) (c : ComplaintText) : Prop





axiom SingleSexPageantScholarship1681a9 (r : Recipient) (c : ComplaintText) : Prop




axiom SingleSexActivityProvided1681a8
    (r : Recipient) (act : SexSeparateActivity) (c : ComplaintText) : Prop




axiom ComparableActivityProvidedForOtherSex1681a8
    (r : Recipient) (act : SexSeparateActivity) (c : ComplaintText) : Prop







axiom ParticipationImbalanceAlleged1681b
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom PreferentialOrDisparateTreatmentDemanded1681b
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom StatisticalEvidenceOfImbalanceConsidered1681b
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop







axiom IsEducationalInstitution1681c (r : Recipient) (c : ComplaintText) : Prop





axiom IsAdministrativelySeparateUnit1681c (r : Recipient) (c : ComplaintText) : Prop






axiom RuleRegulationOrOrderIssued1682
    (a : FederalAgency) (rule : AgencyRule) (c : ComplaintText) : Prop




axiom RuleConsistentWithStatutoryObjectives1682
    (rule : AgencyRule) (c : ComplaintText) : Prop




axiom RuleApprovedByPresident1682 (rule : AgencyRule) (c : ComplaintText) : Prop




axiom RuleGivenEffect1682
    (a : FederalAgency) (rule : AgencyRule) (c : ComplaintText) : Prop




axiom ComplianceEffectedByTerminationOrRefusal1682
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom ComplianceEffectedByOtherMeansAuthorizedByLaw1682
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom ExpressFindingOnRecordAfterHearing1682
    (a : FederalAgency) (r : Recipient) (act : EnforcementAction)
    (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundRecipient1682
    (act : EnforcementAction) (r : Recipient) (c : ComplaintText) : Prop




axiom TerminationLimitedToNoncompliantProgram1682
    (act : EnforcementAction) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop




axiom RecipientAdvisedOfFailureToComply1682
    (a : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop




axiom VoluntaryComplianceDeterminedUnsecurable1682
    (a : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop



axiom EnforcementActionTaken1682
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop





axiom WrittenReportFiledWithCommittees1682
    (a : FederalAgency) (act : EnforcementAction) (rep : CongressionalReport)
    (c : ComplaintText) : Prop



axiom EnforcementActionMadeEffective1682
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom daysFromReportFilingToActionEffective1682
    (act : EnforcementAction) (rep : CongressionalReport) (c : ComplaintText) : Nat






axiom ActionTakenPursuantToSection1682
    (act : EnforcementAction) (c : ComplaintText) : Prop




axiom ActionNotOtherwiseSubjectToJudicialReview1683
    (act : EnforcementAction) (c : ComplaintText) : Prop




axiom JudicialReviewObtained1683
    (p : Person) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom ActionTreatedAsCommittedToUnreviewableDiscretion1683
    (act : EnforcementAction) (c : ComplaintText) : Prop






axiom IsRecipientOfFederalFinancialAssistance1684
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop



axiom BlindOrSeverelyVisuallyImpaired1684 (p : Person) (c : ComplaintText) : Prop




axiom AdmissionToCourseOfStudyDenied1684
    (p : Person) (r : Recipient) (cs : CourseOfStudy) (c : ComplaintText) : Prop




axiom SpecialServicesForVisualImpairmentDemanded1684
    (p : Person) (r : Recipient) (c : ComplaintText) : Prop






axiom AssistanceExtendedByInsuranceOrGuarantyContract1685
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom ChapterConstruedToAddToOrDetractFromAuthority1685
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop





axiom EducationalInstitutionReceivingFunds1686
    (r : Recipient) (c : ComplaintText) : Prop




axiom SeparateLivingFacilitiesForDifferentSexesMaintained1686
    (r : Recipient) (f : LivingFacility) (c : ComplaintText) : Prop









axiom IsCoveredEntityOperations1687
    (e : Entity) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop




axiom AnyPartExtendedFederalFinancialAssistance1687
    (e : Entity) (c : ComplaintText) : Prop





axiom ReligiousControlledOperationExcluded1687
    (e : Entity) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop






axiom IsAbortionRelatedBenefitOrService1688
    (s : AbortionRelatedService) (c : ComplaintText) : Prop





axiom ProvisionOrPaymentRequiredOrProhibited1688
    (p : Person) (s : AbortionRelatedService) (c : ComplaintText) : Prop




axiom PenaltyImposedForSeekingOrReceivingLegalAbortionService1688
    (p : Person) (s : AbortionRelatedService) (c : ComplaintText) : Prop






axiom IsStatutoryEstablishingOfficial1689a (p : Person) (c : ComplaintText) : Prop




axiom JointInteragencyTaskForceEstablished1689a
    (tf : TaskForce) (c : ComplaintText) : Prop




axiom TaskForceEstablishedByStatutoryDeadline1689a
    (tf : TaskForce) (c : ComplaintText) : Prop






axiom CampusSexualViolenceInformationProvided1689a1
    (tf : TaskForce) (c : ComplaintText) : Prop






axiom RecommendationsDevelopedForEducationalInstitutions1689a2
    (tf : TaskForce) (c : ComplaintText) : Prop





axiom PeriodicStakeholderInputSolicited1689a7
    (tf : TaskForce) (c : ComplaintText) : Prop





axiom IntermediateFineAuthorityAssessed1689a8
    (tf : TaskForce) (c : ComplaintText) : Prop



axiom WorkforcePlanCreated1689a9 (tf : TaskForce) (c : ComplaintText) : Prop





axiom PersonnelDetailedToTaskForce1689b
    (a : FederalAgency) (d : PersonnelDetail) (tf : TaskForce)
    (c : ComplaintText) : Prop




axiom DetailJointlyAgreedByComponentHeadAndTaskForce1689b
    (a : FederalAgency) (d : PersonnelDetail) (tf : TaskForce)
    (c : ComplaintText) : Prop




axiom yearsOfPersonnelDetail1689b (d : PersonnelDetail) (c : ComplaintText) : Nat





axiom WorkforceRecommendationsSubmittedToCongress1689c
    (tf : TaskForce) (c : ComplaintText) : Prop




axiom daysFromEstablishmentToRecommendations1689c
    (tf : TaskForce) (c : ComplaintText) : Nat





axiom AnnualReportSubmittedAndMadePubliclyAvailable1689d
    (tf : TaskForce) (rep : CongressionalReport) (c : ComplaintText) : Prop




axiom AnnualReportContainsRequiredComplaintStatistics1689d
    (tf : TaskForce) (rep : CongressionalReport) (c : ComplaintText) : Prop





axiom IsEducationalInstitution1689e (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T20.Ch38.Reearn.Deontic
