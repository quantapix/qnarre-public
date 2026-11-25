













import Proving.USC.T18.Ch1.Reslice.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Procedure

open Proving.USC.Common






axiom ConductAlleged (pr : Prosecution) (c : ComplaintText) : Prop




axiom LocusIdentified (loc : Locus) (pr : Prosecution) (c : ComplaintText) : Prop




axiom OffenseInstant (pr : Prosecution) (c : ComplaintText) : Nat





axiom LocusIsHighSeas (loc : Locus) (c : ComplaintText) : Prop




axiom WatersWithinAdmiraltyJurisdiction (loc : Locus) (c : ComplaintText) : Prop



axiom LocusOutsideAnyStateJurisdiction (loc : Locus) (c : ComplaintText) : Prop





axiom VesselUnitedStatesConnectedOwnership (v : Vessel) (c : ComplaintText) : Prop





axiom VesselAdmiraltyWindowStart (v : Vessel) (c : ComplaintText) : Nat



axiom VesselAdmiraltyWindowEnd (v : Vessel) (c : ComplaintText) : Nat






axiom VesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw
    (v : Vessel) (c : ComplaintText) : Prop





axiom VoyageOnGreatLakesConnectingWatersOrBoundaryStLawrence
    (v : Vessel) (c : ComplaintText) : Prop



axiom VoyageWindowStart (v : Vessel) (c : ComplaintText) : Nat



axiom VoyageWindowEnd (v : Vessel) (c : ComplaintText) : Nat





axiom LandsReservedOrAcquiredForUnitedStatesUse (loc : Locus) (c : ComplaintText) : Prop




axiom UnderExclusiveOrConcurrentUnitedStatesJurisdiction
    (loc : Locus) (c : ComplaintText) : Prop



axiom PlacePurchasedOrOtherwiseAcquiredByUnitedStates
    (loc : Locus) (c : ComplaintText) : Prop




axiom StateLegislatureConsentGiven (loc : Locus) (c : ComplaintText) : Prop




axiom AcquiredForNeedfulBuildingPurpose (loc : Locus) (c : ComplaintText) : Prop



axiom StateConsentInstant (loc : Locus) (c : ComplaintText) : Nat



axiom AcquisitionInstant (loc : Locus) (c : ComplaintText) : Nat





axiom IslandRockOrKeyWithGuanoDeposits (loc : Locus) (c : ComplaintText) : Prop




axiom PresidentialAppurtenanceDetermination (loc : Locus) (c : ComplaintText) : Prop



axiom PresidentialDeterminationInstant (loc : Locus) (c : ComplaintText) : Nat







axiom AircraftUnitedStatesConnectedOwnership (a : Aircraft) (c : ComplaintText) : Prop



axiom AircraftOverHighSeas (a : Aircraft) (c : ComplaintText) : Prop




axiom AircraftOverAdmiraltyWaters (a : Aircraft) (c : ComplaintText) : Prop



axiom AircraftOutsideAnyStateJurisdiction (a : Aircraft) (c : ComplaintText) : Prop



axiom FlightWindowStart (a : Aircraft) (c : ComplaintText) : Nat



axiom FlightWindowEnd (a : Aircraft) (c : ComplaintText) : Nat





axiom VehicleUsedOrDesignedForSpaceFlight (sv : SpaceVehicle) (c : ComplaintText) : Prop




axiom OnUnitedStatesSpaceRegistry (sv : SpaceVehicle) (c : ComplaintText) : Prop




axiom SpaceDoorsClosedInstant (sv : SpaceVehicle) (c : ComplaintText) : Nat




axiom SpaceDoorOpenedInstant (sv : SpaceVehicle) (c : ComplaintText) : Nat



axiom ForcedLandingOccurred (sv : SpaceVehicle) (c : ComplaintText) : Prop





axiom ForcedLandingHandoverInstant (sv : SpaceVehicle) (c : ComplaintText) : Nat





axiom PlaceOutsideJurisdictionOfAnyNation (loc : Locus) (c : ComplaintText) : Prop




axiom OffenseByOrAgainstUnitedStatesNational (pr : Prosecution) (c : ComplaintText) : Prop






