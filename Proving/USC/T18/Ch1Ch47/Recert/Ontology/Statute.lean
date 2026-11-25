











import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Types
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Ontology

open Proving.USC.Common





structure DefEdge where

  defined : String

  dependsOn : String

  citeDefine : String


  citeDependsOn : String



def edgeSmtjDependsOnNational : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "national of the United States",
    citeDefine := "18 USC § 7", citeDependsOn := "" }



def edgeFinancialInstitutionDependsOnMortgageLendingBusiness : DefEdge :=
  { defined := "financial institution", dependsOn := "mortgage lending business",
    citeDefine := "18 USC § 20", citeDependsOn := "18 USC § 27" }



def edgeOfficialRepresentationDependsOnOfficer : DefEdge :=
  { defined := "official representation", dependsOn := "Federal law enforcement officer",
    citeDefine := "18 USC § 21(b)", citeDependsOn := "18 USC § 115" }



def edgeHealthCareOffenseDependsOnBenefitProgram : DefEdge :=
  { defined := "Federal health care offense", dependsOn := "health care benefit program",
    citeDefine := "18 USC § 24(a)", citeDependsOn := "18 USC § 24(b)" }



def edgeAuthenticationFeatureDependsOnIssuingAuthority : DefEdge :=
  { defined := "authentication feature", dependsOn := "issuing authority",
    citeDefine := "18 USC § 1028(d)(1)", citeDependsOn := "18 USC § 1028(d)(6)" }


def edgeAuthenticationFeatureDependsOnIdentificationDocument : DefEdge :=
  { defined := "authentication feature", dependsOn := "identification document",
    citeDefine := "18 USC § 1028(d)(1)", citeDependsOn := "18 USC § 1028(d)(3)" }



def edgeDocumentMakingImplementDependsOnIdentificationDocument : DefEdge :=
  { defined := "document-making implement", dependsOn := "identification document",
    citeDefine := "18 USC § 1028(d)(2)", citeDependsOn := "18 USC § 1028(d)(3)" }



def edgeIdentificationDocumentDependsOnState : DefEdge :=
  { defined := "identification document", dependsOn := "State",
    citeDefine := "18 USC § 1028(d)(3)", citeDependsOn := "18 USC § 1028(d)(11)" }



def edgeFalseAuthenticationFeatureDependsOnAuthenticationFeature : DefEdge :=
  { defined := "false authentication feature", dependsOn := "authentication feature",
    citeDefine := "18 USC § 1028(d)(5)", citeDependsOn := "18 USC § 1028(d)(1)" }



def edgeIssuingAuthorityDependsOnMeansOfIdentification : DefEdge :=
  { defined := "issuing authority", dependsOn := "means of identification",
    citeDefine := "18 USC § 1028(d)(6)", citeDependsOn := "18 USC § 1028(d)(7)" }




def edgeMeansOfIdentificationDependsOnAccessDevice : DefEdge :=
  { defined := "means of identification", dependsOn := "access device",
    citeDefine := "18 USC § 1028(d)(7)", citeDependsOn := "18 USC § 1029(e)(1)" }



def edgePersonalIdentificationCardDependsOnIdentificationDocument : DefEdge :=
  { defined := "personal identification card", dependsOn := "identification document",
    citeDefine := "18 USC § 1028(d)(8)", citeDependsOn := "18 USC § 1028(d)(3)" }



def edgeTransferDependsOnIdentificationDocument : DefEdge :=
  { defined := "transfer", dependsOn := "identification document",
    citeDefine := "18 USC § 1028(d)(10)", citeDependsOn := "18 USC § 1028(d)(3)" }



def edgeSingleDocumentConstructionDependsOnMeansOfIdentification : DefEdge :=
  { defined := "identification document (single-means construction)",
    dependsOn := "means of identification",
    citeDefine := "18 USC § 1028(i)", citeDependsOn := "18 USC § 1028(d)(7)" }



