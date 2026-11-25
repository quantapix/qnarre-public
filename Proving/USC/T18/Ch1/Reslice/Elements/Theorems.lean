









import Proving.USC.T18.Ch1.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Elements

open Proving.USC.Common



@[grind →] theorem admiraltyWaters_highSeas_intro {loc : Locus} {c : ComplaintText}
    (h : IsHighSeas loc c) : AdmiraltyWaters loc c := .highSeas h

@[grind →] theorem admiraltyWaters_otherWaters_intro {loc : Locus} {c : ComplaintText}
    (hAdm : IsWithinAdmiraltyAndMaritimeJurisdiction loc c)
    (hState : IsOutsideJurisdictionOfAnyState loc c) : AdmiraltyWaters loc c :=
  .otherWaters hAdm hState

@[grind →] theorem unitedStatesVessel_intro {loc : Locus} {c : ComplaintText}
    (hVessel : IsVessel loc c) (hOwn : HasUnitedStatesOwnershipInterest loc c)
    (hAdm : IsWithinAdmiraltyAndMaritimeJurisdiction loc c)
    (hState : IsOutsideJurisdictionOfAnyState loc c) : UnitedStatesVessel loc c :=
  ⟨hVessel, hOwn, hAdm, hState⟩

@[grind →] theorem paragraph7_1_waters_intro {loc : Locus} {c : ComplaintText}
    (h : AdmiraltyWaters loc c) : Paragraph7_1 loc c := .waters h

@[grind →] theorem paragraph7_1_vessel_intro {loc : Locus} {c : ComplaintText}
    (h : UnitedStatesVessel loc c) : Paragraph7_1 loc c := .vessel h

@[grind →] theorem paragraph7_2_intro {loc : Locus} {c : ComplaintText}
    (hVessel : IsVessel loc c)
    (hDoc : IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaw loc c)
    (hVoyage : IsOnVoyageUponGreatLakesOrSaintLawrenceBoundaryWaters loc c) :
    Paragraph7_2 loc c := ⟨hVessel, hDoc, hVoyage⟩

@[grind →] theorem reservedFederalLands_intro {loc : Locus} {c : ComplaintText}
    (hReserved : IsLandReservedOrAcquiredForUnitedStatesUse loc c)
    (hJur : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction loc c) :
    ReservedFederalLands loc c := ⟨hReserved, hJur⟩

@[grind →] theorem consentEnclave_intro {loc : Locus} {c : ComplaintText}
    (hConsent : IsPlaceAcquiredWithStateLegislativeConsent loc c)
    (hBuilding : IsForErectionOfNeedfulBuilding loc c) :
    ConsentEnclave loc c := ⟨hConsent, hBuilding⟩

@[grind →] theorem paragraph7_3_reserved_intro {loc : Locus} {c : ComplaintText}
    (h : ReservedFederalLands loc c) : Paragraph7_3 loc c := .reserved h

@[grind →] theorem paragraph7_3_enclave_intro {loc : Locus} {c : ComplaintText}
    (h : ConsentEnclave loc c) : Paragraph7_3 loc c := .enclave h

@[grind →] theorem paragraph7_4_intro {loc : Locus} {c : ComplaintText}
    (hGuano : IsIslandRockOrKeyWithGuanoDeposits loc c)
    (hPres : IsPresidentiallyDeemedAppertainingToUnitedStates loc c) :
    Paragraph7_4 loc c := ⟨hGuano, hPres⟩

@[grind →] theorem paragraph7_5_intro {loc waters : Locus} {c : ComplaintText}
    (hAircraft : IsAircraft loc c) (hOwn : HasUnitedStatesOwnershipInterest loc c)
    (hOver : IsInFlightOver loc waters c) (hWaters : AdmiraltyWaters waters c) :
    Paragraph7_5 loc waters c := ⟨hAircraft, hOwn, hOver, hWaters⟩

@[grind →] theorem spaceVehicleInFlight_intro {loc : Locus} {c : ComplaintText}
    (hClosed : AllExternalDoorsClosedAfterEmbarkation loc c)
    (hNoDisembark : ¬ DoorOpenedOnEarthForDisembarkation loc c)
    (hNoHandover : ¬ CompetentAuthoritiesAssumedResponsibility loc c) :
    SpaceVehicleInFlight loc c := ⟨hClosed, hNoDisembark, hNoHandover⟩

@[grind →] theorem paragraph7_6_intro {loc : Locus} {c : ComplaintText}
    (hVehicle : IsSpaceVehicle loc c) (hRegistry : IsOnUnitedStatesSpaceRegistry loc c)
    (hFlight : SpaceVehicleInFlight loc c) : Paragraph7_6 loc c :=
  ⟨hVehicle, hRegistry, hFlight⟩