axiom PermittedByInternationalLaw (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop



axiom IsForeignVessel (v : Vessel) (c : ComplaintText) : Prop



axiom VoyageHasScheduledUnitedStatesDepartureOrArrival
    (v : Vessel) (c : ComplaintText) : Prop








axiom PremisesOfUnitedStatesMissionInForeignState (loc : Locus) (c : ComplaintText) : Prop





axiom ResidenceInForeignStateUsedForMissionPurposes (loc : Locus) (c : ComplaintText) : Prop






axiom OffenseByOrAgainstUnitedStatesNationalUnderINA
    (pr : Prosecution) (c : ComplaintText) : Prop




axiom ConflictsWithTreatyOrInternationalAgreement (loc : Locus) (c : ComplaintText) : Prop





axiom OffenderDescribedInSection3261a (d : Person) (c : ComplaintText) : Prop






axiom IsInsuredDepositoryInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsCreditUnionInsuredByNCUSIF (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalHomeLoanBankOrMember (i : Institution) (c : ComplaintText) : Prop




axiom IsFarmCreditSystemInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsSmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsDepositoryInstitutionHoldingCompany (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalReserveBankOrMemberBank (i : Institution) (c : ComplaintText) : Prop




axiom IsOrganizationOperatingUnderFederalReserveActSection25
    (i : Institution) (c : ComplaintText) : Prop





axiom IsBranchOrAgencyOfForeignBank (i : Institution) (c : ComplaintText) : Prop






axiom IsMortgageLendingBusinessOrFederallyRelatedMortgageLender
    (i : Institution) (c : ComplaintText) : Prop




axiom StatusEffectiveFrom (i : Institution) (c : ComplaintText) : Nat




axiom StatusEffectiveUntil (i : Institution) (c : ComplaintText) : Nat







axiom OffenseHasStolenOrCounterfeitPropertyElement
    (pr : Prosecution) (c : ComplaintText) : Prop




axiom OffenseHasKnowledgeOfCharacterElement
    (pr : Prosecution) (c : ComplaintText) : Prop



axiom RepresentationAsToNatureOfProperty
    (rep : Representation) (prop : Property) (c : ComplaintText) : Prop





axiom DefendantBelievedPropertyOfProscribedCharacter
    (d : Person) (prop : Property) (c : ComplaintText) : Prop





axiom BeliefResultedFromRepresentation
    (d : Person) (rep : Representation) (c : ComplaintText) : Prop



axiom RepresentationInstant (rep : Representation) (c : ComplaintText) : Nat



axiom BeliefFormedInstant (d : Person) (c : ComplaintText) : Nat





axiom MadeByFederalLawEnforcementOfficer (rep : Representation) (c : ComplaintText) : Prop




axiom MadeAtDirectionOfFederalLawEnforcementOfficer
    (rep : Representation) (c : ComplaintText) : Prop




axiom MadeWithApprovalOfFederalLawEnforcementOfficer
    (rep : Representation) (c : ComplaintText) : Prop





axiom IsDistrictCourtOfGuam (f : Forum) (c : ComplaintText) : Prop



axiom IsDistrictCourtForNorthernMarianaIslands (f : Forum) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfVirginIslands (f : Forum) (c : ComplaintText) : Prop





axiom IsCourtOfTheUnitedStatesApartFromSection23 (f : Forum) (c : ComplaintText) : Prop







axiom ExpresslyProvidedOtherwise
    (f : Forum) (pr : Prosecution) (c : ComplaintText) : Prop





axiom IsSubstantiveViolation (ch : Charge) (c : ComplaintText) : Prop




axiom IsCriminalConspiracyToViolate (ch : Charge) (c : ComplaintText) : Prop




axiom ChargedUnderSection24a1Provision (ch : Charge) (c : ComplaintText) : Prop









axiom ChargedUnderSection24a2Provision (ch : Charge) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (ch : Charge) (c : ComplaintText) : Prop



axiom IsPublicOrPrivatePlanOrContract (bp : BenefitProgram) (c : ComplaintText) : Prop



axiom AffectsCommerce (bp : BenefitProgram) (c : ComplaintText) : Prop




axiom ProvidesMedicalBenefitItemOrService (bp : BenefitProgram) (c : ComplaintText) : Prop





axiom IsProviderUnderPlanOrContract (bp : BenefitProgram) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Reslice.Procedure
