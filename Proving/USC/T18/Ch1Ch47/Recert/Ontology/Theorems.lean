






import Proving.USC.Common.Types
import Proving.USC.Common.Tactic
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Types
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Ontology

open Proving.USC.Common



theorem specialMaritimeTerritorialJurisdictionMembership_intro
    {l : Locus} {c : ComplaintText}
    (hCase : SpecialMaritimeTerritorialJurisdictionCase l c)
    (hMember : IsSpecialMaritimeAndTerritorialJurisdiction l c) :
    SpecialMaritimeTerritorialJurisdictionMembership l c :=
  ⟨hCase, hMember⟩

theorem specialMaritimeTerritorialJurisdictionCase_highSeas_intro
    {l : Locus} {c : ComplaintText} (h : IsHighSeasOrUnitedStatesVesselWaters l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .highSeasOrUnitedStatesVessel h

theorem specialMaritimeTerritorialJurisdictionCase_greatLakes_intro
    {l : Locus} {c : ComplaintText} (h : IsGreatLakesRegisteredVessel l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .greatLakesVessel h

theorem specialMaritimeTerritorialJurisdictionCase_federalEnclave_intro
    {l : Locus} {c : ComplaintText} (h : IsFederalEnclaveOrReservedLands l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .federalEnclave h

theorem specialMaritimeTerritorialJurisdictionCase_guanoIsland_intro
    {l : Locus} {c : ComplaintText} (h : IsGuanoIslandAppertainingToUnitedStates l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .guanoIsland h

theorem specialMaritimeTerritorialJurisdictionCase_aircraft_intro
    {l : Locus} {c : ComplaintText} (h : IsUnitedStatesAircraftInFlight l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .unitedStatesAircraft h

theorem specialMaritimeTerritorialJurisdictionCase_spaceVehicle_intro
    {l : Locus} {c : ComplaintText} (h : IsUnitedStatesRegisteredSpaceVehicleInFlight l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .spaceVehicle h

theorem specialMaritimeTerritorialJurisdictionCase_placeOutsideAnyNation_intro
    {l : Locus} {c : ComplaintText}
    (hPlace : IsPlaceOutsideJurisdictionOfAnyNation l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .placeOutsideAnyNation hPlace hNexus

theorem specialMaritimeTerritorialJurisdictionCase_foreignVessel_intro
    {l : Locus} {c : ComplaintText}
    (hVessel : IsForeignVesselOnScheduledUnitedStatesVoyage l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .foreignVesselScheduledVoyage hVessel hNexus

theorem specialMaritimeTerritorialJurisdictionCase_missionPremises_intro
    {l : Locus} {c : ComplaintText}
    (hPremises : IsUnitedStatesMissionPremisesInForeignState l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates l c)
    (hNot3261 : ¬ OffenseCommittedByPersonDescribedInSection3261a l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .missionPremisesAbroad hPremises hNexus hNot3261

theorem specialMaritimeTerritorialJurisdictionCase_missionResidence_intro
    {l : Locus} {c : ComplaintText}
    (hResidence : IsUnitedStatesMissionResidenceInForeignState l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates l c)
    (hNot3261 : ¬ OffenseCommittedByPersonDescribedInSection3261a l c) :
    SpecialMaritimeTerritorialJurisdictionCase l c :=
  .missionResidenceAbroad hResidence hNexus hNot3261



theorem financialInstitutionMembership_intro
    {i : Institution} {c : ComplaintText}
    (hCase : FinancialInstitutionCase i c) (hMember : IsFinancialInstitution i c) :
    FinancialInstitutionMembership i c :=
  ⟨hCase, hMember⟩

theorem financialInstitutionCase_insuredDepository_intro
    {i : Institution} {c : ComplaintText} (h : IsInsuredDepositoryInstitution i c) :
    FinancialInstitutionCase i c := .insuredDepository h

theorem financialInstitutionCase_creditUnion_intro
    {i : Institution} {c : ComplaintText} (h : IsFederallyInsuredCreditUnion i c) :
    FinancialInstitutionCase i c := .insuredCreditUnion h

theorem financialInstitutionCase_homeLoanBank_intro
    {i : Institution} {c : ComplaintText} (h : IsFederalHomeLoanBankOrMember i c) :
    FinancialInstitutionCase i c := .homeLoanBank h

theorem financialInstitutionCase_farmCredit_intro
    {i : Institution} {c : ComplaintText} (h : IsFarmCreditSystemInstitution i c) :
    FinancialInstitutionCase i c := .farmCredit h

theorem financialInstitutionCase_sbic_intro
    {i : Institution} {c : ComplaintText} (h : IsSmallBusinessInvestmentCompany i c) :
    FinancialInstitutionCase i c := .sbic h

theorem financialInstitutionCase_holdingCompany_intro
    {i : Institution} {c : ComplaintText} (h : IsDepositoryInstitutionHoldingCompany i c) :
    FinancialInstitutionCase i c := .holdingCompany h

theorem financialInstitutionCase_federalReserve_intro
    {i : Institution} {c : ComplaintText} (h : IsFederalReserveBankOrMemberBank i c) :
    FinancialInstitutionCase i c := .federalReserve h

theorem financialInstitutionCase_edgeAct_intro
    {i : Institution} {c : ComplaintText} (h : IsEdgeActOrAgreementCorporation i c) :
    FinancialInstitutionCase i c := .edgeActCorporation h

theorem financialInstitutionCase_foreignBankBranch_intro
    {i : Institution} {c : ComplaintText} (h : IsBranchOrAgencyOfForeignBank i c) :
    FinancialInstitutionCase i c := .foreignBankBranch h

theorem financialInstitutionCase_mortgageLender_intro
    {i : Institution} {c : ComplaintText}
    (h : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c) :
    FinancialInstitutionCase i c := .mortgageLender h



theorem officialRepresentationMembership_intro
    {r : Representation} {x : Person} {c : ComplaintText}
    (hOfficer : IsFederalLawEnforcementOfficer x c)
    (hProvenance : RepresentationMadeByOrUnderOfficerAuthority r x c)
    (hMember : IsOfficialRepresentation r c) :
    OfficialRepresentationMembership r x c :=
  ⟨hOfficer, hProvenance, hMember⟩

theorem stolenOrCounterfeitNatureElement_direct_intro
    {p : Property} {c : ComplaintText}
    (hCharacter : PropertyOfProscribedCharacter p c)
    (hKnowledge : DefendantKnewProscribedCharacter p c) :
    StolenOrCounterfeitNatureElement p c :=
  .direct hCharacter hKnowledge

theorem stolenOrCounterfeitNatureElement_byOfficialRepresentation_intro
    {p : Property} {c : ComplaintText} (r : Representation)
    (hOfficial : IsOfficialRepresentation r c)
    (hConcerns : RepresentationConcernsProperty r p c)
    (hBelief : BelievedPropertyOfProscribedCharacter p r c) :
    StolenOrCounterfeitNatureElement p c :=
  .byOfficialRepresentation r hOfficial hConcerns hBelief



theorem courtOfTheUnitedStatesMembership_intro
    {ct : Court} {c : ComplaintText}
    (hCase : CourtOfTheUnitedStatesCase ct c)
    (hNotDisplaced : ¬ ExpresslyProvidedOtherwise ct c)
    (hMember : IsCourtOfTheUnitedStates ct c) :
    CourtOfTheUnitedStatesMembership ct c :=
  ⟨hCase, hNotDisplaced, hMember⟩

theorem courtOfTheUnitedStatesCase_guam_intro
    {ct : Court} {c : ComplaintText} (h : IsDistrictCourtOfGuam ct c) :
    CourtOfTheUnitedStatesCase ct c := .guam h

theorem courtOfTheUnitedStatesCase_northernMarianaIslands_intro
    {ct : Court} {c : ComplaintText} (h : IsDistrictCourtForTheNorthernMarianaIslands ct c) :
    CourtOfTheUnitedStatesCase ct c := .northernMarianaIslands h

theorem courtOfTheUnitedStatesCase_virginIslands_intro
    {ct : Court} {c : ComplaintText} (h : IsDistrictCourtOfTheVirginIslands ct c) :
    CourtOfTheUnitedStatesCase ct c := .virginIslands h



theorem healthCareBenefitProgramMembership_intro
    {b : BenefitProgram} {c : ComplaintText}
    (hCommerce : AffectsCommerce b c)
    (hProvision : ProvidesMedicalBenefitItemOrService b c)
    (hMember : IsHealthCareBenefitProgram b c) :
    HealthCareBenefitProgramMembership b c :=
  ⟨hCommerce, hProvision, hMember⟩

theorem federalHealthCareOffenseMembership_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hCase : FederalHealthCareOffenseCase o b c)
    (hMember : IsFederalHealthCareOffense o c) :
    FederalHealthCareOffenseMembership o b c :=
  ⟨hCase, hMember⟩

theorem federalHealthCareOffenseCase_enumeratedStatute_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (h : ViolatesEnumeratedHealthCareStatute o c) :
    FederalHealthCareOffenseCase o b c := .enumeratedHealthCareStatute h

theorem federalHealthCareOffenseCase_generalStatute_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hViolation : ViolatesEnumeratedGeneralFraudStatute o c)
    (hProgram : IsHealthCareBenefitProgram b c)
    (hRelates : RelatesToHealthCareBenefitProgram o b c) :
    FederalHealthCareOffenseCase o b c :=
  .generalStatuteRelatedToProgram hViolation hProgram hRelates

theorem federalHealthCareOffenseCase_conspiracy_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (h : IsCriminalConspiracyToViolate o c) :
    FederalHealthCareOffenseCase o b c := .criminalConspiracy h



theorem authenticationFeatureMembership_intro
    {f : Feature} {c : ComplaintText}
    (hKind : IsFeatureOfEnumeratedKind f c)
    (hUse : IsUsedByIssuingAuthorityToDetectFalsification f c)
    (hMember : IsAuthenticationFeature f c) :
    AuthenticationFeatureMembership f c :=
  ⟨hKind, hUse, hMember⟩

theorem documentMakingImplementMembership_intro
    {im : Implement} {c : ComplaintText}
    (hConfigured : IsConfiguredForMakingIdentificationDocuments im c)
    (hMember : IsDocumentMakingImplement im c) :
    DocumentMakingImplementMembership im c :=
  ⟨hConfigured, hMember⟩

theorem identificationDocumentMembership_intro
    {dcm : Document} {c : ComplaintText}
    (hIssued : IsIssuedUnderGovernmentalAuthority dcm c)
    (hType : IsOfTypeCommonlyAcceptedForIdentification dcm c)
    (hMember : IsIdentificationDocument dcm c) :
    IdentificationDocumentMembership dcm c :=
  ⟨hIssued, hType, hMember⟩

theorem falseIdentificationDocumentMembership_intro
    {dcm : Document} {c : ComplaintText}
    (hType : IsOfTypeCommonlyAcceptedForIdentification dcm c)
    (hNotGenuine : NotIssuedByGovernmentalEntityOrAlteredForDeceit dcm c)
    (hAppears : AppearsIssuedByGovernmentalAuthority dcm c)
    (hMember : IsFalseIdentificationDocument dcm c) :
    FalseIdentificationDocumentMembership dcm c :=
  ⟨hType, hNotGenuine, hAppears, hMember⟩

theorem falseAuthenticationFeatureMembership_intro
    {f : Feature} {c : ComplaintText}
    (hCase : FalseAuthenticationFeatureCase f c)
    (hMember : IsFalseAuthenticationFeature f c) :
    FalseAuthenticationFeatureMembership f c :=
  ⟨hCase, hMember⟩

theorem falseAuthenticationFeatureCase_tampered_intro
    {f : Feature} {c : ComplaintText}
    (hBase : IsAuthenticationFeature f c) (h : IsGenuineButTamperedForDeceit f c) :
    FalseAuthenticationFeatureCase f c := .tamperedForDeceit hBase h

theorem falseAuthenticationFeatureCase_distributed_intro
    {f : Feature} {c : ComplaintText}
    (hBase : IsAuthenticationFeature f c)
    (h : IsGenuineButDistributedWithoutAuthorization f c) :
    FalseAuthenticationFeatureCase f c := .distributedWithoutAuthorization hBase h

theorem falseAuthenticationFeatureCase_appearsGenuine_intro
    {f : Feature} {c : ComplaintText}
    (hBase : IsAuthenticationFeature f c) (h : AppearsGenuineButIsNot f c) :
    FalseAuthenticationFeatureCase f c := .appearsGenuineButIsNot hBase h

theorem issuingAuthorityMembership_intro
    {au : Authority} {c : ComplaintText}
    (hGovernmental : IsGovernmentalEntityOrInternationalOrganization au c)
    (hAuthorized : IsAuthorizedToIssueIdentificationDocuments au c)
    (hMember : IsIssuingAuthority au c) :
    IssuingAuthorityMembership au c :=
  ⟨hGovernmental, hAuthorized, hMember⟩

theorem meansOfIdentificationMembership_intro
    {idr : Identifier} {c : ComplaintText}
    (hCase : MeansOfIdentificationCase idr c) (hMember : IsMeansOfIdentification idr c) :
    MeansOfIdentificationMembership idr c :=
  ⟨hCase, hMember⟩

theorem meansOfIdentificationCase_nameOrNumber_intro
    {idr : Identifier} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificIndividual idr c)
    (h : IsNameOrGovernmentIssuedNumber idr c) :
    MeansOfIdentificationCase idr c := .nameOrGovernmentNumber hIdentifies h

theorem meansOfIdentificationCase_biometric_intro
    {idr : Identifier} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificIndividual idr c) (h : IsUniqueBiometricData idr c) :
    MeansOfIdentificationCase idr c := .uniqueBiometric hIdentifies h

theorem meansOfIdentificationCase_electronicNumber_intro
    {idr : Identifier} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificIndividual idr c)
    (h : IsUniqueElectronicIdentificationNumber idr c) :
    MeansOfIdentificationCase idr c := .uniqueElectronicNumber hIdentifies h

theorem meansOfIdentificationCase_telecomOrAccessDevice_intro
    {idr : Identifier} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificIndividual idr c)
    (h : IsTelecommunicationIdentifyingInformationOrAccessDevice idr c) :
    MeansOfIdentificationCase idr c := .telecomIdentifierOrAccessDevice hIdentifies h

theorem meansOfIdentificationViaAccessDevice_intro
    {idr : Identifier} {ad : AccessDevice} {c : ComplaintText}
    (hDevice : IsAccessDevice ad c)
    (hCrossRef : IsTelecommunicationIdentifyingInformationOrAccessDevice idr c)
    (hMember : IsMeansOfIdentification idr c) :
    MeansOfIdentificationViaAccessDevice idr ad c :=
  ⟨hDevice, hCrossRef, hMember⟩

theorem personalIdentificationCardMembership_intro
    {dcm : Document} {c : ComplaintText}
    (hIdentification : IsIdentificationDocument dcm c)
    (hSolePurpose : IsIssuedByStateOrLocalGovernmentSolelyForIdentification dcm c)
    (hMember : IsPersonalIdentificationCard dcm c) :
    PersonalIdentificationCardMembership dcm c :=
  ⟨hIdentification, hSolePurpose, hMember⟩

theorem identificationOrFalseIdentificationDocument_genuine_intro
    {dcm : Document} {c : ComplaintText} (h : IsIdentificationDocument dcm c) :
    IdentificationOrFalseIdentificationDocument dcm c := .genuine h

theorem identificationOrFalseIdentificationDocument_false_intro
    {dcm : Document} {c : ComplaintText} (h : IsFalseIdentificationDocument dcm c) :
    IdentificationOrFalseIdentificationDocument dcm c := .false_ h

theorem singleDocumentSingleMeansConstruction_intro
    {dcm : Document} {idr : Identifier} {c : ComplaintText}
    (hDocument : IdentificationOrFalseIdentificationDocument dcm c)
    (hContains : ContainsOneOrMoreMeansOfIdentification dcm idr c)
    (hSingle : IsMeansOfIdentification idr c) :
    SingleDocumentSingleMeansConstruction dcm idr c :=
  ⟨hDocument, hContains, hSingle⟩



theorem accessDeviceMembership_intro
    {ad : AccessDevice} {c : ComplaintText}
    (hKind : IsAccountAccessMeansOfEnumeratedKind ad c)
    (hCapability : CanBeUsedToObtainValueOrInitiateTransfer ad c)
    (hMember : IsAccessDevice ad c) :
    AccessDeviceMembership ad c :=
  ⟨hKind, hCapability, hMember⟩

theorem counterfeitAccessDeviceMembership_intro
    {ad : AccessDevice} {c : ComplaintText}
    (hBase : IsAccessDevice ad c)
    (hDefect : IsCounterfeitFictitiousAlteredOrForged ad c)
    (hMember : IsCounterfeitAccessDevice ad c) :
    CounterfeitAccessDeviceMembership ad c :=
  ⟨hBase, hDefect, hMember⟩

theorem unauthorizedAccessDeviceMembership_intro
    {ad : AccessDevice} {c : ComplaintText}
    (hBase : IsAccessDevice ad c)
    (hDefect : IsLostStolenExpiredRevokedOrFraudulentlyObtained ad c)
    (hMember : IsUnauthorizedAccessDevice ad c) :
    UnauthorizedAccessDeviceMembership ad c :=
  ⟨hBase, hDefect, hMember⟩

theorem deviceMakingEquipmentMembership_intro
    {eq : Equipment} {ad : AccessDevice} {c : ComplaintText}
    (hTarget : IsAccessDevice ad c)
    (hPurpose : IsDesignedOrPrimarilyUsedForMakingAccessDevices eq c)
    (hMember : IsDeviceMakingEquipment eq c) :
    DeviceMakingEquipmentMembership eq ad c :=
  ⟨hTarget, hPurpose, hMember⟩

theorem creditCardSystemMemberMembership_intro
    {i : Institution} {c : ComplaintText}
    (hCase : CreditCardSystemMemberCase i c) (hMember : IsCreditCardSystemMember i c) :
    CreditCardSystemMemberMembership i c :=
  ⟨hCase, hMember⟩

theorem creditCardSystemMemberCase_financialInstitution_intro
    {i : Institution} {c : ComplaintText}
    (hFinancial : IsFinancialInstitution i c) (hMember : IsMemberOfCreditCardSystem i c) :
    CreditCardSystemMemberCase i c := .financialInstitution hFinancial hMember

theorem creditCardSystemMemberCase_otherEntity_intro
    {i : Institution} {c : ComplaintText} (h : IsMemberOfCreditCardSystem i c) :
    CreditCardSystemMemberCase i c := .otherEntity h

theorem scanningReceiverMembership_intro
    {r : Receiver} {c : ComplaintText}
    (hCapability : CanInterceptCommunicationOrIdentifier r c)
    (hMember : IsScanningReceiver r c) :
    ScanningReceiverMembership r c :=
  ⟨hCapability, hMember⟩

theorem facilitiesBasedCarrierMembership_intro
    {car : Carrier} {c : ComplaintText}
    (hFacilities : OwnsAndOperatesTransmissionFacilities car c)
    (hLicense : HoldsFccOperatingLicense car c)
    (hMember : IsFacilitiesBasedCarrier car c) :
    FacilitiesBasedCarrierMembership car c :=
  ⟨hFacilities, hLicense, hMember⟩

theorem telecommunicationIdentifyingInformationMembership_intro
    {ti : TelecomIdInfo} {inst : Instrument} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificTelecommunicationsInstrument ti inst c)
    (hMember : IsTelecommunicationIdentifyingInformation ti c) :
    TelecommunicationIdentifyingInformationMembership ti inst c :=
  ⟨hIdentifies, hMember⟩

end Proving.USC.T18.Ch1Ch47.Recert.Ontology
