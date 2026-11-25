import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Deontic.Types

set_option autoImplicit false








namespace Proving.USC.T42.Ch6ASchI.Reslice.Deontic

open Proving.USC.Common








axiom AddresseeIsSecretary (p : Person) (c : ComplaintText) : Prop







axiom AddresseeIsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop






axiom AddresseeIsSurgeonGeneral (p : Person) (c : ComplaintText) : Prop






axiom AddresseeIsAdvisoryCouncil (e : Entity) (c : ComplaintText) : Prop







axiom AddresseeIsPublicHealthService (e : Entity) (c : ComplaintText) : Prop







axiom AddresseeIsClaimant (p : Person) (c : ComplaintText) : Prop





axiom AddresseeIsPhsOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop





axiom AddresseeIsSection233FiscalOfficer (p : Person) (c : ComplaintText) : Prop





axiom AddresseeIsManagedCarePlan (e : Entity) (c : ComplaintText) : Prop





axiom AddresseeIsFreeClinicHealthProfessional (p : Person) (c : ComplaintText) : Prop




axiom AddresseeIsHealthProfessionalVolunteer (p : Person) (c : ComplaintText) : Prop





axiom AddresseeIsCoveredPersonSmallpox (p : Person) (c : ComplaintText) : Prop





axiom IsPersonnelOfDeemedEntity233 (p : Person) (e : Entity) (c : ComplaintText) : Prop








axiom AddresseeIsVolunteerEmergencyHealthProfessional (p : Person) (c : ComplaintText) : Prop




axiom AddresseeIsState (e : Entity) (c : ComplaintText) : Prop






axiom AddresseeIsOrphanProductsBoard (e : Entity) (c : ComplaintText) : Prop







axiom AddresseeIsImmigrationService (e : Entity) (c : ComplaintText) : Prop






axiom AddresseeIsUnitedStates (e : Entity) (c : ComplaintText) : Prop





axiom AddresseeIsFacilityTransferorOrOwner (p : Person) (f : Facility) (c : ComplaintText) : Prop







axiom AppointedAndComposedMigrantHealthCouncil218 (p : Person) (c : ComplaintText) : Prop





axiom AdvisedSecretaryOnMigrantHealth218 (e : Entity) (c : ComplaintText) : Prop




axiom OperatedExemptFromFederalAdvisoryCommitteeRule218 (e : Entity) (c : ComplaintText) : Prop





axiom MigrantHealthCouncilRequirementInEffect218 (c : ComplaintText) : Prop






axiom DeterminedCentralServices231 (p : Person) (c : ComplaintText) : Prop





axiom SecretaryApprovedCentralServiceDetermination231 (c : ComplaintText) : Prop





axiom ReimbursedServiceAndSupplyFundAtPrescribedRates231 (e : Entity) (c : ComplaintText) : Prop




axiom ServicesPerformedOrStockFurnished231 (c : ComplaintText) : Prop







axiom BroughtOtherCivilActionAgainstOfficer233 (p d : Person) (c : ComplaintText) : Prop







axiom ExclusiveFtcaRemedyAvailable233 (d : Person) (c : ComplaintText) : Prop




axiom DefendedCoveredPersonCivilAction233 (p : Person) (c : ComplaintText) : Prop




axiom CivilActionAgainstCoveredPersonPending233 (c : ComplaintText) : Prop







axiom DeliveredProcessToDesignatedSuperior233 (p : Person) (c : ComplaintText) : Prop






axiom CertifiedScopeOfEmploymentForRemoval233 (p : Person) (c : ComplaintText) : Prop





axiom StateCourtActionPendingAgainstCoveredPerson233 (c : ComplaintText) : Prop





axiom CompromisedOrSettledCoveredClaim233 (p : Person) (c : ComplaintText) : Prop




axiom HeldHarmlessOrInsuredPhsOfficer233 (p o : Person) (c : ComplaintText) : Prop






