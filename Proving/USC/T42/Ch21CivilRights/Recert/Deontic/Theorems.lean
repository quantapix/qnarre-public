import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Statute

set_option autoImplicit false








namespace Proving.USC.T42.Ch21CivilRights.Recert.Deontic

open Proving.USC.Common



theorem power2000a4Investigate_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsCommunityRelationsService a c)
    (hRef : CondComplaintReferredByCourtUnder2000a3d c) :
    Power2000a4Investigate a c :=
  ⟨hAddr, hRef⟩

theorem power2000a4InvestigateExercised_intro
    {a : Addressee} {c : ComplaintText}
    (hNorm : Power2000a4Investigate a c)
    (hAct : ActFullInvestigationOfReferredComplaint a c) :
    Power2000a4InvestigateExercised a c :=
  ⟨hNorm, hAct⟩

theorem permission2000a4Hearings_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsCommunityRelationsService a c)
    (hRef : CondComplaintReferredByCourtUnder2000a3d c)
    (hNec : CondHearingNecessaryToInvestigation c) :
    Permission2000a4Hearings a c :=
  ⟨hAddr, hRef, hNec⟩

theorem permission2000a4HearingsExercised_intro
    {a : Addressee} {c : ComplaintText}
    (hNorm : Permission2000a4Hearings a c)
    (hAct : ActHeldHearingOnReferredComplaint a c) :
    Permission2000a4HearingsExercised a c :=
  ⟨hNorm, hAct⟩

theorem obligation2000a4ExecutiveSession_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsCommunityRelationsService a c)
    (hRef : CondComplaintReferredByCourtUnder2000a3d c)
    (hHearing : ActHeldHearingOnReferredComplaint a c) :
    Obligation2000a4ExecutiveSession a c :=
  ⟨hAddr, hRef, hHearing⟩

theorem obligation2000a4ExecutiveSessionBreached_intro
    {a : Addressee} {c : ComplaintText}
    (hNorm : Obligation2000a4ExecutiveSession a c)
    (hOmit : ¬ ActConductedHearingInExecutiveSession a c) :
    Obligation2000a4ExecutiveSessionBreached a c :=
  ⟨hNorm, hOmit⟩

theorem prohibition2000a4ReleaseTestimony_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsCommunityRelationsService a c)
    (hHearing : ActHeldHearingOnReferredComplaint a c) :
    Prohibition2000a4ReleaseTestimony a c :=
  ⟨hAddr, hHearing⟩

theorem prohibition2000a4ReleaseTestimonyViolated_intro
    {a : Addressee} {c : ComplaintText}
    (hNorm : Prohibition2000a4ReleaseTestimony a c)
    (hAct : ActReleasedHearingTestimony a c)
    (hNoEscape : ¬ EscapeAllPartiesAgreedWithCourtPermission c) :
    Prohibition2000a4ReleaseTestimonyViolated a c :=
  ⟨hNorm, hAct, hNoEscape⟩

theorem obligation2000a4VoluntarySettlement_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsCommunityRelationsService a c)
    (hRef : CondComplaintReferredByCourtUnder2000a3d c) :
    Obligation2000a4VoluntarySettlement a c :=
  ⟨hAddr, hRef⟩

theorem obligation2000a4VoluntarySettlementBreached_intro
    {a : Addressee} {c : ComplaintText}
    (hNorm : Obligation2000a4VoluntarySettlement a c)
    (hOmit : ¬ ActEndeavoredToBringAboutVoluntarySettlement a c) :
    Obligation2000a4VoluntarySettlementBreached a c :=
  ⟨hNorm, hOmit⟩

theorem section2000a4NormFailure_executiveSession_intro
    {a : Addressee} {c : ComplaintText}
    (h : Obligation2000a4ExecutiveSessionBreached a c) :
    Section2000a4NormFailure a c :=
  .executiveSession h

theorem section2000a4NormFailure_testimonyReleased_intro
    {a : Addressee} {c : ComplaintText}
    (h : Prohibition2000a4ReleaseTestimonyViolated a c) :
    Section2000a4NormFailure a c :=
  .testimonyReleased h

