
















import Proving.USC.T18.Ch47.Ontology.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch47.Ontology

open Proving.USC.Common





axiom IsAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop



axiom IsDocumentMakingImplement (i : Implement) (c : ComplaintText) : Prop



axiom IsIdentificationDocument (d : Document) (c : ComplaintText) : Prop



axiom IsFalseIdentificationDocument (d : Document) (c : ComplaintText) : Prop



axiom IsFalseAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop



axiom IsIssuingAuthority (e : Entity) (c : ComplaintText) : Prop



axiom IsMeansOfIdentification (m : Identifier) (c : ComplaintText) : Prop



axiom IsPersonalIdentificationCard (d : Document) (c : ComplaintText) : Prop



axiom IsProduceUnderS1028 (a : Act) (c : ComplaintText) : Prop



axiom IsTransferUnderS1028 (a : Act) (c : ComplaintText) : Prop



axiom IsStateUnderS1028 (e : Entity) (c : ComplaintText) : Prop



axiom IsTrafficUnderS1028 (a : Act) (c : ComplaintText) : Prop





axiom IsAccessDevice (dv : Device) (c : ComplaintText) : Prop



axiom IsCounterfeitAccessDevice (dv : Device) (c : ComplaintText) : Prop



axiom IsUnauthorizedAccessDevice (dv : Device) (c : ComplaintText) : Prop



axiom IsProduceUnderS1029 (a : Act) (c : ComplaintText) : Prop



axiom IsTrafficUnderS1029 (a : Act) (c : ComplaintText) : Prop



axiom IsDeviceMakingEquipment (i : Implement) (c : ComplaintText) : Prop



axiom IsCreditCardSystemMember (e : Entity) (c : ComplaintText) : Prop



axiom IsScanningReceiver (dv : Device) (c : ComplaintText) : Prop




axiom IsTelecommunicationsService (s : Service) (c : ComplaintText) : Prop



axiom IsFacilitiesBasedCarrier (e : Entity) (c : ComplaintText) : Prop



axiom IsTelecommunicationIdentifyingInformation (m : Identifier) (c : ComplaintText) : Prop





axiom IsStateUnderS1029 (e : Entity) (c : ComplaintText) : Prop







axiom IsAuthenticationFeatureKind (f : Feature) (c : ComplaintText) : Prop




axiom UsedByIssuingAuthorityOnCoveredCarrier (f : Feature) (c : ComplaintText) : Prop




axiom ServesFalsityDetectionPurpose (f : Feature) (c : ComplaintText) : Prop






axiom IsDocumentMakingImplementKind (i : Implement) (c : ComplaintText) : Prop





axiom ConfiguredOrPrimarilyUsedForMakingCoveredArtifact (i : Implement) (c : ComplaintText) : Prop










axiom IsIssuedUnderCoveredGovernmentalAuthority (d : Document) (c : ComplaintText) : Prop





axiom IsOfTypeCommonlyAcceptedForIdentification (d : Document) (c : ComplaintText) : Prop






axiom IsIssuedUnderGovernmentalAuthority (d : Document) (c : ComplaintText) : Prop




axiom WasAlteredForDeceitAfterIssuance (d : Document) (c : ComplaintText) : Prop








axiom AppearsIssuedUnderCoveredGovernmentalAuthority (d : Document) (c : ComplaintText) : Prop







axiom IsGenuineInOrigin (f : Feature) (c : ComplaintText) : Prop




axiom TamperedForDeceitWithoutAuthorization (f : Feature) (c : ComplaintText) : Prop




axiom DistributedWithoutIssuingAuthorityAuthorization (f : Feature) (c : ComplaintText) : Prop






axiom NotConnectedToLawfullyMadeCarrier (f : Feature) (c : ComplaintText) : Prop



axiom AppearsGenuineButIsNot (f : Feature) (c : ComplaintText) : Prop





axiom IsGovernmentalEntityOrAgency (e : Entity) (c : ComplaintText) : Prop




axiom IsAuthorizedToIssueIdentificationArtifacts (e : Entity) (c : ComplaintText) : Prop







axiom IsEnumeratedIssuingAuthority (e : Entity) (c : ComplaintText) : Prop





axiom IsNameOrNumber (m : Identifier) (c : ComplaintText) : Prop




axiom MayBeUsedToIdentifySpecificIndividual (m : Identifier) (c : ComplaintText) : Prop






