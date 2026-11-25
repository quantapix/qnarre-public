import Proving.USC.T18.Ch1.Reslice.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

















set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Ontology

open Proving.USC.Common






axiom IsSpecialMaritimeAndTerritorialJurisdiction (l : Locus) (c : ComplaintText) : Prop


axiom IsHighSeas (l : Locus) (c : ComplaintText) : Prop



axiom IsWithinAdmiraltyAndMaritimeJurisdiction (l : Locus) (c : ComplaintText) : Prop



axiom IsOutOfJurisdictionOfAnyParticularState (l : Locus) (c : ComplaintText) : Prop



axiom IsVessel (l : Locus) (c : ComplaintText) : Prop





axiom BelongsInWholeOrPartToUnitedStatesCitizenOrCorporation (l : Locus) (c : ComplaintText) : Prop



axiom IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaws (l : Locus) (c : ComplaintText) : Prop




axiom IsOnVoyageUponGreatLakesOrConnectingWatersOrSaintLawrenceBoundary (l : Locus) (c : ComplaintText) : Prop



axiom IsLandReservedOrAcquiredForUseOfUnitedStates (l : Locus) (c : ComplaintText) : Prop



axiom IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction (l : Locus) (c : ComplaintText) : Prop





axiom IsPlacePurchasedByConsentOfStateLegislatureForNeedfulBuilding (l : Locus) (c : ComplaintText) : Prop




axiom IsGuanoIslandAppertainingToUnitedStates (l : Locus) (c : ComplaintText) : Prop





axiom IsAircraftInFlightOverHighSeasOrAdmiraltyWaters (l : Locus) (c : ComplaintText) : Prop








axiom IsUnitedStatesRegisteredSpaceVehicleInFlight (l : Locus) (c : ComplaintText) : Prop



axiom IsPlaceOutsideJurisdictionOfAnyNation (l : Locus) (c : ComplaintText) : Prop



axiom IsForeignVessel (l : Locus) (c : ComplaintText) : Prop




axiom IsOnVoyageWithScheduledUnitedStatesDepartureOrArrival (l : Locus) (c : ComplaintText) : Prop




axiom PermittedByInternationalLaw (l : Locus) (c : ComplaintText) : Prop






axiom IsUnitedStatesMissionPremises (l : Locus) (c : ComplaintText) : Prop





axiom IsUnitedStatesMissionResidence (l : Locus) (c : ComplaintText) : Prop




axiom OffenseByOrAgainstNationalOfTheUnitedStates (o : Offense) (c : ComplaintText) : Prop





axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsCitizenOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsCorporationCreatedUnderUnitedStatesOrStateLaw (e : Entity) (c : ComplaintText) : Prop





axiom IsPersonDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop




axiom ConflictsWithTreatyOrInternationalAgreement (l : Locus) (c : ComplaintText) : Prop






axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop




axiom IsInsuredDepositoryInstitution (e : Entity) (c : ComplaintText) : Prop




axiom IsCreditUnionWithInsuredAccounts (e : Entity) (c : ComplaintText) : Prop




axiom IsFederalHomeLoanBankOrSystemMember (e : Entity) (c : ComplaintText) : Prop




axiom IsFarmCreditSystemInstitution (e : Entity) (c : ComplaintText) : Prop




axiom IsSmallBusinessInvestmentCompany (e : Entity) (c : ComplaintText) : Prop




axiom IsDepositoryInstitutionHoldingCompany (e : Entity) (c : ComplaintText) : Prop



axiom IsFederalReserveBankOrMemberBank (e : Entity) (c : ComplaintText) : Prop




axiom IsOrganizationOperatingUnderFederalReserveActSection25 (e : Entity) (c : ComplaintText) : Prop




axiom IsBranchOrAgencyOfForeignBank (e : Entity) (c : ComplaintText) : Prop




axiom IsMortgageLendingBusiness (e : Entity) (c : ComplaintText) : Prop





axiom MakesFederallyRelatedMortgageLoan (e : Entity) (c : ComplaintText) : Prop






axiom IsPropertyOfProscribedCharacter (p : Property) (c : ComplaintText) : Prop



axiom DefendantKnewPropertyCharacter (d : Person) (p : Property) (c : ComplaintText) : Prop





axiom DefendantBelievedPropertyCharacter (d : Person) (p : Property) (c : ComplaintText) : Prop




axiom BeliefFollowedOfficialRepresentation (d : Person) (r : Representation) (c : ComplaintText) : Prop






axiom IsOfficialRepresentation (r : Representation) (c : ComplaintText) : Prop




axiom MadeByFederalLawEnforcementOfficer (r : Representation) (o : Person) (c : ComplaintText) : Prop




axiom MadeAtDirectionOrWithApprovalOfOfficer (r : Representation) (o : Person) (c : ComplaintText) : Prop




axiom IsFederalLawEnforcementOfficer (o : Person) (c : ComplaintText) : Prop







axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfGuam (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtForNorthernMarianaIslands (ct : Court) (c : ComplaintText) : Prop



axiom IsDistrictCourtOfTheVirginIslands (ct : Court) (c : ComplaintText) : Prop





axiom ExpresslyProvidedOtherwise (ct : Court) (c : ComplaintText) : Prop





axiom IsFederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop




axiom IsViolationOrCriminalConspiracyToViolate (o : Offense) (c : ComplaintText) : Prop





axiom IsSubsectionA1PredicateOffense (o : Offense) (c : ComplaintText) : Prop






axiom IsSubsectionA2PredicateOffense (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop





axiom IsHealthCareBenefitProgram (b : BenefitProgram) (c : ComplaintText) : Prop



axiom IsPublicOrPrivatePlanOrContract (b : BenefitProgram) (c : ComplaintText) : Prop



axiom AffectsCommerce (b : BenefitProgram) (c : ComplaintText) : Prop




axiom ProvidesMedicalBenefitItemOrServiceToIndividual (b : BenefitProgram) (c : ComplaintText) : Prop





axiom IsProviderOfMedicalBenefitItemOrServicePayableUnderPlan
    (e : Entity) (b : BenefitProgram) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Reslice.Ontology
