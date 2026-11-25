




















import Proving.USC.T18.Ch47.Ontology.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch47.Ontology

open Proving.USC.Common





structure AuthenticationFeatureMembership (f : Feature) (c : ComplaintText) : Prop where
  membership : IsAuthenticationFeature f c
  kind : IsAuthenticationFeatureKind f c
  usedByIssuer : UsedByIssuingAuthorityOnCoveredCarrier f c
  falsityDetection : ServesFalsityDetectionPurpose f c





structure DocumentMakingImplementMembership (i : Implement) (c : ComplaintText) : Prop where
  membership : IsDocumentMakingImplement i c
  kind : IsDocumentMakingImplementKind i c
  configuredForMaking : ConfiguredOrPrimarilyUsedForMakingCoveredArtifact i c





structure IdentificationDocumentMembership (d : Document) (c : ComplaintText) : Prop where
  membership : IsIdentificationDocument d c
  issued : IsIssuedUnderCoveredGovernmentalAuthority d c
  typeAccepted : IsOfTypeCommonlyAcceptedForIdentification d c







inductive FalseIdentificationDocumentOrigin (d : Document) (c : ComplaintText) : Prop where
  | notGovernmentIssued :
      ¬ IsIssuedUnderGovernmentalAuthority d c → FalseIdentificationDocumentOrigin d c
  | alteredAfterIssuance :
      IsIssuedUnderGovernmentalAuthority d c →
      WasAlteredForDeceitAfterIssuance d c →
      FalseIdentificationDocumentOrigin d c



structure FalseIdentificationDocumentMembership (d : Document) (c : ComplaintText) : Prop where
  membership : IsFalseIdentificationDocument d c
  typeAccepted : IsOfTypeCommonlyAcceptedForIdentification d c
  origin : FalseIdentificationDocumentOrigin d c
  appearsIssued : AppearsIssuedUnderCoveredGovernmentalAuthority d c





inductive FalseAuthenticationFeatureMembership (f : Feature) (c : ComplaintText) : Prop where
  | tampered :
      IsFalseAuthenticationFeature f c →
      IsAuthenticationFeature f c →
      IsGenuineInOrigin f c →
      TamperedForDeceitWithoutAuthorization f c →
      FalseAuthenticationFeatureMembership f c
  | misdistributed :
      IsFalseAuthenticationFeature f c →
      IsAuthenticationFeature f c →
      IsGenuineInOrigin f c →
      DistributedWithoutIssuingAuthorityAuthorization f c →
      NotConnectedToLawfullyMadeCarrier f c →
      FalseAuthenticationFeatureMembership f c
  | apparentOnly :
      IsFalseAuthenticationFeature f c →
      IsAuthenticationFeature f c →
      AppearsGenuineButIsNot f c →
      FalseAuthenticationFeatureMembership f c




structure IssuingAuthorityDefinition (e : Entity) (c : ComplaintText) : Prop where
  governmental : IsGovernmentalEntityOrAgency e c
  authorized : IsAuthorizedToIssueIdentificationArtifacts e c




inductive IssuingAuthorityMembership (e : Entity) (c : ComplaintText) : Prop where
  | byMeansClause :
      IsIssuingAuthority e c → IssuingAuthorityDefinition e c → IssuingAuthorityMembership e c
  | byInclusionRoster :
      IsIssuingAuthority e c → IsEnumeratedIssuingAuthority e c → IssuingAuthorityMembership e c







inductive MeansOfIdentificationKind (m : Identifier) (c : ComplaintText) : Prop where
  | nameOrNumberIdentifier :
      IsEnumeratedNameOrNumberIdentifier m c → MeansOfIdentificationKind m c
  | biometric : IsUniqueBiometricData m c → MeansOfIdentificationKind m c
  | electronicIdentifier : IsUniqueElectronicIdentifier m c → MeansOfIdentificationKind m c
  | telecomOrAccessDevice :
      IsTelecomIdentifyingInfoOrAccessDevice m c → MeansOfIdentificationKind m c



