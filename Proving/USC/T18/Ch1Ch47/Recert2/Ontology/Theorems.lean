import Proving.USC.T18.Ch1Ch47.Recert2.Ontology.Statute













set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Ontology

open Proving.USC.Common



theorem specialMaritimeTerritorialJurisdictionCase_intro
    {l : Locus} {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsHighSeasOrUsAdmiraltyWatersOrUsVessel l c
       ∨ IsGreatLakesUsRegisteredVessel l c
       ∨ IsUsReservedOrAcquiredLands l c
       ∨ IsGuanoIslandAppertainingToUnitedStates l c
       ∨ IsUsAircraftInFlightOverAdmiraltyWaters l c
       ∨ IsUsRegisteredSpaceVehicleInFlight l c
       ∨ (IsPlaceOutsideJurisdictionOfAnyNation l c ∧ IsNationalOfTheUnitedStates p c
            ∧ OffenseIsByOrAgainstPerson o p c)
       ∨ (IsForeignVesselOnScheduledUsVoyage l c ∧ IsNationalOfTheUnitedStates p c
            ∧ OffenseIsByOrAgainstPerson o p c)
       ∨ (IsUsMissionPremisesOrResidenceInForeignState l c ∧ IsNationalOfTheUnitedStates p c
            ∧ OffenseIsByOrAgainstPerson o p c
            ∧ ¬ OffenseCommittedByPersonDescribedInSection3261a o c))
    : SpecialMaritimeTerritorialJurisdictionCase l p o c :=
  match h with
  | .inl h1 => .highSeasOrUsVessel h1
  | .inr (.inl h1) => .greatLakesVessel h1
  | .inr (.inr (.inl h1)) => .reservedOrAcquiredLands h1
  | .inr (.inr (.inr (.inl h1))) => .guanoIsland h1
  | .inr (.inr (.inr (.inr (.inl h1)))) => .usAircraftInFlight h1
  | .inr (.inr (.inr (.inr (.inr (.inl h1))))) => .spaceVehicleInFlight h1
  | .inr (.inr (.inr (.inr (.inr (.inr (.inl ⟨h1, h2, h3⟩)))))) =>
      .outsideAnyNation h1 h2 h3
  | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl ⟨h1, h2, h3⟩))))))) =>
      .foreignVesselScheduledUsVoyage h1 h2 h3
  | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr ⟨h1, h2, h3, h4⟩))))))) =>
      .usMissionPremisesAbroad h1 h2 h3 h4

theorem specialMaritimeTerritorialJurisdictionMembership_intro
    {l : Locus} {p : Person} {o : Offense} {c : ComplaintText}
    (hCase : SpecialMaritimeTerritorialJurisdictionCase l p o c)
    (hMember : IsSpecialMaritimeAndTerritorialJurisdiction l c)
    : SpecialMaritimeTerritorialJurisdictionMembership l p o c :=
  ⟨hCase, hMember⟩



theorem financialInstitutionCase_intro {e : Entity} {c : ComplaintText}
    (h : IsInsuredDepositoryInstitution e c
       ∨ IsNcusifInsuredCreditUnion e c
       ∨ IsFederalHomeLoanBankOrSystemMember e c
       ∨ IsFarmCreditSystemInstitution e c
       ∨ IsSmallBusinessInvestmentCompany e c
       ∨ IsDepositoryInstitutionHoldingCompany e c
       ∨ IsFederalReserveBankOrMemberBank e c
       ∨ IsEdgeActOrAgreementCorporation e c
       ∨ IsBranchOrAgencyOfForeignBank e c
       ∨ IsMortgageLendingBusinessOrFederallyRelatedMortgageLender e c)
    : FinancialInstitutionCase e c :=
  match h with
  | .inl h1 => .insuredDepositoryInstitution h1
  | .inr (.inl h1) => .insuredCreditUnion h1
  | .inr (.inr (.inl h1)) => .homeLoanBankOrMember h1
  | .inr (.inr (.inr (.inl h1))) => .farmCreditSystemInstitution h1
  | .inr (.inr (.inr (.inr (.inl h1)))) => .smallBusinessInvestmentCompany h1
  | .inr (.inr (.inr (.inr (.inr (.inl h1))))) => .depositoryInstitutionHoldingCompany h1
  | .inr (.inr (.inr (.inr (.inr (.inr (.inl h1)))))) => .federalReserveBankOrMemberBank h1
  | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl h1))))))) =>
      .edgeActOrAgreementCorporation h1
  | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl h1)))))))) =>
      .branchOrAgencyOfForeignBank h1
  | .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr h1)))))))) =>
      .mortgageLendingBusiness h1