axiom IsEnumeratedNameOrNumberIdentifier (m : Identifier) (c : ComplaintText) : Prop





axiom IsUniqueBiometricData (m : Identifier) (c : ComplaintText) : Prop




axiom IsUniqueElectronicIdentifier (m : Identifier) (c : ComplaintText) : Prop





axiom IsTelecomIdentifyingInfoOrAccessDevice (m : Identifier) (c : ComplaintText) : Prop





axiom IsIssuedByStateOrLocalGovernment (d : Document) (c : ComplaintText) : Prop



axiom IssuedSolelyForIdentificationPurpose (d : Document) (c : ComplaintText) : Prop







axiom IsOrdinaryProduction (a : Act) (c : ComplaintText) : Prop




axiom IsAlterAuthenticateOrAssemble (a : Act) (c : ComplaintText) : Prop




axiom IsOrdinaryTransfer (a : Act) (c : ComplaintText) : Prop




axiom SelectsCoveredArtifact (a : Act) (c : ComplaintText) : Prop




axiom PlacesOnOnlineLocationAvailableToOthers (a : Act) (c : ComplaintText) : Prop





axiom IsCoveredStateJurisdiction (e : Entity) (c : ComplaintText) : Prop




axiom TransportsTransfersOrDisposesToAnother (a : Act) (c : ComplaintText) : Prop




axiom ForConsiderationOfValue (a : Act) (c : ComplaintText) : Prop




axiom ObtainsControlWithIntentToSoDispose (a : Act) (c : ComplaintText) : Prop








axiom IsAccountAccessMeans (dv : Device) (c : ComplaintText) : Prop





axiom CanObtainThingOfValue (dv : Device) (c : ComplaintText) : Prop



axiom CanInitiateFundsTransfer (dv : Device) (c : ComplaintText) : Prop




axiom IsSolelyPaperInstrumentOriginatedTransfer (dv : Device) (c : ComplaintText) : Prop





axiom IsCounterfeitFictitiousAlteredOrForged (dv : Device) (c : ComplaintText) : Prop




axiom IsIdentifiableComponentOfAccessDevice (dv : Device) (c : ComplaintText) : Prop



axiom IsLostStolenExpiredRevokedOrCanceled (dv : Device) (c : ComplaintText) : Prop



axiom WasObtainedWithIntentToDefraud (dv : Device) (c : ComplaintText) : Prop






axiom IsDesignOrDuplicate (a : Act) (c : ComplaintText) : Prop



axiom IsTransferOrDisposalToAnother (a : Act) (c : ComplaintText) : Prop




axiom ObtainsControlWithIntentToTransferOrDispose (a : Act) (c : ComplaintText) : Prop





axiom IsDeviceMakingEquipmentKind (i : Implement) (c : ComplaintText) : Prop




axiom DesignedOrPrimarilyUsedForMakingAccessDevice (i : Implement) (c : ComplaintText) : Prop



axiom IsFinancialInstitutionOrOtherEntity (e : Entity) (c : ComplaintText) : Prop





axiom IsMemberOfCreditCardSystem (e : Entity) (c : ComplaintText) : Prop




axiom CanInterceptCommunicationUnlawfully (dv : Device) (c : ComplaintText) : Prop





axiom CanInterceptTelecomIdentifier (dv : Device) (c : ComplaintText) : Prop




axiom HasCommunicationsActTelecomServiceMeaning (s : Service) (c : ComplaintText) : Prop



axiom OwnsCommunicationsTransmissionFacilities (e : Entity) (c : ComplaintText) : Prop




axiom ResponsibleForFacilitiesOperationAndMaintenance (e : Entity) (c : ComplaintText) : Prop





axiom HoldsFccOperatingLicense (e : Entity) (c : ComplaintText) : Prop



axiom IsElectronicSerialNumber (m : Identifier) (c : ComplaintText) : Prop




axiom IdentifiesSpecificInstrumentOrAccount (m : Identifier) (c : ComplaintText) : Prop




axiom IdentifiesSpecificTransmittedCommunication (m : Identifier) (c : ComplaintText) : Prop










axiom IsLawfullyAuthorizedInvestigativeActivity (a : Act) (c : ComplaintText) : Prop




axiom ContainsOneOrMoreMeansOfIdentification (d : Document) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch47.Ontology