theorem section2000a4NormFailure_voluntarySettlement_intro
    {a : Addressee} {c : ComplaintText}
    (h : Obligation2000a4VoluntarySettlementBreached a c) :
    Section2000a4NormFailure a c :=
  .voluntarySettlement h



theorem power2000a5PatternOrPracticeAction_intro
    {a : Addressee} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral a c)
    (hCause : CondAttorneyGeneralHasReasonableCause a c)
    (hPattern : CondPatternOrPracticeOfResistance c)
    (hIntent : CondPatternIntendedToDenyFullExercise c) :
    Power2000a5PatternOrPracticeAction a c :=
  ⟨hAddr, hCause, hPattern, hIntent⟩

theorem power2000a5PatternOrPracticeActionExercised_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Power2000a5PatternOrPracticeAction a c)
    (hAct : ActBroughtPatternOrPracticeCivilAction a pr c)
    (hForm : CondComplaintSignedSetsForthFactsAndRequestsRelief pr c) :
    Power2000a5PatternOrPracticeActionExercised a pr c :=
  ⟨hNorm, hAct, hForm⟩

theorem power2000a5ThreeJudgeRequest_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral a c)
    (hProc : CondProceedingUnderSection2000a5 pr c) :
    Power2000a5ThreeJudgeRequest a pr c :=
  ⟨hAddr, hProc⟩

theorem power2000a5ThreeJudgeRequestExercised_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Power2000a5ThreeJudgeRequest a pr c)
    (hAct : ActFiledThreeJudgeCourtRequest a pr c) :
    Power2000a5ThreeJudgeRequestExercised a pr c :=
  ⟨hNorm, hAct⟩

theorem obligation2000a5CertificateAccompanies_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral a c)
    (hRequest : ActFiledThreeJudgeCourtRequest a pr c) :
    Obligation2000a5CertificateAccompanies a pr c :=
  ⟨hAddr, hRequest⟩

theorem obligation2000a5CertificateAccompaniesBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5CertificateAccompanies a pr c)
    (hOmit : ¬ ActRequestAccompaniedByPublicImportanceCertificate a pr c) :
    Obligation2000a5CertificateAccompaniesBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5ClerkFurnishesCopy_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsClerkOfDistrictCourt a pr c)
    (hRequest : CondThreeJudgeRequestFiled pr c) :
    Obligation2000a5ClerkFurnishesCopy a pr c :=
  ⟨hAddr, hRequest⟩

theorem obligation2000a5ClerkFurnishesCopyBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5ClerkFurnishesCopy a pr c)
    (hOmit : ¬ ActFurnishedCertificateCopyToChiefJudge a pr c) :
    Obligation2000a5ClerkFurnishesCopyBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5CircuitDesignatesPanel_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsChiefJudgeOfCircuit a pr c)
    (hRequest : CondThreeJudgeRequestFiled pr c) :
    Obligation2000a5CircuitDesignatesPanel a pr c :=
  ⟨hAddr, hRequest⟩

theorem actDesignatedProperlyConstitutedPanel_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hDesignated : ActDesignatedThreeJudgesImmediately a pr c)
    (hComposition : ActPanelIncludesCircuitAndInstitutingDistrictJudge pr c) :
    ActDesignatedProperlyConstitutedPanel a pr c :=
  ⟨hDesignated, hComposition⟩

theorem obligation2000a5CircuitDesignatesPanelBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5CircuitDesignatesPanel a pr c)
    (hOmit : ¬ ActDesignatedProperlyConstitutedPanel a pr c) :
    Obligation2000a5CircuitDesignatesPanelBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5PanelExpedites_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsDesignatedThreeJudgeCourt a pr c)
    (hProc : CondProceedingUnderSection2000a5 pr c) :
    Obligation2000a5PanelExpedites a pr c :=
  ⟨hAddr, hProc⟩

theorem obligation2000a5PanelExpeditesBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5PanelExpedites a pr c)
    (hOmit : ¬ ActAssignedParticipatedAndExpeditedCase a pr c) :
    Obligation2000a5PanelExpeditesBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem power2000a5AppealToSupremeCourt_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hParty : CondPartyToProceeding p pr c)
    (hJudgment : CondFinalJudgmentEnteredByThreeJudgeCourt pr c) :
    Power2000a5AppealToSupremeCourt p pr c :=
  ⟨hParty, hJudgment⟩

