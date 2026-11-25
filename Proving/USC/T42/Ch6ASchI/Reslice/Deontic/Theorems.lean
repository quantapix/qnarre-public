import Proving.USC.T42.Ch6ASchI.Reslice.Deontic.Statute

set_option autoImplicit false








namespace Proving.USC.T42.Ch6ASchI.Reslice.Deontic

open Proving.USC.Common




theorem deemingPrerequisites233_intro {e : Entity} {c : ComplaintText}
    (h1 : IsFederallyFundedHealthCenterEntity233 e c) (h2 : SubmittedConformingDeemingApplication233 e c) (h3 : HasMalpracticeRiskPoliciesAndProcedures233 e c) (h4 : HasVerifiedPractitionerCredentials233 e c) (h5 : HasCleanOrCooperativeClaimsHistory233 e c) (h6 : WillCooperateWithClaimsEstimate233 e c) (h7 : DeemingApplicationApprovableDeadline233 e c) :
    DeemingPrerequisites233 e c :=
  ⟨h1, h2, h3, h4, h5, h6, h7⟩


theorem emergencyResponseImmunityConditions234_intro {p : Person} {c : ComplaintText}
    (h1 : RespondingToDeclaredEmergency234 p c) (h2 : AllegedActWithinEmergencyResponseScope234 p c) (h3 : PriorStateDeploymentAuthorization234 p c) (h4 : ActOccurredOnOrAfterEffectiveDate234 p c) :
    EmergencyResponseImmunityConditions234 p c :=
  ⟨h1, h2, h3, h4⟩


theorem recoveryTriggeringEvent238l_soldOrTransferred_intro {f : Facility} {c : ComplaintText}
    (h : SoldOrTransferredToDisqualifiedEntity238l f c) :
    RecoveryTriggeringEvent238l f c :=
  .soldOrTransferred h


theorem recoveryTriggeringEvent238l_ceasedUse_intro {f : Facility} {c : ComplaintText}
    (h : CeasedUseByCommunityMentalHealthCenter238l f c) :
    RecoveryTriggeringEvent238l f c :=
  .ceasedUse h


theorem recoveryTriggerWithinPeriod238l_intro {f : Facility} {c : ComplaintText}
    (h1 : RecoveryTriggeringEvent238l f c) (h2 : WithinTwentyYearRecoveryWindow238l f c) :
    RecoveryTriggerWithinPeriod238l f c :=
  ⟨h1, h2⟩






