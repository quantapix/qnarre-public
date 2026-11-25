import Proving.USC.T42.Ch6ASchI.Reslice.Deontic.Predicates

set_option autoImplicit false















namespace Proving.USC.T42.Ch6ASchI.Reslice.Deontic

open Proving.USC.Common




structure DeemingPrerequisites233 (e : Entity) (c : ComplaintText) : Prop where
  fundedEntity : IsFederallyFundedHealthCenterEntity233 e c
  application : SubmittedConformingDeemingApplication233 e c
  riskPolicies : HasMalpracticeRiskPoliciesAndProcedures233 e c
  credentials : HasVerifiedPractitionerCredentials233 e c
  claimsHistory : HasCleanOrCooperativeClaimsHistory233 e c
  estimateCooperation : WillCooperateWithClaimsEstimate233 e c
  transferMade : DeemingApplicationApprovableDeadline233 e c


structure EmergencyResponseImmunityConditions234 (p : Person) (c : ComplaintText) : Prop where
  responding : RespondingToDeclaredEmergency234 p c
  scope : AllegedActWithinEmergencyResponseScope234 p c
  authorized : PriorStateDeploymentAuthorization234 p c
  effective : ActOccurredOnOrAfterEffectiveDate234 p c


inductive RecoveryTriggeringEvent238l (f : Facility) (c : ComplaintText) : Prop where
  | soldOrTransferred (h : SoldOrTransferredToDisqualifiedEntity238l f c)
  | ceasedUse (h : CeasedUseByCommunityMentalHealthCenter238l f c)


structure RecoveryTriggerWithinPeriod238l (f : Facility) (c : ComplaintText) : Prop where
  event : RecoveryTriggeringEvent238l f c
  window : WithinTwentyYearRecoveryWindow238l f c