theorem financialInstitutionMembership_intro {e : Entity} {c : ComplaintText}
    (hCase : FinancialInstitutionCase e c) (hMember : IsFinancialInstitution e c)
    : FinancialInstitutionMembership e c :=
  ⟨hCase, hMember⟩



theorem officialRepresentationCase_intro
    {r : Representation} {p : Person} {c : ComplaintText}
    (h : (IsFederalLawEnforcementOfficer p c
            ∧ RepresentationMadeByFederalLawEnforcementOfficer r p c)
       ∨ (IsFederalLawEnforcementOfficer p c
            ∧ RepresentationMadeAtDirectionOrApprovalOfOfficer r p c))
    : OfficialRepresentationCase r p c :=
  match h with
  | .inl ⟨h1, h2⟩ => .madeByOfficer h1 h2
  | .inr ⟨h1, h2⟩ => .madeAtDirectionOfOfficer h1 h2

theorem officialRepresentationMembership_intro
    {r : Representation} {p : Person} {c : ComplaintText}
    (hCase : OfficialRepresentationCase r p c) (hMember : IsOfficialRepresentation r c)
    : OfficialRepresentationMembership r p c :=
  ⟨hCase, hMember⟩

theorem stolenOrCounterfeitNatureElement_intro
    {d : Person} {x : PropertyItem} {r : Representation} {c : ComplaintText}
    (h : (HasStolenOrCounterfeitCharacter x c
            ∧ DefendantKnewStolenOrCounterfeitCharacter d x c)
       ∨ (IsOfficialRepresentation r c
            ∧ DefendantBelievedStolenOrCounterfeitCharacter d x c))
    : StolenOrCounterfeitNatureElement d x r c :=
  match h with
  | .inl ⟨h1, h2⟩ => .actualCharacterAndKnowledge h1 h2
  | .inr ⟨h1, h2⟩ => .beliefAfterOfficialRepresentation h1 h2



theorem courtOfTheUnitedStatesInclusion_intro {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam ct c
       ∨ IsDistrictCourtForNorthernMarianaIslands ct c
       ∨ IsDistrictCourtOfVirginIslands ct c)
    : CourtOfTheUnitedStatesInclusion ct c :=
  match h with
  | .inl h1 => .districtCourtOfGuam h1
  | .inr (.inl h1) => .districtCourtNorthernMarianaIslands h1
  | .inr (.inr h1) => .districtCourtVirginIslands h1

theorem courtOfTheUnitedStatesMembership_intro {ct : Court} {c : ComplaintText}
    (hInclusion : CourtOfTheUnitedStatesInclusion ct c)
    (hMember : IsCourtOfTheUnitedStates ct c)
    : CourtOfTheUnitedStatesMembership ct c :=
  ⟨hInclusion, hMember⟩



theorem federalHealthCareOffenseRelatedArm_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hStatute : IsRelatedStatuteViolationOrConspiracy o c)
    (hProgram : IsHealthCareBenefitProgram b c)
    (hRelated : OffenseRelatesToHealthCareBenefitProgram o b c)
    : FederalHealthCareOffenseRelatedArm o b c :=
  ⟨hStatute, hProgram, hRelated⟩

theorem federalHealthCareOffenseCase_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (h : IsCoreHealthCareStatuteViolationOrConspiracy o c
       ∨ FederalHealthCareOffenseRelatedArm o b c)
    : FederalHealthCareOffenseCase o b c :=
  match h with
  | .inl h1 => .coreStatute h1
  | .inr h1 => .relatedStatute h1

