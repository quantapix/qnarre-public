









import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Procedure

open Proving.USC.Common




axiom SitusHighSeasOrUnitedStatesVessel (l : Locus) (c : ComplaintText) : Prop


axiom SitusGreatLakesVessel (l : Locus) (c : ComplaintText) : Prop


axiom SitusFederalEnclave (l : Locus) (c : ComplaintText) : Prop


axiom SitusGuanoIsland (l : Locus) (c : ComplaintText) : Prop


axiom SitusUnitedStatesAircraftInFlight (l : Locus) (c : ComplaintText) : Prop


axiom SitusUnitedStatesSpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop


axiom SitusOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop


axiom SitusForeignVesselOnScheduledUnitedStatesVoyage (l : Locus) (c : ComplaintText) : Prop


axiom SitusUnitedStatesMissionPremisesOrResidence (l : Locus) (c : ComplaintText) : Prop



axiom OffenseByOrAgainstUnitedStatesNational (ch : Charge) (c : ComplaintText) : Prop





axiom CoveredBySection3261a (ch : Charge) (c : ComplaintText) : Prop




axiom IsFinancialInstitution (fi : FinancialInstitution) (c : ComplaintText) : Prop




axiom ElementIsStolenOrCounterfeitCharacter (el : Element) (pr : Property) (ch : Charge)
    (c : ComplaintText) : Prop


axiom ElementIsDefendantKnowledgeOfCharacter (el : Element) (ch : Charge)
    (c : ComplaintText) : Prop



axiom OfficialRepresentationAsToNatureOfProperty (r : OfficialRepresentation) (pr : Property)
    (c : ComplaintText) : Prop



axiom RepresentationByFederalLawEnforcementOfficer (r : OfficialRepresentation)
    (c : ComplaintText) : Prop


axiom RepresentationAtDirectionOrApprovalOfOfficer (r : OfficialRepresentation)
    (c : ComplaintText) : Prop


axiom DefendantBelievedPropertyOfSuchCharacter (p : Person) (pr : Property)
    (c : ComplaintText) : Prop



axiom BeliefFollowedFromRepresentation (p : Person) (r : OfficialRepresentation)
    (c : ComplaintText) : Prop





axiom IsListedTerritorialDistrictCourt (t : Tribunal) (c : ComplaintText) : Prop




axiom IsOtherCourtOfTheUnitedStates (t : Tribunal) (c : ComplaintText) : Prop



axiom ExpresslyProvidedOtherwise (t : Tribunal) (ch : Charge) (c : ComplaintText) : Prop




axiom ViolationOfEnumeratedHealthCareStatute (ch : Charge) (c : ComplaintText) : Prop


axiom ViolationOfEnumeratedGeneralFraudStatute (ch : Charge) (c : ComplaintText) : Prop


axiom RelatesToHealthCareBenefitProgram (ch : Charge) (c : ComplaintText) : Prop



axiom IsCriminalConspiracyToViolate (ch : Charge) (c : ComplaintText) : Prop


axiom IsHealthCareBenefitProgram (prog : HealthCareBenefitProgram) (c : ComplaintText) : Prop





