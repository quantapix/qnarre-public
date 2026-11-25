









import Proving.USC.T20.Ch38.Reearn.Deontic.Types
import Proving.USC.T20.Ch38.Reearn.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Deontic

open Proving.USC.Common





def ExemptFromProhibition1681a
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop :=
  AdmissionsClauseInapplicableInstitution1681a1 r prog c
  ∨ AdmissionsTransitionPlanPeriod1681a2 r c
  ∨ ReligiousOrganizationControlInconsistent1681a3 r c
  ∨ MilitaryOrMerchantMarineTrainingPurpose1681a4 r c
  ∨ TraditionallySingleSexPublicUndergraduateAdmissions1681a5 r c
  ∨ ExemptMembershipPractices1681a6 r c
  ∨ YouthConferenceProgramOrActivity1681a7 prog c
  ∨ SingleSexPageantScholarship1681a9 r c
  ∨ (∃ act : SexSeparateActivity, FatherSonOrMotherDaughterActivity1681a8 act c)



structure Prohibition1681a
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  personInUnitedStates : IsPersonInUnitedStates p c
  addressee : OperatesEducationProgramOrActivity1681a r prog c
  condition : ReceivesFederalFinancialAssistance prog c


def prohibition1681aModality : Modality := Modality.prohibition



def Prohibition1681aViolated
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop :=
  Prohibition1681a p r prog c
  ∧ SexBasedExclusionDenialOrDiscrimination1681a p r prog c
  ∧ ¬ ExemptFromProhibition1681a r prog c






structure Obligation1681a8
    (r : Recipient) (act : SexSeparateActivity) (c : ComplaintText) : Prop where
  addressee : IsEducationalInstitution1681c r c
  activityIsSexSeparate : FatherSonOrMotherDaughterActivity1681a8 act c
  condition : SingleSexActivityProvided1681a8 r act c


def obligation1681a8Modality : Modality := Modality.obligation



def Obligation1681a8Breached
    (r : Recipient) (act : SexSeparateActivity) (c : ComplaintText) : Prop :=
  Obligation1681a8 r act c ∧ ¬ ComparableActivityProvidedForOtherSex1681a8 r act c





structure NoObligation1681b
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop where
  imbalanceGround : ParticipationImbalanceAlleged1681b prog c



def noObligation1681bModality : Modality := Modality.permission



def NoObligation1681bInvoked
    (r : Recipient) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop :=
  NoObligation1681b prog c ∧ PreferentialOrDisparateTreatmentDemanded1681b r prog c



structure Permission1681bStatisticalEvidence
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop where
  imbalanceAtIssue : ParticipationImbalanceAlleged1681b prog c


def permission1681bStatisticalEvidenceModality : Modality := Modality.permission


def Permission1681bStatisticalEvidenceExercised
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop :=
  Permission1681bStatisticalEvidence prog c
  ∧ StatisticalEvidenceOfImbalanceConsidered1681b prog c




def definition1681cModality : Modality := Modality.definition




def IsEducationalInstitutionUnderChapter1681c
    (r : Recipient) (c : ComplaintText) : Prop :=
  IsEducationalInstitution1681c r c ∨ IsAdministrativelySeparateUnit1681c r c





structure Power1682Rulemaking
    (a : FederalAgency) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  addressee : EmpoweredToExtendFederalFinancialAssistance a prog c


def power1682RulemakingModality : Modality := Modality.power


def Power1682RulemakingExercised
    (a : FederalAgency) (prog : EducationProgramOrActivity) (rule : AgencyRule)
    (c : ComplaintText) : Prop :=
  Power1682Rulemaking a prog c ∧ RuleRegulationOrOrderIssued1682 a rule c



structure Obligation1682Effectuate
    (a : FederalAgency) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  addressee : EmpoweredToExtendFederalFinancialAssistance a prog c


def obligation1682EffectuateModality : Modality := Modality.obligation




def Obligation1682EffectuateBreached
    (a : FederalAgency) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop :=
  Obligation1682Effectuate a prog c
  ∧ ¬ (∃ rule : AgencyRule,
        RuleRegulationOrOrderIssued1682 a rule c
        ∧ RuleConsistentWithStatutoryObjectives1682 rule c)