@[grind →] theorem paragraph7_7_intro {loc : Locus} {off : Offense} {c : ComplaintText}
    (hPlace : IsOutsideJurisdictionOfAnyNation loc c)
    (hNational : OffenseByOrAgainstUnitedStatesNational off c) :
    Paragraph7_7 loc off c := ⟨hPlace, hNational⟩

@[grind →] theorem paragraph7_8_intro {loc : Locus} {off : Offense} {c : ComplaintText}
    (hForeign : IsForeignVessel loc c)
    (hVoyage : IsOnVoyageScheduledToDepartFromOrArriveInUnitedStates loc c)
    (hNational : OffenseByOrAgainstUnitedStatesNational off c)
    (hIntl : PermittedByInternationalLaw loc c) : Paragraph7_8 loc off c :=
  ⟨hForeign, hVoyage, hNational, hIntl⟩

@[grind →] theorem missionPremises_mission_intro {loc : Locus} {c : ComplaintText}
    (h : IsUnitedStatesMissionPremisesInForeignState loc c) : MissionPremises loc c :=
  .mission h

@[grind →] theorem missionPremises_residence_intro {loc : Locus} {c : ComplaintText}
    (h : IsResidenceInForeignStateUsedForMissionPurposes loc c) : MissionPremises loc c :=
  .residence h

@[grind →] theorem paragraph7_9_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (hNational : OffenseByOrAgainstUnitedStatesNational off c)
    (hPremises : MissionPremises loc c)
    (hNoTreaty : ¬ ConflictsWithTreatyOrInternationalAgreement loc c)
    (hNoMeja : ¬ OffenderDescribedInSection3261a p c) : Paragraph7_9 p loc off c :=
  ⟨hNational, hPremises, hNoTreaty, hNoMeja⟩

theorem smtj_watersOrVessel_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_1 loc c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .watersOrVessel h

theorem smtj_greatLakesVessel_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_2 loc c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .greatLakesVessel h

theorem smtj_federalEnclave_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_3 loc c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .federalEnclave h

theorem smtj_guanoIsland_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_4 loc c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .guanoIsland h

theorem smtj_aircraft_intro {p : Person} {loc waters : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_5 loc waters c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .aircraft waters h

theorem smtj_spaceVehicle_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_6 loc c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .spaceVehicle h

theorem smtj_outsideAnyNation_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_7 loc off c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .outsideAnyNation h

theorem smtj_foreignVessel_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_8 loc off c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .foreignVessel h

theorem smtj_missionPremises_intro {p : Person} {loc : Locus} {off : Offense}
    {c : ComplaintText} (h : Paragraph7_9 p loc off c) :
    SpecialMaritimeAndTerritorialJurisdiction p loc off c := .missionPremises h



@[grind →] theorem federalHomeLoanBankEntity_bank_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBank i c) : FederalHomeLoanBankEntity i c := .bank h

@[grind →] theorem federalHomeLoanBankEntity_member_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBankSystemMember i c) : FederalHomeLoanBankEntity i c := .member h

@[grind →] theorem federalReserveEntity_reserveBank_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalReserveBank i c) : FederalReserveEntity i c := .reserveBank h

@[grind →] theorem federalReserveEntity_memberBank_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalReserveSystemMemberBank i c) : FederalReserveEntity i c := .memberBank h

@[grind →] theorem mortgageEntity_lendingBusiness_intro {i : Institution} {c : ComplaintText}
    (h : IsMortgageLendingBusiness i c) : MortgageEntity i c := .lendingBusiness h

@[grind →] theorem mortgageEntity_federallyRelatedLender_intro {i : Institution}
    {c : ComplaintText} (h : MakesFederallyRelatedMortgageLoan i c) : MortgageEntity i c :=
  .federallyRelatedLender h

@[grind →] theorem financialInstitution20_insuredDepository_intro {i : Institution}
    {c : ComplaintText} (h : IsInsuredDepositoryInstitution i c) :
    FinancialInstitution20 i c := .insuredDepository h

@[grind →] theorem financialInstitution20_creditUnion_intro {i : Institution}
    {c : ComplaintText} (h : IsFederallyInsuredCreditUnion i c) :
    FinancialInstitution20 i c := .creditUnion h

@[grind →] theorem financialInstitution20_homeLoanBank_intro {i : Institution}
    {c : ComplaintText} (h : FederalHomeLoanBankEntity i c) :
    FinancialInstitution20 i c := .homeLoanBank h

@[grind →] theorem financialInstitution20_farmCredit_intro {i : Institution}
    {c : ComplaintText} (h : IsFarmCreditSystemInstitution i c) :
    FinancialInstitution20 i c := .farmCredit h

