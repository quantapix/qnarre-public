














import Proving.USC.T18.Ch1.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Elements

open Proving.USC.Common




axiom IsHighSeas (loc : Locus) (c : ComplaintText) : Prop



axiom IsWithinAdmiraltyAndMaritimeJurisdiction (loc : Locus) (c : ComplaintText) : Prop



axiom IsOutsideJurisdictionOfAnyState (loc : Locus) (c : ComplaintText) : Prop


axiom IsVessel (loc : Locus) (c : ComplaintText) : Prop





axiom HasUnitedStatesOwnershipInterest (loc : Locus) (c : ComplaintText) : Prop



axiom IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaw (loc : Locus) (c : ComplaintText) : Prop




axiom IsOnVoyageUponGreatLakesOrSaintLawrenceBoundaryWaters (loc : Locus) (c : ComplaintText) : Prop



axiom IsLandReservedOrAcquiredForUnitedStatesUse (loc : Locus) (c : ComplaintText) : Prop



axiom IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction (loc : Locus) (c : ComplaintText) : Prop




axiom IsPlaceAcquiredWithStateLegislativeConsent (loc : Locus) (c : ComplaintText) : Prop




axiom IsForErectionOfNeedfulBuilding (loc : Locus) (c : ComplaintText) : Prop



axiom IsIslandRockOrKeyWithGuanoDeposits (loc : Locus) (c : ComplaintText) : Prop




axiom IsPresidentiallyDeemedAppertainingToUnitedStates (loc : Locus) (c : ComplaintText) : Prop


axiom IsAircraft (loc : Locus) (c : ComplaintText) : Prop



axiom IsInFlightOver (loc waters : Locus) (c : ComplaintText) : Prop



axiom IsSpaceVehicle (loc : Locus) (c : ComplaintText) : Prop




axiom IsOnUnitedStatesSpaceRegistry (loc : Locus) (c : ComplaintText) : Prop




axiom AllExternalDoorsClosedAfterEmbarkation (loc : Locus) (c : ComplaintText) : Prop




axiom DoorOpenedOnEarthForDisembarkation (loc : Locus) (c : ComplaintText) : Prop





axiom CompetentAuthoritiesAssumedResponsibility (loc : Locus) (c : ComplaintText) : Prop



axiom IsOutsideJurisdictionOfAnyNation (loc : Locus) (c : ComplaintText) : Prop





axiom OffenseByOrAgainstUnitedStatesNational (off : Offense) (c : ComplaintText) : Prop



axiom IsForeignVessel (loc : Locus) (c : ComplaintText) : Prop




axiom IsOnVoyageScheduledToDepartFromOrArriveInUnitedStates (loc : Locus) (c : ComplaintText) : Prop




axiom PermittedByInternationalLaw (loc : Locus) (c : ComplaintText) : Prop






axiom IsUnitedStatesMissionPremisesInForeignState (loc : Locus) (c : ComplaintText) : Prop






axiom IsResidenceInForeignStateUsedForMissionPurposes (loc : Locus) (c : ComplaintText) : Prop





axiom ConflictsWithTreatyOrInternationalAgreement (loc : Locus) (c : ComplaintText) : Prop





axiom OffenderDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop






axiom IsInsuredDepositoryInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsFederallyInsuredCreditUnion (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalHomeLoanBank (i : Institution) (c : ComplaintText) : Prop




axiom IsFederalHomeLoanBankSystemMember (i : Institution) (c : ComplaintText) : Prop




axiom IsFarmCreditSystemInstitution (i : Institution) (c : ComplaintText) : Prop




axiom IsSmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop




axiom IsDepositoryInstitutionHoldingCompany (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalReserveBank (i : Institution) (c : ComplaintText) : Prop



axiom IsFederalReserveSystemMemberBank (i : Institution) (c : ComplaintText) : Prop





axiom IsFederalReserveActSection25Organization (i : Institution) (c : ComplaintText) : Prop




axiom IsBranchOrAgencyOfForeignBank (i : Institution) (c : ComplaintText) : Prop



axiom IsMortgageLendingBusiness (i : Institution) (c : ComplaintText) : Prop





axiom MakesFederallyRelatedMortgageLoan (i : Institution) (c : ComplaintText) : Prop






axiom OffenseHasStolenOrCounterfeitNatureElement (off : Offense) (c : ComplaintText) : Prop




axiom PropertyWasOfProscribedCharacter (prop : Property) (c : ComplaintText) : Prop




axiom ActedWithScienterAsToPropertyCharacter (p : Person) (prop : Property) (c : ComplaintText) : Prop




axiom RepresentationMadeByFederalLawEnforcementOfficer (rep : Representation) (c : ComplaintText) : Prop




axiom RepresentationMadeAtDirectionOrWithApprovalOfOfficer (rep : Representation) (c : ComplaintText) : Prop



axiom RepresentationConcernsNatureOfProperty (rep : Representation) (prop : Property) (c : ComplaintText) : Prop




axiom BeliefFollowedOrResultedFromRepresentation (p : Person) (rep : Representation) (c : ComplaintText) : Prop





axiom BelievedPropertyToBeOfProscribedCharacter (p : Person) (prop : Property) (c : ComplaintText) : Prop






axiom ExpresslyProvidedOtherwise (prov : Provision) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfGuam (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtForNorthernMarianaIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfVirginIslands (ct : Court) (c : ComplaintText) : Prop






axiom IsSubstantiveViolation (off : Offense) (c : ComplaintText) : Prop




axiom IsCriminalConspiracyToViolate (off : Offense) (c : ComplaintText) : Prop




axiom TargetsParagraph1EnumeratedStatute (off : Offense) (c : ComplaintText) : Prop





axiom TargetsParagraph2EnumeratedStatute (off : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (off : Offense) (prog : Program) (c : ComplaintText) : Prop



axiom IsPublicOrPrivatePlanOrContract (prog : Program) (c : ComplaintText) : Prop




axiom AffectsInterstateCommerce (prog : Program) (c : ComplaintText) : Prop




axiom ProvidesMedicalBenefitItemOrService (prog : Program) (c : ComplaintText) : Prop





axiom IsProviderOfMedicalBenefitPayableUnderPlan (prog : Program) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Reslice.Elements
