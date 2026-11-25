








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch1Ch47.Recert2.Elements





axiom IsHighSeas (l : Locus) (c : ComplaintText) : Prop




axiom IsWithinAdmiraltyAndMaritimeJurisdiction (l : Locus) (c : ComplaintText) : Prop




axiom IsOutsideJurisdictionOfAnyParticularState (l : Locus) (c : ComplaintText) : Prop




axiom IsVesselBelongingToUnitedStatesOrCitizenOrCorporation (l : Locus) (c : ComplaintText) : Prop




axiom IsVesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw (l : Locus) (c : ComplaintText) : Prop





axiom IsOnVoyageUponGreatLakesOrSaintLawrenceBoundary (l : Locus) (c : ComplaintText) : Prop




axiom IsLandReservedOrAcquiredForUseOfUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction (l : Locus) (c : ComplaintText) : Prop





axiom IsPlacePurchasedWithStateConsentForNeedfulBuilding (l : Locus) (c : ComplaintText) : Prop




axiom IsIslandRockOrKeyContainingGuanoDeposits (l : Locus) (c : ComplaintText) : Prop




axiom IsPresidentiallyConsideredAppertainingToUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom IsAircraftBelongingToUnitedStatesOrCitizenOrCorporation (l : Locus) (c : ComplaintText) : Prop




axiom IsAircraftInFlightOverHighSeasOrAdmiraltyWaters (l : Locus) (c : ComplaintText) : Prop





axiom IsSpaceVehicleOnUnitedStatesRegistry (l : Locus) (c : ComplaintText) : Prop






axiom IsSpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop




axiom IsPlaceOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop




axiom IsOffenseByOrAgainstNationalOfTheUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom IsForeignVesselOnVoyageScheduledToOrFromUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom IsPermittedByInternationalLaw (l : Locus) (o : Offense) (c : ComplaintText) : Prop





axiom IsUnitedStatesMissionPremisesInForeignState (l : Locus) (c : ComplaintText) : Prop





axiom IsResidenceInForeignStateUsedForMissionPurposes (l : Locus) (c : ComplaintText) : Prop





axiom ConflictsWithTreatyOrInternationalAgreement (l : Locus) (o : Offense) (c : ComplaintText) : Prop




axiom OffenderDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop





axiom IsInsuredDepositoryInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsCreditUnionWithInsuredAccounts (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalHomeLoanBankOrMember (i : Institution) (c : ComplaintText) : Prop




axiom IsFarmCreditSystemInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsSmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsDepositoryInstitutionHoldingCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalReserveBankOrMemberBank (i : Institution) (c : ComplaintText) : Prop




axiom IsOrganizationOperatingUnderFederalReserveActSection25 (i : Institution) (c : ComplaintText) : Prop




axiom IsBranchOrAgencyOfForeignBank (i : Institution) (c : ComplaintText) : Prop





axiom IsMortgageLendingBusinessOrFederallyRelatedMortgageLender (i : Institution) (c : ComplaintText) : Prop






axiom PropertyOfProscribedCharacter (pr : Property) (c : ComplaintText) : Prop




axiom DefendantKnewPropertyOfProscribedCharacter (p : Person) (pr : Property) (c : ComplaintText) : Prop





axiom DefendantBelievedPropertyOfProscribedCharacter (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom BeliefFollowedOfficialRepresentation (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationMadeByFederalLawEnforcementOfficer (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationMadeAtDirectionOrApprovalOfFederalLawEnforcementOfficer (p : Person) (pr : Property) (c : ComplaintText) : Prop





axiom IsDistrictCourtOfGuam (t : Tribunal) (c : ComplaintText) : Prop




axiom IsDistrictCourtForNorthernMarianaIslands (t : Tribunal) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfTheVirginIslands (t : Tribunal) (c : ComplaintText) : Prop




axiom IsCourtOfTheUnitedStatesUnderOrdinaryMeaning (t : Tribunal) (c : ComplaintText) : Prop






axiom OtherwiseExpresslyProvided (t : Tribunal) (c : ComplaintText) : Prop






axiom IsCompletedViolation (o : Offense) (c : ComplaintText) : Prop




axiom IsCriminalConspiracyToViolate (o : Offense) (c : ComplaintText) : Prop





axiom TargetsOffenseListedInSection24a1 (o : Offense) (c : ComplaintText) : Prop





axiom TargetsOffenseListedInSection24a2 (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (c : ComplaintText) : Prop



axiom IsPublicOrPrivatePlanOrContract (hp : HealthCareProgram) (c : ComplaintText) : Prop



axiom AffectsCommerce (hp : HealthCareProgram) (c : ComplaintText) : Prop




axiom ProvidesMedicalBenefitItemOrServiceToIndividual (hp : HealthCareProgram) (c : ComplaintText) : Prop





axiom IsProviderOfMedicalBenefitPayableUnderPlanOrContract (hp : HealthCareProgram) (c : ComplaintText) : Prop








axiom DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor (d : Document) (c : ComplaintText) : Prop





axiom DocumentMakingImplementDesignedOrSuitedForSuchDocument (d : Document) (c : ComplaintText) : Prop



axiom OffenseIsUnderSection1028a4 (o : Offense) (c : ComplaintText) : Prop





axiom ProhibitedConductAffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop





axiom ItemTransportedInTheMailInCourseOfProhibitedConduct (o : Offense) (c : ComplaintText) : Prop




axiom WithoutLawfulAuthorityOverDocument (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom ProducesIdentificationDocumentOrAuthenticationFeature (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom TransfersIdentificationDocumentOrAuthenticationFeature (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom KnowsDocumentStolenOrProducedWithoutLawfulAuthority (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom PossessesIdentificationDocumentOrAuthenticationFeature (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom NotIssuedLawfullyForUseOfPossessor (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom IntentToUseOrTransferUnlawfully (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom identificationDocumentsPossessed (p : Person) (d : Document) (c : ComplaintText) : Nat




axiom IntentDocumentBeUsedToDefraudTheUnitedStates (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom ProducesTransfersOrPossessesDocumentMakingImplement (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom IntentImplementUsedToProduceFalseDocumentOrImplement (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom DocumentStolenOrProducedWithoutLawfulAuthority (d : Document) (c : ComplaintText) : Prop




axiom TransfersPossessesOrUsesMeansOfIdentification (p : Person) (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom WithoutLawfulAuthorityOverMeansOfIdentification (p : Person) (m : MeansOfIdentification) (c : ComplaintText) : Prop





axiom MeansOfIdentificationOfAnotherPerson (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom IntentOrConnectionWithUnlawfulActivity (p : Person) (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom UnlawfulActivityViolatesFederalLaw (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom UnlawfulActivityIsStateOrLocalFelony (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom TrafficsInAuthenticationFeatures (p : Person) (d : Document) (c : ComplaintText) : Prop





axiom AuthenticationFeaturesForUseInFalseDocumentsOrMeansOfIdentification (d : Document) (c : ComplaintText) : Prop







axiom LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity (p : Person) (c : ComplaintText) : Prop




axiom AttemptsToCommitSection1028Offense (p : Person) (c : ComplaintText) : Prop




axiom ConspiresToCommitSection1028Offense (p : Person) (c : ComplaintText) : Prop






axiom IntentToDefraud (p : Person) (c : ComplaintText) : Prop




axiom ProducesUsesOrTrafficsInAccessDevice (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop





axiom IsCounterfeitAccessDevice (ad : AccessDevice) (c : ComplaintText) : Prop




axiom TrafficsInOrUsesAccessDevice (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom IsUnauthorizedAccessDevice (ad : AccessDevice) (c : ComplaintText) : Prop




axiom ConductOccurredWithinOneYearPeriod (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop





axiom valueObtainedDuringOneYearPeriodDollars (p : Person) (ad : AccessDevice) (c : ComplaintText) : Nat




axiom PossessesAccessDevices (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop





axiom counterfeitOrUnauthorizedDevicesPossessed (p : Person) (ad : AccessDevice) (c : ComplaintText) : Nat




axiom ProducesTrafficsControlsOrPossessesEquipment (p : Person) (eq : Equipment) (c : ComplaintText) : Prop




axiom IsDeviceMakingEquipment (eq : Equipment) (c : ComplaintText) : Prop





axiom EffectsTransactionsWithAccessDeviceIssuedToAnother (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop






axiom aggregateTransactionValueDuringOneYearPeriodDollars (p : Person) (ad : AccessDevice) (c : ComplaintText) : Nat




axiom WithoutAuthorizationOfIssuer (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom SolicitsPersonRegardingAccessDevice (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom PurposeOfOfferingAccessDevice (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom PurposeOfSellingAccessDeviceInformationOrApplication (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom UsesProducesTrafficsControlsOrPossessesEquipment (p : Person) (eq : Equipment) (c : ComplaintText) : Prop





axiom IsTelecommunicationsInstrumentModifiedForUnauthorizedUse (eq : Equipment) (c : ComplaintText) : Prop



axiom IsScanningReceiver (eq : Equipment) (c : ComplaintText) : Prop






axiom IsHardwareOrSoftwareConfiguredToAlterTelecommunicationIdentifyingInformation (eq : Equipment) (c : ComplaintText) : Prop




axiom KnowsHardwareOrSoftwareSoConfigured (p : Person) (eq : Equipment) (c : ComplaintText) : Prop








axiom CarrierProtectionExemption (p : Person) (eq : Equipment) (c : ComplaintText) : Prop




axiom WithoutAuthorizationOfCreditCardSystemMember (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop





axiom CausesOrArrangesPresentmentOfTransactionRecords (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop




axiom OffenseAffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop




axiom AttemptsToCommitSection1029Offense (p : Person) (c : ComplaintText) : Prop




axiom PartyToConspiracyToCommitSection1029Offense (p : Person) (ag : Agreement) (c : ComplaintText) : Prop




axiom PartyEngagedInConductInFurtherance (ag : Agreement) (c : ComplaintText) : Prop




axiom ActOutsideJurisdictionOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom WouldConstituteSection1029OffenseIfCommittedWithinUnitedStates (p : Person) (c : ComplaintText) : Prop






axiom AccessDeviceConnectedToUnitedStatesEntity (ad : AccessDevice) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Elements