@[grind →] theorem financialInstitution20_sbic_intro {i : Institution}
    {c : ComplaintText} (h : IsSmallBusinessInvestmentCompany i c) :
    FinancialInstitution20 i c := .smallBusinessInvestmentCompany h

@[grind →] theorem financialInstitution20_holdingCompany_intro {i : Institution}
    {c : ComplaintText} (h : IsDepositoryInstitutionHoldingCompany i c) :
    FinancialInstitution20 i c := .holdingCompany h

@[grind →] theorem financialInstitution20_federalReserve_intro {i : Institution}
    {c : ComplaintText} (h : FederalReserveEntity i c) :
    FinancialInstitution20 i c := .federalReserve h

@[grind →] theorem financialInstitution20_edgeOrAgreement_intro {i : Institution}
    {c : ComplaintText} (h : IsFederalReserveActSection25Organization i c) :
    FinancialInstitution20 i c := .edgeOrAgreementCorporation h

@[grind →] theorem financialInstitution20_foreignBankBranch_intro {i : Institution}
    {c : ComplaintText} (h : IsBranchOrAgencyOfForeignBank i c) :
    FinancialInstitution20 i c := .foreignBankBranchOrAgency h

@[grind →] theorem financialInstitution20_mortgage_intro {i : Institution}
    {c : ComplaintText} (h : MortgageEntity i c) :
    FinancialInstitution20 i c := .mortgage h



@[grind →] theorem officialRepresentation_byOfficer_intro {rep : Representation}
    {c : ComplaintText} (h : RepresentationMadeByFederalLawEnforcementOfficer rep c) :
    OfficialRepresentation rep c := .byOfficer h

@[grind →] theorem officialRepresentation_atOfficerDirection_intro {rep : Representation}
    {c : ComplaintText} (h : RepresentationMadeAtDirectionOrWithApprovalOfOfficer rep c) :
    OfficialRepresentation rep c := .atOfficerDirection h

@[grind →] theorem actualCharacterRoute_intro {p : Person} {prop : Property}
    {c : ComplaintText} (hChar : PropertyWasOfProscribedCharacter prop c)
    (hKnow : ActedWithScienterAsToPropertyCharacter p prop c) :
    ActualCharacterRoute p prop c := ⟨hChar, hKnow⟩

@[grind →] theorem representationRoute_intro {p : Person} {prop : Property}
    {rep : Representation} {c : ComplaintText} (hOfficial : OfficialRepresentation rep c)
    (hConcerns : RepresentationConcernsNatureOfProperty rep prop c)
    (hNexus : BeliefFollowedOrResultedFromRepresentation p rep c)
    (hBelief : BelievedPropertyToBeOfProscribedCharacter p prop c) :
    RepresentationRoute p prop rep c := ⟨hOfficial, hConcerns, hNexus, hBelief⟩

@[grind →] theorem stolenOrCounterfeitNature_actual_intro {p : Person} {prop : Property}
    {c : ComplaintText} (h : ActualCharacterRoute p prop c) :
    StolenOrCounterfeitNature p prop c := .actual h

@[grind →] theorem stolenOrCounterfeitNature_representation_intro {p : Person}
    {prop : Property} {rep : Representation} {c : ComplaintText}
    (h : RepresentationRoute p prop rep c) : StolenOrCounterfeitNature p prop c :=
  .officialRepresentation rep h

@[grind →] theorem section21a_intro {p : Person} {prop : Property} {off : Offense}
    {c : ComplaintText} (hElement : OffenseHasStolenOrCounterfeitNatureElement off c)
    (hEstablished : StolenOrCounterfeitNature p prop c) : Section21a p prop off c :=
  ⟨hElement, hEstablished⟩



@[grind →] theorem includedTerritorialCourt_guam_intro {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam ct c) : IncludedTerritorialCourt ct c := .guam h

@[grind →] theorem includedTerritorialCourt_northernMariana_intro {ct : Court}
    {c : ComplaintText} (h : IsDistrictCourtForNorthernMarianaIslands ct c) :
    IncludedTerritorialCourt ct c := .northernMariana h

@[grind →] theorem includedTerritorialCourt_virginIslands_intro {ct : Court}
    {c : ComplaintText} (h : IsDistrictCourtOfVirginIslands ct c) :
    IncludedTerritorialCourt ct c := .virginIslands h

@[grind →] theorem courtOfTheUnitedStates23_intro {prov : Provision} {ct : Court}
    {c : ComplaintText} (hNoContrary : ¬ ExpresslyProvidedOtherwise prov c)
    (hTerritorial : IncludedTerritorialCourt ct c) :
    CourtOfTheUnitedStates23 prov ct c := ⟨hNoContrary, hTerritorial⟩



