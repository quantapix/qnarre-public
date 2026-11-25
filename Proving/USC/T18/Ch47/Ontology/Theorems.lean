
















import Proving.USC.T18.Ch47.Ontology.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch47.Ontology

open Proving.USC.Common



theorem authenticationFeatureMembership_intro {f : Feature} {c : ComplaintText}
    (hM : IsAuthenticationFeature f c) (hK : IsAuthenticationFeatureKind f c)
    (hU : UsedByIssuingAuthorityOnCoveredCarrier f c)
    (hP : ServesFalsityDetectionPurpose f c) :
    AuthenticationFeatureMembership f c := ⟨hM, hK, hU, hP⟩

theorem authenticationFeatureMembership_isAuthenticationFeature {f : Feature}
    {c : ComplaintText} (h : AuthenticationFeatureMembership f c) :
    IsAuthenticationFeature f c := h.membership

theorem documentMakingImplementMembership_intro {i : Implement} {c : ComplaintText}
    (hM : IsDocumentMakingImplement i c) (hK : IsDocumentMakingImplementKind i c)
    (hC : ConfiguredOrPrimarilyUsedForMakingCoveredArtifact i c) :
    DocumentMakingImplementMembership i c := ⟨hM, hK, hC⟩

theorem documentMakingImplementMembership_isDocumentMakingImplement {i : Implement}
    {c : ComplaintText} (h : DocumentMakingImplementMembership i c) :
    IsDocumentMakingImplement i c := h.membership



theorem identificationDocumentMembership_intro {d : Document} {c : ComplaintText}
    (hM : IsIdentificationDocument d c) (hI : IsIssuedUnderCoveredGovernmentalAuthority d c)
    (hT : IsOfTypeCommonlyAcceptedForIdentification d c) :
    IdentificationDocumentMembership d c := ⟨hM, hI, hT⟩

theorem identificationDocumentMembership_isIdentificationDocument {d : Document}
    {c : ComplaintText} (h : IdentificationDocumentMembership d c) :
    IsIdentificationDocument d c := h.membership

theorem falseIdentificationDocumentOrigin_intro {d : Document} {c : ComplaintText}
    (h : (¬ IsIssuedUnderGovernmentalAuthority d c)
       ∨ (IsIssuedUnderGovernmentalAuthority d c ∧ WasAlteredForDeceitAfterIssuance d c)) :
    FalseIdentificationDocumentOrigin d c :=
  match h with
  | Or.inl h1 => .notGovernmentIssued h1
  | Or.inr ⟨h1, h2⟩ => .alteredAfterIssuance h1 h2

theorem falseIdentificationDocumentMembership_intro {d : Document} {c : ComplaintText}
    (hM : IsFalseIdentificationDocument d c)
    (hT : IsOfTypeCommonlyAcceptedForIdentification d c)
    (hO : FalseIdentificationDocumentOrigin d c)
    (hA : AppearsIssuedUnderCoveredGovernmentalAuthority d c) :
    FalseIdentificationDocumentMembership d c := ⟨hM, hT, hO, hA⟩

theorem falseIdentificationDocumentMembership_isFalseIdentificationDocument {d : Document}
    {c : ComplaintText} (h : FalseIdentificationDocumentMembership d c) :
    IsFalseIdentificationDocument d c := h.membership



theorem falseAuthenticationFeatureMembership_intro {f : Feature} {c : ComplaintText}
    (hM : IsFalseAuthenticationFeature f c)
    (h : (IsAuthenticationFeature f c ∧ IsGenuineInOrigin f c
            ∧ TamperedForDeceitWithoutAuthorization f c)
       ∨ (IsAuthenticationFeature f c ∧ IsGenuineInOrigin f c
            ∧ DistributedWithoutIssuingAuthorityAuthorization f c
            ∧ NotConnectedToLawfullyMadeCarrier f c)
       ∨ (IsAuthenticationFeature f c ∧ AppearsGenuineButIsNot f c)) :
    FalseAuthenticationFeatureMembership f c :=
  match h with
  | Or.inl ⟨h1, h2, h3⟩ => .tampered hM h1 h2 h3
  | Or.inr (Or.inl ⟨h1, h2, h3, h4⟩) => .misdistributed hM h1 h2 h3 h4
  | Or.inr (Or.inr ⟨h1, h2⟩) => .apparentOnly hM h1 h2

