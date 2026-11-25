











import Proving.USC.T20.Ch38.Reearn.Procedure.Types
import Proving.USC.T20.Ch38.Reearn.Procedure.Predicates
import Proving.USC.T20.Ch38.Reearn.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Procedure

open Proving.USC.Common



theorem ruleEffectivenessPrerequisites_intro
    {a : FederalAgency} {prog : EducationProgram} {r : AgencyRule} {c : ComplaintText}
    (hEmp : AgencyEmpoweredToExtendAssistance a prog c)
    (hIns : AssistanceNotInsuranceOrGuaranty a prog c)
    (hGen : RuleIssuedOfGeneralApplicability a r c)
    (hObj : RuleConsistentWithStatutoryObjectives r c)
    (hPres : RuleApprovedByPresident r c) :
    RuleEffectivenessPrerequisites a prog r c :=
  ⟨hEmp, hIns, hGen, hObj, hPres⟩

theorem preActionNoticeSatisfied_intro
    {a : FederalAgency} {rc : Recipient} {c : ComplaintText}
    (hAdv : RecipientAdvisedOfFailureToComply a rc c)
    (hVol : VoluntaryComplianceDeterminedUnsecurable a rc c) :
    PreActionNoticeSatisfied a rc c :=
  ⟨hAdv, hVol⟩

theorem hearingAndFindingSatisfied_intro
    {a : FederalAgency} {rc : Recipient} {hear : AdministrativeHearing}
    {c : ComplaintText}
    (hHear : OpportunityForHearingAfforded hear rc c)
    (hFind : ExpressFindingOnRecordOfNoncompliance a rc c) :
    HearingAndFindingSatisfied a rc hear c :=
  ⟨hHear, hFind⟩

theorem terminationScopeLimited_intro
    {act : EnforcementAction} {rc : Recipient} {prog : EducationProgram}
    {c : ComplaintText}
    (hRec : TerminationLimitedToFoundRecipient act rc c)
    (hProg : TerminationLimitedToFoundProgram act prog c) :
    TerminationScopeLimited act rc prog c :=
  ⟨hRec, hProg⟩

theorem congressionalReportFiled_intro
    {a : FederalAgency} {rep : ComplianceReport} {c : ComplaintText}
    (hFiled : WrittenReportFiledWithCommittees a rep c)
    (hFull : ReportStatesCircumstancesAndGrounds rep c) :
    CongressionalReportFiled a rep c :=
  ⟨hFiled, hFull⟩

theorem timelyTerminationOfAssistance_intro
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (hPre : RuleEffectivenessPrerequisites a prog r c)
    (hNotice : PreActionNoticeSatisfied a rc c)
    (hHF : HearingAndFindingSatisfied a rc hear c)
    (hScope : TerminationScopeLimited act rc prog c)
    (hRep : CongressionalReportFiled a rep c)
    (hEff : EnforcementActionTakenEffect act c)
    (hWait : ThirtyDayReportWaitElapsed rep act c) :
    TimelyTerminationOfAssistance a rc prog r hear act rep c :=
  ⟨hPre, hNotice, hHF, hScope, hRep, hEff, hWait⟩

theorem enforcementRoute_intro_byTermination
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (hTimely : TimelyTerminationOfAssistance a rc prog r hear act rep c) :
    EnforcementRoute a rc prog r hear act rep c :=
  EnforcementRoute.byTermination hTimely

theorem enforcementRoute_intro_byOtherMeans
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (hPre : RuleEffectivenessPrerequisites a prog r c)
    (hNotice : PreActionNoticeSatisfied a rc c)
    (hOther : EnforcementByOtherMeansAuthorizedByLaw act c) :
    EnforcementRoute a rc prog r hear act rep c :=
  EnforcementRoute.byOtherMeansAuthorizedByLaw hPre hNotice hOther





theorem section1682Progress_intro
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (hEmp : AgencyEmpoweredToExtendAssistance a prog c)
    (hIns : AssistanceNotInsuranceOrGuaranty a prog c)
    (hGen : RuleIssuedOfGeneralApplicability a r c)
    (hObj : RuleConsistentWithStatutoryObjectives r c)
    (hPres : RuleApprovedByPresident r c)
    (hAdv : RecipientAdvisedOfFailureToComply a rc c)
    (hVol : VoluntaryComplianceDeterminedUnsecurable a rc c)
    (hHear : OpportunityForHearingAfforded hear rc c)
    (hFind : ExpressFindingOnRecordOfNoncompliance a rc c)
    (hScope : TerminationScopeLimited act rc prog c)
    (hRep : CongressionalReportFiled a rep c)
    (hEff : EnforcementActionTakenEffect act c)
    (hWait : ThirtyDayReportWaitElapsed rep act c) :
    Section1682Progress a rc prog r hear act rep c EnforcementState.ActionEffective :=
  .actionEffective
    (.reportFiled
      (.actionOrdered
        (.findingOnRecord
          (.hearingAfforded
            (.voluntaryComplianceFailed
              (.recipientAdvised
                (.ruleEffective (.ruleProposed hEmp hIns hGen hObj) hPres)
                hAdv)
              hVol)
            hHear)
          hFind)
        hScope)
      hRep)
    ⟨hEff, hWait⟩