structure MeansOfIdentificationMembership (m : Identifier) (c : ComplaintText) : Prop where
  membership : IsMeansOfIdentification m c
  nameOrNumber : IsNameOrNumber m c
  identifiesIndividual : MayBeUsedToIdentifySpecificIndividual m c





structure PersonalIdentificationCardMembership (d : Document) (c : ComplaintText) : Prop where
  membership : IsPersonalIdentificationCard d c
  isIdentificationDocument : IsIdentificationDocument d c
  stateOrLocal : IsIssuedByStateOrLocalGovernment d c
  solelyIdentification : IssuedSolelyForIdentificationPurpose d c





inductive ProduceS1028Membership (a : Act) (c : ComplaintText) : Prop where
  | ordinary : IsProduceUnderS1028 a c → IsOrdinaryProduction a c → ProduceS1028Membership a c
  | included :
      IsProduceUnderS1028 a c → IsAlterAuthenticateOrAssemble a c → ProduceS1028Membership a c




inductive TransferS1028Membership (a : Act) (c : ComplaintText) : Prop where
  | ordinary : IsTransferUnderS1028 a c → IsOrdinaryTransfer a c → TransferS1028Membership a c
  | onlinePlacement :
      IsTransferUnderS1028 a c →
      SelectsCoveredArtifact a c →
      PlacesOnOnlineLocationAvailableToOthers a c →
      TransferS1028Membership a c


structure StateS1028Membership (e : Entity) (c : ComplaintText) : Prop where
  membership : IsStateUnderS1028 e c
  covered : IsCoveredStateJurisdiction e c



inductive TrafficS1028Membership (a : Act) (c : ComplaintText) : Prop where
  | disposition :
      IsTrafficUnderS1028 a c →
      TransportsTransfersOrDisposesToAnother a c →
      ForConsiderationOfValue a c →
      TrafficS1028Membership a c
  | controlWithIntent :
      IsTrafficUnderS1028 a c →
      ObtainsControlWithIntentToSoDispose a c →
      TrafficS1028Membership a c





inductive AccessDeviceCapability (dv : Device) (c : ComplaintText) : Prop where
  | obtainsValue : CanObtainThingOfValue dv c → AccessDeviceCapability dv c
  | initiatesFundsTransfer :
      CanInitiateFundsTransfer dv c →
      ¬ IsSolelyPaperInstrumentOriginatedTransfer dv c →
      AccessDeviceCapability dv c



structure AccessDeviceMembership (dv : Device) (c : ComplaintText) : Prop where
  membership : IsAccessDevice dv c
  accountAccessMeans : IsAccountAccessMeans dv c
  capability : AccessDeviceCapability dv c




inductive CounterfeitAccessDeviceMembership (dv : Device) (c : ComplaintText) : Prop where
  | falsifiedDevice :
      IsCounterfeitAccessDevice dv c →
      IsAccessDevice dv c →
      IsCounterfeitFictitiousAlteredOrForged dv c →
      CounterfeitAccessDeviceMembership dv c
  | identifiableComponent :
      IsCounterfeitAccessDevice dv c →
      IsIdentifiableComponentOfAccessDevice dv c →
      CounterfeitAccessDeviceMembership dv c


inductive UnauthorizedAccessDeviceMembership (dv : Device) (c : ComplaintText) : Prop where
  | statusDefect :
      IsUnauthorizedAccessDevice dv c →
      IsAccessDevice dv c →
      IsLostStolenExpiredRevokedOrCanceled dv c →
      UnauthorizedAccessDeviceMembership dv c
  | fraudulentlyObtained :
      IsUnauthorizedAccessDevice dv c →
      IsAccessDevice dv c →
      WasObtainedWithIntentToDefraud dv c →
      UnauthorizedAccessDeviceMembership dv c