theorem falseAuthenticationFeatureMembership_isFalseAuthenticationFeature {f : Feature}
    {c : ComplaintText} (h : FalseAuthenticationFeatureMembership f c) :
    IsFalseAuthenticationFeature f c :=
  match h with
  | .tampered hM _ _ _ => hM
  | .misdistributed hM _ _ _ _ => hM
  | .apparentOnly hM _ _ => hM



theorem falseAuthenticationFeatureMembership_isAuthenticationFeature {f : Feature}
    {c : ComplaintText} (h : FalseAuthenticationFeatureMembership f c) :
    IsAuthenticationFeature f c :=
  match h with
  | .tampered _ hA _ _ => hA
  | .misdistributed _ hA _ _ _ => hA
  | .apparentOnly _ hA _ => hA



theorem issuingAuthorityDefinition_intro {e : Entity} {c : ComplaintText}
    (hG : IsGovernmentalEntityOrAgency e c)
    (hA : IsAuthorizedToIssueIdentificationArtifacts e c) :
    IssuingAuthorityDefinition e c := ⟨hG, hA⟩

theorem issuingAuthorityMembership_intro {e : Entity} {c : ComplaintText}
    (hM : IsIssuingAuthority e c)
    (h : IssuingAuthorityDefinition e c ∨ IsEnumeratedIssuingAuthority e c) :
    IssuingAuthorityMembership e c :=
  match h with
  | Or.inl h1 => .byMeansClause hM h1
  | Or.inr h1 => .byInclusionRoster hM h1

theorem issuingAuthorityMembership_isIssuingAuthority {e : Entity} {c : ComplaintText}
    (h : IssuingAuthorityMembership e c) : IsIssuingAuthority e c :=
  match h with
  | .byMeansClause hM _ => hM
  | .byInclusionRoster hM _ => hM



theorem meansOfIdentificationKind_intro {m : Identifier} {c : ComplaintText}
    (h : IsEnumeratedNameOrNumberIdentifier m c ∨ IsUniqueBiometricData m c
       ∨ IsUniqueElectronicIdentifier m c ∨ IsTelecomIdentifyingInfoOrAccessDevice m c) :
    MeansOfIdentificationKind m c :=
  match h with
  | Or.inl h1 => .nameOrNumberIdentifier h1
  | Or.inr (Or.inl h1) => .biometric h1
  | Or.inr (Or.inr (Or.inl h1)) => .electronicIdentifier h1
  | Or.inr (Or.inr (Or.inr h1)) => .telecomOrAccessDevice h1

theorem meansOfIdentificationMembership_intro {m : Identifier} {c : ComplaintText}
    (hM : IsMeansOfIdentification m c) (hN : IsNameOrNumber m c)
    (hI : MayBeUsedToIdentifySpecificIndividual m c) :
    MeansOfIdentificationMembership m c := ⟨hM, hN, hI⟩

theorem meansOfIdentificationMembership_isMeansOfIdentification {m : Identifier}
    {c : ComplaintText} (h : MeansOfIdentificationMembership m c) :
    IsMeansOfIdentification m c := h.membership



theorem personalIdentificationCardMembership_intro {d : Document} {c : ComplaintText}
    (hM : IsPersonalIdentificationCard d c) (hD : IsIdentificationDocument d c)
    (hS : IsIssuedByStateOrLocalGovernment d c)
    (hP : IssuedSolelyForIdentificationPurpose d c) :
    PersonalIdentificationCardMembership d c := ⟨hM, hD, hS, hP⟩

theorem personalIdentificationCardMembership_isPersonalIdentificationCard {d : Document}
    {c : ComplaintText} (h : PersonalIdentificationCardMembership d c) :
    IsPersonalIdentificationCard d c := h.membership


theorem personalIdentificationCardMembership_isIdentificationDocument {d : Document}
    {c : ComplaintText} (h : PersonalIdentificationCardMembership d c) :
    IsIdentificationDocument d c := h.isIdentificationDocument



