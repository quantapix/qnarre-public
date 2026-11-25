





import Proving.USC.T20.Ch38.Reearn.Deontic.Types
import Proving.USC.T20.Ch38.Reearn.Deontic.Predicates
import Proving.USC.T20.Ch38.Reearn.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Deontic

open Proving.USC.Common



theorem prohibition1681a_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {c : ComplaintText}
    (hPerson : IsPersonInUnitedStates p c)
    (hAddr : OperatesEducationProgramOrActivity1681a r prog c)
    (hCond : ReceivesFederalFinancialAssistance prog c) :
    Prohibition1681a p r prog c :=
  ⟨hPerson, hAddr, hCond⟩

theorem prohibition1681aViolated_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {c : ComplaintText}
    (hNorm : Prohibition1681a p r prog c)
    (hAct : SexBasedExclusionDenialOrDiscrimination1681a p r prog c)
    (hNoEscape : ¬ ExemptFromProhibition1681a r prog c) :
    Prohibition1681aViolated p r prog c :=
  ⟨hNorm, hAct, hNoEscape⟩



theorem obligation1681a8_intro
    {r : Recipient} {act : SexSeparateActivity} {c : ComplaintText}
    (hAddr : IsEducationalInstitution1681c r c)
    (hActivity : FatherSonOrMotherDaughterActivity1681a8 act c)
    (hCond : SingleSexActivityProvided1681a8 r act c) :
    Obligation1681a8 r act c :=
  ⟨hAddr, hActivity, hCond⟩

theorem obligation1681a8Breached_intro
    {r : Recipient} {act : SexSeparateActivity} {c : ComplaintText}
    (hNorm : Obligation1681a8 r act c)
    (hOmission : ¬ ComparableActivityProvidedForOtherSex1681a8 r act c) :
    Obligation1681a8Breached r act c :=
  ⟨hNorm, hOmission⟩



theorem noObligation1681b_intro
    {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hImbalance : ParticipationImbalanceAlleged1681b prog c) :
    NoObligation1681b prog c :=
  ⟨hImbalance⟩

theorem noObligation1681bInvoked_intro
    {r : Recipient} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hNorm : NoObligation1681b prog c)
    (hDemand : PreferentialOrDisparateTreatmentDemanded1681b r prog c) :
    NoObligation1681bInvoked r prog c :=
  ⟨hNorm, hDemand⟩

theorem permission1681bStatisticalEvidence_intro
    {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hImbalance : ParticipationImbalanceAlleged1681b prog c) :
    Permission1681bStatisticalEvidence prog c :=
  ⟨hImbalance⟩

theorem permission1681bStatisticalEvidenceExercised_intro
    {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hNorm : Permission1681bStatisticalEvidence prog c)
    (hAct : StatisticalEvidenceOfImbalanceConsidered1681b prog c) :
    Permission1681bStatisticalEvidenceExercised prog c :=
  ⟨hNorm, hAct⟩



theorem isEducationalInstitutionUnderChapter1681c_intro_school
    {r : Recipient} {c : ComplaintText}
    (h : IsEducationalInstitution1681c r c) :
    IsEducationalInstitutionUnderChapter1681c r c :=
  Or.inl h

theorem isEducationalInstitutionUnderChapter1681c_intro_unit
    {r : Recipient} {c : ComplaintText}
    (h : IsAdministrativelySeparateUnit1681c r c) :
    IsEducationalInstitutionUnderChapter1681c r c :=
  Or.inr h



theorem power1682Rulemaking_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hAddr : EmpoweredToExtendFederalFinancialAssistance a prog c) :
    Power1682Rulemaking a prog c :=
  ⟨hAddr⟩

theorem power1682RulemakingExercised_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {rule : AgencyRule}
    {c : ComplaintText}
    (hNorm : Power1682Rulemaking a prog c)
    (hAct : RuleRegulationOrOrderIssued1682 a rule c) :
    Power1682RulemakingExercised a prog rule c :=
  ⟨hNorm, hAct⟩