inductive ProduceS1029Membership (a : Act) (c : ComplaintText) : Prop where
  | ordinary : IsProduceUnderS1029 a c → IsOrdinaryProduction a c → ProduceS1029Membership a c
  | sharedVerbs :
      IsProduceUnderS1029 a c → IsAlterAuthenticateOrAssemble a c → ProduceS1029Membership a c
  | designOrDuplicate :
      IsProduceUnderS1029 a c → IsDesignOrDuplicate a c → ProduceS1029Membership a c



inductive TrafficS1029Membership (a : Act) (c : ComplaintText) : Prop where
  | disposition :
      IsTrafficUnderS1029 a c →
      IsTransferOrDisposalToAnother a c →
      TrafficS1029Membership a c
  | controlWithIntent :
      IsTrafficUnderS1029 a c →
      ObtainsControlWithIntentToTransferOrDispose a c →
      TrafficS1029Membership a c




structure DeviceMakingEquipmentMembership (i : Implement) (c : ComplaintText) : Prop where
  membership : IsDeviceMakingEquipment i c
  kind : IsDeviceMakingEquipmentKind i c
  purpose : DesignedOrPrimarilyUsedForMakingAccessDevice i c


structure CreditCardSystemMemberMembership (e : Entity) (c : ComplaintText) : Prop where
  membership : IsCreditCardSystemMember e c
  entityKind : IsFinancialInstitutionOrOtherEntity e c
  systemMembership : IsMemberOfCreditCardSystem e c


inductive ScanningReceiverMembership (dv : Device) (c : ComplaintText) : Prop where
  | communicationIntercept :
      IsScanningReceiver dv c →
      CanInterceptCommunicationUnlawfully dv c →
      ScanningReceiverMembership dv c
  | identifierIntercept :
      IsScanningReceiver dv c →
      CanInterceptTelecomIdentifier dv c →
      ScanningReceiverMembership dv c



structure TelecommunicationsServiceMembership (s : Service) (c : ComplaintText) : Prop where
  membership : IsTelecommunicationsService s c
  incorporatedMeaning : HasCommunicationsActTelecomServiceMeaning s c


structure FacilitiesBasedCarrierMembership (e : Entity) (c : ComplaintText) : Prop where
  membership : IsFacilitiesBasedCarrier e c
  owns : OwnsCommunicationsTransmissionFacilities e c
  responsible : ResponsibleForFacilitiesOperationAndMaintenance e c
  licensed : HoldsFccOperatingLicense e c


inductive TelecommunicationIdentifyingInformationMembership
    (m : Identifier) (c : ComplaintText) : Prop where
  | serialNumber :
      IsTelecommunicationIdentifyingInformation m c →
      IsElectronicSerialNumber m c →
      TelecommunicationIdentifyingInformationMembership m c
  | instrumentOrAccount :
      IsTelecommunicationIdentifyingInformation m c →
      IdentifiesSpecificInstrumentOrAccount m c →
      TelecommunicationIdentifyingInformationMembership m c
  | transmittedCommunication :
      IsTelecommunicationIdentifyingInformation m c →
      IdentifiesSpecificTransmittedCommunication m c →
      TelecommunicationIdentifyingInformationMembership m c



structure StateS1029Membership (e : Entity) (c : ComplaintText) : Prop where
  membership : IsStateUnderS1029 e c
  covered : IsCoveredStateJurisdiction e c









structure NonExemptCoveredAct (a : Act) (c : ComplaintText) : Prop where
  covered :
    ProduceS1028Membership a c ∨ TransferS1028Membership a c ∨ TrafficS1028Membership a c
  notExempt : ¬ IsLawfullyAuthorizedInvestigativeActivity a c





structure DeemedSingleMeansOfIdentification (d : Document) (c : ComplaintText) : Prop where
  documentKind : IsIdentificationDocument d c ∨ IsFalseIdentificationDocument d c
  contains : ContainsOneOrMoreMeansOfIdentification d c






structure DefEdge where
  defined : String
  dependsOn : String
  citeDefine : String
  citeDependency : String


structure UseEdge where
  provision : String
  usesTerm : String


structure DanglingTerm where
  term : String
  usedAt : String
  note : String