theorem produceS1028Membership_intro {a : Act} {c : ComplaintText}
    (hM : IsProduceUnderS1028 a c)
    (h : IsOrdinaryProduction a c ∨ IsAlterAuthenticateOrAssemble a c) :
    ProduceS1028Membership a c :=
  match h with
  | Or.inl h1 => .ordinary hM h1
  | Or.inr h1 => .included hM h1

theorem produceS1028Membership_isProduceUnderS1028 {a : Act} {c : ComplaintText}
    (h : ProduceS1028Membership a c) : IsProduceUnderS1028 a c :=
  match h with
  | .ordinary hM _ => hM
  | .included hM _ => hM

theorem transferS1028Membership_intro {a : Act} {c : ComplaintText}
    (hM : IsTransferUnderS1028 a c)
    (h : IsOrdinaryTransfer a c
       ∨ (SelectsCoveredArtifact a c ∧ PlacesOnOnlineLocationAvailableToOthers a c)) :
    TransferS1028Membership a c :=
  match h with
  | Or.inl h1 => .ordinary hM h1
  | Or.inr ⟨h1, h2⟩ => .onlinePlacement hM h1 h2

theorem transferS1028Membership_isTransferUnderS1028 {a : Act} {c : ComplaintText}
    (h : TransferS1028Membership a c) : IsTransferUnderS1028 a c :=
  match h with
  | .ordinary hM _ => hM
  | .onlinePlacement hM _ _ => hM

theorem stateS1028Membership_intro {e : Entity} {c : ComplaintText}
    (hM : IsStateUnderS1028 e c) (hC : IsCoveredStateJurisdiction e c) :
    StateS1028Membership e c := ⟨hM, hC⟩

theorem stateS1028Membership_isStateUnderS1028 {e : Entity} {c : ComplaintText}
    (h : StateS1028Membership e c) : IsStateUnderS1028 e c := h.membership

theorem trafficS1028Membership_intro {a : Act} {c : ComplaintText}
    (hM : IsTrafficUnderS1028 a c)
    (h : (TransportsTransfersOrDisposesToAnother a c ∧ ForConsiderationOfValue a c)
       ∨ ObtainsControlWithIntentToSoDispose a c) :
    TrafficS1028Membership a c :=
  match h with
  | Or.inl ⟨h1, h2⟩ => .disposition hM h1 h2
  | Or.inr h1 => .controlWithIntent hM h1

theorem trafficS1028Membership_isTrafficUnderS1028 {a : Act} {c : ComplaintText}
    (h : TrafficS1028Membership a c) : IsTrafficUnderS1028 a c :=
  match h with
  | .disposition hM _ _ => hM
  | .controlWithIntent hM _ => hM



theorem accessDeviceCapability_intro {dv : Device} {c : ComplaintText}
    (h : CanObtainThingOfValue dv c
       ∨ (CanInitiateFundsTransfer dv c
            ∧ ¬ IsSolelyPaperInstrumentOriginatedTransfer dv c)) :
    AccessDeviceCapability dv c :=
  match h with
  | Or.inl h1 => .obtainsValue h1
  | Or.inr ⟨h1, h2⟩ => .initiatesFundsTransfer h1 h2

theorem accessDeviceMembership_intro {dv : Device} {c : ComplaintText}
    (hM : IsAccessDevice dv c) (hA : IsAccountAccessMeans dv c)
    (hC : AccessDeviceCapability dv c) : AccessDeviceMembership dv c := ⟨hM, hA, hC⟩

theorem accessDeviceMembership_isAccessDevice {dv : Device} {c : ComplaintText}
    (h : AccessDeviceMembership dv c) : IsAccessDevice dv c := h.membership

theorem counterfeitAccessDeviceMembership_intro {dv : Device} {c : ComplaintText}
    (hM : IsCounterfeitAccessDevice dv c)
    (h : (IsAccessDevice dv c ∧ IsCounterfeitFictitiousAlteredOrForged dv c)
       ∨ IsIdentifiableComponentOfAccessDevice dv c) :
    CounterfeitAccessDeviceMembership dv c :=
  match h with
  | Or.inl ⟨h1, h2⟩ => .falsifiedDevice hM h1 h2
  | Or.inr h1 => .identifiableComponent hM h1