theorem federalHealthCareOffenseMembership_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hCase : FederalHealthCareOffenseCase o b c) (hMember : IsFederalHealthCareOffense o c)
    : FederalHealthCareOffenseMembership o b c :=
  ⟨hCase, hMember⟩

theorem healthCareBenefitProgramCase_intro {b : BenefitProgram} {c : ComplaintText}
    (h : IsPlanOrContractAffectingCommerceProvidingMedicalBenefit b c
       ∨ IsProviderOfMedicalBenefitUnderPlanOrContract b c)
    : HealthCareBenefitProgramCase b c :=
  match h with
  | .inl h1 => .planOrContract h1
  | .inr h1 => .providerInclusion h1

theorem healthCareBenefitProgramMembership_intro {b : BenefitProgram} {c : ComplaintText}
    (hCase : HealthCareBenefitProgramCase b c) (hMember : IsHealthCareBenefitProgram b c)
    : HealthCareBenefitProgramMembership b c :=
  ⟨hCase, hMember⟩



theorem identificationDocumentDefinition_intro {d : Document} {c : ComplaintText}
    (hIssuance : IsIssuedUnderGovernmentalAuthority d c)
    (hType : IsOfTypeCommonlyAcceptedForIdentification d c)
    : IdentificationDocumentDefinition d c :=
  ⟨hIssuance, hType⟩

theorem identificationDocumentMembership_intro {d : Document} {c : ComplaintText}
    (hDef : IdentificationDocumentDefinition d c) (hMember : IsIdentificationDocument d c)
    : IdentificationDocumentMembership d c :=
  ⟨hDef, hMember⟩

theorem falseIdentificationDocumentDefinition_intro {d : Document} {c : ComplaintText}
    (hType : IsOfTypeCommonlyAcceptedForIdentification d c)
    (hNotGenuine : LacksGenuineGovernmentalIssuance d c)
    (hAppears : AppearsIssuedUnderGovernmentalAuthority d c)
    : FalseIdentificationDocumentDefinition d c :=
  ⟨hType, hNotGenuine, hAppears⟩

theorem falseIdentificationDocumentMembership_intro {d : Document} {c : ComplaintText}
    (hDef : FalseIdentificationDocumentDefinition d c)
    (hMember : IsFalseIdentificationDocument d c)
    : FalseIdentificationDocumentMembership d c :=
  ⟨hDef, hMember⟩

theorem falseAuthenticationFeatureCase_intro {f : Feature} {c : ComplaintText}
    (h : IsGenuineButTamperedWithoutAuthorization f c
       ∨ IsGenuineButDistributedWithoutAuthorization f c
       ∨ AppearsGenuineButIsNot f c)
    : FalseAuthenticationFeatureCase f c :=
  match h with
  | .inl h1 => .genuineButTampered h1
  | .inr (.inl h1) => .genuineButUnauthorizedDistribution h1
  | .inr (.inr h1) => .apparentButNotGenuine h1

theorem falseAuthenticationFeatureMembership_intro {f : Feature} {c : ComplaintText}
    (hBase : IsAuthenticationFeature f c)
    (hCase : FalseAuthenticationFeatureCase f c)
    (hMember : IsFalseAuthenticationFeature f c)
    : FalseAuthenticationFeatureMembership f c :=
  ⟨hBase, hCase, hMember⟩

theorem issuingAuthorityCase_intro {a : Authority} {c : ComplaintText}
    (h : IsGovernmentalEntityAuthorizedToIssue a c ∨ IsEnumeratedGovernmentalIssuer a c)
    : IssuingAuthorityCase a c :=
  match h with
  | .inl h1 => .authorizedGovernmentalEntity h1
  | .inr h1 => .enumeratedGovernmentalIssuer h1

theorem issuingAuthorityMembership_intro {a : Authority} {c : ComplaintText}
    (hCase : IssuingAuthorityCase a c) (hMember : IsIssuingAuthority a c)
    : IssuingAuthorityMembership a c :=
  ⟨hCase, hMember⟩

