













import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Procedure

open Proving.USC.Common



structure Transition where

  pre : Stage

  post : Stage

  guard : Prop





def CouncilOrganizedWithinOneHundredTwentyDays
    (co : AdvisoryCouncil) (c : ComplaintText) : Prop :=
  daysFromJuly291975ToCouncilOrganization co c ≤ 120





def CouncilCompositionQuotasSatisfied
    (co : AdvisoryCouncil) (c : ComplaintText) : Prop :=
  councilMemberCount co c = 15
    ∧ 12 ≤ councilGoverningBoardMemberCount co c
    ∧ 9 ≤ councilBoardMembersServedByCenterCount co c
    ∧ councilHealthQualifiedMemberCount co c = 3


structure Section218CouncilConstitution
    (co : AdvisoryCouncil) (c : ComplaintText) : Prop where

  appointed : SecretaryAppointedMigrantHealthCouncil co c

  timely : CouncilOrganizedWithinOneHundredTwentyDays co c

  composition : CouncilCompositionQuotasSatisfied co c



def VacancyTermRunsToPredecessorExpiration
    (m : CouncilMember) (c : ComplaintText) : Prop :=
  vacancyAppointeeTermExpirationDay m c = predecessorTermExpirationDay m c


structure Section218VacancyAppointment
    (m : CouncilMember) (c : ComplaintText) : Prop where

  vacancy : CouncilMemberAppointedToFillVacancy m c

  remainderOnly : VacancyTermRunsToPredecessorExpiration m c


def section218ConstitutionTransition
    (co : AdvisoryCouncil) (c : ComplaintText) : Transition :=
  { pre := Stage.notCommenced
    post := Stage.bodyConstituted
    guard := Section218CouncilConstitution co c }