theorem section1682Progress_intro_underJudicialReview
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (pty : AggrievedParty) (pet : JudicialReviewPetition)
    (prev : Section1682Progress a rc prog r hear act rep c EnforcementState.ActionEffective)
    (hAgg : PartyAggrievedByAction pty act c)
    (hSought : JudicialReviewSoughtUnderAPA pet act c) :
    Section1682Progress a rc prog r hear act rep c EnforcementState.UnderJudicialReview :=
  .underJudicialReview pty pet prev ⟨hAgg, hSought⟩



theorem judicialReviewInvoked_intro
    {pty : AggrievedParty} {pet : JudicialReviewPetition}
    {act : EnforcementAction} {c : ComplaintText}
    (hPursuant : ActionTakenPursuantToSection1682 act c)
    (hAgg : PartyAggrievedByAction pty act c)
    (hSought : JudicialReviewSoughtUnderAPA pet act c) :
    JudicialReviewInvoked pty pet act c :=
  ⟨hPursuant, hAgg, hSought⟩

theorem judicialReviewAvailability_intro_otherwiseProvided
    {pty : AggrievedParty} {pet : JudicialReviewPetition}
    {act : EnforcementAction} {c : ComplaintText}
    (hPursuant : ActionTakenPursuantToSection1682 act c)
    (hOther : ActionOtherwiseSubjectToJudicialReview act c) :
    JudicialReviewAvailability pty pet act c :=
  JudicialReviewAvailability.otherwiseProvidedByLaw hPursuant hOther

theorem judicialReviewAvailability_intro_residualAPA
    {pty : AggrievedParty} {pet : JudicialReviewPetition}
    {act : EnforcementAction} {c : ComplaintText}
    (hPursuant : ActionTakenPursuantToSection1682 act c)
    (hNotOther : ¬ ActionOtherwiseSubjectToJudicialReview act c)
    (hTerm : ActionTerminatingOrRefusingAssistance act c)
    (hInvoked : JudicialReviewInvoked pty pet act c) :
    JudicialReviewAvailability pty pet act c :=
  JudicialReviewAvailability.residualAPAReview hPursuant hNotOther hTerm hInvoked



theorem admissionsTransitionExemption_intro
    {pl : TransitionPlan} {prog : EducationProgram} {c : ComplaintText}
    (hAdm : AdmissionsActionChallenged prog c)
    (hBegun : InstitutionBegunSingleSexToCoedTransition prog c)
    (hApproved : TransitionPlanApprovedBySecretary pl prog c)
    (hCarrying : CarryingOutApprovedTransitionPlan pl prog c)
    (hWindow : WithinAdmissionsTransitionExemption prog c) :
    AdmissionsTransitionExemption pl prog c :=
  ⟨hAdm, hBegun, hApproved, hCarrying, hWindow⟩

theorem admissionsExemptionWindow_intro_enactmentGrace
    {pl : TransitionPlan} {prog : EducationProgram} {c : ComplaintText}
    (hAdm : AdmissionsActionChallenged prog c)
    (hGrace : WithinEnactmentGracePeriod prog c) :
    AdmissionsExemptionWindow pl prog c :=
  AdmissionsExemptionWindow.enactmentGrace hAdm hGrace

theorem admissionsExemptionWindow_intro_transitionWindow
    {pl : TransitionPlan} {prog : EducationProgram} {c : ComplaintText}
    (hExempt : AdmissionsTransitionExemption pl prog c) :
    AdmissionsExemptionWindow pl prog c :=
  AdmissionsExemptionWindow.transitionWindow hExempt



theorem statisticalEvidenceConsiderable_intro
    {pr : ChapterProceeding} {c : ComplaintText}
    (hForum : ProceedingUnderThisChapter pr c)
    (hEvid : StatisticalImbalanceEvidenceOffered pr c) :
    StatisticalEvidenceConsiderable pr c :=
  ⟨hForum, hEvid⟩

theorem section1688PenaltyBarTriggered_intro
    {p : Person} {c : ComplaintText}
    (hPenalty : PenaltySoughtAgainstPerson p c)
    (hGround : PenaltyGroundIsAbortionRelatedBenefit p c) :
    Section1688PenaltyBarTriggered p c :=
  ⟨hPenalty, hGround⟩



theorem taskForceEstablishmentTimely_intro
    {tf : TaskForce} {c : ComplaintText}
    (hEst : TaskForceEstablishedJointly tf c)
    (hDeadline : TaskForceEstablishedByDeadline tf c) :
    TaskForceEstablishmentTimely tf c :=
  ⟨hEst, hDeadline⟩