structure Prohibition1682UnapprovedRule
    (a : FederalAgency) (prog : EducationProgramOrActivity) (rule : AgencyRule)
    (c : ComplaintText) : Prop where
  addressee : EmpoweredToExtendFederalFinancialAssistance a prog c
  ruleIssued : RuleRegulationOrOrderIssued1682 a rule c
  notApproved : ¬ RuleApprovedByPresident1682 rule c


def prohibition1682UnapprovedRuleModality : Modality := Modality.prohibition



def Prohibition1682UnapprovedRuleViolated
    (a : FederalAgency) (prog : EducationProgramOrActivity) (rule : AgencyRule)
    (c : ComplaintText) : Prop :=
  Prohibition1682UnapprovedRule a prog rule c ∧ RuleGivenEffect1682 a rule c




structure Power1682Enforcement
    (a : FederalAgency) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  addressee : EmpoweredToExtendFederalFinancialAssistance a prog c


def power1682EnforcementModality : Modality := Modality.power


def Power1682EnforcementExercised
    (a : FederalAgency) (prog : EducationProgramOrActivity)
    (act : EnforcementAction) (c : ComplaintText) : Prop :=
  Power1682Enforcement a prog c
  ∧ (ComplianceEffectedByTerminationOrRefusal1682 a act c
     ∨ ComplianceEffectedByOtherMeansAuthorizedByLaw1682 a act c)





structure Obligation1682TerminationLimits
    (a : FederalAgency) (r : Recipient) (act : EnforcementAction)
    (c : ComplaintText) : Prop where
  enforcementByTermination : ComplianceEffectedByTerminationOrRefusal1682 a act c
  expressFinding : ExpressFindingOnRecordAfterHearing1682 a r act c


def obligation1682TerminationLimitsModality : Modality := Modality.obligation



def Obligation1682TerminationLimitsBreached
    (a : FederalAgency) (r : Recipient) (prog : EducationProgramOrActivity)
    (act : EnforcementAction) (c : ComplaintText) : Prop :=
  Obligation1682TerminationLimits a r act c
  ∧ ¬ (TerminationLimitedToFoundRecipient1682 act r c
       ∧ TerminationLimitedToNoncompliantProgram1682 act prog c)