theorem obligation1682Effectuate_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hAddr : EmpoweredToExtendFederalFinancialAssistance a prog c) :
    Obligation1682Effectuate a prog c :=
  ⟨hAddr⟩

theorem obligation1682EffectuateBreached_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hNorm : Obligation1682Effectuate a prog c)
    (hOmission : ¬ (∃ rule : AgencyRule,
        RuleRegulationOrOrderIssued1682 a rule c
        ∧ RuleConsistentWithStatutoryObjectives1682 rule c)) :
    Obligation1682EffectuateBreached a prog c :=
  ⟨hNorm, hOmission⟩

theorem prohibition1682UnapprovedRule_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {rule : AgencyRule}
    {c : ComplaintText}
    (hAddr : EmpoweredToExtendFederalFinancialAssistance a prog c)
    (hIssued : RuleRegulationOrOrderIssued1682 a rule c)
    (hUnapproved : ¬ RuleApprovedByPresident1682 rule c) :
    Prohibition1682UnapprovedRule a prog rule c :=
  ⟨hAddr, hIssued, hUnapproved⟩

theorem prohibition1682UnapprovedRuleViolated_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {rule : AgencyRule}
    {c : ComplaintText}
    (hNorm : Prohibition1682UnapprovedRule a prog rule c)
    (hAct : RuleGivenEffect1682 a rule c) :
    Prohibition1682UnapprovedRuleViolated a prog rule c :=
  ⟨hNorm, hAct⟩

theorem power1682Enforcement_intro
    {a : FederalAgency} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hAddr : EmpoweredToExtendFederalFinancialAssistance a prog c) :
    Power1682Enforcement a prog c :=
  ⟨hAddr⟩

theorem power1682EnforcementExercised_intro_termination
    {a : FederalAgency} {prog : EducationProgramOrActivity}
    {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Power1682Enforcement a prog c)
    (hAct : ComplianceEffectedByTerminationOrRefusal1682 a act c) :
    Power1682EnforcementExercised a prog act c :=
  ⟨hNorm, Or.inl hAct⟩

theorem power1682EnforcementExercised_intro_otherMeans
    {a : FederalAgency} {prog : EducationProgramOrActivity}
    {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Power1682Enforcement a prog c)
    (hAct : ComplianceEffectedByOtherMeansAuthorizedByLaw1682 a act c) :
    Power1682EnforcementExercised a prog act c :=
  ⟨hNorm, Or.inr hAct⟩

theorem obligation1682TerminationLimits_intro
    {a : FederalAgency} {r : Recipient} {act : EnforcementAction}
    {c : ComplaintText}
    (hTermination : ComplianceEffectedByTerminationOrRefusal1682 a act c)
    (hFinding : ExpressFindingOnRecordAfterHearing1682 a r act c) :
    Obligation1682TerminationLimits a r act c :=
  ⟨hTermination, hFinding⟩

theorem obligation1682TerminationLimitsBreached_intro
    {a : FederalAgency} {r : Recipient} {prog : EducationProgramOrActivity}
    {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Obligation1682TerminationLimits a r act c)
    (hOverbroad : ¬ (TerminationLimitedToFoundRecipient1682 act r c
       ∧ TerminationLimitedToNoncompliantProgram1682 act prog c)) :
    Obligation1682TerminationLimitsBreached a r prog act c :=
  ⟨hNorm, hOverbroad⟩

theorem prohibition1682PrematureAction_intro
    {a : FederalAgency} {r : Recipient} {c : ComplaintText}
    (hMissing : ¬ (RecipientAdvisedOfFailureToComply1682 a r c
       ∧ VoluntaryComplianceDeterminedUnsecurable1682 a r c)) :
    Prohibition1682PrematureAction a r c :=
  ⟨hMissing⟩

theorem prohibition1682PrematureActionViolated_intro
    {a : FederalAgency} {r : Recipient} {act : EnforcementAction}
    {c : ComplaintText}
    (hNorm : Prohibition1682PrematureAction a r c)
    (hAct : EnforcementActionTaken1682 a act c) :
    Prohibition1682PrematureActionViolated a r act c :=
  ⟨hNorm, hAct⟩

