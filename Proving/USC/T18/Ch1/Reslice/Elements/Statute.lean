











import Proving.USC.T18.Ch1.Reslice.Elements.Types
import Proving.USC.T18.Ch1.Reslice.Elements.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Elements

open Proving.USC.Common






inductive AdmiraltyWaters (loc : Locus) (c : ComplaintText) : Prop where
  | highSeas (h : IsHighSeas loc c)
  | otherWaters (hAdm : IsWithinAdmiraltyAndMaritimeJurisdiction loc c)
      (hState : IsOutsideJurisdictionOfAnyState loc c)




structure UnitedStatesVessel (loc : Locus) (c : ComplaintText) : Prop where
  vessel : IsVessel loc c
  ownership : HasUnitedStatesOwnershipInterest loc c
  admiralty : IsWithinAdmiraltyAndMaritimeJurisdiction loc c
  outsideState : IsOutsideJurisdictionOfAnyState loc c


inductive Paragraph7_1 (loc : Locus) (c : ComplaintText) : Prop where
  | waters (h : AdmiraltyWaters loc c)
  | vessel (h : UnitedStatesVessel loc c)



structure Paragraph7_2 (loc : Locus) (c : ComplaintText) : Prop where
  vessel : IsVessel loc c
  documented : IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaw loc c
  voyage : IsOnVoyageUponGreatLakesOrSaintLawrenceBoundaryWaters loc c



structure ReservedFederalLands (loc : Locus) (c : ComplaintText) : Prop where
  reserved : IsLandReservedOrAcquiredForUnitedStatesUse loc c
  jurisdiction : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction loc c



structure ConsentEnclave (loc : Locus) (c : ComplaintText) : Prop where
  consent : IsPlaceAcquiredWithStateLegislativeConsent loc c
  needfulBuilding : IsForErectionOfNeedfulBuilding loc c


inductive Paragraph7_3 (loc : Locus) (c : ComplaintText) : Prop where
  | reserved (h : ReservedFederalLands loc c)
  | enclave (h : ConsentEnclave loc c)



structure Paragraph7_4 (loc : Locus) (c : ComplaintText) : Prop where
  guano : IsIslandRockOrKeyWithGuanoDeposits loc c
  presidential : IsPresidentiallyDeemedAppertainingToUnitedStates loc c



structure Paragraph7_5 (loc waters : Locus) (c : ComplaintText) : Prop where
  aircraft : IsAircraft loc c
  ownership : HasUnitedStatesOwnershipInterest loc c
  inFlightOver : IsInFlightOver loc waters c
  overWaters : AdmiraltyWaters waters c




structure SpaceVehicleInFlight (loc : Locus) (c : ComplaintText) : Prop where
  commenced : AllExternalDoorsClosedAfterEmbarkation loc c
  notDisembarked : ¬ DoorOpenedOnEarthForDisembarkation loc c
  notHandedOver : ¬ CompetentAuthoritiesAssumedResponsibility loc c


structure Paragraph7_6 (loc : Locus) (c : ComplaintText) : Prop where
  vehicle : IsSpaceVehicle loc c
  registry : IsOnUnitedStatesSpaceRegistry loc c
  inFlight : SpaceVehicleInFlight loc c



structure Paragraph7_7 (loc : Locus) (off : Offense) (c : ComplaintText) : Prop where
  statelessPlace : IsOutsideJurisdictionOfAnyNation loc c
  nationalNexus : OffenseByOrAgainstUnitedStatesNational off c




structure Paragraph7_8 (loc : Locus) (off : Offense) (c : ComplaintText) : Prop where
  foreignVessel : IsForeignVessel loc c
  scheduledVoyage : IsOnVoyageScheduledToDepartFromOrArriveInUnitedStates loc c
  nationalNexus : OffenseByOrAgainstUnitedStatesNational off c
  internationalLaw : PermittedByInternationalLaw loc c


inductive MissionPremises (loc : Locus) (c : ComplaintText) : Prop where
  | mission (h : IsUnitedStatesMissionPremisesInForeignState loc c)
  | residence (h : IsResidenceInForeignStateUsedForMissionPurposes loc c)




structure Paragraph7_9 (p : Person) (loc : Locus) (off : Offense) (c : ComplaintText) : Prop where
  nationalNexus : OffenseByOrAgainstUnitedStatesNational off c
  premises : MissionPremises loc c
  noTreatyConflict : ¬ ConflictsWithTreatyOrInternationalAgreement loc c
  notMejaOffender : ¬ OffenderDescribedInSection3261a p c




inductive SpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (loc : Locus) (off : Offense) (c : ComplaintText) : Prop where
  | watersOrVessel (h : Paragraph7_1 loc c)
  | greatLakesVessel (h : Paragraph7_2 loc c)
  | federalEnclave (h : Paragraph7_3 loc c)
  | guanoIsland (h : Paragraph7_4 loc c)
  | aircraft (waters : Locus) (h : Paragraph7_5 loc waters c)
  | spaceVehicle (h : Paragraph7_6 loc c)
  | outsideAnyNation (h : Paragraph7_7 loc off c)
  | foreignVessel (h : Paragraph7_8 loc off c)
  | missionPremises (h : Paragraph7_9 p loc off c)


abbrev IsWithinSpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (loc : Locus) (off : Offense) (c : ComplaintText) : Prop :=
  SpecialMaritimeAndTerritorialJurisdiction p loc off c