theorem meansOfIdentificationKind_intro {m : Identifier} {c : ComplaintText}
    (h : IsNameOrGovernmentIssuedNumber m c
       ∨ IsUniqueBiometricData m c
       ∨ IsUniqueElectronicIdentifier m c
       ∨ IsTelecomIdentifyingInformationOrAccessDeviceIdentifier m c)
    : MeansOfIdentificationKind m c :=
  match h with
  | .inl h1 => .nameOrGovernmentNumber h1
  | .inr (.inl h1) => .biometric h1
  | .inr (.inr (.inl h1)) => .electronicIdentifier h1
  | .inr (.inr (.inr h1)) => .telecomOrAccessDevice h1

theorem meansOfIdentificationEnumeratedInstance_intro {m : Identifier} {c : ComplaintText}
    (hIdentifies : IdentifiesSpecificIndividual m c) (hKind : MeansOfIdentificationKind m c)
    : MeansOfIdentificationEnumeratedInstance m c :=
  ⟨hIdentifies, hKind⟩

theorem meansOfIdentificationMembership_intro {m : Identifier} {c : ComplaintText}
    (hEnumerated : MeansOfIdentificationEnumeratedInstance m c)
    (hMember : IsMeansOfIdentification m c)
    : MeansOfIdentificationMembership m c :=
  ⟨hEnumerated, hMember⟩

theorem accessDeviceAsMeansOfIdentification_intro
    {m : Identifier} {a : AccessDevice} {c : ComplaintText}
    (hDevice : IsAccessDevice a c)
    (hForm : IsTelecomIdentifyingInformationOrAccessDeviceIdentifier m c)
    (hIdentifies : IdentifiesSpecificIndividual m c)
    (hMember : IsMeansOfIdentification m c)
    : AccessDeviceAsMeansOfIdentification m a c :=
  ⟨hDevice, hForm, hIdentifies, hMember⟩

theorem personalIdentificationCardDefinition_intro {d : Document} {c : ComplaintText}
    (hDocument : IsIdentificationDocument d c)
    (hSoleUse : IsIssuedByStateOrLocalGovernmentSolelyForIdentification d c)
    : PersonalIdentificationCardDefinition d c :=
  ⟨hDocument, hSoleUse⟩

theorem personalIdentificationCardMembership_intro {d : Document} {c : ComplaintText}
    (hDef : PersonalIdentificationCardDefinition d c)
    (hMember : IsPersonalIdentificationCard d c)
    : PersonalIdentificationCardMembership d c :=
  ⟨hDef, hMember⟩

theorem trafficConductCaseUnderSection1028_intro {k : Conduct} {c : ComplaintText}
    (h : IsDisposalToAnotherForConsideration k c ∨ IsControlObtainedWithIntentToDispose k c)
    : TrafficConductCaseUnderSection1028 k c :=
  match h with
  | .inl h1 => .disposalForConsideration h1
  | .inr h1 => .controlWithIntentToDispose h1

theorem trafficConductMembershipUnderSection1028_intro {k : Conduct} {c : ComplaintText}
    (hCase : TrafficConductCaseUnderSection1028 k c)
    (hMember : IsTrafficConductUnderSection1028 k c)
    : TrafficConductMembershipUnderSection1028 k c :=
  ⟨hCase, hMember⟩



theorem accessDeviceDefinition_intro {a : AccessDevice} {c : ComplaintText}
    (hForm : IsCardPlateCodeOrAccountIdentifier a c)
    (hCapability : CanBeUsedToObtainValueOrInitiateFundsTransfer a c)
    : AccessDeviceDefinition a c :=
  ⟨hForm, hCapability⟩

theorem accessDeviceMembership_intro {a : AccessDevice} {c : ComplaintText}
    (hDef : AccessDeviceDefinition a c) (hMember : IsAccessDevice a c)
    : AccessDeviceMembership a c :=
  ⟨hDef, hMember⟩