theorem power2000a5AppealToSupremeCourtExercised_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Power2000a5AppealToSupremeCourt p pr c)
    (hAct : ActAppealedFinalJudgmentToSupremeCourt p pr c) :
    Power2000a5AppealToSupremeCourtExercised p pr c :=
  ⟨hNorm, hAct⟩

theorem obligation2000a5DistrictDesignatesSingleJudge_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsChiefJudgeOfDistrict a pr c)
    (hProc : CondProceedingUnderSection2000a5 pr c)
    (hNoRequest : CondAttorneyGeneralFailedToRequestThreeJudgeCourt pr c) :
    Obligation2000a5DistrictDesignatesSingleJudge a pr c :=
  ⟨hAddr, hProc, hNoRequest⟩

theorem obligation2000a5DistrictDesignatesSingleJudgeBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5DistrictDesignatesSingleJudge a pr c)
    (hOmit : ¬ ActDesignatedSingleJudgeImmediately a pr c) :
    Obligation2000a5DistrictDesignatesSingleJudgeBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5CertifyUnavailability_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsChiefJudgeOfDistrict a pr c)
    (hProc : CondProceedingUnderSection2000a5 pr c)
    (hNone : CondNoDistrictJudgeAvailable pr c) :
    Obligation2000a5CertifyUnavailability a pr c :=
  ⟨hAddr, hProc, hNone⟩

theorem obligation2000a5CertifyUnavailabilityBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5CertifyUnavailability a pr c)
    (hOmit : ¬ ActCertifiedJudgeUnavailabilityToCircuit a pr c) :
    Obligation2000a5CertifyUnavailabilityBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5CircuitDesignatesAfterCertification_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsChiefJudgeOfCircuit a pr c)
    (hCert : CondUnavailabilityCertifiedToCircuit pr c) :
    Obligation2000a5CircuitDesignatesAfterCertification a pr c :=
  ⟨hAddr, hCert⟩

theorem obligation2000a5CircuitDesignatesAfterCertificationBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5CircuitDesignatesAfterCertification a pr c)
    (hOmit : ¬ ActDesignatedJudgeAfterUnavailabilityCertification a pr c) :
    Obligation2000a5CircuitDesignatesAfterCertificationBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem obligation2000a5DesignatedJudgeExpedites_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsDesignatedSingleJudge a pr c)
    (hProc : CondProceedingUnderSection2000a5 pr c) :
    Obligation2000a5DesignatedJudgeExpedites a pr c :=
  ⟨hAddr, hProc⟩

theorem obligation2000a5DesignatedJudgeExpeditesBreached_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation2000a5DesignatedJudgeExpedites a pr c)
    (hOmit : ¬ ActAssignedAndExpeditedCase a pr c) :
    Obligation2000a5DesignatedJudgeExpeditesBreached a pr c :=
  ⟨hNorm, hOmit⟩

theorem section2000a5NormFailure_certificate_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5CertificateAccompaniesBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .certificate h

theorem section2000a5NormFailure_clerkCopy_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5ClerkFurnishesCopyBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .clerkCopy h

theorem section2000a5NormFailure_circuitPanel_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5CircuitDesignatesPanelBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .circuitPanel h

theorem section2000a5NormFailure_panelExpedites_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5PanelExpeditesBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .panelExpedites h

theorem section2000a5NormFailure_districtSingleJudge_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5DistrictDesignatesSingleJudgeBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .districtSingleJudge h

theorem section2000a5NormFailure_certifyUnavailability_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5CertifyUnavailabilityBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .certifyUnavailability h

theorem section2000a5NormFailure_circuitAfterCertification_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5CircuitDesignatesAfterCertificationBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .circuitAfterCertification h

theorem section2000a5NormFailure_designatedJudgeExpedites_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (h : Obligation2000a5DesignatedJudgeExpeditesBreached a pr c) :
    Section2000a5NormFailure a pr c :=
  .designatedJudgeExpedites h