axiom OffenseUnderIdentificationParagraph (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop


axiom DocumentAppearsIssuedByUnitedStatesOrSponsoringEntity (d : IdentificationDocument)
    (c : ComplaintText) : Prop


axiom ImplementSuitedForMakingUnitedStatesDocument (impl : DocumentMakingImplement)
    (c : ComplaintText) : Prop



axiom ConductInInterstateOrForeignCommerce (ch : Charge) (c : ComplaintText) : Prop



axiom AffectsInterstateOrForeignCommerce (ch : Charge) (c : ComplaintText) : Prop


axiom ItemTransportedInTheMail (ch : Charge) (c : ComplaintText) : Prop



axiom LawfullyAuthorizedInvestigativeOrProtectiveActivity (ch : Charge) (c : ComplaintText) : Prop



axiom ActivityAuthorizedUnderChapter224 (ch : Charge) (c : ComplaintText) : Prop


axiom AttemptedOffenseUnderSection1028 (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom ConspiredToCommitOffenseUnderSection1028 (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom OffenseIsProductionOrTransferOfUnitedStatesTypeDocument (ch : Charge)
    (c : ComplaintText) : Prop


axiom OtherProductionTransferOrUseOfIdentificationItem (ch : Charge) (c : ComplaintText) : Prop


axiom CommittedToFacilitateDrugTraffickingCrime (ch : Charge) (c : ComplaintText) : Prop


axiom CommittedInConnectionWithCrimeOfViolence (ch : Charge) (c : ComplaintText) : Prop


axiom PriorConvictionUnderSection1028Final (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom CommittedToFacilitateActOfTerrorism (ch : Charge) (c : ComplaintText) : Prop


axiom ConvictedOfViolationOfSubsection1028a (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom CourtOrderedForfeitureAndDisposition (ch : Charge) (c : ComplaintText) : Prop


axiom ForfeitureProceedingGovernedBySection853 (ch : Charge) (c : ComplaintText) : Prop




axiom ForfeitureProceedingAppliedSection853d (ch : Charge) (c : ComplaintText) : Prop






axiom identificationDocumentsProducedOrTransferred (ch : Charge) (c : ComplaintText) : Nat



axiom identificationDocumentsPossessed (ch : Charge) (c : ComplaintText) : Nat



axiom meansOfIdentificationInvolved (ch : Charge) (c : ComplaintText) : Nat



axiom valueObtainedInAggregationPeriodCents (ch : Charge) (c : ComplaintText) : Nat





axiom daysSpannedByAggregatedConduct (ch : Charge) (c : ComplaintText) : Nat




axiom OffenseUnderAccessDeviceParagraph (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop


axiom PriorConvictionUnderSection1029Final (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom AttemptedOffenseUnderSection1029 (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom PartyToConspiracyOfTwoOrMore (p : Person) (ch : Charge) (c : ComplaintText) : Prop



axiom AnyPartyEngagedInConductInFurtherance (ch : Charge) (c : ComplaintText) : Prop


axiom ConvictedOfViolationOfSubsection1029a (p : Person) (ch : Charge) (c : ComplaintText) : Prop


axiom InvestigationConductedBySecretService (ch : Charge) (c : ComplaintText) : Prop



axiom SecretServiceAgreementWithAttorneyGeneralInEffect (c : ComplaintText) : Prop


axiom FacilitiesBasedCarrierProtectiveConduct (p : Person) (ch : Charge) (c : ComplaintText) : Prop



axiom ConductForObtainingAnotherCarriersServiceWithoutAuthorization (ch : Charge)
    (c : ComplaintText) : Prop


axiom ConductForResearchOrDevelopmentLawfulPurpose (ch : Charge) (c : ComplaintText) : Prop



axiom DefendantEstablishedByPreponderance (p : Person) (ch : Charge) (c : ComplaintText) : Prop



axiom ChargedConductIsProducingOrTrafficking (ch : Charge) (c : ComplaintText) : Prop


axiom ConductOutsideJurisdictionOfUnitedStates (ch : Charge) (c : ComplaintText) : Prop


axiom WouldConstituteOffenseIfCommittedWithinUnitedStates (ch : Charge) (c : ComplaintText) : Prop




axiom AccessDeviceIssuedOrControlledByInstitution (ad : AccessDevice) (fi : FinancialInstitution)
    (c : ComplaintText) : Prop





axiom AccessDeviceControlledByUnitedStatesOrganizedEntity (ad : AccessDevice)
    (c : ComplaintText) : Prop





axiom accessDevicesPossessed (ch : Charge) (c : ComplaintText) : Nat



axiom valueObtainedFromUnauthorizedDevicesCents (ch : Charge) (c : ComplaintText) : Nat




axiom paymentsReceivedViaAnothersDevicesCents (ch : Charge) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch1Ch47.Recert.Procedure
