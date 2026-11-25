import Proving.USC.T18.Ch47.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false














namespace Proving.USC.T18.Ch47.Elements

open Proving.USC.Common





axiom IsIdentificationDocument (i : Item) (c : ComplaintText) : Prop



axiom IsFalseIdentificationDocument (i : Item) (c : ComplaintText) : Prop



axiom IsAuthenticationFeature (i : Item) (c : ComplaintText) : Prop



axiom IsFalseAuthenticationFeature (i : Item) (c : ComplaintText) : Prop



axiom IsDocumentMakingImplement (i : Item) (c : ComplaintText) : Prop



axiom IsMeansOfIdentification (i : Item) (c : ComplaintText) : Prop



axiom BelongsToAnotherPerson (i : Item) (c : ComplaintText) : Prop




axiom IsBirthCertificateDriversLicenseOrPersonalIdentificationCard
    (i : Item) (c : ComplaintText) : Prop






axiom Produced (p : Person) (i : Item) (c : ComplaintText) : Prop



axiom Transferred (p : Person) (i : Item) (c : ComplaintText) : Prop



axiom Possessed (p : Person) (i : Item) (c : ComplaintText) : Prop



axiom Used (p : Person) (i : Item) (c : ComplaintText) : Prop



axiom TraffickedIn (p : Person) (i : Item) (c : ComplaintText) : Prop





axiom WithoutLawfulAuthority (p : Person) (c : ComplaintText) : Prop




axiom ItemStolenOrProducedWithoutLawfulAuthority (i : Item) (c : ComplaintText) : Prop



axiom KnewItemStolenOrProducedWithoutLawfulAuthority
    (p : Person) (i : Item) (c : ComplaintText) : Prop




axiom NotIssuedLawfullyForUseOfPossessor (i : Item) (c : ComplaintText) : Prop





axiom AppearsToBeDocumentOfUnitedStatesOrSponsoringEntity
    (i : Item) (c : ComplaintText) : Prop





axiom IntentToUseOrTransferUnlawfully (p : Person) (c : ComplaintText) : Prop




axiom IntentToDefraudUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom IntentImplementUsedToProduceFalseDocument
    (p : Person) (i : Item) (c : ComplaintText) : Prop




axiom IntentToCommitOrAidUnlawfulActivity (p : Person) (c : ComplaintText) : Prop




axiom ForUseInFalseDocumentsOrMeansOfIdentification
    (p : Person) (i : Item) (c : ComplaintText) : Prop







axiom DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority
    (i : Item) (c : ComplaintText) : Prop




axiom ImplementSuitedForUnitedStatesDocument (i : Item) (c : ComplaintText) : Prop






axiom EngagedInInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop




axiom ItemTransportedInTheMail (i : Item) (c : ComplaintText) : Prop








axiom LawfullyAuthorizedInvestigativeOrIntelligenceActivity
    (p : Person) (c : ComplaintText) : Prop






axiom IsObjectOffenseUnderSection1028 (o : Offense) (c : ComplaintText) : Prop



axiom AttemptedOffenseUnderSection1028
    (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ConspiredToCommitOffenseUnderSection1028
    (p : Person) (o : Offense) (c : ComplaintText) : Prop






axiom ToFacilitateDrugTraffickingCrime (p : Person) (c : ComplaintText) : Prop




axiom InConnectionWithCrimeOfViolence (p : Person) (c : ComplaintText) : Prop




axiom AfterPriorConvictionUnderThisSectionFinal (p : Person) (c : ComplaintText) : Prop




axiom ToFacilitateActOfTerrorism (p : Person) (c : ComplaintText) : Prop





axiom IsAccessDevice (d : Device) (c : ComplaintText) : Prop



axiom IsCounterfeitAccessDevice (d : Device) (c : ComplaintText) : Prop



axiom IsUnauthorizedAccessDevice (d : Device) (c : ComplaintText) : Prop



axiom IsDeviceMakingEquipment (d : Device) (c : ComplaintText) : Prop



axiom IsScanningReceiver (d : Device) (c : ComplaintText) : Prop




axiom IsModifiedTelecommunicationsInstrument (d : Device) (c : ComplaintText) : Prop





axiom IsHardwareOrSoftwareConfiguredForTelecomIdentifyingInformation
    (d : Device) (c : ComplaintText) : Prop



axiom AccessDeviceIssuedToAnotherPerson (d : Device) (c : ComplaintText) : Prop






axiom ProducedDevice (p : Person) (d : Device) (c : ComplaintText) : Prop



axiom UsedDevice (p : Person) (d : Device) (c : ComplaintText) : Prop




axiom TraffickedInDevice (p : Person) (d : Device) (c : ComplaintText) : Prop



axiom PossessedDevice (p : Person) (d : Device) (c : ComplaintText) : Prop



axiom HadControlOrCustodyOfDevice (p : Person) (d : Device) (c : ComplaintText) : Prop






axiom IntentToDefraud (p : Person) (c : ComplaintText) : Prop




axiom KnewHardwareConfiguredToModifyTelecomIdentifyingInformation
    (p : Person) (d : Device) (c : ComplaintText) : Prop




axiom ObtainedValueByProhibitedConduct (p : Person) (c : ComplaintText) : Prop




axiom EffectedTransactionsToReceivePayment (p : Person) (c : ComplaintText) : Prop




axiom WithoutAuthorizationOfIssuer (p : Person) (c : ComplaintText) : Prop




axiom SolicitedPersonToOfferAccessDevice (p : Person) (c : ComplaintText) : Prop




axiom SolicitedPersonToSellAccessDeviceInformation (p : Person) (c : ComplaintText) : Prop




axiom WithoutAuthorizationOfCreditCardSystemMember (p : Person) (c : ComplaintText) : Prop




axiom CausedAnotherToPresentTransactionRecords (p : Person) (c : ComplaintText) : Prop






axiom ActOutsideUnitedStatesJurisdiction (p : Person) (c : ComplaintText) : Prop





axiom DeviceLinkedToUnitedStatesEntity (d : Device) (c : ComplaintText) : Prop






axiom IsCarrierAffiliatedActor (p : Person) (c : ComplaintText) : Prop




axiom ConductConstitutedTrafficking (p : Person) (c : ComplaintText) : Prop




axiom ForPurposeOfProtectingCarrierPropertyOrRights (p : Person) (c : ComplaintText) : Prop






axiom ForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization
    (p : Person) (c : ComplaintText) : Prop




axiom ConductConstitutedProducingOrTrafficking (p : Person) (c : ComplaintText) : Prop





axiom ForResearchOrDevelopmentInConnectionWithLawfulPurpose
    (p : Person) (c : ComplaintText) : Prop






axiom IsObjectOffenseUnderSection1029 (o : Offense) (c : ComplaintText) : Prop



axiom AttemptedOffenseUnderSection1029
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom PartyToConspiracyOfTwoOrMore
    (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom PartyEngagedInConductInFurtherance (o : Offense) (c : ComplaintText) : Prop




axiom AfterConvictionForAnotherOffenseUnderSection1029
    (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch47.Elements