axiom OfficerAssignedAbroadOrDetailed233 (o : Person) (c : ComplaintText) : Prop





axiom ApprovedDeemingOfEntityPersonnel233 (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom DeemingApplicationReceived233 (e : Entity) (c : ComplaintText) : Prop





axiom DeterminedDeemingWithinThirtyDays233 (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom SubmittedConformingDeemingApplication233 (e : Entity) (c : ComplaintText) : Prop




axiom IsFederallyFundedHealthCenterEntity233 (e : Entity) (c : ComplaintText) : Prop





axiom HasMalpracticeRiskPoliciesAndProcedures233 (e : Entity) (c : ComplaintText) : Prop






axiom HasVerifiedPractitionerCredentials233 (e : Entity) (c : ComplaintText) : Prop






axiom HasCleanOrCooperativeClaimsHistory233 (e : Entity) (c : ComplaintText) : Prop




axiom WillCooperateWithClaimsEstimate233 (e : Entity) (c : ComplaintText) : Prop





axiom DeemingApplicationApprovableDeadline233 (e : Entity) (c : ComplaintText) : Prop






axiom EstimatedAndFundedAnnualMalpracticeClaims233 (p : Person) (c : ComplaintText) : Prop





axiom FiscalYearUnderway233 (c : ComplaintText) : Prop






axiom AppearedAndAdvisedStateCourt233 (p : Person) (c : ComplaintText) : Prop






axiom DeemedContractingEntityCoverageCompliant233 (plan ent : Entity) (c : ComplaintText) : Prop






axiom ManagedCarePlanContractWithDeemedEntity233 (plan ent : Entity) (c : ComplaintText) : Prop





axiom DeemedFreeClinicProfessionalPhsEmployee233 (p : Person) (c : ComplaintText) : Prop





axiom FreeClinicDeemingConditionsMet233 (p : Person) (c : ComplaintText) : Prop




axiom DeemedVolunteerPhsEmployee233 (p : Person) (c : ComplaintText) : Prop




axiom VolunteerDeemingConditionsMet233 (p : Person) (c : ComplaintText) : Prop




axiom BroughtSmallpoxCountermeasureClaim233 (p : Person) (c : ComplaintText) : Prop





axiom PartCRemediesUnexhausted233 (p : Person) (c : ComplaintText) : Prop





axiom CooperatedInDefenseOfSmallpoxClaim233 (p : Person) (c : ComplaintText) : Prop




axiom SmallpoxCountermeasureClaimPending233 (p : Person) (c : ComplaintText) : Prop







axiom ProvidedEmergencyResponseHealthServices234 (p : Person) (c : ComplaintText) : Prop






axiom RespondingToDeclaredEmergency234 (p : Person) (c : ComplaintText) : Prop





axiom AllegedActWithinEmergencyResponseScope234 (p : Person) (c : ComplaintText) : Prop





axiom PriorStateDeploymentAuthorization234 (p : Person) (c : ComplaintText) : Prop




axiom ActOccurredOnOrAfterEffectiveDate234 (p : Person) (c : ComplaintText) : Prop





axiom AppliedNonHostStateLiabilityLaw234 (e : Entity) (p : Person) (c : ComplaintText) : Prop







axiom PromulgatedMultigrantAdministrationRegulations235 (p : Person) (c : ComplaintText) : Prop




axiom SingleProjectUnderMultiplePrograms235 (c : ComplaintText) : Prop





axiom WaivedStatutoryProgramRequirement235 (p : Person) (c : ComplaintText) : Prop






axiom PerformedOrphanDrugBoardFunctions236 (e : Entity) (c : ComplaintText) : Prop





axiom OrphanProductsBoardConstituted236 (e : Entity) (c : ComplaintText) : Prop





axiom ConsultedInterestedPersonsWithOralViews236 (e : Entity) (c : ComplaintText) : Prop





axiom SubmittedAnnualOrphanProductsReport236 (e : Entity) (c : ComplaintText) : Prop




axiom AnnualReportDeadlineArrived236 (c : ComplaintText) : Prop







axiom ExceededConteServiceMembershipCap237 (p : Person) (c : ComplaintText) : Prop




axiom ConteServiceInOperation237 (c : ComplaintText) : Prop




axiom AppointedIndividualToConteService237 (p a : Person) (c : ComplaintText) : Prop




axiom ConteServiceQualificationsUnmet237 (a : Person) (c : ComplaintText) : Prop





axiom DevelopedConteServiceAppraisalSystem237 (p : Person) (c : ComplaintText) : Prop





axiom SetConteServicePayOutsideStatutoryBand237 (p a : Person) (c : ComplaintText) : Prop





axiom AppointedSeparatedMemberToCivilService237 (p a : Person) (c : ComplaintText) : Prop




axiom MemberSeparatedInvoluntarilyWithoutCause237 (a : Person) (c : ComplaintText) : Prop




axiom PromulgatedConteServiceRegulations237 (p : Person) (c : ComplaintText) : Prop







axiom PerformedWomensHealthOfficeFunctions237a (p : Person) (c : ComplaintText) : Prop





axiom OfficeOnWomensHealthEstablished237a (c : ComplaintText) : Prop





axiom MadeWomensHealthGrantOrAgreement237a (p : Person) (c : ComplaintText) : Prop





axiom ProvidedForProjectEvaluationAndDissemination237a (p : Person) (c : ComplaintText) : Prop




axiom WomensHealthAssistanceProvided237a (c : ComplaintText) : Prop





axiom SubmittedBiennialWomensHealthReport237a (p : Person) (c : ComplaintText) : Prop




axiom BiennialReportDeadlineArrived237a (c : ComplaintText) : Prop







axiom PermittedPhsUseOfStationHospitals238a (e : Entity) (c : ComplaintText) : Prop




axiom InterdepartmentalAgreementInEffect238a (c : ComplaintText) : Prop





axiom ReimbursedImmigrationServiceForUtilities238a (p : Person) (c : ComplaintText) : Prop




axiom PhsUsedImmigrationStationHospitals238a (c : ComplaintText) : Prop




axiom ChargedForPhysicalUpkeepOfHospitals238a (e : Entity) (c : ComplaintText) : Prop





axiom ReimbursedSurgeonGeneralForDetaineeCare238a (e : Entity) (c : ComplaintText) : Prop





axiom DetaineeCareFurnishedAtServiceRequest238a (c : ComplaintText) : Prop







axiom RecoveredBaseAmountAndInterest238l (e : Entity) (f : Facility) (c : ComplaintText) : Prop





axiom SoldOrTransferredToDisqualifiedEntity238l (f : Facility) (c : ComplaintText) : Prop




axiom CeasedUseByCommunityMentalHealthCenter238l (f : Facility) (c : ComplaintText) : Prop





axiom WithinTwentyYearRecoveryWindow238l (f : Facility) (c : ComplaintText) : Prop





axiom GaveWrittenNoticeOfTransferOrChange238l (p : Person) (f : Facility) (c : ComplaintText) : Prop




axiom WaivedFederalRecoveryRights238l (p : Person) (f : Facility) (c : ComplaintText) : Prop




axiom GoodCauseForWaiverFound238l (f : Facility) (c : ComplaintText) : Prop





axiom AssertedPreJudgmentLienOnFacility238l (e : Entity) (f : Facility) (c : ComplaintText) : Prop






axiom EnteredFiscalAgentContract238m (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom FiscalAgentFunctionsNeeded238m (c : ComplaintText) : Prop






axiom FiscalAgentResponsibilityFindingAbsent238m (e : Entity) (c : ComplaintText) : Prop




axiom ProvidedAdvancesToFiscalAgent238m (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom FiscalAgentContractInEffect238m (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reslice.Deontic