theorem obligation1682CongressionalReport_intro
    {a : FederalAgency} {act : EnforcementAction} {c : ComplaintText}
    (hTermination : ComplianceEffectedByTerminationOrRefusal1682 a act c) :
    Obligation1682CongressionalReport a act c :=
  ⟨hTermination⟩

theorem obligation1682CongressionalReportBreached_intro
    {a : FederalAgency} {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Obligation1682CongressionalReport a act c)
    (hOmission : ¬ (∃ rep : CongressionalReport,
        WrittenReportFiledWithCommittees1682 a act rep c)) :
    Obligation1682CongressionalReportBreached a act c :=
  ⟨hNorm, hOmission⟩

theorem prohibition1682ThirtyDayBar_intro
    {a : FederalAgency} {act : EnforcementAction} {rep : CongressionalReport}
    {c : ComplaintText}
    (hReport : WrittenReportFiledWithCommittees1682 a act rep c)
    (hDays : daysFromReportFilingToActionEffective1682 act rep c < 30) :
    Prohibition1682ThirtyDayBar a act rep c :=
  ⟨hReport, hDays⟩

theorem prohibition1682ThirtyDayBarViolated_intro
    {a : FederalAgency} {act : EnforcementAction} {rep : CongressionalReport}
    {c : ComplaintText}
    (hNorm : Prohibition1682ThirtyDayBar a act rep c)
    (hAct : EnforcementActionMadeEffective1682 a act c) :
    Prohibition1682ThirtyDayBarViolated a act rep c :=
  ⟨hNorm, hAct⟩



theorem permission1683JudicialReview_intro
    {p : Person} {act : EnforcementAction} {c : ComplaintText}
    (hAction : ActionTakenPursuantToSection1682 act c)
    (hAggrieved : IsPersonAggrievedByAgencyAction p act c)
    (hNotReviewable : ActionNotOtherwiseSubjectToJudicialReview1683 act c) :
    Permission1683JudicialReview p act c :=
  ⟨hAction, hAggrieved, hNotReviewable⟩

theorem permission1683JudicialReviewExercised_intro
    {p : Person} {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Permission1683JudicialReview p act c)
    (hAct : JudicialReviewObtained1683 p act c) :
    Permission1683JudicialReviewExercised p act c :=
  ⟨hNorm, hAct⟩

theorem prohibition1683UnreviewableDiscretion_intro
    {act : EnforcementAction} {c : ComplaintText}
    (hAction : ActionTakenPursuantToSection1682 act c)
    (hNotReviewable : ActionNotOtherwiseSubjectToJudicialReview1683 act c) :
    Prohibition1683UnreviewableDiscretion act c :=
  ⟨hAction, hNotReviewable⟩

theorem prohibition1683UnreviewableDiscretionViolated_intro
    {act : EnforcementAction} {c : ComplaintText}
    (hNorm : Prohibition1683UnreviewableDiscretion act c)
    (hAct : ActionTreatedAsCommittedToUnreviewableDiscretion1683 act c) :
    Prohibition1683UnreviewableDiscretionViolated act c :=
  ⟨hNorm, hAct⟩



theorem prohibition1684_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {c : ComplaintText}
    (hPerson : IsPersonInUnitedStates p c)
    (hAddr : IsRecipientOfFederalFinancialAssistance1684 r prog c)
    (hGround : BlindOrSeverelyVisuallyImpaired1684 p c) :
    Prohibition1684 p r prog c :=
  ⟨hPerson, hAddr, hGround⟩

theorem prohibition1684Violated_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {cs : CourseOfStudy} {c : ComplaintText}
    (hNorm : Prohibition1684 p r prog c)
    (hAct : AdmissionToCourseOfStudyDenied1684 p r cs c) :
    Prohibition1684Violated p r prog cs c :=
  ⟨hNorm, hAct⟩

theorem noObligation1684SpecialServices_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {c : ComplaintText}
    (hAddr : IsRecipientOfFederalFinancialAssistance1684 r prog c)
    (hGround : BlindOrSeverelyVisuallyImpaired1684 p c) :
    NoObligation1684SpecialServices p r prog c :=
  ⟨hAddr, hGround⟩