theorem counterfeitAccessDeviceMembership_isCounterfeitAccessDevice {dv : Device}
    {c : ComplaintText} (h : CounterfeitAccessDeviceMembership dv c) :
    IsCounterfeitAccessDevice dv c :=
  match h with
  | .falsifiedDevice hM _ _ => hM
  | .identifiableComponent hM _ => hM

theorem unauthorizedAccessDeviceMembership_intro {dv : Device} {c : ComplaintText}
    (hM : IsUnauthorizedAccessDevice dv c) (hA : IsAccessDevice dv c)
    (h : IsLostStolenExpiredRevokedOrCanceled dv c ∨ WasObtainedWithIntentToDefraud dv c) :
    UnauthorizedAccessDeviceMembership dv c :=
  match h with
  | Or.inl h1 => .statusDefect hM hA h1
  | Or.inr h1 => .fraudulentlyObtained hM hA h1

theorem unauthorizedAccessDeviceMembership_isUnauthorizedAccessDevice {dv : Device}
    {c : ComplaintText} (h : UnauthorizedAccessDeviceMembership dv c) :
    IsUnauthorizedAccessDevice dv c :=
  match h with
  | .statusDefect hM _ _ => hM
  | .fraudulentlyObtained hM _ _ => hM




theorem unauthorizedAccessDeviceMembership_isAccessDevice {dv : Device}
    {c : ComplaintText} (h : UnauthorizedAccessDeviceMembership dv c) :
    IsAccessDevice dv c :=
  match h with
  | .statusDefect _ hA _ => hA
  | .fraudulentlyObtained _ hA _ => hA



theorem produceS1029Membership_intro {a : Act} {c : ComplaintText}
    (hM : IsProduceUnderS1029 a c)
    (h : IsOrdinaryProduction a c ∨ IsAlterAuthenticateOrAssemble a c
       ∨ IsDesignOrDuplicate a c) : ProduceS1029Membership a c :=
  match h with
  | Or.inl h1 => .ordinary hM h1
  | Or.inr (Or.inl h1) => .sharedVerbs hM h1
  | Or.inr (Or.inr h1) => .designOrDuplicate hM h1

theorem produceS1029Membership_isProduceUnderS1029 {a : Act} {c : ComplaintText}
    (h : ProduceS1029Membership a c) : IsProduceUnderS1029 a c :=
  match h with
  | .ordinary hM _ => hM
  | .sharedVerbs hM _ => hM
  | .designOrDuplicate hM _ => hM

theorem trafficS1029Membership_intro {a : Act} {c : ComplaintText}
    (hM : IsTrafficUnderS1029 a c)
    (h : IsTransferOrDisposalToAnother a c
       ∨ ObtainsControlWithIntentToTransferOrDispose a c) :
    TrafficS1029Membership a c :=
  match h with
  | Or.inl h1 => .disposition hM h1
  | Or.inr h1 => .controlWithIntent hM h1

theorem trafficS1029Membership_isTrafficUnderS1029 {a : Act} {c : ComplaintText}
    (h : TrafficS1029Membership a c) : IsTrafficUnderS1029 a c :=
  match h with
  | .disposition hM _ => hM
  | .controlWithIntent hM _ => hM

theorem deviceMakingEquipmentMembership_intro {i : Implement} {c : ComplaintText}
    (hM : IsDeviceMakingEquipment i c) (hK : IsDeviceMakingEquipmentKind i c)
    (hP : DesignedOrPrimarilyUsedForMakingAccessDevice i c) :
    DeviceMakingEquipmentMembership i c := ⟨hM, hK, hP⟩

theorem deviceMakingEquipmentMembership_isDeviceMakingEquipment {i : Implement}
    {c : ComplaintText} (h : DeviceMakingEquipmentMembership i c) :
    IsDeviceMakingEquipment i c := h.membership

theorem creditCardSystemMemberMembership_intro {e : Entity} {c : ComplaintText}
    (hM : IsCreditCardSystemMember e c) (hE : IsFinancialInstitutionOrOtherEntity e c)
    (hS : IsMemberOfCreditCardSystem e c) :
    CreditCardSystemMemberMembership e c := ⟨hM, hE, hS⟩

theorem creditCardSystemMemberMembership_isCreditCardSystemMember {e : Entity}
    {c : ComplaintText} (h : CreditCardSystemMemberMembership e c) :
    IsCreditCardSystemMember e c := h.membership