theorem prohibition2000d_intro
    {r : Recipient} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederallyAssistedProgram r c)
    (hTerm : TermProgramOrActivityApplies r c)
    (hAssistance : ReceivesFederalFinancialAssistance r c)
    (hPerson : IsPersonInUnitedStates p c) :
    Prohibition2000d r p c :=
  ⟨hAddr, hTerm, hAssistance, hPerson⟩

theorem prohibition2000dViolated_intro
    {r : Recipient} {p : Person} {c : ComplaintText}
    (hNorm : Prohibition2000d r p c)
    (hAct : ActExcludedDeniedBenefitsOrDiscriminated r p c)
    (hGround : OnGroundOfRaceColorOrNationalOrigin p r c) :
    Prohibition2000dViolated r p c :=
  ⟨hNorm, hAct, hGround⟩



theorem power2000d1Rulemaking_intro
    {a : Addressee} {r : Recipient} {c : ComplaintText}
    (hAddr : AddresseeIsFederalFundingAgency a c)
    (hEmpowered : CondAgencyEmpoweredToExtendFederalFinancialAssistance a c)
    (hForm : CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty r c) :
    Power2000d1Rulemaking a r c :=
  ⟨hAddr, hEmpowered, hForm⟩

theorem actIssuedConsistentRuleEffectuatingSection2000d_intro
    {a : Addressee} {ru : Rule} {c : ComplaintText}
    (hIssued : ActIssuedRuleEffectuatingSection2000d a ru c)
    (hConsistent : ActRuleConsistentWithStatutoryObjectives ru c) :
    ActIssuedConsistentRuleEffectuatingSection2000d a ru c :=
  ⟨hIssued, hConsistent⟩

theorem power2000d1RulemakingExercised_intro
    {a : Addressee} {r : Recipient} {ru : Rule} {c : ComplaintText}
    (hNorm : Power2000d1Rulemaking a r c)
    (hAct : ActIssuedConsistentRuleEffectuatingSection2000d a ru c) :
    Power2000d1RulemakingExercised a r ru c :=
  ⟨hNorm, hAct⟩

theorem obligation2000d1Rulemaking_intro
    {a : Addressee} {r : Recipient} {c : ComplaintText}
    (hAddr : AddresseeIsFederalFundingAgency a c)
    (hEmpowered : CondAgencyEmpoweredToExtendFederalFinancialAssistance a c)
    (hForm : CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty r c) :
    Obligation2000d1Rulemaking a r c :=
  ⟨hAddr, hEmpowered, hForm⟩

theorem obligation2000d1RulemakingBreached_intro
    {a : Addressee} {r : Recipient} {c : ComplaintText}
    (hNorm : Obligation2000d1Rulemaking a r c)
    (hOmit : ¬ (∃ ru : Rule, ActIssuedConsistentRuleEffectuatingSection2000d a ru c)) :
    Obligation2000d1RulemakingBreached a r c :=
  ⟨hNorm, hOmit⟩

theorem prohibition2000d1EffectiveWithoutApproval_intro
    {ru : Rule} {c : ComplaintText}
    (hUnderSection : CondRuleIssuedUnderSection2000d1 ru c) :
    Prohibition2000d1EffectiveWithoutApproval ru c :=
  ⟨hUnderSection⟩

theorem prohibition2000d1EffectiveWithoutApprovalViolated_intro
    {ru : Rule} {c : ComplaintText}
    (hNorm : Prohibition2000d1EffectiveWithoutApproval ru c)
    (hAct : ActRuleTookEffect ru c)
    (hNoApproval : ¬ CondRuleApprovedByPresident ru c) :
    Prohibition2000d1EffectiveWithoutApprovalViolated ru c :=
  ⟨hNorm, hAct, hNoApproval⟩

theorem power2000d1EffectCompliance_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (hAddr : AddresseeIsFederalFundingAgency a c)
    (hPursuant : CondActionTakenPursuantToSection2000d1 ea c)
    (hFinding : CondExpressFindingOnRecordAfterHearing ea c) :
    Power2000d1EffectCompliance a ea c :=
  ⟨hAddr, hPursuant, hFinding⟩