def edgeCounterfeitAccessDeviceDependsOnAccessDevice : DefEdge :=
  { defined := "counterfeit access device", dependsOn := "access device",
    citeDefine := "18 USC § 1029(e)(2)", citeDependsOn := "18 USC § 1029(e)(1)" }



def edgeUnauthorizedAccessDeviceDependsOnAccessDevice : DefEdge :=
  { defined := "unauthorized access device", dependsOn := "access device",
    citeDefine := "18 USC § 1029(e)(3)", citeDependsOn := "18 USC § 1029(e)(1)" }



def edgeDeviceMakingEquipmentDependsOnAccessDevice : DefEdge :=
  { defined := "device-making equipment", dependsOn := "access device",
    citeDefine := "18 USC § 1029(e)(6)", citeDependsOn := "18 USC § 1029(e)(1)" }




def edgeCreditCardSystemMemberDependsOnFinancialInstitution : DefEdge :=
  { defined := "credit card system member", dependsOn := "financial institution",
    citeDefine := "18 USC § 1029(e)(7)", citeDependsOn := "18 USC § 20" }



def edgeScanningReceiverDependsOnTelecommunicationsService : DefEdge :=
  { defined := "scanning receiver", dependsOn := "telecommunications service",
    citeDefine := "18 USC § 1029(e)(8)", citeDependsOn := "18 USC § 1029(e)(9)" }



def edgeTelecommunicationIdentifyingInformationDependsOnInstrument : DefEdge :=
  { defined := "telecommunication identifying information",
    dependsOn := "telecommunications instrument",
    citeDefine := "18 USC § 1029(e)(11)", citeDependsOn := "" }


def defEdges : List DefEdge :=
  [ edgeSmtjDependsOnNational,
    edgeFinancialInstitutionDependsOnMortgageLendingBusiness,
    edgeOfficialRepresentationDependsOnOfficer,
    edgeHealthCareOffenseDependsOnBenefitProgram,
    edgeAuthenticationFeatureDependsOnIssuingAuthority,
    edgeAuthenticationFeatureDependsOnIdentificationDocument,
    edgeDocumentMakingImplementDependsOnIdentificationDocument,
    edgeIdentificationDocumentDependsOnState,
    edgeFalseAuthenticationFeatureDependsOnAuthenticationFeature,
    edgeIssuingAuthorityDependsOnMeansOfIdentification,
    edgeMeansOfIdentificationDependsOnAccessDevice,
    edgePersonalIdentificationCardDependsOnIdentificationDocument,
    edgeTransferDependsOnIdentificationDocument,
    edgeSingleDocumentConstructionDependsOnMeansOfIdentification,
    edgeCounterfeitAccessDeviceDependsOnAccessDevice,
    edgeUnauthorizedAccessDeviceDependsOnAccessDevice,
    edgeDeviceMakingEquipmentDependsOnAccessDevice,
    edgeCreditCardSystemMemberDependsOnFinancialInstitution,
    edgeScanningReceiverDependsOnTelecommunicationsService,
    edgeTelecommunicationIdentifyingInformationDependsOnInstrument ]






inductive SpecialMaritimeTerritorialJurisdictionCase
    (l : Locus) (c : ComplaintText) : Prop where

  | highSeasOrUnitedStatesVessel :
      IsHighSeasOrUnitedStatesVesselWaters l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | greatLakesVessel :
      IsGreatLakesRegisteredVessel l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | federalEnclave :
      IsFederalEnclaveOrReservedLands l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | guanoIsland :
      IsGuanoIslandAppertainingToUnitedStates l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | unitedStatesAircraft :
      IsUnitedStatesAircraftInFlight l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | spaceVehicle :
      IsUnitedStatesRegisteredSpaceVehicleInFlight l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | placeOutsideAnyNation :
      IsPlaceOutsideJurisdictionOfAnyNation l c →
      OffenseByOrAgainstNationalOfTheUnitedStates l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | foreignVesselScheduledVoyage :
      IsForeignVesselOnScheduledUnitedStatesVoyage l c →
      OffenseByOrAgainstNationalOfTheUnitedStates l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | missionPremisesAbroad :
      IsUnitedStatesMissionPremisesInForeignState l c →
      OffenseByOrAgainstNationalOfTheUnitedStates l c →
      ¬ OffenseCommittedByPersonDescribedInSection3261a l c →
      SpecialMaritimeTerritorialJurisdictionCase l c

  | missionResidenceAbroad :
      IsUnitedStatesMissionResidenceInForeignState l c →
      OffenseByOrAgainstNationalOfTheUnitedStates l c →
      ¬ OffenseCommittedByPersonDescribedInSection3261a l c →
      SpecialMaritimeTerritorialJurisdictionCase l c