theorem scanningReceiverMembership_intro {dv : Device} {c : ComplaintText}
    (hM : IsScanningReceiver dv c)
    (h : CanInterceptCommunicationUnlawfully dv c ∨ CanInterceptTelecomIdentifier dv c) :
    ScanningReceiverMembership dv c :=
  match h with
  | Or.inl h1 => .communicationIntercept hM h1
  | Or.inr h1 => .identifierIntercept hM h1

theorem scanningReceiverMembership_isScanningReceiver {dv : Device} {c : ComplaintText}
    (h : ScanningReceiverMembership dv c) : IsScanningReceiver dv c :=
  match h with
  | .communicationIntercept hM _ => hM
  | .identifierIntercept hM _ => hM

theorem telecommunicationsServiceMembership_intro {s : Service} {c : ComplaintText}
    (hM : IsTelecommunicationsService s c)
    (hI : HasCommunicationsActTelecomServiceMeaning s c) :
    TelecommunicationsServiceMembership s c := ⟨hM, hI⟩

theorem telecommunicationsServiceMembership_isTelecommunicationsService {s : Service}
    {c : ComplaintText} (h : TelecommunicationsServiceMembership s c) :
    IsTelecommunicationsService s c := h.membership

theorem facilitiesBasedCarrierMembership_intro {e : Entity} {c : ComplaintText}
    (hM : IsFacilitiesBasedCarrier e c) (hO : OwnsCommunicationsTransmissionFacilities e c)
    (hR : ResponsibleForFacilitiesOperationAndMaintenance e c)
    (hL : HoldsFccOperatingLicense e c) :
    FacilitiesBasedCarrierMembership e c := ⟨hM, hO, hR, hL⟩

theorem facilitiesBasedCarrierMembership_isFacilitiesBasedCarrier {e : Entity}
    {c : ComplaintText} (h : FacilitiesBasedCarrierMembership e c) :
    IsFacilitiesBasedCarrier e c := h.membership

theorem telecommunicationIdentifyingInformationMembership_intro {m : Identifier}
    {c : ComplaintText} (hM : IsTelecommunicationIdentifyingInformation m c)
    (h : IsElectronicSerialNumber m c ∨ IdentifiesSpecificInstrumentOrAccount m c
       ∨ IdentifiesSpecificTransmittedCommunication m c) :
    TelecommunicationIdentifyingInformationMembership m c :=
  match h with
  | Or.inl h1 => .serialNumber hM h1
  | Or.inr (Or.inl h1) => .instrumentOrAccount hM h1
  | Or.inr (Or.inr h1) => .transmittedCommunication hM h1

theorem telecommunicationIdentifyingInformationMembership_isTelecommunicationIdentifyingInformation
    {m : Identifier} {c : ComplaintText}
    (h : TelecommunicationIdentifyingInformationMembership m c) :
    IsTelecommunicationIdentifyingInformation m c :=
  match h with
  | .serialNumber hM _ => hM
  | .instrumentOrAccount hM _ => hM
  | .transmittedCommunication hM _ => hM

theorem stateS1029Membership_intro {e : Entity} {c : ComplaintText}
    (hM : IsStateUnderS1029 e c) (hC : IsCoveredStateJurisdiction e c) :
    StateS1029Membership e c := ⟨hM, hC⟩

theorem stateS1029Membership_isStateUnderS1029 {e : Entity} {c : ComplaintText}
    (h : StateS1029Membership e c) : IsStateUnderS1029 e c := h.membership



theorem nonExemptCoveredAct_intro {a : Act} {c : ComplaintText}
    (hC : ProduceS1028Membership a c ∨ TransferS1028Membership a c
            ∨ TrafficS1028Membership a c)
    (hE : ¬ IsLawfullyAuthorizedInvestigativeActivity a c) :
    NonExemptCoveredAct a c := ⟨hC, hE⟩

theorem deemedSingleMeansOfIdentification_intro {d : Document} {c : ComplaintText}
    (hD : IsIdentificationDocument d c ∨ IsFalseIdentificationDocument d c)
    (hC : ContainsOneOrMoreMeansOfIdentification d c) :
    DeemedSingleMeansOfIdentification d c := ⟨hD, hC⟩

end Proving.USC.T18.Ch47.Ontology