@[grind →] theorem planOrContract24b_intro {prog : Program} {c : ComplaintText}
    (hPlan : IsPublicOrPrivatePlanOrContract prog c)
    (hCommerce : AffectsInterstateCommerce prog c)
    (hBenefit : ProvidesMedicalBenefitItemOrService prog c) :
    PlanOrContract24b prog c := ⟨hPlan, hCommerce, hBenefit⟩

@[grind →] theorem healthCareBenefitProgram24b_plan_intro {prog : Program}
    {c : ComplaintText} (h : PlanOrContract24b prog c) :
    HealthCareBenefitProgram24b prog c := .plan h

@[grind →] theorem healthCareBenefitProgram24b_provider_intro {prog : Program}
    {c : ComplaintText} (h : IsProviderOfMedicalBenefitPayableUnderPlan prog c) :
    HealthCareBenefitProgram24b prog c := .provider h

@[grind →] theorem offenseMode24a_violation_intro {off : Offense} {c : ComplaintText}
    (h : IsSubstantiveViolation off c) : OffenseMode24a off c := .violation h

@[grind →] theorem offenseMode24a_conspiracy_intro {off : Offense} {c : ComplaintText}
    (h : IsCriminalConspiracyToViolate off c) : OffenseMode24a off c := .conspiracy h

@[grind →] theorem paragraph24a_1_intro {off : Offense} {c : ComplaintText}
    (hMode : OffenseMode24a off c) (hEnum : TargetsParagraph1EnumeratedStatute off c) :
    Paragraph24a_1 off c := ⟨hMode, hEnum⟩

@[grind →] theorem paragraph24a_2_intro {off : Offense} {prog : Program} {c : ComplaintText}
    (hMode : OffenseMode24a off c) (hEnum : TargetsParagraph2EnumeratedStatute off c)
    (hRelated : RelatesToHealthCareBenefitProgram off prog c)
    (hProgram : HealthCareBenefitProgram24b prog c) : Paragraph24a_2 off prog c :=
  ⟨hMode, hEnum, hRelated, hProgram⟩

@[grind →] theorem federalHealthCareOffense24a_perSe_intro {off : Offense} {c : ComplaintText}
    (h : Paragraph24a_1 off c) : FederalHealthCareOffense24a off c := .perSe h

@[grind →] theorem federalHealthCareOffense24a_related_intro {off : Offense} {prog : Program}
    {c : ComplaintText} (h : Paragraph24a_2 off prog c) :
    FederalHealthCareOffense24a off c := .related prog h





example {loc : Locus} {c : ComplaintText}
    (h1 : IsVessel loc c) (h2 : HasUnitedStatesOwnershipInterest loc c)
    (h3 : IsWithinAdmiraltyAndMaritimeJurisdiction loc c)
    (h4 : IsOutsideJurisdictionOfAnyState loc c) : UnitedStatesVessel loc c := by prove_element

example {loc : Locus} {c : ComplaintText}
    (h1 : IsSpaceVehicle loc c) (h2 : IsOnUnitedStatesSpaceRegistry loc c)
    (h3 : AllExternalDoorsClosedAfterEmbarkation loc c)
    (h4 : ¬ DoorOpenedOnEarthForDisembarkation loc c)
    (h5 : ¬ CompetentAuthoritiesAssumedResponsibility loc c) :
    Paragraph7_6 loc c := by prove_element





example {p : Person} {loc : Locus} {off : Offense} {c : ComplaintText}
    (h1 : IsVessel loc c) (h2 : HasUnitedStatesOwnershipInterest loc c)
    (h3 : IsWithinAdmiraltyAndMaritimeJurisdiction loc c)
    (h4 : IsOutsideJurisdictionOfAnyState loc c) :
    IsWithinSpecialMaritimeAndTerritorialJurisdiction p loc off c :=
  smtj_watersOrVessel_intro (paragraph7_1_vessel_intro (unitedStatesVessel_intro h1 h2 h3 h4))

example {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBankSystemMember i c) : IsFinancialInstitution i c := by
  prove_element

example {prog : Program} {c : ComplaintText}
    (h1 : IsPublicOrPrivatePlanOrContract prog c) (h2 : AffectsInterstateCommerce prog c)
    (h3 : ProvidesMedicalBenefitItemOrService prog c) :
    IsHealthCareBenefitProgram prog c := by prove_element

example {off : Offense} {prog : Program} {c : ComplaintText}
    (h1 : IsCriminalConspiracyToViolate off c)
    (h2 : TargetsParagraph2EnumeratedStatute off c)
    (h3 : RelatesToHealthCareBenefitProgram off prog c)
    (h4 : IsProviderOfMedicalBenefitPayableUnderPlan prog c) :
    IsFederalHealthCareOffense off c := by prove_element

end Proving.USC.T18.Ch1.Reslice.Elements
