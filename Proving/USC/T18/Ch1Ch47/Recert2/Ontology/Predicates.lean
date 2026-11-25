import Proving.USC.T18.Ch1Ch47.Recert2.Ontology.Types










set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Ontology

open Proving.USC.Common



axiom IsSpecialMaritimeAndTerritorialJurisdiction (l : Locus) (c : ComplaintText) : Prop



axiom IsHighSeasOrUsAdmiraltyWatersOrUsVessel (l : Locus) (c : ComplaintText) : Prop



axiom IsGreatLakesUsRegisteredVessel (l : Locus) (c : ComplaintText) : Prop



axiom IsUsReservedOrAcquiredLands (l : Locus) (c : ComplaintText) : Prop



axiom IsGuanoIslandAppertainingToUnitedStates (l : Locus) (c : ComplaintText) : Prop



axiom IsUsAircraftInFlightOverAdmiraltyWaters (l : Locus) (c : ComplaintText) : Prop



axiom IsUsRegisteredSpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop



axiom IsPlaceOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop



axiom IsForeignVesselOnScheduledUsVoyage (l : Locus) (c : ComplaintText) : Prop



axiom IsUsMissionPremisesOrResidenceInForeignState (l : Locus) (c : ComplaintText) : Prop



axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom OffenseIsByOrAgainstPerson (o : Offense) (p : Person) (c : ComplaintText) : Prop



axiom OffenseCommittedByPersonDescribedInSection3261a (o : Offense) (c : ComplaintText) : Prop



axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop



axiom IsInsuredDepositoryInstitution (e : Entity) (c : ComplaintText) : Prop



axiom IsNcusifInsuredCreditUnion (e : Entity) (c : ComplaintText) : Prop



axiom IsFederalHomeLoanBankOrSystemMember (e : Entity) (c : ComplaintText) : Prop



axiom IsFarmCreditSystemInstitution (e : Entity) (c : ComplaintText) : Prop



axiom IsSmallBusinessInvestmentCompany (e : Entity) (c : ComplaintText) : Prop



axiom IsDepositoryInstitutionHoldingCompany (e : Entity) (c : ComplaintText) : Prop



axiom IsFederalReserveBankOrMemberBank (e : Entity) (c : ComplaintText) : Prop



axiom IsEdgeActOrAgreementCorporation (e : Entity) (c : ComplaintText) : Prop



axiom IsBranchOrAgencyOfForeignBank (e : Entity) (c : ComplaintText) : Prop



axiom IsMortgageLendingBusinessOrFederallyRelatedMortgageLender (e : Entity) (c : ComplaintText) : Prop



axiom IsOfficialRepresentation (r : Representation) (c : ComplaintText) : Prop



axiom IsFederalLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop



axiom RepresentationMadeByFederalLawEnforcementOfficer (r : Representation) (p : Person) (c : ComplaintText) : Prop



axiom RepresentationMadeAtDirectionOrApprovalOfOfficer (r : Representation) (p : Person) (c : ComplaintText) : Prop



axiom HasStolenOrCounterfeitCharacter (x : PropertyItem) (c : ComplaintText) : Prop



axiom DefendantKnewStolenOrCounterfeitCharacter (d : Person) (x : PropertyItem) (c : ComplaintText) : Prop



axiom DefendantBelievedStolenOrCounterfeitCharacter (d : Person) (x : PropertyItem) (c : ComplaintText) : Prop



axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfGuam (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtForNorthernMarianaIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfVirginIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsFederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop



axiom IsCoreHealthCareStatuteViolationOrConspiracy (o : Offense) (c : ComplaintText) : Prop



axiom IsRelatedStatuteViolationOrConspiracy (o : Offense) (c : ComplaintText) : Prop



axiom OffenseRelatesToHealthCareBenefitProgram (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop



axiom IsHealthCareBenefitProgram (b : BenefitProgram) (c : ComplaintText) : Prop



axiom IsPlanOrContractAffectingCommerceProvidingMedicalBenefit (b : BenefitProgram) (c : ComplaintText) : Prop



axiom IsProviderOfMedicalBenefitUnderPlanOrContract (b : BenefitProgram) (c : ComplaintText) : Prop



axiom IsAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop



axiom IsDocumentMakingImplement (im : Implement) (c : ComplaintText) : Prop



axiom IsIdentificationDocument (d : Document) (c : ComplaintText) : Prop



axiom IsIssuedUnderGovernmentalAuthority (d : Document) (c : ComplaintText) : Prop



axiom IsOfTypeCommonlyAcceptedForIdentification (d : Document) (c : ComplaintText) : Prop



axiom IsFalseIdentificationDocument (d : Document) (c : ComplaintText) : Prop



axiom LacksGenuineGovernmentalIssuance (d : Document) (c : ComplaintText) : Prop



axiom AppearsIssuedUnderGovernmentalAuthority (d : Document) (c : ComplaintText) : Prop



axiom IsFalseAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop



axiom IsGenuineButTamperedWithoutAuthorization (f : Feature) (c : ComplaintText) : Prop



axiom IsGenuineButDistributedWithoutAuthorization (f : Feature) (c : ComplaintText) : Prop



axiom AppearsGenuineButIsNot (f : Feature) (c : ComplaintText) : Prop



axiom IsIssuingAuthority (a : Authority) (c : ComplaintText) : Prop



axiom IsGovernmentalEntityAuthorizedToIssue (a : Authority) (c : ComplaintText) : Prop



axiom IsEnumeratedGovernmentalIssuer (a : Authority) (c : ComplaintText) : Prop



axiom IsMeansOfIdentification (m : Identifier) (c : ComplaintText) : Prop



axiom IdentifiesSpecificIndividual (m : Identifier) (c : ComplaintText) : Prop



axiom IsNameOrGovernmentIssuedNumber (m : Identifier) (c : ComplaintText) : Prop



axiom IsUniqueBiometricData (m : Identifier) (c : ComplaintText) : Prop



axiom IsUniqueElectronicIdentifier (m : Identifier) (c : ComplaintText) : Prop



axiom IsTelecomIdentifyingInformationOrAccessDeviceIdentifier (m : Identifier) (c : ComplaintText) : Prop



axiom IsPersonalIdentificationCard (d : Document) (c : ComplaintText) : Prop



axiom IsIssuedByStateOrLocalGovernmentSolelyForIdentification (d : Document) (c : ComplaintText) : Prop



axiom IsProduceConductUnderSection1028 (k : Conduct) (c : ComplaintText) : Prop



axiom IsTransferConductUnderSection1028 (k : Conduct) (c : ComplaintText) : Prop



axiom IsStateUnderSection1028 (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsTrafficConductUnderSection1028 (k : Conduct) (c : ComplaintText) : Prop



axiom IsDisposalToAnotherForConsideration (k : Conduct) (c : ComplaintText) : Prop



axiom IsControlObtainedWithIntentToDispose (k : Conduct) (c : ComplaintText) : Prop



axiom IsAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsCardPlateCodeOrAccountIdentifier (a : AccessDevice) (c : ComplaintText) : Prop



axiom CanBeUsedToObtainValueOrInitiateFundsTransfer (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsCounterfeitAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsCounterfeitFictitiousAlteredOrForged (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsIdentifiableComponentOfAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsUnauthorizedAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsLostStolenExpiredRevokedOrCanceled (a : AccessDevice) (c : ComplaintText) : Prop



axiom WasObtainedWithIntentToDefraud (a : AccessDevice) (c : ComplaintText) : Prop



axiom IsProduceConductUnderSection1029 (k : Conduct) (c : ComplaintText) : Prop



axiom IsTrafficConductUnderSection1029 (k : Conduct) (c : ComplaintText) : Prop



axiom IsTransferOrDisposalToAnother (k : Conduct) (c : ComplaintText) : Prop



axiom IsControlObtainedWithIntentToTransferOrDispose (k : Conduct) (c : ComplaintText) : Prop



axiom IsDeviceMakingEquipment (q : Equipment) (c : ComplaintText) : Prop



axiom IsCreditCardSystemMember (e : Entity) (c : ComplaintText) : Prop



axiom IsMemberOfCreditCardSystem (e : Entity) (c : ComplaintText) : Prop



axiom IsScanningReceiver (q : Equipment) (c : ComplaintText) : Prop



axiom IsTelecommunicationsService (s : TelecomService) (c : ComplaintText) : Prop



axiom IsFacilitiesBasedCarrier (car : Carrier) (c : ComplaintText) : Prop



axiom OwnsCommunicationsTransmissionFacilities (car : Carrier) (c : ComplaintText) : Prop



axiom IsResponsibleForFacilityOperationAndMaintenance (car : Carrier) (c : ComplaintText) : Prop



axiom HoldsFccOperatingLicense (car : Carrier) (c : ComplaintText) : Prop



axiom IsTelecommunicationIdentifyingInformation (t : TelecomIdentifyingInfo) (c : ComplaintText) : Prop



axiom IsStateUnderSection1029 (j : Jurisdiction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Ontology