theorem obligation218aAppointBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : MigrantHealthCouncilRequirementInEffect218 c)
    (hAct : ¬ AppointedAndComposedMigrantHealthCouncil218 p c) :
    Obligation218aAppointBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation218aAdviseBreached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsAdvisoryCouncil e c) (hCond : MigrantHealthCouncilRequirementInEffect218 c)
    (hAct : ¬ AdvisedSecretaryOnMigrantHealth218 e c) :
    Obligation218aAdviseBreached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission218dExercised_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsAdvisoryCouncil e c) (hCond : MigrantHealthCouncilRequirementInEffect218 c)
    (hAct : OperatedExemptFromFederalAdvisoryCommitteeRule218 e c) :
    Permission218dExercised e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem power231Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSurgeonGeneral p c) (hCond : SecretaryApprovedCentralServiceDetermination231 c)
    (hAct : DeterminedCentralServices231 p c) :
    Power231Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation231Breached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsPublicHealthService e c) (hCond : ServicesPerformedOrStockFurnished231 c)
    (hAct : ¬ ReimbursedServiceAndSupplyFundAtPrescribedRates231 e c) :
    Obligation231Breached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem prohibition233aViolated_intro {p d : Person} {c : ComplaintText}
    (hAddr : AddresseeIsClaimant p c) (hCond : ExclusiveFtcaRemedyAvailable233 d c)
    (hAct : BroughtOtherCivilActionAgainstOfficer233 p d c) :
    Prohibition233aViolated p d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233bDefendBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c) (hCond : CivilActionAgainstCoveredPersonPending233 c)
    (hAct : ¬ DefendedCoveredPersonCivilAction233 p c) :
    Obligation233bDefendBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233bProcessBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPhsOfficerOrEmployee p c) (hCond : CivilActionAgainstCoveredPersonPending233 c)
    (hAct : ¬ DeliveredProcessToDesignatedSuperior233 p c) :
    Obligation233bProcessBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power233cExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c) (hCond : StateCourtActionPendingAgainstCoveredPerson233 c)
    (hAct : CertifiedScopeOfEmploymentForRemoval233 p c) :
    Power233cExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission233dExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c) (hCond : CivilActionAgainstCoveredPersonPending233 c)
    (hAct : CompromisedOrSettledCoveredClaim233 p c) :
    Permission233dExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission233fExercised_intro {p o : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : OfficerAssignedAbroadOrDetailed233 o c)
    (hAct : HeldHarmlessOrInsuredPhsOfficer233 p o c) :
    Permission233fExercised p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power233gExercised_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : DeemingPrerequisites233 e c)
    (hAct : ApprovedDeemingOfEntityPersonnel233 p e c) :
    Power233gExercised p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition233ghViolated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ¬ DeemingPrerequisites233 e c)
    (hAct : ApprovedDeemingOfEntityPersonnel233 p e c) :
    Prohibition233ghViolated p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233gDetermineBreached_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : DeemingApplicationReceived233 e c)
    (hAct : ¬ DeterminedDeemingWithinThirtyDays233 p e c) :
    Obligation233gDetermineBreached p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233kBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSection233FiscalOfficer p c) (hCond : FiscalYearUnderway233 c)
    (hAct : ¬ EstimatedAndFundedAnnualMalpracticeClaims233 p c) :
    Obligation233kBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233lBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c) (hCond : StateCourtActionPendingAgainstCoveredPerson233 c)
    (hAct : ¬ AppearedAndAdvisedStateCourt233 p c) :
    Obligation233lBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233mBreached_intro {plan ent : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsManagedCarePlan plan c) (hCond : ManagedCarePlanContractWithDeemedEntity233 plan ent c)
    (hAct : ¬ DeemedContractingEntityCoverageCompliant233 plan ent c) :
    Obligation233mBreached plan ent c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power233oExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFreeClinicHealthProfessional p c) (hCond : FreeClinicDeemingConditionsMet233 p c)
    (hAct : DeemedFreeClinicProfessionalPhsEmployee233 p c) :
    Power233oExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power233qExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsHealthProfessionalVolunteer p c) (hCond : VolunteerDeemingConditionsMet233 p c)
    (hAct : DeemedVolunteerPhsEmployee233 p c) :
    Power233qExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition233pViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsClaimant p c) (hCond : PartCRemediesUnexhausted233 p c)
    (hAct : BroughtSmallpoxCountermeasureClaim233 p c) :
    Prohibition233pViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233pBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsCoveredPersonSmallpox p c) (hCond : SmallpoxCountermeasureClaimPending233 p c)
    (hAct : ¬ CooperatedInDefenseOfSmallpoxClaim233 p c) :
    Obligation233pBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem permission234aExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsVolunteerEmergencyHealthProfessional p c) (hCond : EmergencyResponseImmunityConditions234 p c)
    (hAct : ProvidedEmergencyResponseHealthServices234 p c) :
    Permission234aExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition234cViolated_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsState e c) (hCond : EmergencyResponseImmunityConditions234 p c)
    (hAct : AppliedNonHostStateLiabilityLaw234 e p c) :
    Prohibition234cViolated e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem power235Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : SingleProjectUnderMultiplePrograms235 c)
    (hAct : PromulgatedMultigrantAdministrationRegulations235 p c) :
    Power235Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition235Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : SingleProjectUnderMultiplePrograms235 c)
    (hAct : WaivedStatutoryProgramRequirement235 p c) :
    Prohibition235Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem obligation236cBreached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsOrphanProductsBoard e c) (hCond : OrphanProductsBoardConstituted236 e c)
    (hAct : ¬ PerformedOrphanDrugBoardFunctions236 e c) :
    Obligation236cBreached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation236dBreached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsOrphanProductsBoard e c) (hCond : OrphanProductsBoardConstituted236 e c)
    (hAct : ¬ ConsultedInterestedPersonsWithOralViews236 e c) :
    Obligation236dBreached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation236eBreached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsOrphanProductsBoard e c) (hCond : AnnualReportDeadlineArrived236 c)
    (hAct : ¬ SubmittedAnnualOrphanProductsReport236 e c) :
    Obligation236eBreached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem prohibition237aViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ConteServiceInOperation237 c)
    (hAct : ExceededConteServiceMembershipCap237 p c) :
    Prohibition237aViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition237bViolated_intro {p a : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ConteServiceQualificationsUnmet237 a c)
    (hAct : AppointedIndividualToConteService237 p a c) :
    Prohibition237bViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation237cBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ConteServiceInOperation237 c)
    (hAct : ¬ DevelopedConteServiceAppraisalSystem237 p c) :
    Obligation237cBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition237dViolated_intro {p a : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ConteServiceInOperation237 c)
    (hAct : SetConteServicePayOutsideStatutoryBand237 p a c) :
    Prohibition237dViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission237eExercised_intro {p a : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : MemberSeparatedInvoluntarilyWithoutCause237 a c)
    (hAct : AppointedSeparatedMemberToCivilService237 p a c) :
    Permission237eExercised p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation237fBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : ConteServiceInOperation237 c)
    (hAct : ¬ PromulgatedConteServiceRegulations237 p c) :
    Obligation237fBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem obligation237aBBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : OfficeOnWomensHealthEstablished237a c)
    (hAct : ¬ PerformedWomensHealthOfficeFunctions237a p c) :
    Obligation237aBBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission237aCExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : OfficeOnWomensHealthEstablished237a c)
    (hAct : MadeWomensHealthGrantOrAgreement237a p c) :
    Permission237aCExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation237aEBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : WomensHealthAssistanceProvided237a c)
    (hAct : ¬ ProvidedForProjectEvaluationAndDissemination237a p c) :
    Obligation237aEBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation237aDBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : BiennialReportDeadlineArrived237a c)
    (hAct : ¬ SubmittedBiennialWomensHealthReport237a p c) :
    Obligation237aDBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem permission238aExercised_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsImmigrationService e c) (hCond : InterdepartmentalAgreementInEffect238a c)
    (hAct : PermittedPhsUseOfStationHospitals238a e c) :
    Permission238aExercised e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238aUtilitiesBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSurgeonGeneral p c) (hCond : PhsUsedImmigrationStationHospitals238a c)
    (hAct : ¬ ReimbursedImmigrationServiceForUtilities238a p c) :
    Obligation238aUtilitiesBreached p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition238aUpkeepViolated_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsImmigrationService e c) (hCond : PhsUsedImmigrationStationHospitals238a c)
    (hAct : ChargedForPhysicalUpkeepOfHospitals238a e c) :
    Prohibition238aUpkeepViolated e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238aDetaineeBreached_intro {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsImmigrationService e c) (hCond : DetaineeCareFurnishedAtServiceRequest238a c)
    (hAct : ¬ ReimbursedSurgeonGeneralForDetaineeCare238a e c) :
    Obligation238aDetaineeBreached e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem power238lAExercised_intro {e : Entity} {f : Facility} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates e c) (hCond : RecoveryTriggerWithinPeriod238l f c)
    (hAct : RecoveredBaseAmountAndInterest238l e f c) :
    Power238lAExercised e f c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238lBBreached_intro {p : Person} {f : Facility} {c : ComplaintText}
    (hAddr : AddresseeIsFacilityTransferorOrOwner p f c) (hCond : RecoveryTriggerWithinPeriod238l f c)
    (hAct : ¬ GaveWrittenNoticeOfTransferOrChange238l p f c) :
    Obligation238lBBreached p f c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission238lDExercised_intro {p : Person} {f : Facility} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : GoodCauseForWaiverFound238l f c)
    (hAct : WaivedFederalRecoveryRights238l p f c) :
    Permission238lDExercised p f c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition238lEViolated_intro {e : Entity} {f : Facility} {c : ComplaintText}
    (hAddr : AddresseeIsUnitedStates e c) (hCond : RecoveryTriggerWithinPeriod238l f c)
    (hAct : AssertedPreJudgmentLienOnFacility238l e f c) :
    Prohibition238lEViolated e f c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem permission238mAExercised_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : FiscalAgentFunctionsNeeded238m c)
    (hAct : EnteredFiscalAgentContract238m p e c) :
    Permission238mAExercised p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition238mBViolated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : FiscalAgentResponsibilityFindingAbsent238m e c)
    (hAct : EnteredFiscalAgentContract238m p e c) :
    Prohibition238mBViolated p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission238mCExercised_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeIsSecretary p c) (hCond : FiscalAgentContractInEffect238m e c)
    (hAct : ProvidedAdvancesToFiscalAgent238m p e c) :
    Permission238mCExercised p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩





theorem deemedPhsEmployeeRoute233_grantee_intro {p s : Person} {e : Entity}
    {c : ComplaintText} (hApproval : Power233gExercised s e c)
    (hMember : IsPersonnelOfDeemedEntity233 p e c) :
    DeemedPhsEmployeeRoute233 p c :=
  .viaGranteeEntity s e hApproval hMember


theorem deemedPhsEmployeeRoute233_freeClinic_intro {p : Person}
    {c : ComplaintText} (h : Power233oExercised p c) :
    DeemedPhsEmployeeRoute233 p c :=
  .viaFreeClinic h


theorem deemedPhsEmployeeRoute233_volunteer_intro {p : Person}
    {c : ComplaintText} (h : Power233qExercised p c) :
    DeemedPhsEmployeeRoute233 p c :=
  .viaVolunteer h

end Proving.USC.T42.Ch6ASchI.Reslice.Deontic
