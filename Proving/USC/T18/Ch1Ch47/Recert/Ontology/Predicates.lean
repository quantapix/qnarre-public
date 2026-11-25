






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Ontology

open Proving.USC.Common







axiom IsSpecialMaritimeAndTerritorialJurisdiction (l : Locus) (c : ComplaintText) : Prop




axiom IsHighSeasOrUnitedStatesVesselWaters (l : Locus) (c : ComplaintText) : Prop




axiom IsGreatLakesRegisteredVessel (l : Locus) (c : ComplaintText) : Prop




axiom IsFederalEnclaveOrReservedLands (l : Locus) (c : ComplaintText) : Prop




axiom IsGuanoIslandAppertainingToUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesAircraftInFlight (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesRegisteredSpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop



axiom IsPlaceOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop




axiom IsForeignVesselOnScheduledUnitedStatesVoyage (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesMissionPremisesInForeignState (l : Locus) (c : ComplaintText) : Prop




axiom IsUnitedStatesMissionResidenceInForeignState (l : Locus) (c : ComplaintText) : Prop





axiom OffenseByOrAgainstNationalOfTheUnitedStates (l : Locus) (c : ComplaintText) : Prop




axiom OffenseCommittedByPersonDescribedInSection3261a (l : Locus) (c : ComplaintText) : Prop





axiom IsFinancialInstitution (i : Institution) (c : ComplaintText) : Prop



axiom IsInsuredDepositoryInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsFederallyInsuredCreditUnion (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalHomeLoanBankOrMember (i : Institution) (c : ComplaintText) : Prop




axiom IsFarmCreditSystemInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsSmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsDepositoryInstitutionHoldingCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalReserveBankOrMemberBank (i : Institution) (c : ComplaintText) : Prop




axiom IsEdgeActOrAgreementCorporation (i : Institution) (c : ComplaintText) : Prop




axiom IsBranchOrAgencyOfForeignBank (i : Institution) (c : ComplaintText) : Prop




axiom IsMortgageLendingBusinessOrFederallyRelatedMortgageLender (i : Institution) (c : ComplaintText) : Prop







axiom PropertyOfProscribedCharacter (p : Property) (c : ComplaintText) : Prop



axiom DefendantKnewProscribedCharacter (p : Property) (c : ComplaintText) : Prop



axiom IsOfficialRepresentation (r : Representation) (c : ComplaintText) : Prop




axiom IsFederalLawEnforcementOfficer (x : Person) (c : ComplaintText) : Prop




axiom RepresentationMadeByOrUnderOfficerAuthority
  (r : Representation) (x : Person) (c : ComplaintText) : Prop




axiom RepresentationConcernsProperty
  (r : Representation) (p : Property) (c : ComplaintText) : Prop




axiom BelievedPropertyOfProscribedCharacter
  (p : Property) (r : Representation) (c : ComplaintText) : Prop






axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfGuam (ct : Court) (c : ComplaintText) : Prop




axiom IsDistrictCourtForTheNorthernMarianaIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfTheVirginIslands (ct : Court) (c : ComplaintText) : Prop




axiom ExpresslyProvidedOtherwise (ct : Court) (c : ComplaintText) : Prop






axiom IsFederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedHealthCareStatute (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedGeneralFraudStatute (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram
  (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop




axiom IsCriminalConspiracyToViolate (o : Offense) (c : ComplaintText) : Prop



axiom IsHealthCareBenefitProgram (b : BenefitProgram) (c : ComplaintText) : Prop



axiom AffectsCommerce (b : BenefitProgram) (c : ComplaintText) : Prop





axiom ProvidesMedicalBenefitItemOrService (b : BenefitProgram) (c : ComplaintText) : Prop





axiom IsAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop




axiom IsFeatureOfEnumeratedKind (f : Feature) (c : ComplaintText) : Prop






axiom IsUsedByIssuingAuthorityToDetectFalsification (f : Feature) (c : ComplaintText) : Prop



axiom IsDocumentMakingImplement (im : Implement) (c : ComplaintText) : Prop





axiom IsConfiguredForMakingIdentificationDocuments (im : Implement) (c : ComplaintText) : Prop



axiom IsIdentificationDocument (dcm : Document) (c : ComplaintText) : Prop




axiom IsIssuedUnderGovernmentalAuthority (dcm : Document) (c : ComplaintText) : Prop




axiom IsOfTypeCommonlyAcceptedForIdentification (dcm : Document) (c : ComplaintText) : Prop




axiom IsFalseIdentificationDocument (dcm : Document) (c : ComplaintText) : Prop





axiom NotIssuedByGovernmentalEntityOrAlteredForDeceit (dcm : Document) (c : ComplaintText) : Prop




axiom AppearsIssuedByGovernmentalAuthority (dcm : Document) (c : ComplaintText) : Prop




axiom IsFalseAuthenticationFeature (f : Feature) (c : ComplaintText) : Prop




axiom IsGenuineButTamperedForDeceit (f : Feature) (c : ComplaintText) : Prop






axiom IsGenuineButDistributedWithoutAuthorization (f : Feature) (c : ComplaintText) : Prop



axiom AppearsGenuineButIsNot (f : Feature) (c : ComplaintText) : Prop



axiom IsIssuingAuthority (au : Authority) (c : ComplaintText) : Prop





axiom IsAuthorizedToIssueIdentificationDocuments (au : Authority) (c : ComplaintText) : Prop





axiom IsGovernmentalEntityOrInternationalOrganization (au : Authority) (c : ComplaintText) : Prop



axiom IsMeansOfIdentification (idr : Identifier) (c : ComplaintText) : Prop




axiom IdentifiesSpecificIndividual (idr : Identifier) (c : ComplaintText) : Prop






axiom IsNameOrGovernmentIssuedNumber (idr : Identifier) (c : ComplaintText) : Prop




axiom IsUniqueBiometricData (idr : Identifier) (c : ComplaintText) : Prop




axiom IsUniqueElectronicIdentificationNumber (idr : Identifier) (c : ComplaintText) : Prop




axiom IsTelecommunicationIdentifyingInformationOrAccessDevice
  (idr : Identifier) (c : ComplaintText) : Prop




axiom IsPersonalIdentificationCard (dcm : Document) (c : ComplaintText) : Prop




axiom IsIssuedByStateOrLocalGovernmentSolelyForIdentification
  (dcm : Document) (c : ComplaintText) : Prop




axiom IsProduceConductUnderSection1028 (a : Conduct) (c : ComplaintText) : Prop





axiom IsTransferConductUnderSection1028 (a : Conduct) (c : ComplaintText) : Prop





axiom IsStateUnderSection1028 (s : Polity) (c : ComplaintText) : Prop



axiom IsTraffickingConductUnderSection1028 (a : Conduct) (c : ComplaintText) : Prop




axiom ContainsOneOrMoreMeansOfIdentification
  (dcm : Document) (idr : Identifier) (c : ComplaintText) : Prop





axiom IsAccessDevice (ad : AccessDevice) (c : ComplaintText) : Prop






axiom IsAccountAccessMeansOfEnumeratedKind (ad : AccessDevice) (c : ComplaintText) : Prop





axiom CanBeUsedToObtainValueOrInitiateTransfer (ad : AccessDevice) (c : ComplaintText) : Prop



axiom IsCounterfeitAccessDevice (ad : AccessDevice) (c : ComplaintText) : Prop





axiom IsCounterfeitFictitiousAlteredOrForged (ad : AccessDevice) (c : ComplaintText) : Prop



axiom IsUnauthorizedAccessDevice (ad : AccessDevice) (c : ComplaintText) : Prop




axiom IsLostStolenExpiredRevokedOrFraudulentlyObtained
  (ad : AccessDevice) (c : ComplaintText) : Prop




axiom IsProduceConductUnderSection1029 (a : Conduct) (c : ComplaintText) : Prop



axiom IsTraffickingConductUnderSection1029 (a : Conduct) (c : ComplaintText) : Prop



axiom IsDeviceMakingEquipment (eq : Equipment) (c : ComplaintText) : Prop




axiom IsDesignedOrPrimarilyUsedForMakingAccessDevices (eq : Equipment) (c : ComplaintText) : Prop



axiom IsCreditCardSystemMember (i : Institution) (c : ComplaintText) : Prop





axiom IsMemberOfCreditCardSystem (i : Institution) (c : ComplaintText) : Prop



axiom IsScanningReceiver (r : Receiver) (c : ComplaintText) : Prop






axiom CanInterceptCommunicationOrIdentifier (r : Receiver) (c : ComplaintText) : Prop




axiom IsTelecommunicationsService (ts : TelecomService) (c : ComplaintText) : Prop



axiom IsFacilitiesBasedCarrier (car : Carrier) (c : ComplaintText) : Prop




axiom OwnsAndOperatesTransmissionFacilities (car : Carrier) (c : ComplaintText) : Prop




axiom HoldsFccOperatingLicense (car : Carrier) (c : ComplaintText) : Prop




axiom IsTelecommunicationIdentifyingInformation (ti : TelecomIdInfo) (c : ComplaintText) : Prop





axiom IdentifiesSpecificTelecommunicationsInstrument
  (ti : TelecomIdInfo) (inst : Instrument) (c : ComplaintText) : Prop





axiom IsStateUnderSection1029 (s : Polity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert.Ontology
