






import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Deontic

open Proving.USC.Common







axiom WithinSpecialMaritimeAndTerritorialJurisdiction
    (pl : Place) (c : ComplaintText) : Prop






axiom LocusOfUnitedStatesMissionPremisesOrResidence
    (pl : Place) (c : ComplaintText) : Prop




axiom OffenseByOrAgainstNationalOfTheUnitedStates
    (o : Offense) (c : ComplaintText) : Prop




axiom ConflictsWithTreatyOrInternationalAgreement (c : ComplaintText) : Prop





axiom ParagraphNineDeemedToSupersedeTreaty (c : ComplaintText) : Prop





axiom IsPersonDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop






axiom IsFinancialInstitution (x : Institution) (c : ComplaintText) : Prop







axiom PropertyOfProscribedCharacter (pr : Property) (c : ComplaintText) : Prop




axiom KnewPropertyOfProscribedCharacter
    (p : Person) (pr : Property) (c : ComplaintText) : Prop





axiom OffenseHasStolenOrCounterfeitCharacterElements
    (o : Offense) (c : ComplaintText) : Prop





axiom BelievedPropertyOfProscribedCharacterAfterRepresentation
    (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom RepresentationAsToNatureOfPropertyMade
    (officer : Person) (subject : Person) (pr : Property) (c : ComplaintText) : Prop




axiom IsFederalLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop




axiom ActedAtDirectionOrWithApprovalOfFederalLawEnforcementOfficer
    (p : Person) (c : ComplaintText) : Prop








axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop




axiom ExpresslyProvidedOtherwise (c : ComplaintText) : Prop







axiom ViolationOfEnumeratedCoreHealthCareStatute
    (o : Offense) (c : ComplaintText) : Prop






axiom ViolationOfEnumeratedGeneralFraudStatute
    (o : Offense) (c : ComplaintText) : Prop




axiom CriminalConspiracyToViolate
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom CommittedTheOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram
    (o : Offense) (hp : HealthCareBenefitProgram) (c : ComplaintText) : Prop





axiom IsHealthCareBenefitProgram
    (hp : HealthCareBenefitProgram) (c : ComplaintText) : Prop





axiom IsIdentificationDocument (it : IdentificationItem) (c : ComplaintText) : Prop




axiom IsFalseIdentificationDocument (it : IdentificationItem) (c : ComplaintText) : Prop



axiom IsAuthenticationFeature (it : IdentificationItem) (c : ComplaintText) : Prop




axiom IsDocumentMakingImplement
    (im : DocumentMakingImplement) (c : ComplaintText) : Prop



axiom IsMeansOfIdentification
    (m : MeansOfIdentification) (c : ComplaintText) : Prop







axiom AddresseeWhoever1028 (p : Person) (c : ComplaintText) : Prop




axiom ProducesItemWithoutLawfulAuthority
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop




axiom TransfersItemKnowingStolenOrUnlawfullyProduced
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop





axiom KnowinglyPossessesItemsWithUnlawfulIntent
    (p : Person) (c : ComplaintText) : Prop






axiom identificationItemsPossessedWithUnlawfulIntent
    (p : Person) (c : ComplaintText) : Nat





axiom PossessesItemWithIntentToDefraudTheUnitedStates
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop






axiom ProducesTransfersOrPossessesDocumentMakingImplement
    (p : Person) (im : DocumentMakingImplement) (c : ComplaintText) : Prop






axiom ProducesTransfersOrPossessesAuthenticationFeatureForUnlawfulProduction
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop







axiom PossessesStolenOrUnlawfullyProducedUnitedStatesItem
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop







axiom TransfersPossessesOrUsesMeansOfIdentificationOfAnother
    (p : Person) (m : MeansOfIdentification) (c : ComplaintText) : Prop





axiom TrafficsInAuthenticationFeatures
    (p : Person) (it : IdentificationItem) (c : ComplaintText) : Prop







axiom ItemIsOrAppearsIssuedByUnitedStatesOrSponsoringEntity
    (it : IdentificationItem) (c : ComplaintText) : Prop





axiom ImplementDesignedOrSuitedForMakingSuchDocument
    (im : DocumentMakingImplement) (c : ComplaintText) : Prop







axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop





axiom TransportedInTheMailInCourseOfProhibitedConduct (c : ComplaintText) : Prop









axiom LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity
    (p : Person) (c : ComplaintText) : Prop




axiom AttemptsOrConspiresToCommitOffenseUnderSection1028
    (p : Person) (c : ComplaintText) : Prop




axiom ConvictedOfViolationOfSection1028a (p : Person) (c : ComplaintText) : Prop






axiom CourtOrderedForfeitureAndDestructionOfIllicitItems
    (ct : Court) (p : Person) (c : ComplaintText) : Prop




axiom PunishmentImposedAsProvidedInSection1028b
    (ct : Court) (p : Person) (c : ComplaintText) : Prop





axiom PersonalPropertyUsedOrIntendedToBeUsedToCommitTheOffense
    (c : ComplaintText) : Prop





axiom IsAccessDevice (d : AccessDevice) (c : ComplaintText) : Prop





axiom IsCounterfeitAccessDevice (d : AccessDevice) (c : ComplaintText) : Prop





axiom IsUnauthorizedAccessDevice (d : AccessDevice) (c : ComplaintText) : Prop



axiom IsDeviceMakingEquipment
    (q : DeviceMakingEquipment) (c : ComplaintText) : Prop




axiom IsCreditCardSystemMember (x : Institution) (c : ComplaintText) : Prop




axiom IsFacilitiesBasedCarrier (x : Institution) (c : ComplaintText) : Prop






axiom AddresseeWhoever1029 (p : Person) (c : ComplaintText) : Prop




axiom ProducesUsesOrTrafficsInCounterfeitAccessDevices
    (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom TrafficsInOrUsesUnauthorizedAccessDevices
    (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop





axiom aggregateValueObtainedInOneYearPeriod
    (p : Person) (c : ComplaintText) : Nat




axiom KnowinglyPossessesCounterfeitOrUnauthorizedAccessDevices
    (p : Person) (c : ComplaintText) : Prop




axiom counterfeitOrUnauthorizedAccessDevicesPossessed
    (p : Person) (c : ComplaintText) : Nat




axiom ProducesTrafficsInOrPossessesDeviceMakingEquipment
    (p : Person) (q : DeviceMakingEquipment) (c : ComplaintText) : Prop






axiom EffectsTransactionsWithAccessDevicesIssuedToAnother
    (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop





axiom aggregateValueReceivedInOneYearPeriod
    (p : Person) (c : ComplaintText) : Nat





axiom SolicitsWithoutIssuerAuthorizationToOfferAccessDevice
    (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop





axiom SolicitsWithoutIssuerAuthorizationToSellAccessDeviceInformation
    (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop






axiom UsesOrPossessesModifiedTelecommunicationsInstrument
    (p : Person) (t : TelecommunicationsInstrument) (c : ComplaintText) : Prop





axiom UsesOrPossessesScanningReceiver (p : Person) (c : ComplaintText) : Prop







axiom UsesOrPossessesTelecommunicationIdentifyingInformationModifyingHardwareOrSoftware
    (p : Person) (c : ComplaintText) : Prop







axiom CausesPresentationOfTransactionRecordsWithoutMemberAuthorization
    (p : Person) (x : Institution) (c : ComplaintText) : Prop






axiom AttemptsToCommitOffenseUnderSection1029
    (p : Person) (c : ComplaintText) : Prop




axiom IsPartyToConspiracyOfTwoOrMoreToCommitOffenseUnderSection1029
    (p : Person) (c : ComplaintText) : Prop




axiom AnyPartyEngagedInConductInFurtheranceOfTheOffense
    (c : ComplaintText) : Prop




axiom IsUnitedStatesSecretService (ag : Agency) (c : ComplaintText) : Prop




axiom InvestigatesOffenseUnderSection1029
    (ag : Agency) (c : ComplaintText) : Prop





axiom AgreementBetweenSecretaryOfTheTreasuryAndAttorneyGeneralEntered
    (c : ComplaintText) : Prop






axiom EngagedInNonTraffickingConductToProtectCarrierPropertyOrLegalRights
    (p : Person) (x : Institution) (c : ComplaintText) : Prop





axiom PurposeToObtainAnotherCarriersTelecommunicationsServiceWithoutAuthorization
    (p : Person) (c : ComplaintText) : Prop





axiom ConductConsistingOfProducingOrTrafficking
    (p : Person) (c : ComplaintText) : Prop




axiom ResearchOrDevelopmentInConnectionWithLawfulPurpose
    (p : Person) (c : ComplaintText) : Prop




axiom EstablishedByPreponderanceOfTheEvidence
    (p : Person) (c : ComplaintText) : Prop




axiom ActOutsideJurisdictionOfTheUnitedStates
    (p : Person) (c : ComplaintText) : Prop




axiom ActWouldConstituteOffenseUnderSection1029aOrB
    (p : Person) (c : ComplaintText) : Prop







axiom AccessDeviceIssuedOwnedManagedOrControlledByUnitedStatesEntity
    (d : AccessDevice) (x : Institution) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert.Deontic