structure SpecialMaritimeTerritorialJurisdictionMembership
    (l : Locus) (c : ComplaintText) : Prop where

  enumerated : SpecialMaritimeTerritorialJurisdictionCase l c

  member : IsSpecialMaritimeAndTerritorialJurisdiction l c




inductive FinancialInstitutionCase (i : Institution) (c : ComplaintText) : Prop where

  | insuredDepository : IsInsuredDepositoryInstitution i c → FinancialInstitutionCase i c

  | insuredCreditUnion : IsFederallyInsuredCreditUnion i c → FinancialInstitutionCase i c

  | homeLoanBank : IsFederalHomeLoanBankOrMember i c → FinancialInstitutionCase i c

  | farmCredit : IsFarmCreditSystemInstitution i c → FinancialInstitutionCase i c

  | sbic : IsSmallBusinessInvestmentCompany i c → FinancialInstitutionCase i c

  | holdingCompany : IsDepositoryInstitutionHoldingCompany i c → FinancialInstitutionCase i c

  | federalReserve : IsFederalReserveBankOrMemberBank i c → FinancialInstitutionCase i c

  | edgeActCorporation : IsEdgeActOrAgreementCorporation i c → FinancialInstitutionCase i c

  | foreignBankBranch : IsBranchOrAgencyOfForeignBank i c → FinancialInstitutionCase i c

  | mortgageLender :
      IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c →
      FinancialInstitutionCase i c


structure FinancialInstitutionMembership (i : Institution) (c : ComplaintText) : Prop where

  enumerated : FinancialInstitutionCase i c

  member : IsFinancialInstitution i c






structure OfficialRepresentationMembership
    (r : Representation) (x : Person) (c : ComplaintText) : Prop where

  officer : IsFederalLawEnforcementOfficer x c

  provenance : RepresentationMadeByOrUnderOfficerAuthority r x c

  member : IsOfficialRepresentation r c



inductive StolenOrCounterfeitNatureElement (p : Property) (c : ComplaintText) : Prop where

  | direct :
      PropertyOfProscribedCharacter p c →
      DefendantKnewProscribedCharacter p c →
      StolenOrCounterfeitNatureElement p c


  | byOfficialRepresentation (r : Representation) :
      IsOfficialRepresentation r c →
      RepresentationConcernsProperty r p c →
      BelievedPropertyOfProscribedCharacter p r c →
      StolenOrCounterfeitNatureElement p c




inductive CourtOfTheUnitedStatesCase (ct : Court) (c : ComplaintText) : Prop where

  | guam : IsDistrictCourtOfGuam ct c → CourtOfTheUnitedStatesCase ct c

  | northernMarianaIslands :
      IsDistrictCourtForTheNorthernMarianaIslands ct c → CourtOfTheUnitedStatesCase ct c

  | virginIslands : IsDistrictCourtOfTheVirginIslands ct c → CourtOfTheUnitedStatesCase ct c





structure CourtOfTheUnitedStatesMembership (ct : Court) (c : ComplaintText) : Prop where

  enumerated : CourtOfTheUnitedStatesCase ct c

  notDisplaced : ¬ ExpresslyProvidedOtherwise ct c

  member : IsCourtOfTheUnitedStates ct c






structure HealthCareBenefitProgramMembership
    (b : BenefitProgram) (c : ComplaintText) : Prop where

  commerce : AffectsCommerce b c

  provision : ProvidesMedicalBenefitItemOrService b c

  member : IsHealthCareBenefitProgram b c