theorem noObligation1684SpecialServicesInvoked_intro
    {p : Person} {r : Recipient} {prog : EducationProgramOrActivity}
    {c : ComplaintText}
    (hNorm : NoObligation1684SpecialServices p r prog c)
    (hDemand : SpecialServicesForVisualImpairmentDemanded1684 p r c) :
    NoObligation1684SpecialServicesInvoked p r prog c :=
  ⟨hNorm, hDemand⟩



theorem prohibition1685Construction_intro
    {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hInsurance : AssistanceExtendedByInsuranceOrGuarantyContract1685 prog c) :
    Prohibition1685Construction prog c :=
  ⟨hInsurance⟩

theorem prohibition1685ConstructionViolated_intro
    {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hNorm : Prohibition1685Construction prog c)
    (hAct : ChapterConstruedToAddToOrDetractFromAuthority1685 prog c) :
    Prohibition1685ConstructionViolated prog c :=
  ⟨hNorm, hAct⟩



theorem permission1686SeparateLivingFacilities_intro
    {r : Recipient} {c : ComplaintText}
    (hAddr : EducationalInstitutionReceivingFunds1686 r c) :
    Permission1686SeparateLivingFacilities r c :=
  ⟨hAddr⟩

theorem permission1686SeparateLivingFacilitiesExercised_intro
    {r : Recipient} {f : LivingFacility} {c : ComplaintText}
    (hNorm : Permission1686SeparateLivingFacilities r c)
    (hAct : SeparateLivingFacilitiesForDifferentSexesMaintained1686 r f c) :
    Permission1686SeparateLivingFacilitiesExercised r f c :=
  ⟨hNorm, hAct⟩



theorem definition1687ProgramOrActivity_intro
    {e : Entity} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hOperations : IsCoveredEntityOperations1687 e prog c)
    (hAssisted : AnyPartExtendedFederalFinancialAssistance1687 e c) :
    Definition1687ProgramOrActivity e prog c :=
  ⟨hOperations, hAssisted⟩

theorem isProgramOrActivity1687_intro
    {e : Entity} {prog : EducationProgramOrActivity} {c : ComplaintText}
    (hDef : Definition1687ProgramOrActivity e prog c)
    (hNotExcluded : ¬ ReligiousControlledOperationExcluded1687 e prog c) :
    IsProgramOrActivity1687 e prog c :=
  ⟨hDef, hNotExcluded⟩



theorem prohibition1688NeutralityConstruction_intro
    {s : AbortionRelatedService} {c : ComplaintText}
    (hService : IsAbortionRelatedBenefitOrService1688 s c) :
    Prohibition1688NeutralityConstruction s c :=
  ⟨hService⟩

theorem prohibition1688NeutralityConstructionViolated_intro
    {p : Person} {s : AbortionRelatedService} {c : ComplaintText}
    (hNorm : Prohibition1688NeutralityConstruction s c)
    (hAct : ProvisionOrPaymentRequiredOrProhibited1688 p s c) :
    Prohibition1688NeutralityConstructionViolated p s c :=
  ⟨hNorm, hAct⟩

theorem prohibition1688Penalty_intro
    {s : AbortionRelatedService} {c : ComplaintText}
    (hService : IsAbortionRelatedBenefitOrService1688 s c) :
    Prohibition1688Penalty s c :=
  ⟨hService⟩

theorem prohibition1688PenaltyViolated_intro
    {p : Person} {s : AbortionRelatedService} {c : ComplaintText}
    (hNorm : Prohibition1688Penalty s c)
    (hAct : PenaltyImposedForSeekingOrReceivingLegalAbortionService1688 p s c) :
    Prohibition1688PenaltyViolated p s c :=
  ⟨hNorm, hAct⟩



theorem obligation1689aEstablish_intro
    {p : Person} {c : ComplaintText}
    (hAddr : IsStatutoryEstablishingOfficial1689a p c) :
    Obligation1689aEstablish p c :=
  ⟨hAddr⟩