theorem power2000d1EffectComplianceExercised_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (hNorm : Power2000d1EffectCompliance a ea c)
    (hAct : ActEffectedComplianceByTerminationOrRefusal a ea c) :
    Power2000d1EffectComplianceExercised a ea c :=
  ⟨hNorm, hAct⟩

theorem prohibition2000d1TerminationBeyondFinding_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hPursuant : CondActionTakenPursuantToSection2000d1 ea c)
    (hFinding : CondExpressFindingOnRecordAfterHearing ea c) :
    Prohibition2000d1TerminationBeyondFinding ea c :=
  ⟨hPursuant, hFinding⟩

theorem prohibition2000d1TerminationBeyondFindingViolated_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hNorm : Prohibition2000d1TerminationBeyondFinding ea c)
    (hAct : ActTerminationExtendedBeyondFinding ea c) :
    Prohibition2000d1TerminationBeyondFindingViolated ea c :=
  ⟨hNorm, hAct⟩

theorem preTerminationConditionsSatisfied_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hAdvised : CondAgencyAdvisedOfFailureToComply ea c)
    (hVoluntary : CondVoluntaryComplianceDeterminedUnattainable ea c) :
    PreTerminationConditionsSatisfied ea c :=
  ⟨hAdvised, hVoluntary⟩

theorem prohibition2000d1ActionBeforeNoticeAndVoluntaryEffort_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hPursuant : CondActionTakenPursuantToSection2000d1 ea c) :
    Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffort ea c :=
  ⟨hPursuant⟩

theorem prohibition2000d1ActionBeforeNoticeAndVoluntaryEffortViolated_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hNorm : Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffort ea c)
    (hAct : ActEnforcementActionTaken ea c)
    (hUnmet : ¬ PreTerminationConditionsSatisfied ea c) :
    Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffortViolated ea c :=
  ⟨hNorm, hAct, hUnmet⟩

theorem obligation2000d1ReportToCommittees_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (hAddr : AddresseeIsHeadOfFederalFundingAgency a c)
    (hPursuant : CondActionTakenPursuantToSection2000d1 ea c)
    (hTaken : ActEnforcementActionTaken ea c) :
    Obligation2000d1ReportToCommittees a ea c :=
  ⟨hAddr, hPursuant, hTaken⟩

theorem obligation2000d1ReportToCommitteesBreached_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (hNorm : Obligation2000d1ReportToCommittees a ea c)
    (hOmit : ¬ ActFiledFullWrittenReportWithCommittees a ea c) :
    Obligation2000d1ReportToCommitteesBreached a ea c :=
  ⟨hNorm, hOmit⟩


theorem thirtyDayReportPeriodElapsed_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (h : 30 ≤ daysFromReportFilingToActionEffective ea c) :
    ThirtyDayReportPeriodElapsed ea c :=
  h

theorem prohibition2000d1ActionEffectiveBeforeThirtyDays_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hPursuant : CondActionTakenPursuantToSection2000d1 ea c)
    (hTaken : ActEnforcementActionTaken ea c) :
    Prohibition2000d1ActionEffectiveBeforeThirtyDays ea c :=
  ⟨hPursuant, hTaken⟩

theorem prohibition2000d1ActionEffectiveBeforeThirtyDaysViolated_intro
    {ea : EnforcementAction} {c : ComplaintText}
    (hNorm : Prohibition2000d1ActionEffectiveBeforeThirtyDays ea c)
    (hAct : ActEnforcementActionBecameEffective ea c)
    (hEarly : ¬ ThirtyDayReportPeriodElapsed ea c) :
    Prohibition2000d1ActionEffectiveBeforeThirtyDaysViolated ea c :=
  ⟨hNorm, hAct, hEarly⟩

theorem section2000d1NormFailure_terminationBeyondFinding_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (h : Prohibition2000d1TerminationBeyondFindingViolated ea c) :
    Section2000d1NormFailure a ea c :=
  .terminationBeyondFinding h

theorem section2000d1NormFailure_actionBeforeNotice_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (h : Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffortViolated ea c) :
    Section2000d1NormFailure a ea c :=
  .actionBeforeNotice h