inductive FederalHomeLoanBankEntity (i : Institution) (c : ComplaintText) : Prop where
  | bank (h : IsFederalHomeLoanBank i c)
  | member (h : IsFederalHomeLoanBankSystemMember i c)


inductive FederalReserveEntity (i : Institution) (c : ComplaintText) : Prop where
  | reserveBank (h : IsFederalReserveBank i c)
  | memberBank (h : IsFederalReserveSystemMemberBank i c)



inductive MortgageEntity (i : Institution) (c : ComplaintText) : Prop where
  | lendingBusiness (h : IsMortgageLendingBusiness i c)
  | federallyRelatedLender (h : MakesFederallyRelatedMortgageLoan i c)



inductive FinancialInstitution20 (i : Institution) (c : ComplaintText) : Prop where
  | insuredDepository (h : IsInsuredDepositoryInstitution i c)
  | creditUnion (h : IsFederallyInsuredCreditUnion i c)
  | homeLoanBank (h : FederalHomeLoanBankEntity i c)
  | farmCredit (h : IsFarmCreditSystemInstitution i c)
  | smallBusinessInvestmentCompany (h : IsSmallBusinessInvestmentCompany i c)
  | holdingCompany (h : IsDepositoryInstitutionHoldingCompany i c)
  | federalReserve (h : FederalReserveEntity i c)
  | edgeOrAgreementCorporation (h : IsFederalReserveActSection25Organization i c)
  | foreignBankBranchOrAgency (h : IsBranchOrAgencyOfForeignBank i c)
  | mortgage (h : MortgageEntity i c)


abbrev IsFinancialInstitution (i : Institution) (c : ComplaintText) : Prop :=
  FinancialInstitution20 i c





inductive OfficialRepresentation (rep : Representation) (c : ComplaintText) : Prop where
  | byOfficer (h : RepresentationMadeByFederalLawEnforcementOfficer rep c)
  | atOfficerDirection (h : RepresentationMadeAtDirectionOrWithApprovalOfOfficer rep c)



structure ActualCharacterRoute (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  character : PropertyWasOfProscribedCharacter prop c
  knowledge : ActedWithScienterAsToPropertyCharacter p prop c



structure RepresentationRoute
    (p : Person) (prop : Property) (rep : Representation) (c : ComplaintText) : Prop where
  official : OfficialRepresentation rep c
  concernsProperty : RepresentationConcernsNatureOfProperty rep prop c
  nexus : BeliefFollowedOrResultedFromRepresentation p rep c
  belief : BelievedPropertyToBeOfProscribedCharacter p prop c



inductive StolenOrCounterfeitNature (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  | actual (h : ActualCharacterRoute p prop c)
  | officialRepresentation (rep : Representation) (h : RepresentationRoute p prop rep c)



structure Section21a (p : Person) (prop : Property) (off : Offense) (c : ComplaintText) : Prop where
  offenseElement : OffenseHasStolenOrCounterfeitNatureElement off c
  established : StolenOrCounterfeitNature p prop c




inductive IncludedTerritorialCourt (ct : Court) (c : ComplaintText) : Prop where
  | guam (h : IsDistrictCourtOfGuam ct c)
  | northernMariana (h : IsDistrictCourtForNorthernMarianaIslands ct c)
  | virginIslands (h : IsDistrictCourtOfVirginIslands ct c)






structure CourtOfTheUnitedStates23 (prov : Provision) (ct : Court) (c : ComplaintText) : Prop where
  noContraryProvision : ¬ ExpresslyProvidedOtherwise prov c
  territorial : IncludedTerritorialCourt ct c




structure PlanOrContract24b (prog : Program) (c : ComplaintText) : Prop where
  planOrContract : IsPublicOrPrivatePlanOrContract prog c
  commerce : AffectsInterstateCommerce prog c
  medicalBenefit : ProvidesMedicalBenefitItemOrService prog c



inductive HealthCareBenefitProgram24b (prog : Program) (c : ComplaintText) : Prop where
  | plan (h : PlanOrContract24b prog c)
  | provider (h : IsProviderOfMedicalBenefitPayableUnderPlan prog c)


abbrev IsHealthCareBenefitProgram (prog : Program) (c : ComplaintText) : Prop :=
  HealthCareBenefitProgram24b prog c


inductive OffenseMode24a (off : Offense) (c : ComplaintText) : Prop where
  | violation (h : IsSubstantiveViolation off c)
  | conspiracy (h : IsCriminalConspiracyToViolate off c)


structure Paragraph24a_1 (off : Offense) (c : ComplaintText) : Prop where
  mode : OffenseMode24a off c
  enumerated : TargetsParagraph1EnumeratedStatute off c



structure Paragraph24a_2 (off : Offense) (prog : Program) (c : ComplaintText) : Prop where
  mode : OffenseMode24a off c
  enumerated : TargetsParagraph2EnumeratedStatute off c
  relatedness : RelatesToHealthCareBenefitProgram off prog c
  program : HealthCareBenefitProgram24b prog c


inductive FederalHealthCareOffense24a (off : Offense) (c : ComplaintText) : Prop where
  | perSe (h : Paragraph24a_1 off c)
  | related (prog : Program) (h : Paragraph24a_2 off prog c)


abbrev IsFederalHealthCareOffense (off : Offense) (c : ComplaintText) : Prop :=
  FederalHealthCareOffense24a off c

end Proving.USC.T18.Ch1.Reslice.Elements
