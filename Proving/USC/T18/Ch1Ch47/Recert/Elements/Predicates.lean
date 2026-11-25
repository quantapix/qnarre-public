




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Elements

open Proving.USC.Common





axiom IsHighSeasOrAdmiraltyWaters (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesConnectedVessel (l : Locus) (c : ComplaintText) : Prop




axiom VesselWithinAdmiraltyOutsideStateJurisdiction (l : Locus) (c : ComplaintText) : Prop



axiom IsUnitedStatesRegisteredVessel (l : Locus) (c : ComplaintText) : Prop




axiom OnGreatLakesOrSaintLawrenceBoundary (l : Locus) (c : ComplaintText) : Prop



axiom IsLandReservedOrAcquiredForUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom UnderExclusiveOrConcurrentUnitedStatesJurisdiction (l : Locus) (c : ComplaintText) : Prop





axiom IsPlacePurchasedWithStateConsentForNeedfulBuilding (l : Locus) (c : ComplaintText) : Prop




axiom IsGuanoIslandAppertainingToUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesConnectedAircraft (l : Locus) (c : ComplaintText) : Prop




axiom AircraftInFlightOverAdmiraltyWaters (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesRegisteredSpaceVehicle (l : Locus) (c : ComplaintText) : Prop




axiom SpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop



axiom IsPlaceOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop




axiom OffenseByOrAgainstUnitedStatesNational (o : Offense) (c : ComplaintText) : Prop




axiom IsForeignVesselOnScheduledUnitedStatesVoyage (l : Locus) (c : ComplaintText) : Prop




axiom PermittedByInternationalLaw (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesMissionPremisesAbroad (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesPersonnelResidenceAbroad (l : Locus) (c : ComplaintText) : Prop





axiom ConflictingTreatyOrInternationalAgreement (l : Locus) (c : ComplaintText) : Prop




axiom OffenseCommittedByPersonDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop





axiom IsInsuredDepositoryInstitution (i : Institution) (c : ComplaintText) : Prop



axiom IsInsuredCreditUnion (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalHomeLoanBankOrMember (i : Institution) (c : ComplaintText) : Prop



axiom IsFarmCreditSystemInstitution (i : Institution) (c : ComplaintText) : Prop



axiom IsSmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop



axiom IsDepositoryInstitutionHoldingCompany (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalReserveBankOrMemberBank (i : Institution) (c : ComplaintText) : Prop




axiom IsEdgeActOrganization (i : Institution) (c : ComplaintText) : Prop



axiom IsBranchOrAgencyOfForeignBank (i : Institution) (c : ComplaintText) : Prop





axiom IsMortgageLendingBusinessOrFederallyRelatedLender (i : Institution) (c : ComplaintText) : Prop






axiom PropertyOfStolenOrCounterfeitCharacter (pr : Property) (c : ComplaintText) : Prop



axiom DefendantKnewPropertyCharacter (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationAsToNatureOfProperty (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationByFederalLawEnforcementOfficer (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationAtDirectionOrApprovalOfFederalOfficer (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom DefendantBelievedPropertyOfSuchCharacter (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom BeliefResultedFromOfficialRepresentation (p : Person) (pr : Property) (c : ComplaintText) : Prop





axiom IsDistrictCourtOfGuam (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtForNorthernMarianaIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfVirginIslands (ct : Court) (c : ComplaintText) : Prop




axiom IsCourtOfTheUnitedStatesApartFromSection23 (ct : Court) (c : ComplaintText) : Prop





axiom OtherwiseExpresslyProvidedInProvision (c : ComplaintText) : Prop






axiom IsViolationOrCriminalConspiracyToViolate (o : Offense) (c : ComplaintText) : Prop




axiom IsEnumeratedCoreHealthCareProvision (o : Offense) (c : ComplaintText) : Prop





axiom IsEnumeratedGeneralFraudProvision (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (c : ComplaintText) : Prop



axiom IsPublicOrPrivatePlanOrContract (hp : HealthProgram) (c : ComplaintText) : Prop



axiom ProgramAffectsCommerce (hp : HealthProgram) (c : ComplaintText) : Prop




axiom ProvidesMedicalBenefitItemOrService (hp : HealthProgram) (c : ComplaintText) : Prop





axiom IsProviderOfMedicalBenefitPayableUnderPlan (hp : HealthProgram) (c : ComplaintText) : Prop







axiom ActedKnowingly (p : Person) (act : Conduct) (c : ComplaintText) : Prop



axiom ActedWithoutLawfulAuthority (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ProducedIdentificationDocumentOrFeature (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom TransferredIdentificationDocumentOrFeature (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom KnewDocumentStolenOrProducedWithoutAuthority (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom PossessedIdentificationDocuments (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom IntentToUseOrTransferUnlawfully (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom identificationDocumentCount (act : Conduct) (c : ComplaintText) : Nat




axiom DocumentsNotLawfullyIssuedToPossessor (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom IntentDocumentUsedToDefraudUnitedStates (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ProducedTransferredOrPossessedImplementOrFeature (p : Person) (act : Conduct) (c : ComplaintText) : Prop





axiom IntentImplementUsedToProduceFalseDocument (p : Person) (act : Conduct) (c : ComplaintText) : Prop






axiom DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued (d : IdDocument) (c : ComplaintText) : Prop




axiom DocumentStolenOrProducedWithoutAuthority (d : IdDocument) (c : ComplaintText) : Prop




axiom TransferredPossessedOrUsedMeansOfIdentification
    (p : Person) (m : MeansOfIdentification) (act : Conduct) (c : ComplaintText) : Prop



axiom MeansOfIdentificationOfAnotherPerson (m : MeansOfIdentification) (c : ComplaintText) : Prop




axiom IntentToCommitOrAidUnlawfulActivity (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom UnlawfulActivityIsFederalViolationOrStateFelony (act : Conduct) (c : ComplaintText) : Prop




axiom TraffickedInAuthenticationFeatures (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom AuthenticationFeatureIntendedForFalseDocuments (af : AuthFeature) (c : ComplaintText) : Prop





axiom ImplementDesignedOrSuitedForSuchDocument (impl : DocMakingImplement) (c : ComplaintText) : Prop




axiom OffenseChargedUnderSubsectionA4 (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerce (act : Conduct) (c : ComplaintText) : Prop





axiom TransportedInTheMailDuringConduct (act : Conduct) (c : ComplaintText) : Prop






axiom LawfullyAuthorizedInvestigativeActivity (act : Conduct) (c : ComplaintText) : Prop



axiom AttemptedSection1028Offense (p : Person) (act : Conduct) (c : ComplaintText) : Prop



axiom IsPartyToConspiracy (p : Person) (ag : Agreement) (c : ComplaintText) : Prop



axiom ObjectOfAgreementIsSection1028Offense
    (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop






axiom ActedWithIntentToDefraud (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ProducedUsedOrTraffickedInCounterfeitAccessDevices
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom TraffickedInOrUsedUnauthorizedAccessDevices
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ConductWithinOneYearPeriod (act : Conduct) (c : ComplaintText) : Prop




axiom ValueObtainedByChargedConduct (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom valueObtainedInPeriodDollars (act : Conduct) (c : ComplaintText) : Nat




axiom PossessedCounterfeitOrUnauthorizedAccessDevices
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop



axiom counterfeitOrUnauthorizedAccessDeviceCount (act : Conduct) (c : ComplaintText) : Nat




axiom ProducedTraffickedControlledOrPossessedDeviceMakingEquipment
    (p : Person) (dme : DeviceMakingEquipment) (act : Conduct) (c : ComplaintText) : Prop




axiom EffectedTransactionsWithAnothersAccessDevices
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom aggregateTransactionValueDollars (act : Conduct) (c : ComplaintText) : Nat




axiom WithoutAuthorizationOfIssuer (p : Person) (act : Conduct) (c : ComplaintText) : Prop



axiom SolicitedPersonRegardingAccessDevice (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom PurposeOfferingAccessDevice (act : Conduct) (c : ComplaintText) : Prop




axiom PurposeSellingAccessDeviceInformation (act : Conduct) (c : ComplaintText) : Prop




axiom UsedProducedOrPossessedTelecommunicationsInstrument
    (p : Person) (ti : TelecomInstrument) (act : Conduct) (c : ComplaintText) : Prop




axiom InstrumentModifiedForUnauthorizedTelecomUse (ti : TelecomInstrument) (c : ComplaintText) : Prop




axiom UsedProducedOrPossessedScanningReceiver
    (p : Person) (sr : ScanningReceiver) (act : Conduct) (c : ComplaintText) : Prop




axiom UsedProducedOrPossessedTelecomHardwareOrSoftware
    (p : Person) (hw : TelecomConfigurable) (act : Conduct) (c : ComplaintText) : Prop




axiom KnewHardwareConfiguredToModifyTelecomIdentifyingInformation
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ConfigurationEnablesUnauthorizedTelecomService (hw : TelecomConfigurable) (c : ComplaintText) : Prop







axiom CarrierProtectiveConductExemption (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom WithoutAuthorizationOfCreditCardSystemMember
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop





axiom CausedOrArrangedPresentmentOfTransactionRecords
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop



axiom AttemptedSection1029Offense (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ObjectOfAgreementIsSection1029Offense
    (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop




axiom ConductInFurtheranceByAnyParty (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop




axiom ActOutsideUnitedStatesJurisdiction (p : Person) (act : Conduct) (c : ComplaintText) : Prop




axiom ConductWouldConstituteSection1029Offense (p : Person) (act : Conduct) (c : ComplaintText) : Prop






axiom AccessDeviceControlledByUnitedStatesEntity (ad : AccessDevice) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert.Elements