theorem section2000d1NormFailure_reportToCommittees_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (h : Obligation2000d1ReportToCommitteesBreached a ea c) :
    Section2000d1NormFailure a ea c :=
  .reportToCommittees h

theorem section2000d1NormFailure_actionEffectiveEarly_intro
    {a : Addressee} {ea : EnforcementAction} {c : ComplaintText}
    (h : Prohibition2000d1ActionEffectiveBeforeThirtyDaysViolated ea c) :
    Section2000d1NormFailure a ea c :=
  .actionEffectiveEarly h





theorem definedProgramOrActivity_intro
    {r : Recipient} {c : ComplaintText}
    (h : TermProgramOrActivityApplies r c) :
    DefinedProgramOrActivity r c :=
  h



theorem power2000d7ImmunityAbrogated_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeIsStateSuedInFederalCourt a pr c)
    (hStatute : CondSuitForViolationOfCoveredAntidiscriminationStatute pr c)
    (hDate : CondViolationOccursAfterOctober211986 pr c) :
    Power2000d7ImmunityAbrogated a pr c :=
  ⟨hAddr, hStatute, hDate⟩

theorem power2000d7ImmunityAbrogatedExercised_intro
    {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Power2000d7ImmunityAbrogated a pr c)
    (hAct : ActMaintainedFederalSuitAgainstState pr c) :
    Power2000d7ImmunityAbrogatedExercised a pr c :=
  ⟨hNorm, hAct⟩

theorem permission2000d7RemediesCoextensive_intro
    {p : Person} {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hClaimant : AddresseeIsClaimantAgainstState p pr c)
    (hState : AddresseeIsStateSuedInFederalCourt a pr c)
    (hStatute : CondSuitForViolationOfCoveredAntidiscriminationStatute pr c)
    (hDate : CondViolationOccursAfterOctober211986 pr c)
    (hComparator : CondRemedyAvailableAgainstNonStateEntity pr c) :
    Permission2000d7RemediesCoextensive p a pr c :=
  ⟨hClaimant, hState, hStatute, hDate, hComparator⟩

theorem permission2000d7RemediesCoextensiveExercised_intro
    {p : Person} {a : Addressee} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Permission2000d7RemediesCoextensive p a pr c)
    (hAct : ActSoughtRemedyAgainstState p pr c) :
    Permission2000d7RemediesCoextensiveExercised p a pr c :=
  ⟨hNorm, hAct⟩



theorem ch21CoveredNormFailure_section2000a4_intro
    {c : ComplaintText} (a : Addressee) (h : Section2000a4NormFailure a c) :
    Ch21CoveredNormFailure c :=
  .section2000a4 a h

theorem ch21CoveredNormFailure_section2000a5_intro
    {c : ComplaintText} (a : Addressee) (pr : Proceeding)
    (h : Section2000a5NormFailure a pr c) :
    Ch21CoveredNormFailure c :=
  .section2000a5 a pr h

theorem ch21CoveredNormFailure_section2000d_intro
    {c : ComplaintText} (r : Recipient) (p : Person) (h : Prohibition2000dViolated r p c) :
    Ch21CoveredNormFailure c :=
  .section2000d r p h

theorem ch21CoveredNormFailure_section2000d1Enforcement_intro
    {c : ComplaintText} (a : Addressee) (ea : EnforcementAction)
    (h : Section2000d1NormFailure a ea c) :
    Ch21CoveredNormFailure c :=
  .section2000d1Enforcement a ea h

theorem ch21CoveredNormFailure_section2000d1Rulemaking_intro
    {c : ComplaintText} (a : Addressee) (r : Recipient)
    (h : Obligation2000d1RulemakingBreached a r c) :
    Ch21CoveredNormFailure c :=
  .section2000d1Rulemaking a r h

theorem ch21CoveredNormFailure_section2000d1Rule_intro
    {c : ComplaintText} (ru : Rule)
    (h : Prohibition2000d1EffectiveWithoutApprovalViolated ru c) :
    Ch21CoveredNormFailure c :=
  .section2000d1Rule ru h

end Proving.USC.T42.Ch21CivilRights.Recert.Deontic