def CentralServiceAuthorizationComplete
    (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop :=
  SurgeonGeneralDeterminedCentralService t c
    ∧ SecretaryApprovedCentralServiceDetermination t c



inductive Section231ReimbursementOccasion
    (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop where

  | onPerformance (hp : ServicesPerformedOrStockFurnished t c)
      (hr : ServiceAndSupplyFundReimbursed t c)

  | inAdvance (ha : ReimbursementMadeInAdvanceOfPerformance t c)
      (hr : ServiceAndSupplyFundReimbursed t c)


structure Section231ReimbursementProper
    (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop where

  authorized : CentralServiceAuthorizationComplete t c

  occasion : Section231ReimbursementOccasion t c

  rateProper : ReimbursementRateCoversStatutoryCostComponents t c





def ProcessDeliveredWithinPrescribedTime
    (a : CivilAction) (c : ComplaintText) : Prop :=
  daysFromServiceOfProcessToDelivery a c
    ≤ attorneyGeneralPrescribedDeliveryDays a c



structure Section233ProcessTransmittal
    (a : CivilAction) (c : ComplaintText) : Prop where

  suitBrought : CivilActionBroughtAgainstDeemedPerson a c

  delivered : ProcessDeliveredToImmediateSuperiorOrDesignee a c

  withinWindow : ProcessDeliveredWithinPrescribedTime a c

  copiesFurnished : CopiesOfPleadingFurnishedToFederalOfficers a c


structure Section233FederalDefense
    (a : CivilAction) (c : ComplaintText) : Prop where

  transmittal : Section233ProcessTransmittal a c

  defended : AttorneyGeneralDefendedAction a c



def RemovalOccurredBeforeTrial
    (a : CivilAction) (c : ComplaintText) : Prop :=
  removalFilingDay a c < trialCommencementDay a c


structure Section233RemovalProper
    (a : CivilAction) (c : ComplaintText) : Prop where

  stateCourt : ActionCommencedInStateCourt a c

  certified : AttorneyGeneralCertifiedScopeOfEmployment a c

  beforeTrial : RemovalOccurredBeforeTrial a c

  withoutBond : RemovalEffectedWithoutBond a c





noncomputable def tolledCompensationDeadlineDay
    (a : CivilAction) (c : ComplaintText) : Nat :=
  compensationClaimLimitationsDeadlineDay a c + civilActionPendencyDays a c



def CompensationClaimTimelyAfterSuspension
    (a : CivilAction) (c : ComplaintText) : Prop :=
  compensationClaimFilingDay a c ≤ tolledCompensationDeadlineDay a c






inductive Section233PostRemovalDisposition
    (a : CivilAction) (c : ComplaintText) : Prop where


  | retainedAsFederalTortAction (h : FtcaRemedyAvailableAgainstUnitedStates a c)

  | remandedToStateCourt (hh : RemandMotionHeardBeforeTrialOnMerits a c)
      (hno : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
      (hnp : ¬ AlternativeCompensationRemedyPrecludesSuit a c)


  | dismissedWithLimitationsSuspended
      (hh : RemandMotionHeardBeforeTrialOnMerits a c)
      (hno : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
      (hp : AlternativeCompensationRemedyPrecludesSuit a c)
      (hs : CompensationClaimTimelyAfterSuspension a c)



def SecretaryDeterminedWithinThirtyDays
    (ap : DeemingApplication) (c : ComplaintText) : Prop :=
  daysFromDeemingApplicationReceiptToDetermination ap c ≤ 30



def SubsectionHPrerequisitesMet
    (ap : DeemingApplication) (c : ComplaintText) : Prop :=
  EntityRiskManagementPoliciesImplemented ap c
    ∧ EntityProfessionalCredentialsVerified ap c
    ∧ EntityClaimsHistoryAcceptable ap c
    ∧ EntityWillCooperateWithAttorneyGeneral ap c



structure Section233DeemingDetermination
    (ap : DeemingApplication) (c : ComplaintText) : Prop where

  applied : DeemingApplicationSubmittedToSecretary ap c

  prerequisites : SubsectionHPrerequisitesMet ap c

  timely : SecretaryDeterminedWithinThirtyDays ap c

  approved : SecretaryApprovedDeemingApplication ap c



inductive Section233ExclusionGround (x : Person) (c : ComplaintText) : Prop where

  | policyNoncompliance (h : PractitionerNoncompliantWithEntityPolicies x c)

  | claimsHistory (h : PractitionerClaimsHistoryOutsideNorm x c)

  | refusalToCooperate (h : PractitionerRefusedToCooperateInDefense x c)

  | falseInformation (h : PractitionerProvidedFalseInformation x c)


  | disciplinaryAction (h : PractitionerSubjectToDisciplinaryAction x c)




structure Section233IndividualExclusion
    (x : Person) (c : ComplaintText) : Prop where

  onRecord : ExclusionDeterminationMadeOnTheRecord x c

  hearing : NoticeAndFullAndFairHearingAfforded x c

  ground : Section233ExclusionGround x c

  noticeReceived : ExclusionNoticeReceivedByEntity x c



def ExclusionReachesActOrOmission (x : Person) (c : ComplaintText) : Prop :=
  exclusionNoticeReceiptDay x c < challengedActOrOmissionDay x c


structure Section233ExclusionEffective
    (x : Person) (c : ComplaintText) : Prop where

  determined : Section233IndividualExclusion x c

  prospectiveOnly : ExclusionReachesActOrOmission x c




def AttorneyGeneralAppearanceTimely
    (a : CivilAction) (c : ComplaintText) : Prop :=
  AttorneyGeneralAppearedInStateCourt a c
    ∧ daysFromStateCourtNotificationToAppearance a c ≤ 15




def AttorneyGeneralFailedToAppearTimely
    (a : CivilAction) (c : ComplaintText) : Prop :=
  ¬ AttorneyGeneralAppearedInStateCourt a c
    ∨ 15 < daysFromStateCourtNotificationToAppearance a c



structure Section233AdviceSatisfiesCertification
    (a : CivilAction) (c : ComplaintText) : Prop where

  timelyAppearance : AttorneyGeneralAppearanceTimely a c

  certificationDeemed : AttorneyGeneralCertifiedScopeOfEmployment a c



structure Section233RemovalOnPetition
    (a : CivilAction) (c : ComplaintText) : Prop where

  failure : AttorneyGeneralFailedToAppearTimely a c

  petition : PetitionForRemovalFiledByNamedParty a c

  stayed : ProceedingStayedPendingForumDetermination a c

  forumOrder : CourtIssuedForumDeterminationOrder a c



def SecretaryLapsedTwoHundredFortyDays
    (r : CompensationRequest) (c : ComplaintText) : Prop :=
  240 < daysFromCompensationRequestToFinalDetermination r c



inductive Section233ClaimGateway
    (r : CompensationRequest) (c : ComplaintText) : Prop where

  | byExhaustion (h : PartCAdministrativeRemediesExhausted r c)
      (hd : SecretaryMadeFinalDeterminationOnCompensationRequest r c)

  | byTwoHundredFortyDayLapse (h : SecretaryLapsedTwoHundredFortyDays r c)
      (hnd : ¬ SecretaryMadeFinalDeterminationOnCompensationRequest r c)



noncomputable def tolledSmallpoxClaimDeadlineDay
    (r : CompensationRequest) (c : ComplaintText) : Nat :=
  smallpoxClaimBaseDeadlineDay r c + compensationRequestPendencyDays r c



def SmallpoxClaimFiledWithinTolledPeriod
    (r : CompensationRequest) (c : ComplaintText) : Prop :=
  smallpoxClaimFilingDay r c ≤ tolledSmallpoxClaimDeadlineDay r c




structure Section233ClaimProcedurallyOpen
    (r : CompensationRequest) (a : CivilAction) (c : ComplaintText) : Prop where

  gateway : Section233ClaimGateway r c

  tolledTimely : SmallpoxClaimFiledWithinTolledPeriod r c

  ftcaExhaustion : FtcaAdministrativeExhaustionSatisfied a c



structure Section233SubstitutionForNoncooperation
    (a : CivilAction) (x : Person) (c : ComplaintText) : Prop where

  noCooperation : ¬ CoveredPersonCooperatedInDefense x c

  found : CourtFoundFailureToCooperate a c

  substituted : CoveredPersonSubstitutedAsPartyDefendant a c



structure Section233RemandAfterSubstitution
    (a : CivilAction) (x : Person) (c : ComplaintText) : Prop where

  substitution : Section233SubstitutionForNoncooperation a x c

  noJurisdiction : CourtLacksSubjectMatterJurisdiction a c



def FundTransferredByDecemberThirtyFirst
    (fc : FiscalCycle) (c : ComplaintText) : Prop :=
  fiscalTransferDay fc c ≤ decemberThirtyFirstDeadlineDay fc c


structure Section233FiscalTransferTimely
    (fc : FiscalCycle) (c : ComplaintText) : Prop where

  transferred : FundTransferredToTreasuryAccounts fc c

  byDeadline : FundTransferredByDecemberThirtyFirst fc c





inductive Section233Reachable
    (a : CivilAction) (c : ComplaintText) : Stage → Prop where

  | commenced (h : ActionCommencedInStateCourt a c) :
      Section233Reachable a c Stage.commencedInStateCourt

  | transmitted (hprev : Section233Reachable a c Stage.commencedInStateCourt)
      (h : Section233ProcessTransmittal a c) :
      Section233Reachable a c Stage.processTransmitted

  | removedByCertification
      (hprev : Section233Reachable a c Stage.processTransmitted)
      (h : Section233RemovalProper a c) :
      Section233Reachable a c Stage.removedToDistrictCourt

  | removedOnPetition
      (hprev : Section233Reachable a c Stage.commencedInStateCourt)
      (h : Section233RemovalOnPetition a c) :
      Section233Reachable a c Stage.removedToDistrictCourt

  | remanded (hprev : Section233Reachable a c Stage.removedToDistrictCourt)
      (hh : RemandMotionHeardBeforeTrialOnMerits a c)
      (hno : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
      (hnp : ¬ AlternativeCompensationRemedyPrecludesSuit a c) :
      Section233Reachable a c Stage.remandedToStateCourt


  | dismissed (hprev : Section233Reachable a c Stage.removedToDistrictCourt)
      (hh : RemandMotionHeardBeforeTrialOnMerits a c)
      (hno : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
      (hp : AlternativeCompensationRemedyPrecludesSuit a c)
      (hs : CompensationClaimTimelyAfterSuspension a c) :
      Section233Reachable a c Stage.dismissedForAlternativeRemedy


def section233RemovalTransition
    (a : CivilAction) (c : ComplaintText) : Transition :=
  { pre := Stage.processTransmitted
    post := Stage.removedToDistrictCourt
    guard := Section233RemovalProper a c }


def section233PetitionRemovalTransition
    (a : CivilAction) (c : ComplaintText) : Transition :=
  { pre := Stage.commencedInStateCourt
    post := Stage.removedToDistrictCourt
    guard := Section233RemovalOnPetition a c }


def section233DeemingTransition
    (ap : DeemingApplication) (c : ComplaintText) : Transition :=
  { pre := Stage.applicationFiled
    post := Stage.determinationMade
    guard := Section233DeemingDetermination ap c }






def EmergencyInitialPeriodWithinNinetyDays
    (e : EmergencyResponse) (c : ComplaintText) : Prop :=
  emergencyInitialPeriodDays e c ≤ 90




inductive Section234EmergencyBasis
    (e : EmergencyResponse) (c : ComplaintText) : Prop where

  | publicHealthEmergency (h : PublicHealthEmergencyDeterminationInEffect e c)
      (hcap : EmergencyInitialPeriodWithinNinetyDays e c)

  | presidentialDeclaration
      (h : MajorDisasterOrPresidentialEmergencyDeclared e c)



def ActOrOmissionWithinInitialPeriod
    (e : EmergencyResponse) (c : ComplaintText) : Prop :=
  emergencyInitialPeriodStartDay e c ≤ responderActOrOmissionDay e c
    ∧ responderActOrOmissionDay e c ≤ emergencyInitialPeriodEndDay e c




def DeploymentAuthorizationPrecededActOrOmission
    (e : EmergencyResponse) (c : ComplaintText) : Prop :=
  stateDeploymentAuthorizationDay e c ≤ responderActOrOmissionDay e c



def ClaimWithinSectionTemporalScope
    (e : EmergencyResponse) (c : ComplaintText) : Prop :=
  90 ≤ daysFromJune242019ToActOrOmission e c



structure Section234StateLawExclusivity
    (e : EmergencyResponse) (c : ComplaintText) : Prop where

  enrolled : ProfessionalEnrolledInReserveCorpsOrEsarVhp e c

  basis : Section234EmergencyBasis e c

  withinPeriod : ActOrOmissionWithinInitialPeriod e c

  emergencyRelated : ActOrOmissionRelatedToEmergencyTreatment e c

  inCoveredState : ActOrOmissionOccurredInCoveredState e c

  inCapacity : ActedInReserveCorpsOrEsarVhpCapacity e c

  withinScope : ServicesWithinScopeOfLicensure e c

  authorized : StateAuthorizedDeploymentOfVolunteerSystem e c

  authorizationFirst : DeploymentAuthorizationPrecededActOrOmission e c

  temporalScope : ClaimWithinSectionTemporalScope e c






structure Section235ConsolidatedAdministration
    (pr : MultigrantProject) (c : ComplaintText) : Prop where

  multigrant : GrantsSoughtUnderTwoOrMorePrograms pr c

  regulations : ConsolidationRegulationsPromulgated pr c

  singleUnit : SingleAdministrativeUnitPerformsFunctions pr c


  burdenReduced : ApplicationAndReportingBurdenReduced pr c

  uniform : DuplicativeRequirementsMadeUniform pr c


  noStatutoryWaiver : ¬ StatutoryRequirementWaivedOrSuspended pr c





def AnnualReportSubmittedByJuneFirst
    (b : OrphanProductsBoard) (c : ComplaintText) : Prop :=
  annualReportSubmissionDayOfYear b c ≤ juneFirstDayOfYear b c


structure Section236AnnualReporting
    (b : OrphanProductsBoard) (c : ComplaintText) : Prop where

  constituted : OrphanProductsBoardConstituted b c

  consulted : BoardAffordedOpportunityForOralViews b c

  submitted : AnnualReportSubmittedToCongressionalCommittees b c

  byDeadline : AnnualReportSubmittedByJuneFirst b c

  precedingYear : AnnualReportCoversPrecedingCalendarYear b c

  components : ComponentAgencyReportsFurnishedForInclusion b c

  contents : AnnualReportContainsStatutoryContents b c




def ConteServiceSizeWithinCap
    (s : ServiceAppointment) (c : ComplaintText) : Prop :=
  conteServiceMemberCount s c ≤ 2000


def ConteAppointmentEligibilityMet
    (s : ServiceAppointment) (c : ComplaintText) : Prop :=
  AppointeeHoldsQualifyingDoctoralOrMastersDegree s c
    ∧ AppointeeMeetsGeneralScheduleFifteenQualificationStandards s c



def ExceptedAppointmentWithinTwoYearCap
    (s : ServiceAppointment) (c : ComplaintText) : Prop :=
  exceptedAppointmentYears s c ≤ 2


structure Section237ServiceAppointment
    (s : ServiceAppointment) (c : ComplaintText) : Prop where

  appointed : SecretaryAppointedMemberToConteService s c

  eligible : ConteAppointmentEligibilityMet s c

  withinCap : ConteServiceSizeWithinCap s c

  appraisal : PerformanceAppraisalSystemEstablished s c





inductive Section237ReappointmentRoute
    (s : ServiceAppointment) (c : ComplaintText) : Prop where

  | careerCompetitive (h : MemberSeparatedInvoluntarilyWithoutCause s c)
      (hc : AppointeeWasCareerAppointeeBeforeService s c)

  | exceptedCapped (h : MemberSeparatedInvoluntarilyWithoutCause s c)
      (hnc : ¬ AppointeeWasCareerAppointeeBeforeService s c)
      (hcap : ExceptedAppointmentWithinTwoYearCap s c)





def FirstReportWithinOneYear
    (o : WomensHealthOffice) (c : ComplaintText) : Prop :=
  monthsFromMarch232010ToFirstReport o c ≤ 12


def SubsequentReportsBiennial
    (o : WomensHealthOffice) (c : ComplaintText) : Prop :=
  monthsBetweenConsecutiveReports o c ≤ 24


structure Section237aOfficeEstablished
    (o : WomensHealthOffice) (c : ComplaintText) : Prop where

  office : OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary o c

  committee : CoordinatingCommitteeEstablished o c

  center : NationalWomensHealthInformationCenterEstablished o c


structure Section237aReportingCycle
    (o : WomensHealthOffice) (c : ComplaintText) : Prop where

  established : Section237aOfficeEstablished o c

  submitted : BiennialReportSubmittedToCongress o c

  firstTimely : FirstReportWithinOneYear o c

  biennial : SubsequentReportsBiennial o c

  evaluations : GrantProjectEvaluationsProvided o c







structure Section238aReimbursementObligations
    (ag : HospitalUseAgreement) (c : ComplaintText) : Prop where

  agreement : InterdepartmentalAgreementPermitsHospitalUse ag c

  utilitiesReimbursed : SurgeonGeneralReimbursedForUtilitiesAndSupplies ag c

  noUpkeepCharge : NoChargeMadeForPhysicalUpkeep ag c

  detaineeCareReimbursed : ImmigrationServiceReimbursedForDetaineeCare ag c


  noStatutoryEntitlement : ¬ DetaineeEntitledToCareUnderSection249a ag c




inductive Section238lTriggeringEvent
    (f : AssistedFacility) (c : ComplaintText) : Prop where

  | saleToUnqualified (h : FacilitySoldOrTransferredToUnqualifiedEntity f c)

  | saleToDisapproved (h : TransfereeDisapprovedByStateMentalHealthAgency f c)

  | cessationOfUse
      (h : FacilityCeasedUseInComprehensiveMentalHealthServices f c)



def TriggeringEventWithinTwentyYears
    (f : AssistedFacility) (c : ComplaintText) : Prop :=
  yearsFromCompletionOrAcquisitionToTriggeringEvent f c ≤ 20


def NoticeTimelyUnderTenDayRule
    (f : AssistedFacility) (c : ComplaintText) : Prop :=
  daysFromTriggeringEventToNotice f c ≤ 10



def NoticeTimelyUnderTransitionalRule
    (f : AssistedFacility) (c : ComplaintText) : Prop :=
  daysFromOctober221985ToNotice f c ≤ 30



def NoticeGivenAsPrescribed
    (f : AssistedFacility) (c : ComplaintText) : Prop :=
  WrittenNoticeOfTriggeringEventProvidedToSecretary f c
    ∧ (NoticeTimelyUnderTenDayRule f c ∨ NoticeTimelyUnderTransitionalRule f c)




structure Section238lRecoveryEntitlement
    (f : AssistedFacility) (c : ComplaintText) : Prop where

  federalFunds : FederalFundsPaidUnderCommunityMentalHealthCentersAct f c

  event : Section238lTriggeringEvent f c

  withinTwentyYears : TriggeringEventWithinTwentyYears f c


  valuation : RecoveryActionBroughtInDistrictWhereFacilitySituated f c

  noWaiver : ¬ SecretaryWaivedRecoveryRightsForGoodCause f c




inductive Section238lInterestAccrual
    (f : AssistedFacility) (c : ComplaintText) : Prop where

  | afterPrescribedNotice (hn : NoticeGivenAsPrescribed f c)
      (hstart : interestPeriodStartDay f c = triggeringEventDay f c + 191)
      (hend : interestPeriodStartDay f c ≤ recoveryCollectionDay f c)


  | withoutPrescribedNotice (hn : ¬ NoticeGivenAsPrescribed f c)
      (hstart : interestPeriodStartDay f c = triggeringEventDay f c + 11)
      (hend : interestPeriodStartDay f c ≤ recoveryCollectionDay f c)


def section238lNoticeTransition
    (f : AssistedFacility) (c : ComplaintText) : Transition :=
  { pre := Stage.notCommenced
    post := Stage.reportOrTransferMade
    guard := NoticeGivenAsPrescribed f c }





structure Section238mFiscalAgentContract
    (k : FiscalAgentContract) (c : ComplaintText) : Prop where

  findingEfficiency : SecretaryFoundEntityWillPerformEfficientlyAndEffectively k c

  findingResponsibility : SecretaryFoundEntityMeetsResponsibilityRequirements k c

  contracted : FiscalAgentContractEntered k c

  functions : FiscalAgentDeterminedAmountsPayable k c

  audits : FiscalAgentAuditedRecordsForPaymentPropriety k c



def section238mAdvanceTransition
    (k : FiscalAgentContract) (c : ComplaintText) : Transition :=
  { pre := Stage.determinationMade
    post := Stage.obligationDischarged
    guard := Section238mFiscalAgentContract k c
             ∧ AdvanceOfFundsProvidedUnderContract k c }

end Proving.USC.T42.Ch6ASchI.Reslice.Procedure