theorem taskForcePlanSubmissionTimely_intro
    {tf : TaskForce} {rec : TaskForceRecommendations} {c : ComplaintText}
    (hEst : TaskForceEstablishedJointly tf c)
    (hSub : TaskForceRecommendationsSubmittedToCongress tf rec c)
    (hNinety : RecommendationsWithinNinetyDays tf rec c) :
    TaskForcePlanSubmissionTimely tf rec c :=
  ⟨hEst, hSub, hNinety⟩

theorem personnelDetailWithinLimits_intro
    {d : PersonnelDetail} {tf : TaskForce} {c : ComplaintText}
    (hAgreed : PersonnelDetailAgreedByComponentHeadAndTaskForce d tf c)
    (hCap : DetailWithinThreeYearLimit d c) :
    PersonnelDetailWithinLimits d tf c :=
  ⟨hAgreed, hCap⟩

theorem taskForceAnnualReporting_intro
    {tf : TaskForce} {rep : AnnualReport} {c : ComplaintText}
    (hEst : TaskForceEstablishedJointly tf c)
    (hReport : AnnualReportSubmittedAndMadePublic tf rep c) :
    TaskForceAnnualReporting tf rep c :=
  ⟨hEst, hReport⟩







theorem thirtyDayReportWaitElapsed_of_gap
    {rep : ComplianceReport} {act : EnforcementAction} {c : ComplaintText}
    (hGap : 30 ≤ dayEnforcementActionEffective act c
                  - dayOfReportFilingWithCommittees rep c) :
    ThirtyDayReportWaitElapsed rep act c := by
  show dayOfReportFilingWithCommittees rep c + 30
        ≤ dayEnforcementActionEffective act c
  omega




theorem thirtyDayWait_bites
    {a : FederalAgency} {rc : Recipient} {prog : EducationProgram} {r : AgencyRule}
    {hear : AdministrativeHearing} {act : EnforcementAction}
    {rep : ComplianceReport} {c : ComplaintText}
    (hTimely : TimelyTerminationOfAssistance a rc prog r hear act rep c)
    (hPremature : dayEnforcementActionEffective act c
                    < dayOfReportFilingWithCommittees rep c + 30) : False := by
  have hWait : dayOfReportFilingWithCommittees rep c + 30
                ≤ dayEnforcementActionEffective act c := hTimely.thirtyDayOk
  omega


theorem withinAdmissionsTransitionExemption_of_sixYearMeasure
    {prog : EducationProgram} {c : ComplaintText}
    (h : dayOfChallengedAdmissionsAction prog c ≤ dayOfTitleIXEnactment c + 2190) :
    WithinAdmissionsTransitionExemption prog c := by
  show dayOfChallengedAdmissionsAction prog c
        ≤ max (dayOfTitleIXEnactment c + 2190)
              (dayTransitionProcessBegan prog c + 2555)
  omega



theorem withinAdmissionsTransitionExemption_of_sevenYearMeasure
    {prog : EducationProgram} {c : ComplaintText}
    (h : dayOfChallengedAdmissionsAction prog c
          ≤ dayTransitionProcessBegan prog c + 2555) :
    WithinAdmissionsTransitionExemption prog c := by
  show dayOfChallengedAdmissionsAction prog c
        ≤ max (dayOfTitleIXEnactment c + 2190)
              (dayTransitionProcessBegan prog c + 2555)
  omega



theorem withinAdmissionsTransitionExemption_of_grace
    {prog : EducationProgram} {c : ComplaintText}
    (h : WithinEnactmentGracePeriod prog c) :
    WithinAdmissionsTransitionExemption prog c := by
  have h' : dayOfChallengedAdmissionsAction prog c
              ≤ dayOfTitleIXEnactment c + 365 := h
  show dayOfChallengedAdmissionsAction prog c
        ≤ max (dayOfTitleIXEnactment c + 2190)
              (dayTransitionProcessBegan prog c + 2555)
  omega


theorem recommendationsWithinNinetyDays_of_gap
    {tf : TaskForce} {rec : TaskForceRecommendations} {c : ComplaintText}
    (hGap : dayRecommendationsSubmitted rec c - dayTaskForceEstablished tf c ≤ 90) :
    RecommendationsWithinNinetyDays tf rec c := by
  show dayRecommendationsSubmitted rec c ≤ dayTaskForceEstablished tf c + 90
  omega


theorem detailWithinThreeYearLimit_bites
    {d : PersonnelDetail} {c : ComplaintText}
    (hWithin : DetailWithinThreeYearLimit d c)
    (hLong : 1096 ≤ daysOfPersonnelDetail d c) : False := by
  have h : daysOfPersonnelDetail d c ≤ 1095 := hWithin
  omega

end Proving.USC.T20.Ch38.Reearn.Procedure