def defEdges : List DefEdge :=
  [ { defined := "authentication feature", dependsOn := "issuing authority",
      citeDefine := "18 USC § 1028(d)(1)", citeDependency := "18 USC § 1028(d)(6)" },
    { defined := "authentication feature", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(1)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "authentication feature", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(1)", citeDependency := "18 USC § 1028(d)(2)" },
    { defined := "authentication feature", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(1)", citeDependency := "18 USC § 1028(d)(7)" },
    { defined := "document-making implement", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(2)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "document-making implement", dependsOn := "false identification document",
      citeDefine := "18 USC § 1028(d)(2)", citeDependency := "18 USC § 1028(d)(4)" },
    { defined := "document-making implement", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(2)", citeDependency := "18 USC § 1028(d)(2)" },
    { defined := "identification document", dependsOn := "State",
      citeDefine := "18 USC § 1028(d)(3)", citeDependency := "18 USC § 1028(d)(11)" },
    { defined := "identification document",
      dependsOn := "special event of national significance",
      citeDefine := "18 USC § 1028(d)(3)", citeDependency := "—" },
    { defined := "false identification document", dependsOn := "State",
      citeDefine := "18 USC § 1028(d)(4)", citeDependency := "18 USC § 1028(d)(11)" },
    { defined := "false identification document", dependsOn := "governmental entity",
      citeDefine := "18 USC § 1028(d)(4)", citeDependency := "—" },
    { defined := "false identification document",
      dependsOn := "special event of national significance",
      citeDefine := "18 USC § 1028(d)(4)", citeDependency := "—" },
    { defined := "false authentication feature", dependsOn := "authentication feature",
      citeDefine := "18 USC § 1028(d)(5)", citeDependency := "18 USC § 1028(d)(1)" },
    { defined := "false authentication feature", dependsOn := "issuing authority",
      citeDefine := "18 USC § 1028(d)(5)", citeDependency := "18 USC § 1028(d)(6)" },
    { defined := "false authentication feature", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(5)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "false authentication feature", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(5)", citeDependency := "18 USC § 1028(d)(2)" },
    { defined := "false authentication feature", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(5)", citeDependency := "18 USC § 1028(d)(7)" },
    { defined := "issuing authority", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(6)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "issuing authority", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(6)", citeDependency := "18 USC § 1028(d)(7)" },
    { defined := "issuing authority", dependsOn := "authentication feature",
      citeDefine := "18 USC § 1028(d)(6)", citeDependency := "18 USC § 1028(d)(1)" },
    { defined := "issuing authority", dependsOn := "State",
      citeDefine := "18 USC § 1028(d)(6)", citeDependency := "18 USC § 1028(d)(11)" },
    { defined := "means of identification", dependsOn := "State",
      citeDefine := "18 USC § 1028(d)(7)", citeDependency := "18 USC § 1028(d)(11)" },
    { defined := "means of identification",
      dependsOn := "telecommunication identifying information",
      citeDefine := "18 USC § 1028(d)(7)", citeDependency := "18 USC § 1029(e)(11)" },
    { defined := "means of identification", dependsOn := "access device",
      citeDefine := "18 USC § 1028(d)(7)", citeDependency := "18 USC § 1029(e)(1)" },
    { defined := "personal identification card", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(8)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "personal identification card", dependsOn := "State",
      citeDefine := "18 USC § 1028(d)(8)", citeDependency := "18 USC § 1028(d)(11)" },
    { defined := "transfer", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(10)", citeDependency := "18 USC § 1028(d)(3)" },
    { defined := "transfer", dependsOn := "false identification document",
      citeDefine := "18 USC § 1028(d)(10)", citeDependency := "18 USC § 1028(d)(4)" },
    { defined := "transfer", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(10)", citeDependency := "18 USC § 1028(d)(2)" },
    { defined := "traffic", dependsOn := "transfer",
      citeDefine := "18 USC § 1028(d)(12)", citeDependency := "18 USC § 1028(d)(10)" },
    { defined := "access device", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(1)", citeDependency := "18 USC § 1029(e)(1)" },
    { defined := "access device", dependsOn := "telecommunications service",
      citeDefine := "18 USC § 1029(e)(1)", citeDependency := "18 USC § 1029(e)(9)" },
    { defined := "counterfeit access device", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(2)", citeDependency := "18 USC § 1029(e)(1)" },
    { defined := "counterfeit access device", dependsOn := "counterfeit access device",
      citeDefine := "18 USC § 1029(e)(2)", citeDependency := "18 USC § 1029(e)(2)" },
    { defined := "unauthorized access device", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(3)", citeDependency := "18 USC § 1029(e)(1)" },
    { defined := "device-making equipment", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(6)", citeDependency := "18 USC § 1029(e)(1)" },
    { defined := "device-making equipment", dependsOn := "counterfeit access device",
      citeDefine := "18 USC § 1029(e)(6)", citeDependency := "18 USC § 1029(e)(2)" },
    { defined := "credit card system member", dependsOn := "financial institution",
      citeDefine := "18 USC § 1029(e)(7)", citeDependency := "—" },
    { defined := "credit card system member", dependsOn := "credit card system",
      citeDefine := "18 USC § 1029(e)(7)", citeDependency := "—" },
    { defined := "scanning receiver", dependsOn := "telecommunications service",
      citeDefine := "18 USC § 1029(e)(8)", citeDependency := "18 USC § 1029(e)(9)" },
    { defined := "telecommunications service", dependsOn := "47 USC § 153",
      citeDefine := "18 USC § 1029(e)(9)", citeDependency := "—" },
    { defined := "facilities-based carrier", dependsOn := "telecommunications instrument",
      citeDefine := "18 USC § 1029(e)(10)", citeDependency := "—" },
    { defined := "telecommunication identifying information",
      dependsOn := "telecommunications instrument",
      citeDefine := "18 USC § 1029(e)(11)", citeDependency := "—" } ]




def useEdges : List UseEdge :=
  [ { provision := "18 USC § 1028(a)(1)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(a)(1)", usesTerm := "authentication feature" },
    { provision := "18 USC § 1028(a)(1)", usesTerm := "false identification document" },
    { provision := "18 USC § 1028(a)(1)", usesTerm := "produce" },
    { provision := "18 USC § 1028(a)(2)", usesTerm := "transfer" },
    { provision := "18 USC § 1028(a)(2)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(a)(3)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(a)(3)", usesTerm := "authentication feature" },
    { provision := "18 USC § 1028(a)(4)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(a)(5)", usesTerm := "document-making implement" },
    { provision := "18 USC § 1028(a)(5)", usesTerm := "authentication feature" },
    { provision := "18 USC § 1028(a)(6)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(a)(7)", usesTerm := "means of identification" },
    { provision := "18 USC § 1028(a)(8)", usesTerm := "traffic" },
    { provision := "18 USC § 1028(a)(8)", usesTerm := "authentication feature" },
    { provision := "18 USC § 1028(a)(8)", usesTerm := "means of identification" },
    { provision := "18 USC § 1028(b)(1)(A)", usesTerm := "personal identification card" },
    { provision := "18 USC § 1028(b)(1)(D)", usesTerm := "means of identification" },
    { provision := "18 USC § 1028(b)(2)(A)", usesTerm := "means of identification" },
    { provision := "18 USC § 1028(c)(1)", usesTerm := "identification document" },
    { provision := "18 USC § 1028(c)(1)", usesTerm := "document-making implement" },
    { provision := "18 USC § 1028(c)(3)", usesTerm := "means of identification" },
    { provision := "18 USC § 1028(h)", usesTerm := "authentication feature" },
    { provision := "18 USC § 1028(i)", usesTerm := "means of identification" },
    { provision := "18 USC § 1029(a)(1)", usesTerm := "counterfeit access device" },
    { provision := "18 USC § 1029(a)(1)", usesTerm := "produce" },
    { provision := "18 USC § 1029(a)(1)", usesTerm := "traffic" },
    { provision := "18 USC § 1029(a)(2)", usesTerm := "unauthorized access device" },
    { provision := "18 USC § 1029(a)(3)", usesTerm := "counterfeit access device" },
    { provision := "18 USC § 1029(a)(3)", usesTerm := "unauthorized access device" },
    { provision := "18 USC § 1029(a)(4)", usesTerm := "device-making equipment" },
    { provision := "18 USC § 1029(a)(5)", usesTerm := "access device" },
    { provision := "18 USC § 1029(a)(6)", usesTerm := "access device" },
    { provision := "18 USC § 1029(a)(7)", usesTerm := "telecommunications service" },
    { provision := "18 USC § 1029(a)(8)", usesTerm := "scanning receiver" },
    { provision := "18 USC § 1029(a)(9)", usesTerm := "telecommunication identifying information" },
    { provision := "18 USC § 1029(a)(10)", usesTerm := "credit card system member" },
    { provision := "18 USC § 1029(a)(10)", usesTerm := "access device" },
    { provision := "18 USC § 1029(g)(1)", usesTerm := "facilities-based carrier" } ]




def danglingTerms : List DanglingTerm :=
  [ { term := "special event of national significance",
      usedAt := "18 USC § 1028(c)(1), (d)(3), (d)(4)(B), (d)(6)(B)",
      note := "designation is Presidential; no definition anywhere in § 1028 or § 1029" },
    { term := "sponsoring entity", usedAt := "18 USC § 1028(c)(1), (d)(3)",
      note := "undefined; denotes the private or public host of the designated event" },
    { term := "governmental entity", usedAt := "18 USC § 1028(d)(4)(A), (d)(6)(A)",
      note := "undefined; broader than the (d)(6)(B) roster it anchors" },
    { term := "lawful authority", usedAt := "18 USC § 1028(a)(1), (a)(2), (a)(6), (a)(7)",
      note := "undefined; the § 1028(a) actus-reus qualifier" },
    { term := "State or local government", usedAt := "18 USC § 1028(d)(8)",
      note := "\"State\" is defined at (d)(11); \"local government\" is not" },
    { term := "drug trafficking crime", usedAt := "18 USC § 1028(b)(3)(A)",
      note := "defined outside the slice at 18 USC § 929(a)(2)" },
    { term := "crime of violence", usedAt := "18 USC § 1028(b)(3)(B)",
      note := "defined outside the slice at 18 USC § 924(c)(3)" },
    { term := "domestic terrorism / international terrorism", usedAt := "18 USC § 1028(b)(4)",
      note := "defined outside the slice at 18 USC § 2331(5) and § 2331(1)" },
    { term := "anything of value",
      usedAt := "18 USC § 1028(b)(1)(D), (d)(12)(A); § 1029(a)(2), (a)(5), (e)(1)",
      note := "undefined; carries the aggregation thresholds in both sections" },
    { term := "financial institution", usedAt := "18 USC § 1029(e)(7), (h)",
      note := "undefined in the slice; a title-18 general definition exists at § 20" },
    { term := "credit card system", usedAt := "18 USC § 1029(a)(10), (e)(7)",
      note := "only its \"member\" is defined; the system itself never is" },
    { term := "issuer (of an access device)", usedAt := "18 USC § 1029(a)(6)",
      note := "undefined; distinct from the § 1028(d)(6) \"issuing authority\"" },
    { term := "account issuer", usedAt := "18 USC § 1029(h)",
      note := "undefined; appears only in the extraterritoriality clause" },
    { term := "telecommunications instrument", usedAt := "18 USC § 1029(a)(7), (a)(9), (e)(11)",
      note := "undefined; \"telecommunications service\" is defined, the instrument is not" },
    { term := "telecommunications service", usedAt := "18 USC § 1029(e)(9)",
      note := "defined only by incorporation of 47 USC § 153 — external, not resolvable in title 18" } ]

end Proving.USC.T18.Ch47.Ontology