theorem counterfeitAccessDeviceCase_intro {a : AccessDevice} {c : ComplaintText}
    (h : (IsAccessDevice a c ∧ IsCounterfeitFictitiousAlteredOrForged a c)
       ∨ IsIdentifiableComponentOfAccessDevice a c)
    : CounterfeitAccessDeviceCase a c :=
  match h with
  | .inl ⟨h1, h2⟩ => .counterfeitDevice h1 h2
  | .inr h1 => .identifiableComponent h1

theorem counterfeitAccessDeviceMembership_intro {a : AccessDevice} {c : ComplaintText}
    (hCase : CounterfeitAccessDeviceCase a c) (hMember : IsCounterfeitAccessDevice a c)
    : CounterfeitAccessDeviceMembership a c :=
  ⟨hCase, hMember⟩

theorem unauthorizedAccessDeviceCase_intro {a : AccessDevice} {c : ComplaintText}
    (h : (IsAccessDevice a c ∧ IsLostStolenExpiredRevokedOrCanceled a c)
       ∨ (IsAccessDevice a c ∧ WasObtainedWithIntentToDefraud a c))
    : UnauthorizedAccessDeviceCase a c :=
  match h with
  | .inl ⟨h1, h2⟩ => .lostStolenExpiredRevokedCanceled h1 h2
  | .inr ⟨h1, h2⟩ => .obtainedWithIntentToDefraud h1 h2

theorem unauthorizedAccessDeviceMembership_intro {a : AccessDevice} {c : ComplaintText}
    (hCase : UnauthorizedAccessDeviceCase a c) (hMember : IsUnauthorizedAccessDevice a c)
    : UnauthorizedAccessDeviceMembership a c :=
  ⟨hCase, hMember⟩

theorem trafficConductCaseUnderSection1029_intro {k : Conduct} {c : ComplaintText}
    (h : IsTransferOrDisposalToAnother k c
       ∨ IsControlObtainedWithIntentToTransferOrDispose k c)
    : TrafficConductCaseUnderSection1029 k c :=
  match h with
  | .inl h1 => .transferOrDisposal h1
  | .inr h1 => .controlWithIntent h1

theorem trafficConductMembershipUnderSection1029_intro {k : Conduct} {c : ComplaintText}
    (hCase : TrafficConductCaseUnderSection1029 k c)
    (hMember : IsTrafficConductUnderSection1029 k c)
    : TrafficConductMembershipUnderSection1029 k c :=
  ⟨hCase, hMember⟩

theorem creditCardSystemMemberMembership_intro {e : Entity} {c : ComplaintText}
    (hSystem : IsMemberOfCreditCardSystem e c) (hMember : IsCreditCardSystemMember e c)
    : CreditCardSystemMemberMembership e c :=
  ⟨hSystem, hMember⟩

theorem financialInstitutionCreditCardSystemMember_intro {e : Entity} {c : ComplaintText}
    (hFinancial : IsFinancialInstitution e c)
    (hSystem : IsMemberOfCreditCardSystem e c)
    (hMember : IsCreditCardSystemMember e c)
    : FinancialInstitutionCreditCardSystemMember e c :=
  ⟨hFinancial, hSystem, hMember⟩

theorem facilitiesBasedCarrierDefinition_intro {car : Carrier} {c : ComplaintText}
    (hOwns : OwnsCommunicationsTransmissionFacilities car c)
    (hOperates : IsResponsibleForFacilityOperationAndMaintenance car c)
    (hLicense : HoldsFccOperatingLicense car c)
    : FacilitiesBasedCarrierDefinition car c :=
  ⟨hOwns, hOperates, hLicense⟩

theorem facilitiesBasedCarrierMembership_intro {car : Carrier} {c : ComplaintText}
    (hDef : FacilitiesBasedCarrierDefinition car c) (hMember : IsFacilitiesBasedCarrier car c)
    : FacilitiesBasedCarrierMembership car c :=
  ⟨hDef, hMember⟩

end Proving.USC.T18.Ch1Ch47.Recert2.Ontology