theorem obligation1689aEstablishBreached_intro
    {p : Person} {c : ComplaintText}
    (hNorm : Obligation1689aEstablish p c)
    (hOmission : ¬ (∃ tf : TaskForce,
        JointInteragencyTaskForceEstablished1689a tf c
        ∧ TaskForceEstablishedByStatutoryDeadline1689a tf c)) :
    Obligation1689aEstablishBreached p c :=
  ⟨hNorm, hOmission⟩

theorem obligation1689aDuties_intro
    {tf : TaskForce} {c : ComplaintText}
    (hEstablished : JointInteragencyTaskForceEstablished1689a tf c) :
    Obligation1689aDuties tf c :=
  ⟨hEstablished⟩

theorem obligation1689aDutiesBreached_intro
    {tf : TaskForce} {c : ComplaintText}
    (hNorm : Obligation1689aDuties tf c)
    (hOmission : ¬ (CampusSexualViolenceInformationProvided1689a1 tf c
       ∧ RecommendationsDevelopedForEducationalInstitutions1689a2 tf c
       ∧ PeriodicStakeholderInputSolicited1689a7 tf c
       ∧ IntermediateFineAuthorityAssessed1689a8 tf c
       ∧ WorkforcePlanCreated1689a9 tf c)) :
    Obligation1689aDutiesBreached tf c :=
  ⟨hNorm, hOmission⟩

theorem power1689bDetail_intro
    {a : FederalAgency} {d : PersonnelDetail} {tf : TaskForce}
    {c : ComplaintText}
    (hEstablished : JointInteragencyTaskForceEstablished1689a tf c)
    (hAgreed : DetailJointlyAgreedByComponentHeadAndTaskForce1689b a d tf c) :
    Power1689bDetail a d tf c :=
  ⟨hEstablished, hAgreed⟩

theorem power1689bDetailExercised_intro
    {a : FederalAgency} {d : PersonnelDetail} {tf : TaskForce}
    {c : ComplaintText}
    (hNorm : Power1689bDetail a d tf c)
    (hAct : PersonnelDetailedToTaskForce1689b a d tf c)
    (hWithinLimit : yearsOfPersonnelDetail1689b d c ≤ 3) :
    Power1689bDetailExercised a d tf c :=
  ⟨hNorm, hAct, hWithinLimit⟩

theorem obligation1689cRecommendations_intro
    {tf : TaskForce} {c : ComplaintText}
    (hEstablished : JointInteragencyTaskForceEstablished1689a tf c) :
    Obligation1689cRecommendations tf c :=
  ⟨hEstablished⟩

theorem obligation1689cRecommendationsBreached_intro
    {tf : TaskForce} {c : ComplaintText}
    (hNorm : Obligation1689cRecommendations tf c)
    (hOmission : ¬ (WorkforceRecommendationsSubmittedToCongress1689c tf c
       ∧ daysFromEstablishmentToRecommendations1689c tf c ≤ 90)) :
    Obligation1689cRecommendationsBreached tf c :=
  ⟨hNorm, hOmission⟩

theorem obligation1689dAnnualReport_intro
    {tf : TaskForce} {c : ComplaintText}
    (hEstablished : JointInteragencyTaskForceEstablished1689a tf c) :
    Obligation1689dAnnualReport tf c :=
  ⟨hEstablished⟩

theorem obligation1689dAnnualReportBreached_intro
    {tf : TaskForce} {c : ComplaintText}
    (hNorm : Obligation1689dAnnualReport tf c)
    (hOmission : ¬ (∃ rep : CongressionalReport,
        AnnualReportSubmittedAndMadePubliclyAvailable1689d tf rep c
        ∧ AnnualReportContainsRequiredComplaintStatistics1689d tf rep c)) :
    Obligation1689dAnnualReportBreached tf c :=
  ⟨hNorm, hOmission⟩

theorem definition1689eEducationalInstitution_intro
    {e : Entity} {c : ComplaintText}
    (hInstitution : IsEducationalInstitution1689e e c) :
    Definition1689eEducationalInstitution e c :=
  ⟨hInstitution⟩

end Proving.USC.T20.Ch38.Reearn.Deontic