inductive FederalHealthCareOffenseCase
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where

  | enumeratedHealthCareStatute :
      ViolatesEnumeratedHealthCareStatute o c →
      FederalHealthCareOffenseCase o b c

  | generalStatuteRelatedToProgram :
      ViolatesEnumeratedGeneralFraudStatute o c →
      IsHealthCareBenefitProgram b c →
      RelatesToHealthCareBenefitProgram o b c →
      FederalHealthCareOffenseCase o b c


  | criminalConspiracy :
      IsCriminalConspiracyToViolate o c →
      FederalHealthCareOffenseCase o b c


structure FederalHealthCareOffenseMembership
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where

  enumerated : FederalHealthCareOffenseCase o b c

  member : IsFederalHealthCareOffense o c





structure AuthenticationFeatureMembership (f : Feature) (c : ComplaintText) : Prop where

  kind : IsFeatureOfEnumeratedKind f c

  issuerUse : IsUsedByIssuingAuthorityToDetectFalsification f c

  member : IsAuthenticationFeature f c


structure DocumentMakingImplementMembership (im : Implement) (c : ComplaintText) : Prop where

  configured : IsConfiguredForMakingIdentificationDocuments im c

  member : IsDocumentMakingImplement im c


structure IdentificationDocumentMembership (dcm : Document) (c : ComplaintText) : Prop where

  issued : IsIssuedUnderGovernmentalAuthority dcm c

  typeAccepted : IsOfTypeCommonlyAcceptedForIdentification dcm c

  member : IsIdentificationDocument dcm c




structure FalseIdentificationDocumentMembership
    (dcm : Document) (c : ComplaintText) : Prop where

  typeAccepted : IsOfTypeCommonlyAcceptedForIdentification dcm c

  notGenuine : NotIssuedByGovernmentalEntityOrAlteredForDeceit dcm c

  appearsOfficial : AppearsIssuedByGovernmentalAuthority dcm c

  member : IsFalseIdentificationDocument dcm c



inductive FalseAuthenticationFeatureCase (f : Feature) (c : ComplaintText) : Prop where

  | tamperedForDeceit :
      IsAuthenticationFeature f c → IsGenuineButTamperedForDeceit f c →
      FalseAuthenticationFeatureCase f c

  | distributedWithoutAuthorization :
      IsAuthenticationFeature f c → IsGenuineButDistributedWithoutAuthorization f c →
      FalseAuthenticationFeatureCase f c

  | appearsGenuineButIsNot :
      IsAuthenticationFeature f c → AppearsGenuineButIsNot f c →
      FalseAuthenticationFeatureCase f c


structure FalseAuthenticationFeatureMembership (f : Feature) (c : ComplaintText) : Prop where

  enumerated : FalseAuthenticationFeatureCase f c

  member : IsFalseAuthenticationFeature f c


structure IssuingAuthorityMembership (au : Authority) (c : ComplaintText) : Prop where

  governmental : IsGovernmentalEntityOrInternationalOrganization au c

  authorized : IsAuthorizedToIssueIdentificationDocuments au c

  member : IsIssuingAuthority au c



inductive MeansOfIdentificationCase (idr : Identifier) (c : ComplaintText) : Prop where

  | nameOrGovernmentNumber :
      IdentifiesSpecificIndividual idr c → IsNameOrGovernmentIssuedNumber idr c →
      MeansOfIdentificationCase idr c

  | uniqueBiometric :
      IdentifiesSpecificIndividual idr c → IsUniqueBiometricData idr c →
      MeansOfIdentificationCase idr c

  | uniqueElectronicNumber :
      IdentifiesSpecificIndividual idr c → IsUniqueElectronicIdentificationNumber idr c →
      MeansOfIdentificationCase idr c


  | telecomIdentifierOrAccessDevice :
      IdentifiesSpecificIndividual idr c →
      IsTelecommunicationIdentifyingInformationOrAccessDevice idr c →
      MeansOfIdentificationCase idr c