structure Prohibition1682PrematureAction
    (a : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop where
  noticeOrVoluntaryStepMissing :
    ¬ (RecipientAdvisedOfFailureToComply1682 a r c
       ∧ VoluntaryComplianceDeterminedUnsecurable1682 a r c)


def prohibition1682PrematureActionModality : Modality := Modality.prohibition



def Prohibition1682PrematureActionViolated
    (a : FederalAgency) (r : Recipient) (act : EnforcementAction)
    (c : ComplaintText) : Prop :=
  Prohibition1682PrematureAction a r c ∧ EnforcementActionTaken1682 a act c




structure Obligation1682CongressionalReport
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop where
  terminatingAction : ComplianceEffectedByTerminationOrRefusal1682 a act c


def obligation1682CongressionalReportModality : Modality := Modality.obligation


def Obligation1682CongressionalReportBreached
    (a : FederalAgency) (act : EnforcementAction) (c : ComplaintText) : Prop :=
  Obligation1682CongressionalReport a act c
  ∧ ¬ (∃ rep : CongressionalReport, WrittenReportFiledWithCommittees1682 a act rep c)



structure Prohibition1682ThirtyDayBar
    (a : FederalAgency) (act : EnforcementAction) (rep : CongressionalReport)
    (c : ComplaintText) : Prop where
  reportFiled : WrittenReportFiledWithCommittees1682 a act rep c
  withinThirtyDays : daysFromReportFilingToActionEffective1682 act rep c < 30


def prohibition1682ThirtyDayBarModality : Modality := Modality.prohibition



def Prohibition1682ThirtyDayBarViolated
    (a : FederalAgency) (act : EnforcementAction) (rep : CongressionalReport)
    (c : ComplaintText) : Prop :=
  Prohibition1682ThirtyDayBar a act rep c ∧ EnforcementActionMadeEffective1682 a act c





structure Permission1683JudicialReview
    (p : Person) (act : EnforcementAction) (c : ComplaintText) : Prop where
  agencyAction : ActionTakenPursuantToSection1682 act c
  aggrieved : IsPersonAggrievedByAgencyAction p act c
  notOtherwiseReviewable : ActionNotOtherwiseSubjectToJudicialReview1683 act c


def permission1683JudicialReviewModality : Modality := Modality.permission


def Permission1683JudicialReviewExercised
    (p : Person) (act : EnforcementAction) (c : ComplaintText) : Prop :=
  Permission1683JudicialReview p act c ∧ JudicialReviewObtained1683 p act c



structure Prohibition1683UnreviewableDiscretion
    (act : EnforcementAction) (c : ComplaintText) : Prop where
  agencyAction : ActionTakenPursuantToSection1682 act c
  notOtherwiseReviewable : ActionNotOtherwiseSubjectToJudicialReview1683 act c


def prohibition1683UnreviewableDiscretionModality : Modality := Modality.prohibition


def Prohibition1683UnreviewableDiscretionViolated
    (act : EnforcementAction) (c : ComplaintText) : Prop :=
  Prohibition1683UnreviewableDiscretion act c
  ∧ ActionTreatedAsCommittedToUnreviewableDiscretion1683 act c




structure Prohibition1684
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  personInUnitedStates : IsPersonInUnitedStates p c
  addressee : IsRecipientOfFederalFinancialAssistance1684 r prog c
  ground : BlindOrSeverelyVisuallyImpaired1684 p c


def prohibition1684Modality : Modality := Modality.prohibition



def Prohibition1684Violated
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (cs : CourseOfStudy) (c : ComplaintText) : Prop :=
  Prohibition1684 p r prog c ∧ AdmissionToCourseOfStudyDenied1684 p r cs c



structure NoObligation1684SpecialServices
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop where
  addressee : IsRecipientOfFederalFinancialAssistance1684 r prog c
  ground : BlindOrSeverelyVisuallyImpaired1684 p c


def noObligation1684SpecialServicesModality : Modality := Modality.permission



def NoObligation1684SpecialServicesInvoked
    (p : Person) (r : Recipient) (prog : EducationProgramOrActivity)
    (c : ComplaintText) : Prop :=
  NoObligation1684SpecialServices p r prog c
  ∧ SpecialServicesForVisualImpairmentDemanded1684 p r c







structure Prohibition1685Construction
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop where
  insuranceOrGuaranty : AssistanceExtendedByInsuranceOrGuarantyContract1685 prog c


def prohibition1685ConstructionModality : Modality := Modality.prohibition



def Prohibition1685ConstructionViolated
    (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop :=
  Prohibition1685Construction prog c
  ∧ ChapterConstruedToAddToOrDetractFromAuthority1685 prog c





structure Permission1686SeparateLivingFacilities
    (r : Recipient) (c : ComplaintText) : Prop where
  addressee : EducationalInstitutionReceivingFunds1686 r c


def permission1686SeparateLivingFacilitiesModality : Modality := Modality.permission


def Permission1686SeparateLivingFacilitiesExercised
    (r : Recipient) (f : LivingFacility) (c : ComplaintText) : Prop :=
  Permission1686SeparateLivingFacilities r c
  ∧ SeparateLivingFacilitiesForDifferentSexesMaintained1686 r f c




def definition1687Modality : Modality := Modality.definition



structure Definition1687ProgramOrActivity
    (e : Entity) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop where
  coveredOperations : IsCoveredEntityOperations1687 e prog c
  anyPartAssisted : AnyPartExtendedFederalFinancialAssistance1687 e c



def IsProgramOrActivity1687
    (e : Entity) (prog : EducationProgramOrActivity) (c : ComplaintText) : Prop :=
  Definition1687ProgramOrActivity e prog c
  ∧ ¬ ReligiousControlledOperationExcluded1687 e prog c





structure Prohibition1688NeutralityConstruction
    (s : AbortionRelatedService) (c : ComplaintText) : Prop where
  abortionRelated : IsAbortionRelatedBenefitOrService1688 s c


def prohibition1688NeutralityConstructionModality : Modality := Modality.prohibition



def Prohibition1688NeutralityConstructionViolated
    (p : Person) (s : AbortionRelatedService) (c : ComplaintText) : Prop :=
  Prohibition1688NeutralityConstruction s c
  ∧ ProvisionOrPaymentRequiredOrProhibited1688 p s c




structure Prohibition1688Penalty
    (s : AbortionRelatedService) (c : ComplaintText) : Prop where
  abortionRelated : IsAbortionRelatedBenefitOrService1688 s c


def prohibition1688PenaltyModality : Modality := Modality.prohibition


def Prohibition1688PenaltyViolated
    (p : Person) (s : AbortionRelatedService) (c : ComplaintText) : Prop :=
  Prohibition1688Penalty s c
  ∧ PenaltyImposedForSeekingOrReceivingLegalAbortionService1688 p s c





structure Obligation1689aEstablish (p : Person) (c : ComplaintText) : Prop where
  addressee : IsStatutoryEstablishingOfficial1689a p c


def obligation1689aEstablishModality : Modality := Modality.obligation



def Obligation1689aEstablishBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation1689aEstablish p c
  ∧ ¬ (∃ tf : TaskForce,
        JointInteragencyTaskForceEstablished1689a tf c
        ∧ TaskForceEstablishedByStatutoryDeadline1689a tf c)


structure Obligation1689aDuties (tf : TaskForce) (c : ComplaintText) : Prop where
  established : JointInteragencyTaskForceEstablished1689a tf c


def obligation1689aDutiesModality : Modality := Modality.obligation



def Obligation1689aDutiesBreached (tf : TaskForce) (c : ComplaintText) : Prop :=
  Obligation1689aDuties tf c
  ∧ ¬ (CampusSexualViolenceInformationProvided1689a1 tf c
       ∧ RecommendationsDevelopedForEducationalInstitutions1689a2 tf c
       ∧ PeriodicStakeholderInputSolicited1689a7 tf c
       ∧ IntermediateFineAuthorityAssessed1689a8 tf c
       ∧ WorkforcePlanCreated1689a9 tf c)



structure Power1689bDetail
    (a : FederalAgency) (d : PersonnelDetail) (tf : TaskForce)
    (c : ComplaintText) : Prop where
  established : JointInteragencyTaskForceEstablished1689a tf c
  jointlyAgreed : DetailJointlyAgreedByComponentHeadAndTaskForce1689b a d tf c


def power1689bDetailModality : Modality := Modality.power


def Power1689bDetailExercised
    (a : FederalAgency) (d : PersonnelDetail) (tf : TaskForce)
    (c : ComplaintText) : Prop :=
  Power1689bDetail a d tf c
  ∧ PersonnelDetailedToTaskForce1689b a d tf c
  ∧ yearsOfPersonnelDetail1689b d c ≤ 3



structure Obligation1689cRecommendations (tf : TaskForce) (c : ComplaintText) : Prop where
  established : JointInteragencyTaskForceEstablished1689a tf c


def obligation1689cRecommendationsModality : Modality := Modality.obligation



def Obligation1689cRecommendationsBreached (tf : TaskForce) (c : ComplaintText) : Prop :=
  Obligation1689cRecommendations tf c
  ∧ ¬ (WorkforceRecommendationsSubmittedToCongress1689c tf c
       ∧ daysFromEstablishmentToRecommendations1689c tf c ≤ 90)




structure Obligation1689dAnnualReport (tf : TaskForce) (c : ComplaintText) : Prop where
  established : JointInteragencyTaskForceEstablished1689a tf c


def obligation1689dAnnualReportModality : Modality := Modality.obligation



def Obligation1689dAnnualReportBreached (tf : TaskForce) (c : ComplaintText) : Prop :=
  Obligation1689dAnnualReport tf c
  ∧ ¬ (∃ rep : CongressionalReport,
        AnnualReportSubmittedAndMadePubliclyAvailable1689d tf rep c
        ∧ AnnualReportContainsRequiredComplaintStatistics1689d tf rep c)


def definition1689eModality : Modality := Modality.definition


structure Definition1689eEducationalInstitution (e : Entity) (c : ComplaintText) : Prop where
  institution : IsEducationalInstitution1689e e c

end Proving.USC.T20.Ch38.Reearn.Deontic