structure Obligation218aAppoint (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : MigrantHealthCouncilRequirementInEffect218 c


def obligation218aAppointModality : Modality := .obligation


def Obligation218aAppointBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation218aAppoint p c ∧ ¬ AppointedAndComposedMigrantHealthCouncil218 p c



structure Obligation218aAdvise (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAdvisoryCouncil e c
  condition : MigrantHealthCouncilRequirementInEffect218 c


def obligation218aAdviseModality : Modality := .obligation


def Obligation218aAdviseBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation218aAdvise e c ∧ ¬ AdvisedSecretaryOnMigrantHealth218 e c



structure Permission218d (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAdvisoryCouncil e c
  condition : MigrantHealthCouncilRequirementInEffect218 c


def permission218dModality : Modality := .permission


def Permission218dExercised (e : Entity) (c : ComplaintText) : Prop :=
  Permission218d e c ∧ OperatedExemptFromFederalAdvisoryCommitteeRule218 e c





structure Power231 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSurgeonGeneral p c
  condition : SecretaryApprovedCentralServiceDetermination231 c


def power231Modality : Modality := .power


def Power231Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power231 p c ∧ DeterminedCentralServices231 p c



structure Obligation231 (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPublicHealthService e c
  condition : ServicesPerformedOrStockFurnished231 c


def obligation231Modality : Modality := .obligation


def Obligation231Breached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation231 e c ∧ ¬ ReimbursedServiceAndSupplyFundAtPrescribedRates231 e c





structure Prohibition233a (p d : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsClaimant p c
  condition : ExclusiveFtcaRemedyAvailable233 d c


def prohibition233aModality : Modality := .prohibition


def Prohibition233aViolated (p d : Person) (c : ComplaintText) : Prop :=
  Prohibition233a p d c ∧ BroughtOtherCivilActionAgainstOfficer233 p d c



structure Obligation233bDefend (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  condition : CivilActionAgainstCoveredPersonPending233 c


def obligation233bDefendModality : Modality := .obligation


def Obligation233bDefendBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233bDefend p c ∧ ¬ DefendedCoveredPersonCivilAction233 p c



structure Obligation233bProcess (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPhsOfficerOrEmployee p c
  condition : CivilActionAgainstCoveredPersonPending233 c


def obligation233bProcessModality : Modality := .obligation


def Obligation233bProcessBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233bProcess p c ∧ ¬ DeliveredProcessToDesignatedSuperior233 p c



structure Power233c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  condition : StateCourtActionPendingAgainstCoveredPerson233 c


def power233cModality : Modality := .power


def Power233cExercised (p : Person) (c : ComplaintText) : Prop :=
  Power233c p c ∧ CertifiedScopeOfEmploymentForRemoval233 p c



structure Permission233d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  condition : CivilActionAgainstCoveredPersonPending233 c


def permission233dModality : Modality := .permission


def Permission233dExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission233d p c ∧ CompromisedOrSettledCoveredClaim233 p c



structure Permission233f (p o : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : OfficerAssignedAbroadOrDetailed233 o c


def permission233fModality : Modality := .permission


def Permission233fExercised (p o : Person) (c : ComplaintText) : Prop :=
  Permission233f p o c ∧ HeldHarmlessOrInsuredPhsOfficer233 p o c



structure Power233g (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : DeemingPrerequisites233 e c


def power233gModality : Modality := .power


def Power233gExercised (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Power233g p e c ∧ ApprovedDeemingOfEntityPersonnel233 p e c



structure Prohibition233gh (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ¬ DeemingPrerequisites233 e c


def prohibition233ghModality : Modality := .prohibition


def Prohibition233ghViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition233gh p e c ∧ ApprovedDeemingOfEntityPersonnel233 p e c



structure Obligation233gDetermine (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : DeemingApplicationReceived233 e c


def obligation233gDetermineModality : Modality := .obligation


def Obligation233gDetermineBreached (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Obligation233gDetermine p e c ∧ ¬ DeterminedDeemingWithinThirtyDays233 p e c



structure Obligation233k (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSection233FiscalOfficer p c
  condition : FiscalYearUnderway233 c


def obligation233kModality : Modality := .obligation


def Obligation233kBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233k p c ∧ ¬ EstimatedAndFundedAnnualMalpracticeClaims233 p c



structure Obligation233l (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  condition : StateCourtActionPendingAgainstCoveredPerson233 c


def obligation233lModality : Modality := .obligation


def Obligation233lBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233l p c ∧ ¬ AppearedAndAdvisedStateCourt233 p c



structure Obligation233m (plan ent : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsManagedCarePlan plan c
  condition : ManagedCarePlanContractWithDeemedEntity233 plan ent c


def obligation233mModality : Modality := .obligation


def Obligation233mBreached (plan ent : Entity) (c : ComplaintText) : Prop :=
  Obligation233m plan ent c ∧ ¬ DeemedContractingEntityCoverageCompliant233 plan ent c



structure Power233o (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFreeClinicHealthProfessional p c
  condition : FreeClinicDeemingConditionsMet233 p c


def power233oModality : Modality := .power


def Power233oExercised (p : Person) (c : ComplaintText) : Prop :=
  Power233o p c ∧ DeemedFreeClinicProfessionalPhsEmployee233 p c



structure Power233q (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsHealthProfessionalVolunteer p c
  condition : VolunteerDeemingConditionsMet233 p c


def power233qModality : Modality := .power


def Power233qExercised (p : Person) (c : ComplaintText) : Prop :=
  Power233q p c ∧ DeemedVolunteerPhsEmployee233 p c



structure Prohibition233p (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsClaimant p c
  condition : PartCRemediesUnexhausted233 p c


def prohibition233pModality : Modality := .prohibition


def Prohibition233pViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition233p p c ∧ BroughtSmallpoxCountermeasureClaim233 p c



structure Obligation233p (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCoveredPersonSmallpox p c
  condition : SmallpoxCountermeasureClaimPending233 p c


def obligation233pModality : Modality := .obligation


def Obligation233pBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233p p c ∧ ¬ CooperatedInDefenseOfSmallpoxClaim233 p c





structure Permission234a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsVolunteerEmergencyHealthProfessional p c
  condition : EmergencyResponseImmunityConditions234 p c


def permission234aModality : Modality := .permission


def Permission234aExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission234a p c ∧ ProvidedEmergencyResponseHealthServices234 p c



structure Prohibition234c (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsState e c
  condition : EmergencyResponseImmunityConditions234 p c


def prohibition234cModality : Modality := .prohibition


def Prohibition234cViolated (e : Entity) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition234c e p c ∧ AppliedNonHostStateLiabilityLaw234 e p c





structure Power235 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : SingleProjectUnderMultiplePrograms235 c


def power235Modality : Modality := .power


def Power235Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power235 p c ∧ PromulgatedMultigrantAdministrationRegulations235 p c



structure Prohibition235 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : SingleProjectUnderMultiplePrograms235 c


def prohibition235Modality : Modality := .prohibition


def Prohibition235Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition235 p c ∧ WaivedStatutoryProgramRequirement235 p c





structure Obligation236c (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsOrphanProductsBoard e c
  condition : OrphanProductsBoardConstituted236 e c


def obligation236cModality : Modality := .obligation


def Obligation236cBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation236c e c ∧ ¬ PerformedOrphanDrugBoardFunctions236 e c



structure Obligation236d (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsOrphanProductsBoard e c
  condition : OrphanProductsBoardConstituted236 e c


def obligation236dModality : Modality := .obligation


def Obligation236dBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation236d e c ∧ ¬ ConsultedInterestedPersonsWithOralViews236 e c



structure Obligation236e (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsOrphanProductsBoard e c
  condition : AnnualReportDeadlineArrived236 c


def obligation236eModality : Modality := .obligation


def Obligation236eBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation236e e c ∧ ¬ SubmittedAnnualOrphanProductsReport236 e c





structure Prohibition237a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ConteServiceInOperation237 c


def prohibition237aModality : Modality := .prohibition


def Prohibition237aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition237a p c ∧ ExceededConteServiceMembershipCap237 p c



structure Prohibition237b (p a : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ConteServiceQualificationsUnmet237 a c


def prohibition237bModality : Modality := .prohibition


def Prohibition237bViolated (p a : Person) (c : ComplaintText) : Prop :=
  Prohibition237b p a c ∧ AppointedIndividualToConteService237 p a c



structure Obligation237c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ConteServiceInOperation237 c


def obligation237cModality : Modality := .obligation


def Obligation237cBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237c p c ∧ ¬ DevelopedConteServiceAppraisalSystem237 p c



structure Prohibition237d (p a : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ConteServiceInOperation237 c


def prohibition237dModality : Modality := .prohibition


def Prohibition237dViolated (p a : Person) (c : ComplaintText) : Prop :=
  Prohibition237d p a c ∧ SetConteServicePayOutsideStatutoryBand237 p a c



structure Permission237e (p a : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : MemberSeparatedInvoluntarilyWithoutCause237 a c


def permission237eModality : Modality := .permission


def Permission237eExercised (p a : Person) (c : ComplaintText) : Prop :=
  Permission237e p a c ∧ AppointedSeparatedMemberToCivilService237 p a c



structure Obligation237f (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : ConteServiceInOperation237 c


def obligation237fModality : Modality := .obligation


def Obligation237fBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237f p c ∧ ¬ PromulgatedConteServiceRegulations237 p c





structure Obligation237aB (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : OfficeOnWomensHealthEstablished237a c


def obligation237aBModality : Modality := .obligation


def Obligation237aBBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237aB p c ∧ ¬ PerformedWomensHealthOfficeFunctions237a p c



structure Permission237aC (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : OfficeOnWomensHealthEstablished237a c


def permission237aCModality : Modality := .permission


def Permission237aCExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission237aC p c ∧ MadeWomensHealthGrantOrAgreement237a p c



structure Obligation237aE (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : WomensHealthAssistanceProvided237a c


def obligation237aEModality : Modality := .obligation


def Obligation237aEBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237aE p c ∧ ¬ ProvidedForProjectEvaluationAndDissemination237a p c



structure Obligation237aD (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : BiennialReportDeadlineArrived237a c


def obligation237aDModality : Modality := .obligation


def Obligation237aDBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237aD p c ∧ ¬ SubmittedBiennialWomensHealthReport237a p c





structure Permission238a (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsImmigrationService e c
  condition : InterdepartmentalAgreementInEffect238a c


def permission238aModality : Modality := .permission


def Permission238aExercised (e : Entity) (c : ComplaintText) : Prop :=
  Permission238a e c ∧ PermittedPhsUseOfStationHospitals238a e c



structure Obligation238aUtilities (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSurgeonGeneral p c
  condition : PhsUsedImmigrationStationHospitals238a c


def obligation238aUtilitiesModality : Modality := .obligation


def Obligation238aUtilitiesBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238aUtilities p c ∧ ¬ ReimbursedImmigrationServiceForUtilities238a p c



structure Prohibition238aUpkeep (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsImmigrationService e c
  condition : PhsUsedImmigrationStationHospitals238a c


def prohibition238aUpkeepModality : Modality := .prohibition


def Prohibition238aUpkeepViolated (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition238aUpkeep e c ∧ ChargedForPhysicalUpkeepOfHospitals238a e c



structure Obligation238aDetainee (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsImmigrationService e c
  condition : DetaineeCareFurnishedAtServiceRequest238a c


def obligation238aDetaineeModality : Modality := .obligation


def Obligation238aDetaineeBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation238aDetainee e c ∧ ¬ ReimbursedSurgeonGeneralForDetaineeCare238a e c





structure Power238lA (e : Entity) (f : Facility) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates e c
  condition : RecoveryTriggerWithinPeriod238l f c


def power238lAModality : Modality := .power


def Power238lAExercised (e : Entity) (f : Facility) (c : ComplaintText) : Prop :=
  Power238lA e f c ∧ RecoveredBaseAmountAndInterest238l e f c



structure Obligation238lB (p : Person) (f : Facility) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFacilityTransferorOrOwner p f c
  condition : RecoveryTriggerWithinPeriod238l f c


def obligation238lBModality : Modality := .obligation


def Obligation238lBBreached (p : Person) (f : Facility) (c : ComplaintText) : Prop :=
  Obligation238lB p f c ∧ ¬ GaveWrittenNoticeOfTransferOrChange238l p f c



structure Permission238lD (p : Person) (f : Facility) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : GoodCauseForWaiverFound238l f c


def permission238lDModality : Modality := .permission


def Permission238lDExercised (p : Person) (f : Facility) (c : ComplaintText) : Prop :=
  Permission238lD p f c ∧ WaivedFederalRecoveryRights238l p f c



structure Prohibition238lE (e : Entity) (f : Facility) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStates e c
  condition : RecoveryTriggerWithinPeriod238l f c


def prohibition238lEModality : Modality := .prohibition


def Prohibition238lEViolated (e : Entity) (f : Facility) (c : ComplaintText) : Prop :=
  Prohibition238lE e f c ∧ AssertedPreJudgmentLienOnFacility238l e f c





structure Permission238mA (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : FiscalAgentFunctionsNeeded238m c


def permission238mAModality : Modality := .permission


def Permission238mAExercised (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Permission238mA p e c ∧ EnteredFiscalAgentContract238m p e c



structure Prohibition238mB (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : FiscalAgentResponsibilityFindingAbsent238m e c


def prohibition238mBModality : Modality := .prohibition


def Prohibition238mBViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition238mB p e c ∧ EnteredFiscalAgentContract238m p e c



structure Permission238mC (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretary p c
  condition : FiscalAgentContractInEffect238m e c


def permission238mCModality : Modality := .permission


def Permission238mCExercised (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Permission238mC p e c ∧ ProvidedAdvancesToFiscalAgent238m p e c







inductive DeemedPhsEmployeeRoute233 (p : Person) (c : ComplaintText) : Prop where
  | viaGranteeEntity (s : Person) (e : Entity)
      (hApproval : Power233gExercised s e c)
      (hMember : IsPersonnelOfDeemedEntity233 p e c)
  | viaFreeClinic (h : Power233oExercised p c)
  | viaVolunteer (h : Power233qExercised p c)

end Proving.USC.T42.Ch6ASchI.Reslice.Deontic
