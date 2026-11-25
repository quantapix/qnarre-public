import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Predicates

set_option autoImplicit false





















namespace Proving.USC.T42.Ch21CivilRights.Recert.Deontic

open Proving.USC.Common






def ActDesignatedProperlyConstitutedPanel
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  ActDesignatedThreeJudgesImmediately a pr c ∧
    ActPanelIncludesCircuitAndInstitutingDistrictJudge pr c



def ActIssuedConsistentRuleEffectuatingSection2000d
    (a : Addressee) (ru : Rule) (c : ComplaintText) : Prop :=
  ActIssuedRuleEffectuatingSection2000d a ru c ∧ ActRuleConsistentWithStatutoryObjectives ru c



def PreTerminationConditionsSatisfied (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  CondAgencyAdvisedOfFailureToComply ea c ∧ CondVoluntaryComplianceDeterminedUnattainable ea c



def ThirtyDayReportPeriodElapsed (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  30 ≤ daysFromReportFilingToActionEffective ea c





structure Power2000a4Investigate (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCommunityRelationsService a c
  referral : CondComplaintReferredByCourtUnder2000a3d c


def Power2000a4InvestigateExercised (a : Addressee) (c : ComplaintText) : Prop :=
  Power2000a4Investigate a c ∧ ActFullInvestigationOfReferredComplaint a c



structure Permission2000a4Hearings (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCommunityRelationsService a c
  referral : CondComplaintReferredByCourtUnder2000a3d c
  necessity : CondHearingNecessaryToInvestigation c


def Permission2000a4HearingsExercised (a : Addressee) (c : ComplaintText) : Prop :=
  Permission2000a4Hearings a c ∧ ActHeldHearingOnReferredComplaint a c



structure Obligation2000a4ExecutiveSession (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCommunityRelationsService a c
  referral : CondComplaintReferredByCourtUnder2000a3d c
  hearingHeld : ActHeldHearingOnReferredComplaint a c


def Obligation2000a4ExecutiveSessionBreached (a : Addressee) (c : ComplaintText) : Prop :=
  Obligation2000a4ExecutiveSession a c ∧ ¬ ActConductedHearingInExecutiveSession a c





structure Prohibition2000a4ReleaseTestimony (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCommunityRelationsService a c
  hearingHeld : ActHeldHearingOnReferredComplaint a c



def Prohibition2000a4ReleaseTestimonyViolated (a : Addressee) (c : ComplaintText) : Prop :=
  Prohibition2000a4ReleaseTestimony a c ∧ ActReleasedHearingTestimony a c ∧
    ¬ EscapeAllPartiesAgreedWithCourtPermission c



structure Obligation2000a4VoluntarySettlement (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCommunityRelationsService a c
  referral : CondComplaintReferredByCourtUnder2000a3d c


def Obligation2000a4VoluntarySettlementBreached (a : Addressee) (c : ComplaintText) : Prop :=
  Obligation2000a4VoluntarySettlement a c ∧ ¬ ActEndeavoredToBringAboutVoluntarySettlement a c


inductive Section2000a4NormFailure (a : Addressee) (c : ComplaintText) : Prop where
  | executiveSession (h : Obligation2000a4ExecutiveSessionBreached a c)
  | testimonyReleased (h : Prohibition2000a4ReleaseTestimonyViolated a c)
  | voluntarySettlement (h : Obligation2000a4VoluntarySettlementBreached a c)






structure Power2000a5PatternOrPracticeAction
    (a : Addressee) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral a c
  reasonableCause : CondAttorneyGeneralHasReasonableCause a c
  patternOrPractice : CondPatternOrPracticeOfResistance c
  intendedDenial : CondPatternIntendedToDenyFullExercise c



def Power2000a5PatternOrPracticeActionExercised
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2000a5PatternOrPracticeAction a c ∧ ActBroughtPatternOrPracticeCivilAction a pr c ∧
    CondComplaintSignedSetsForthFactsAndRequestsRelief pr c



structure Power2000a5ThreeJudgeRequest
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral a c
  proceeding : CondProceedingUnderSection2000a5 pr c


def Power2000a5ThreeJudgeRequestExercised
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2000a5ThreeJudgeRequest a pr c ∧ ActFiledThreeJudgeCourtRequest a pr c



structure Obligation2000a5CertificateAccompanies
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral a c
  requestFiled : ActFiledThreeJudgeCourtRequest a pr c


def Obligation2000a5CertificateAccompaniesBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5CertificateAccompanies a pr c ∧
    ¬ ActRequestAccompaniedByPublicImportanceCertificate a pr c



structure Obligation2000a5ClerkFurnishesCopy
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsClerkOfDistrictCourt a pr c
  requestFiled : CondThreeJudgeRequestFiled pr c


def Obligation2000a5ClerkFurnishesCopyBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5ClerkFurnishesCopy a pr c ∧ ¬ ActFurnishedCertificateCopyToChiefJudge a pr c





structure Obligation2000a5CircuitDesignatesPanel
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsChiefJudgeOfCircuit a pr c
  requestFiled : CondThreeJudgeRequestFiled pr c


def Obligation2000a5CircuitDesignatesPanelBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5CircuitDesignatesPanel a pr c ∧ ¬ ActDesignatedProperlyConstitutedPanel a pr c





structure Obligation2000a5PanelExpedites
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsDesignatedThreeJudgeCourt a pr c
  proceeding : CondProceedingUnderSection2000a5 pr c


def Obligation2000a5PanelExpeditesBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5PanelExpedites a pr c ∧ ¬ ActAssignedParticipatedAndExpeditedCase a pr c



structure Power2000a5AppealToSupremeCourt
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  party : CondPartyToProceeding p pr c
  finalJudgment : CondFinalJudgmentEnteredByThreeJudgeCourt pr c


def Power2000a5AppealToSupremeCourtExercised
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2000a5AppealToSupremeCourt p pr c ∧ ActAppealedFinalJudgmentToSupremeCourt p pr c




structure Obligation2000a5DistrictDesignatesSingleJudge
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsChiefJudgeOfDistrict a pr c
  proceeding : CondProceedingUnderSection2000a5 pr c
  noRequest : CondAttorneyGeneralFailedToRequestThreeJudgeCourt pr c


def Obligation2000a5DistrictDesignatesSingleJudgeBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5DistrictDesignatesSingleJudge a pr c ∧ ¬ ActDesignatedSingleJudgeImmediately a pr c




structure Obligation2000a5CertifyUnavailability
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsChiefJudgeOfDistrict a pr c
  proceeding : CondProceedingUnderSection2000a5 pr c
  noneAvailable : CondNoDistrictJudgeAvailable pr c


def Obligation2000a5CertifyUnavailabilityBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5CertifyUnavailability a pr c ∧ ¬ ActCertifiedJudgeUnavailabilityToCircuit a pr c



structure Obligation2000a5CircuitDesignatesAfterCertification
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsChiefJudgeOfCircuit a pr c
  certified : CondUnavailabilityCertifiedToCircuit pr c


def Obligation2000a5CircuitDesignatesAfterCertificationBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5CircuitDesignatesAfterCertification a pr c ∧
    ¬ ActDesignatedJudgeAfterUnavailabilityCertification a pr c




structure Obligation2000a5DesignatedJudgeExpedites
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsDesignatedSingleJudge a pr c
  proceeding : CondProceedingUnderSection2000a5 pr c


def Obligation2000a5DesignatedJudgeExpeditesBreached
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2000a5DesignatedJudgeExpedites a pr c ∧ ¬ ActAssignedAndExpeditedCase a pr c


inductive Section2000a5NormFailure
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  | certificate (h : Obligation2000a5CertificateAccompaniesBreached a pr c)
  | clerkCopy (h : Obligation2000a5ClerkFurnishesCopyBreached a pr c)
  | circuitPanel (h : Obligation2000a5CircuitDesignatesPanelBreached a pr c)
  | panelExpedites (h : Obligation2000a5PanelExpeditesBreached a pr c)
  | districtSingleJudge (h : Obligation2000a5DistrictDesignatesSingleJudgeBreached a pr c)
  | certifyUnavailability (h : Obligation2000a5CertifyUnavailabilityBreached a pr c)
  | circuitAfterCertification (h : Obligation2000a5CircuitDesignatesAfterCertificationBreached a pr c)
  | designatedJudgeExpedites (h : Obligation2000a5DesignatedJudgeExpeditesBreached a pr c)







structure Prohibition2000d (r : Recipient) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederallyAssistedProgram r c
  programOrActivity : TermProgramOrActivityApplies r c
  assistance : ReceivesFederalFinancialAssistance r c
  personInUS : IsPersonInUnitedStates p c



def Prohibition2000dViolated (r : Recipient) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000d r p c ∧ ActExcludedDeniedBenefitsOrDiscriminated r p c ∧
    OnGroundOfRaceColorOrNationalOrigin p r c






structure Power2000d1Rulemaking
    (a : Addressee) (r : Recipient) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalFundingAgency a c
  empowered : CondAgencyEmpoweredToExtendFederalFinancialAssistance a c
  assistanceForm : CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty r c


def Power2000d1RulemakingExercised
    (a : Addressee) (r : Recipient) (ru : Rule) (c : ComplaintText) : Prop :=
  Power2000d1Rulemaking a r c ∧ ActIssuedConsistentRuleEffectuatingSection2000d a ru c




structure Obligation2000d1Rulemaking
    (a : Addressee) (r : Recipient) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalFundingAgency a c
  empowered : CondAgencyEmpoweredToExtendFederalFinancialAssistance a c
  assistanceForm : CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty r c


def Obligation2000d1RulemakingBreached
    (a : Addressee) (r : Recipient) (c : ComplaintText) : Prop :=
  Obligation2000d1Rulemaking a r c ∧
    ¬ (∃ ru : Rule, ActIssuedConsistentRuleEffectuatingSection2000d a ru c)



structure Prohibition2000d1EffectiveWithoutApproval (ru : Rule) (c : ComplaintText) : Prop where
  issuedUnderSection : CondRuleIssuedUnderSection2000d1 ru c


def Prohibition2000d1EffectiveWithoutApprovalViolated (ru : Rule) (c : ComplaintText) : Prop :=
  Prohibition2000d1EffectiveWithoutApproval ru c ∧ ActRuleTookEffect ru c ∧
    ¬ CondRuleApprovedByPresident ru c





structure Power2000d1EffectCompliance
    (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalFundingAgency a c
  pursuantToSection : CondActionTakenPursuantToSection2000d1 ea c
  finding : CondExpressFindingOnRecordAfterHearing ea c


def Power2000d1EffectComplianceExercised
    (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  Power2000d1EffectCompliance a ea c ∧ ActEffectedComplianceByTerminationOrRefusal a ea c





structure Prohibition2000d1TerminationBeyondFinding
    (ea : EnforcementAction) (c : ComplaintText) : Prop where
  pursuantToSection : CondActionTakenPursuantToSection2000d1 ea c
  finding : CondExpressFindingOnRecordAfterHearing ea c



def Prohibition2000d1TerminationBeyondFindingViolated
    (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  Prohibition2000d1TerminationBeyondFinding ea c ∧ ActTerminationExtendedBeyondFinding ea c





structure Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffort
    (ea : EnforcementAction) (c : ComplaintText) : Prop where
  pursuantToSection : CondActionTakenPursuantToSection2000d1 ea c


def Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffortViolated
    (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffort ea c ∧ ActEnforcementActionTaken ea c ∧
    ¬ PreTerminationConditionsSatisfied ea c




structure Obligation2000d1ReportToCommittees
    (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop where
  addressee : AddresseeIsHeadOfFederalFundingAgency a c
  pursuantToSection : CondActionTakenPursuantToSection2000d1 ea c
  actionTaken : ActEnforcementActionTaken ea c


def Obligation2000d1ReportToCommitteesBreached
    (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  Obligation2000d1ReportToCommittees a ea c ∧ ¬ ActFiledFullWrittenReportWithCommittees a ea c



structure Prohibition2000d1ActionEffectiveBeforeThirtyDays
    (ea : EnforcementAction) (c : ComplaintText) : Prop where
  pursuantToSection : CondActionTakenPursuantToSection2000d1 ea c
  actionTaken : ActEnforcementActionTaken ea c


def Prohibition2000d1ActionEffectiveBeforeThirtyDaysViolated
    (ea : EnforcementAction) (c : ComplaintText) : Prop :=
  Prohibition2000d1ActionEffectiveBeforeThirtyDays ea c ∧ ActEnforcementActionBecameEffective ea c ∧
    ¬ ThirtyDayReportPeriodElapsed ea c


inductive Section2000d1NormFailure
    (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop where
  | terminationBeyondFinding (h : Prohibition2000d1TerminationBeyondFindingViolated ea c)
  | actionBeforeNotice (h : Prohibition2000d1ActionBeforeNoticeAndVoluntaryEffortViolated ea c)
  | reportToCommittees (h : Obligation2000d1ReportToCommitteesBreached a ea c)
  | actionEffectiveEarly (h : Prohibition2000d1ActionEffectiveBeforeThirtyDaysViolated ea c)











def DefinedProgramOrActivity (r : Recipient) (c : ComplaintText) : Prop :=
  TermProgramOrActivityApplies r c


def modality2000d4a : Modality := Modality.definition












structure Power2000d7ImmunityAbrogated
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeIsStateSuedInFederalCourt a pr c
  coveredStatute : CondSuitForViolationOfCoveredAntidiscriminationStatute pr c
  afterEffectiveDate : CondViolationOccursAfterOctober211986 pr c


def Power2000d7ImmunityAbrogatedExercised
    (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2000d7ImmunityAbrogated a pr c ∧ ActMaintainedFederalSuitAgainstState pr c




structure Permission2000d7RemediesCoextensive
    (p : Person) (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop where
  claimant : AddresseeIsClaimantAgainstState p pr c
  state : AddresseeIsStateSuedInFederalCourt a pr c
  coveredStatute : CondSuitForViolationOfCoveredAntidiscriminationStatute pr c
  afterEffectiveDate : CondViolationOccursAfterOctober211986 pr c
  comparator : CondRemedyAvailableAgainstNonStateEntity pr c


def Permission2000d7RemediesCoextensiveExercised
    (p : Person) (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Permission2000d7RemediesCoextensive p a pr c ∧ ActSoughtRemedyAgainstState p pr c






inductive Ch21CoveredNormFailure (c : ComplaintText) : Prop where
  | section2000a4 (a : Addressee) (h : Section2000a4NormFailure a c)
  | section2000a5 (a : Addressee) (pr : Proceeding) (h : Section2000a5NormFailure a pr c)
  | section2000d (r : Recipient) (p : Person) (h : Prohibition2000dViolated r p c)
  | section2000d1Enforcement (a : Addressee) (ea : EnforcementAction)
      (h : Section2000d1NormFailure a ea c)
  | section2000d1Rulemaking (a : Addressee) (r : Recipient)
      (h : Obligation2000d1RulemakingBreached a r c)
  | section2000d1Rule (ru : Rule) (h : Prohibition2000d1EffectiveWithoutApprovalViolated ru c)

end Proving.USC.T42.Ch21CivilRights.Recert.Deontic