structure MeansOfIdentificationMembership (idr : Identifier) (c : ComplaintText) : Prop where

  enumerated : MeansOfIdentificationCase idr c

  member : IsMeansOfIdentification idr c




structure MeansOfIdentificationViaAccessDevice
    (idr : Identifier) (ad : AccessDevice) (c : ComplaintText) : Prop where

  device : IsAccessDevice ad c

  crossReference : IsTelecommunicationIdentifyingInformationOrAccessDevice idr c

  member : IsMeansOfIdentification idr c


structure PersonalIdentificationCardMembership (dcm : Document) (c : ComplaintText) : Prop where

  identification : IsIdentificationDocument dcm c

  soleIdentificationPurpose : IsIssuedByStateOrLocalGovernmentSolelyForIdentification dcm c

  member : IsPersonalIdentificationCard dcm c




inductive IdentificationOrFalseIdentificationDocument
    (dcm : Document) (c : ComplaintText) : Prop where

  | genuine : IsIdentificationDocument dcm c → IdentificationOrFalseIdentificationDocument dcm c

  | false_ :
      IsFalseIdentificationDocument dcm c → IdentificationOrFalseIdentificationDocument dcm c


structure SingleDocumentSingleMeansConstruction
    (dcm : Document) (idr : Identifier) (c : ComplaintText) : Prop where

  document : IdentificationOrFalseIdentificationDocument dcm c

  contains : ContainsOneOrMoreMeansOfIdentification dcm idr c

  construedSingle : IsMeansOfIdentification idr c




structure AccessDeviceMembership (ad : AccessDevice) (c : ComplaintText) : Prop where

  kind : IsAccountAccessMeansOfEnumeratedKind ad c

  capability : CanBeUsedToObtainValueOrInitiateTransfer ad c

  member : IsAccessDevice ad c


structure CounterfeitAccessDeviceMembership (ad : AccessDevice) (c : ComplaintText) : Prop where

  base : IsAccessDevice ad c

  defect : IsCounterfeitFictitiousAlteredOrForged ad c

  member : IsCounterfeitAccessDevice ad c


structure UnauthorizedAccessDeviceMembership (ad : AccessDevice) (c : ComplaintText) : Prop where

  base : IsAccessDevice ad c

  defect : IsLostStolenExpiredRevokedOrFraudulentlyObtained ad c

  member : IsUnauthorizedAccessDevice ad c



structure DeviceMakingEquipmentMembership
    (eq : Equipment) (ad : AccessDevice) (c : ComplaintText) : Prop where

  target : IsAccessDevice ad c

  purpose : IsDesignedOrPrimarilyUsedForMakingAccessDevices eq c

  member : IsDeviceMakingEquipment eq c



inductive CreditCardSystemMemberCase (i : Institution) (c : ComplaintText) : Prop where

  | financialInstitution :
      IsFinancialInstitution i c → IsMemberOfCreditCardSystem i c →
      CreditCardSystemMemberCase i c

  | otherEntity :
      IsMemberOfCreditCardSystem i c → CreditCardSystemMemberCase i c


structure CreditCardSystemMemberMembership (i : Institution) (c : ComplaintText) : Prop where

  enumerated : CreditCardSystemMemberCase i c

  member : IsCreditCardSystemMember i c


structure ScanningReceiverMembership (r : Receiver) (c : ComplaintText) : Prop where

  capability : CanInterceptCommunicationOrIdentifier r c

  member : IsScanningReceiver r c


structure FacilitiesBasedCarrierMembership (car : Carrier) (c : ComplaintText) : Prop where

  facilities : OwnsAndOperatesTransmissionFacilities car c

  license : HoldsFccOperatingLicense car c

  member : IsFacilitiesBasedCarrier car c


structure TelecommunicationIdentifyingInformationMembership
    (ti : TelecomIdInfo) (inst : Instrument) (c : ComplaintText) : Prop where

  identifies : IdentifiesSpecificTelecommunicationsInstrument ti inst c

  member : IsTelecommunicationIdentifyingInformation ti c

end Proving.USC.T18.Ch1Ch47.Recert.Ontology
