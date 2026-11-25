



import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Statute

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch1Ch47.Recert2.Elements



theorem smtj7Waters_intro {l : Locus} {c : ComplaintText}
    (hAdm : IsWithinAdmiraltyAndMaritimeJurisdiction l c)
    (hOut : IsOutsideJurisdictionOfAnyParticularState l c) : Smtj7Waters l c :=
  ⟨hAdm, hOut⟩

theorem smtj7Vessel_intro {l : Locus} {c : ComplaintText}
    (hBel : IsVesselBelongingToUnitedStatesOrCitizenOrCorporation l c)
    (hAdm : IsWithinAdmiraltyAndMaritimeJurisdiction l c)
    (hOut : IsOutsideJurisdictionOfAnyParticularState l c) : Smtj7Vessel l c :=
  ⟨hBel, hAdm, hOut⟩

theorem smtj7Paragraph1_intro_highSeas {l : Locus} {c : ComplaintText}
    (h : IsHighSeas l c) : Smtj7Paragraph1 l c := .highSeas h

theorem smtj7Paragraph1_intro_otherWaters {l : Locus} {c : ComplaintText}
    (h : Smtj7Waters l c) : Smtj7Paragraph1 l c := .otherWaters h

theorem smtj7Paragraph1_intro_vessel {l : Locus} {c : ComplaintText}
    (h : Smtj7Vessel l c) : Smtj7Paragraph1 l c := .vessel h

theorem smtj7Paragraph2_intro {l : Locus} {c : ComplaintText}
    (hReg : IsVesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw l c)
    (hVoy : IsOnVoyageUponGreatLakesOrSaintLawrenceBoundary l c) : Smtj7Paragraph2 l c :=
  ⟨hReg, hVoy⟩

theorem smtj7ReservedLand_intro {l : Locus} {c : ComplaintText}
    (hLand : IsLandReservedOrAcquiredForUseOfUnitedStates l c)
    (hJur : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction l c) : Smtj7ReservedLand l c :=
  ⟨hLand, hJur⟩

theorem smtj7Paragraph3_intro_reserved {l : Locus} {c : ComplaintText}
    (h : Smtj7ReservedLand l c) : Smtj7Paragraph3 l c := .reserved h

theorem smtj7Paragraph3_intro_purchasedWithConsent {l : Locus} {c : ComplaintText}
    (h : IsPlacePurchasedWithStateConsentForNeedfulBuilding l c) : Smtj7Paragraph3 l c :=
  .purchasedWithConsent h

theorem smtj7Paragraph4_intro {l : Locus} {c : ComplaintText}
    (hGuano : IsIslandRockOrKeyContainingGuanoDeposits l c)
    (hApp : IsPresidentiallyConsideredAppertainingToUnitedStates l c) : Smtj7Paragraph4 l c :=
  ⟨hGuano, hApp⟩

theorem smtj7Paragraph5_intro {l : Locus} {c : ComplaintText}
    (hAir : IsAircraftBelongingToUnitedStatesOrCitizenOrCorporation l c)
    (hFlight : IsAircraftInFlightOverHighSeasOrAdmiraltyWaters l c) : Smtj7Paragraph5 l c :=
  ⟨hAir, hFlight⟩

theorem smtj7Paragraph6_intro {l : Locus} {c : ComplaintText}
    (hReg : IsSpaceVehicleOnUnitedStatesRegistry l c)
    (hFlight : IsSpaceVehicleInFlight l c) : Smtj7Paragraph6 l c :=
  ⟨hReg, hFlight⟩

theorem smtj7Paragraph7_intro {l : Locus} {o : Offense} {c : ComplaintText}
    (hPlace : IsPlaceOutsideJurisdictionOfAnyNation l c)
    (hNat : IsOffenseByOrAgainstNationalOfTheUnitedStates o c) : Smtj7Paragraph7 l o c :=
  ⟨hPlace, hNat⟩

theorem smtj7Paragraph8_intro {l : Locus} {o : Offense} {c : ComplaintText}
    (hIntl : IsPermittedByInternationalLaw l o c)
    (hVessel : IsForeignVesselOnVoyageScheduledToOrFromUnitedStates l c)
    (hNat : IsOffenseByOrAgainstNationalOfTheUnitedStates o c) : Smtj7Paragraph8 l o c :=
  ⟨hIntl, hVessel, hNat⟩

theorem smtj7MissionPlace_intro_premises {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesMissionPremisesInForeignState l c) : Smtj7MissionPlace l c := .premises h

theorem smtj7MissionPlace_intro_residence {l : Locus} {c : ComplaintText}
    (h : IsResidenceInForeignStateUsedForMissionPurposes l c) : Smtj7MissionPlace l c := .residence h

theorem smtj7Paragraph9_intro {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (hNat : IsOffenseByOrAgainstNationalOfTheUnitedStates o c)
    (hPlace : Smtj7MissionPlace l c)
    (hTreaty : ¬ ConflictsWithTreatyOrInternationalAgreement l o c)
    (h3261 : ¬ OffenderDescribedInSection3261a p c) : Smtj7Paragraph9 p l o c :=
  ⟨hNat, hPlace, hTreaty, h3261⟩

theorem specialMaritimeAndTerritorialJurisdiction_intro_highSeasOrVessel
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph1 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .highSeasOrVessel h

theorem specialMaritimeAndTerritorialJurisdiction_intro_greatLakesVessel
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph2 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .greatLakesVessel h

theorem specialMaritimeAndTerritorialJurisdiction_intro_federalEnclave
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph3 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .federalEnclave h

theorem specialMaritimeAndTerritorialJurisdiction_intro_guanoIsland
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph4 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .guanoIsland h

theorem specialMaritimeAndTerritorialJurisdiction_intro_aircraft
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph5 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .aircraft h

theorem specialMaritimeAndTerritorialJurisdiction_intro_spaceVehicle
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph6 l c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .spaceVehicle h

theorem specialMaritimeAndTerritorialJurisdiction_intro_placeOutsideAnyNation
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph7 l o c) : SpecialMaritimeAndTerritorialJurisdiction p l o c :=
  .placeOutsideAnyNation h

theorem specialMaritimeAndTerritorialJurisdiction_intro_foreignVessel
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph8 l o c) : SpecialMaritimeAndTerritorialJurisdiction p l o c := .foreignVessel h

theorem specialMaritimeAndTerritorialJurisdiction_intro_missionPremises
    {p : Person} {l : Locus} {o : Offense} {c : ComplaintText}
    (h : Smtj7Paragraph9 p l o c) : SpecialMaritimeAndTerritorialJurisdiction p l o c :=
  .missionPremises h



theorem financialInstitution_intro_insuredDepository {i : Institution} {c : ComplaintText}
    (h : IsInsuredDepositoryInstitution i c) : FinancialInstitution i c := .insuredDepository h

theorem financialInstitution_intro_creditUnion {i : Institution} {c : ComplaintText}
    (h : IsCreditUnionWithInsuredAccounts i c) : FinancialInstitution i c := .creditUnion h

theorem financialInstitution_intro_homeLoanBank {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBankOrMember i c) : FinancialInstitution i c := .homeLoanBank h

theorem financialInstitution_intro_farmCredit {i : Institution} {c : ComplaintText}
    (h : IsFarmCreditSystemInstitution i c) : FinancialInstitution i c := .farmCredit h

theorem financialInstitution_intro_sbic {i : Institution} {c : ComplaintText}
    (h : IsSmallBusinessInvestmentCompany i c) : FinancialInstitution i c := .sbic h

theorem financialInstitution_intro_holdingCompany {i : Institution} {c : ComplaintText}
    (h : IsDepositoryInstitutionHoldingCompany i c) : FinancialInstitution i c := .holdingCompany h

theorem financialInstitution_intro_reserveBank {i : Institution} {c : ComplaintText}
    (h : IsFederalReserveBankOrMemberBank i c) : FinancialInstitution i c := .reserveBank h

theorem financialInstitution_intro_edgeActOrganization {i : Institution} {c : ComplaintText}
    (h : IsOrganizationOperatingUnderFederalReserveActSection25 i c) : FinancialInstitution i c :=
  .edgeActOrganization h

theorem financialInstitution_intro_foreignBankBranch {i : Institution} {c : ComplaintText}
    (h : IsBranchOrAgencyOfForeignBank i c) : FinancialInstitution i c := .foreignBankBranch h

theorem financialInstitution_intro_mortgageLender {i : Institution} {c : ComplaintText}
    (h : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c) : FinancialInstitution i c :=
  .mortgageLender h



theorem officialRepresentation_intro_byOfficer {p : Person} {pr : Property} {c : ComplaintText}
    (h : RepresentationMadeByFederalLawEnforcementOfficer p pr c) : OfficialRepresentation p pr c :=
  .byOfficer h

theorem officialRepresentation_intro_atOfficerDirection {p : Person} {pr : Property} {c : ComplaintText}
    (h : RepresentationMadeAtDirectionOrApprovalOfFederalLawEnforcementOfficer p pr c) :
    OfficialRepresentation p pr c := .atOfficerDirection h

theorem actualCharacterRoute_intro {p : Person} {pr : Property} {c : ComplaintText}
    (hChar : PropertyOfProscribedCharacter pr c)
    (hKnew : DefendantKnewPropertyOfProscribedCharacter p pr c) : ActualCharacterRoute p pr c :=
  ⟨hChar, hKnew⟩

theorem officialRepresentationRoute_intro {p : Person} {pr : Property} {c : ComplaintText}
    (hRep : OfficialRepresentation p pr c)
    (hBelief : DefendantBelievedPropertyOfProscribedCharacter p pr c)
    (hSeq : BeliefFollowedOfficialRepresentation p pr c) : OfficialRepresentationRoute p pr c :=
  ⟨hRep, hBelief, hSeq⟩

theorem stolenOrCounterfeitNatureElement_intro_actual {p : Person} {pr : Property} {c : ComplaintText}
    (h : ActualCharacterRoute p pr c) : StolenOrCounterfeitNatureElement p pr c := .actual h

theorem stolenOrCounterfeitNatureElement_intro_officialRepresentation
    {p : Person} {pr : Property} {c : ComplaintText}
    (h : OfficialRepresentationRoute p pr c) : StolenOrCounterfeitNatureElement p pr c :=
  .officialRepresentation h



theorem courtOfTheUnitedStatesRoute_intro_guam {t : Tribunal} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam t c) : CourtOfTheUnitedStatesRoute t c := .guam h

theorem courtOfTheUnitedStatesRoute_intro_northernMariana {t : Tribunal} {c : ComplaintText}
    (h : IsDistrictCourtForNorthernMarianaIslands t c) : CourtOfTheUnitedStatesRoute t c :=
  .northernMariana h

theorem courtOfTheUnitedStatesRoute_intro_virginIslands {t : Tribunal} {c : ComplaintText}
    (h : IsDistrictCourtOfTheVirginIslands t c) : CourtOfTheUnitedStatesRoute t c := .virginIslands h

theorem courtOfTheUnitedStatesRoute_intro_ordinaryMeaning {t : Tribunal} {c : ComplaintText}
    (h : IsCourtOfTheUnitedStatesUnderOrdinaryMeaning t c) : CourtOfTheUnitedStatesRoute t c :=
  .ordinaryMeaning h

theorem courtOfTheUnitedStates_intro {t : Tribunal} {c : ComplaintText}
    (hRoute : CourtOfTheUnitedStatesRoute t c)
    (hNotOther : ¬ OtherwiseExpresslyProvided t c) : CourtOfTheUnitedStates t c :=
  ⟨hRoute, hNotOther⟩



theorem violationOrConspiracy_intro_violation {o : Offense} {c : ComplaintText}
    (h : IsCompletedViolation o c) : ViolationOrConspiracy o c := .violation h

theorem violationOrConspiracy_intro_conspiracy {o : Offense} {c : ComplaintText}
    (h : IsCriminalConspiracyToViolate o c) : ViolationOrConspiracy o c := .conspiracy h

theorem federalHealthCareOffenseParagraph1_intro {o : Offense} {c : ComplaintText}
    (hMode : ViolationOrConspiracy o c)
    (hListed : TargetsOffenseListedInSection24a1 o c) : FederalHealthCareOffenseParagraph1 o c :=
  ⟨hMode, hListed⟩

theorem federalHealthCareOffenseParagraph2_intro {o : Offense} {c : ComplaintText}
    (hMode : ViolationOrConspiracy o c)
    (hListed : TargetsOffenseListedInSection24a2 o c)
    (hRel : RelatesToHealthCareBenefitProgram o c) : FederalHealthCareOffenseParagraph2 o c :=
  ⟨hMode, hListed, hRel⟩

theorem federalHealthCareOffense_intro_perSe {o : Offense} {c : ComplaintText}
    (h : FederalHealthCareOffenseParagraph1 o c) : FederalHealthCareOffense o c := .perSe h

theorem federalHealthCareOffense_intro_relatedFraud {o : Offense} {c : ComplaintText}
    (h : FederalHealthCareOffenseParagraph2 o c) : FederalHealthCareOffense o c := .relatedFraud h

theorem healthCareBenefitPlan_intro {hp : HealthCareProgram} {c : ComplaintText}
    (hPlan : IsPublicOrPrivatePlanOrContract hp c)
    (hCommerce : AffectsCommerce hp c)
    (hBenefit : ProvidesMedicalBenefitItemOrServiceToIndividual hp c) : HealthCareBenefitPlan hp c :=
  ⟨hPlan, hCommerce, hBenefit⟩

theorem healthCareBenefitProgram_intro_plan {hp : HealthCareProgram} {c : ComplaintText}
    (h : HealthCareBenefitPlan hp c) : HealthCareBenefitProgram hp c := .plan h

theorem healthCareBenefitProgram_intro_provider {hp : HealthCareProgram} {c : ComplaintText}
    (h : IsProviderOfMedicalBenefitPayableUnderPlanOrContract hp c) : HealthCareBenefitProgram hp c :=
  .provider h



theorem circumstance1028_intro_federalOrSpecialEventDocument
    {d : Document} {o : Offense} {c : ComplaintText}
    (h : DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c) : Circumstance1028 d o c :=
  .federalOrSpecialEventDocument h

theorem circumstance1028_intro_implementForSuchDocument
    {d : Document} {o : Offense} {c : ComplaintText}
    (h : DocumentMakingImplementDesignedOrSuitedForSuchDocument d c) : Circumstance1028 d o c :=
  .implementForSuchDocument h

theorem circumstance1028_intro_defraudUnitedStatesOffense
    {d : Document} {o : Offense} {c : ComplaintText}
    (h : OffenseIsUnderSection1028a4 o c) : Circumstance1028 d o c := .defraudUnitedStatesOffense h

theorem circumstance1028_intro_commerce {d : Document} {o : Offense} {c : ComplaintText}
    (h : ProhibitedConductAffectsInterstateOrForeignCommerce o c) : Circumstance1028 d o c := .commerce h

theorem circumstance1028_intro_mails {d : Document} {o : Offense} {c : ComplaintText}
    (h : ItemTransportedInTheMailInCourseOfProhibitedConduct o c) : Circumstance1028 d o c := .mails h

theorem section1028a1_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hAuth : WithoutLawfulAuthorityOverDocument p d c)
    (hProd : ProducesIdentificationDocumentOrAuthenticationFeature p d c) : Section1028a1 p d c :=
  ⟨hSci, hAuth, hProd⟩

theorem section1028a2_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hTrans : TransfersIdentificationDocumentOrAuthenticationFeature p d c)
    (hKnows : KnowsDocumentStolenOrProducedWithoutLawfulAuthority p d c) : Section1028a2 p d c :=
  ⟨hSci, hTrans, hKnows⟩

theorem section1028a3_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hPoss : PossessesIdentificationDocumentOrAuthenticationFeature p d c)
    (hNotOwn : NotIssuedLawfullyForUseOfPossessor p d c)
    (hIntent : IntentToUseOrTransferUnlawfully p d c)
    (hCount : 5 ≤ identificationDocumentsPossessed p d c) : Section1028a3 p d c :=
  ⟨hSci, hPoss, hNotOwn, hIntent, hCount⟩

theorem section1028a4_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hPoss : PossessesIdentificationDocumentOrAuthenticationFeature p d c)
    (hNotOwn : NotIssuedLawfullyForUseOfPossessor p d c)
    (hIntent : IntentDocumentBeUsedToDefraudTheUnitedStates p d c) : Section1028a4 p d c :=
  ⟨hSci, hPoss, hNotOwn, hIntent⟩

theorem section1028a5_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hConduct : ProducesTransfersOrPossessesDocumentMakingImplement p d c)
    (hIntent : IntentImplementUsedToProduceFalseDocumentOrImplement p d c) : Section1028a5 p d c :=
  ⟨hSci, hConduct, hIntent⟩

theorem section1028a6_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hPoss : PossessesIdentificationDocumentOrAuthenticationFeature p d c)
    (hFederal : DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c)
    (hTainted : DocumentStolenOrProducedWithoutLawfulAuthority d c)
    (hKnows : KnowsDocumentStolenOrProducedWithoutLawfulAuthority p d c) : Section1028a6 p d c :=
  ⟨hSci, hPoss, hFederal, hTainted, hKnows⟩

theorem unlawfulActivity1028_intro_federal {m : MeansOfIdentification} {c : ComplaintText}
    (h : UnlawfulActivityViolatesFederalLaw m c) : UnlawfulActivity1028 m c := .federal h

theorem unlawfulActivity1028_intro_stateOrLocalFelony {m : MeansOfIdentification} {c : ComplaintText}
    (h : UnlawfulActivityIsStateOrLocalFelony m c) : UnlawfulActivity1028 m c := .stateOrLocalFelony h

theorem section1028a7_intro {p : Person} {m : MeansOfIdentification} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hConduct : TransfersPossessesOrUsesMeansOfIdentification p m c)
    (hAuth : WithoutLawfulAuthorityOverMeansOfIdentification p m c)
    (hAnother : MeansOfIdentificationOfAnotherPerson m c)
    (hPurpose : IntentOrConnectionWithUnlawfulActivity p m c)
    (hActivity : UnlawfulActivity1028 m c) : Section1028a7 p m c :=
  ⟨hSci, hConduct, hAuth, hAnother, hPurpose, hActivity⟩

theorem section1028a8_intro {p : Person} {d : Document} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hTraffic : TrafficsInAuthenticationFeatures p d c)
    (hUse : AuthenticationFeaturesForUseInFalseDocumentsOrMeansOfIdentification d c) :
    Section1028a8 p d c := ⟨hSci, hTraffic, hUse⟩

theorem conduct1028_intro_produces
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a1 p d c) : Conduct1028 p d m c := .produces h

theorem conduct1028_intro_transfers
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a2 p d c) : Conduct1028 p d m c := .transfers h

theorem conduct1028_intro_possessesFiveOrMore
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a3 p d c) : Conduct1028 p d m c := .possessesFiveOrMore h

theorem conduct1028_intro_possessesToDefraudUnitedStates
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a4 p d c) : Conduct1028 p d m c := .possessesToDefraudUnitedStates h

theorem conduct1028_intro_documentMakingImplement
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a5 p d c) : Conduct1028 p d m c := .documentMakingImplement h

theorem conduct1028_intro_possessesStolenFederalDocument
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a6 p d c) : Conduct1028 p d m c := .possessesStolenFederalDocument h

theorem conduct1028_intro_meansOfIdentification
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a7 p m c) : Conduct1028 p d m c := .meansOfIdentification h

theorem conduct1028_intro_trafficsAuthenticationFeatures
    {p : Person} {d : Document} {m : MeansOfIdentification} {c : ComplaintText}
    (h : Section1028a8 p d c) : Conduct1028 p d m c := .trafficsAuthenticationFeatures h

theorem section1028a_intro
    {p : Person} {d : Document} {m : MeansOfIdentification} {o : Offense} {c : ComplaintText}
    (hConduct : Conduct1028 p d m c)
    (hCirc : Circumstance1028 d o c)
    (hNotExempt : ¬ LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c) :
    Section1028a p d m o c := ⟨hConduct, hCirc, hNotExempt⟩

theorem section1028Inchoate_intro_attempt {p : Person} {c : ComplaintText}
    (h : AttemptsToCommitSection1028Offense p c) : Section1028Inchoate p c := .attempt h

theorem section1028Inchoate_intro_conspiracy {p : Person} {c : ComplaintText}
    (h : ConspiresToCommitSection1028Offense p c) : Section1028Inchoate p c := .conspiracy h



theorem section1029a1_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : ProducesUsesOrTrafficsInAccessDevice p ad c)
    (hCounterfeit : IsCounterfeitAccessDevice ad c) : Section1029a1 p ad c :=
  ⟨hSci, hFraud, hConduct, hCounterfeit⟩

theorem section1029a2_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : TrafficsInOrUsesAccessDevice p ad c)
    (hUnauth : IsUnauthorizedAccessDevice ad c)
    (hYear : ConductOccurredWithinOneYearPeriod p ad c)
    (hValue : 1000 ≤ valueObtainedDuringOneYearPeriodDollars p ad c) : Section1029a2 p ad c :=
  ⟨hSci, hFraud, hConduct, hUnauth, hYear, hValue⟩

theorem counterfeitOrUnauthorized_intro_counterfeit {ad : AccessDevice} {c : ComplaintText}
    (h : IsCounterfeitAccessDevice ad c) : CounterfeitOrUnauthorized ad c := .counterfeit h

theorem counterfeitOrUnauthorized_intro_unauthorized {ad : AccessDevice} {c : ComplaintText}
    (h : IsUnauthorizedAccessDevice ad c) : CounterfeitOrUnauthorized ad c := .unauthorized h

theorem section1029a3_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hPoss : PossessesAccessDevices p ad c)
    (hChar : CounterfeitOrUnauthorized ad c)
    (hCount : 15 ≤ counterfeitOrUnauthorizedDevicesPossessed p ad c) : Section1029a3 p ad c :=
  ⟨hSci, hFraud, hPoss, hChar, hCount⟩

theorem section1029a4_intro {p : Person} {eq : Equipment} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : ProducesTrafficsControlsOrPossessesEquipment p eq c)
    (hEquip : IsDeviceMakingEquipment eq c) : Section1029a4 p eq c :=
  ⟨hSci, hFraud, hConduct, hEquip⟩

theorem section1029a5_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : EffectsTransactionsWithAccessDeviceIssuedToAnother p ad c)
    (hYear : ConductOccurredWithinOneYearPeriod p ad c)
    (hValue : 1000 ≤ aggregateTransactionValueDuringOneYearPeriodDollars p ad c) :
    Section1029a5 p ad c := ⟨hSci, hFraud, hConduct, hYear, hValue⟩

theorem solicitationPurpose_intro_offering {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (h : PurposeOfOfferingAccessDevice p ad c) : SolicitationPurpose p ad c := .offering h

theorem solicitationPurpose_intro_sellingInformation
    {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (h : PurposeOfSellingAccessDeviceInformationOrApplication p ad c) : SolicitationPurpose p ad c :=
  .sellingInformation h

theorem section1029a6_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hAuth : WithoutAuthorizationOfIssuer p ad c)
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hSolicit : SolicitsPersonRegardingAccessDevice p ad c)
    (hPurpose : SolicitationPurpose p ad c) : Section1029a6 p ad c :=
  ⟨hAuth, hSci, hFraud, hSolicit, hPurpose⟩

theorem section1029a7_intro {p : Person} {eq : Equipment} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c)
    (hInstrument : IsTelecommunicationsInstrumentModifiedForUnauthorizedUse eq c) :
    Section1029a7 p eq c := ⟨hSci, hFraud, hConduct, hInstrument⟩

theorem section1029a8_intro {p : Person} {eq : Equipment} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hConduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c)
    (hScanner : IsScanningReceiver eq c) : Section1029a8 p eq c :=
  ⟨hSci, hFraud, hConduct, hScanner⟩

theorem section1029a9_intro {p : Person} {eq : Equipment} {c : ComplaintText}
    (hSci : ActedWithScienter p c)
    (hConduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c)
    (hConfig : IsHardwareOrSoftwareConfiguredToAlterTelecommunicationIdentifyingInformation eq c)
    (hKnows : KnowsHardwareOrSoftwareSoConfigured p eq c)
    (hNotCarrier : ¬ CarrierProtectionExemption p eq c) : Section1029a9 p eq c :=
  ⟨hSci, hConduct, hConfig, hKnows, hNotCarrier⟩

theorem section1029a10_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hAuth : WithoutAuthorizationOfCreditCardSystemMember p ad c)
    (hSci : ActedWithScienter p c) (hFraud : IntentToDefraud p c)
    (hPresent : CausesOrArrangesPresentmentOfTransactionRecords p ad c) : Section1029a10 p ad c :=
  ⟨hAuth, hSci, hFraud, hPresent⟩

theorem conduct1029_intro_counterfeitDevices
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a1 p ad c) : Conduct1029 p ad eq c := .counterfeitDevices h

theorem conduct1029_intro_unauthorizedDevices
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a2 p ad c) : Conduct1029 p ad eq c := .unauthorizedDevices h

theorem conduct1029_intro_fifteenOrMoreDevices
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a3 p ad c) : Conduct1029 p ad eq c := .fifteenOrMoreDevices h

theorem conduct1029_intro_deviceMakingEquipment
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a4 p eq c) : Conduct1029 p ad eq c := .deviceMakingEquipment h

theorem conduct1029_intro_transactionsOnAnothersDevice
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a5 p ad c) : Conduct1029 p ad eq c := .transactionsOnAnothersDevice h

theorem conduct1029_intro_solicitation
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a6 p ad c) : Conduct1029 p ad eq c := .solicitation h

theorem conduct1029_intro_modifiedInstrument
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a7 p eq c) : Conduct1029 p ad eq c := .modifiedInstrument h

theorem conduct1029_intro_scanningReceiver
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a8 p eq c) : Conduct1029 p ad eq c := .scanningReceiver h

theorem conduct1029_intro_cloningHardwareOrSoftware
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a9 p eq c) : Conduct1029 p ad eq c := .cloningHardwareOrSoftware h

theorem conduct1029_intro_presentmentOfRecords
    {p : Person} {ad : AccessDevice} {eq : Equipment} {c : ComplaintText}
    (h : Section1029a10 p ad c) : Conduct1029 p ad eq c := .presentmentOfRecords h

theorem section1029a_intro
    {p : Person} {ad : AccessDevice} {eq : Equipment} {o : Offense} {c : ComplaintText}
    (hConduct : Conduct1029 p ad eq c)
    (hCommerce : OffenseAffectsInterstateOrForeignCommerce o c)
    (hNotExempt : ¬ LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c) :
    Section1029a p ad eq o c := ⟨hConduct, hCommerce, hNotExempt⟩

theorem section1029Conspiracy_intro {p : Person} {ag : Agreement} {c : ComplaintText}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (hMember : PartyToConspiracyToCommitSection1029Offense p ag c)
    (hOvert : PartyEngagedInConductInFurtherance ag c) : Section1029Conspiracy p ag c :=
  ⟨hAgree, hMember, hOvert⟩

theorem section1029Inchoate_intro_attempt {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : AttemptsToCommitSection1029Offense p c) : Section1029Inchoate p ag c := .attempt h

theorem section1029Inchoate_intro_conspiracy {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Section1029Conspiracy p ag c) : Section1029Inchoate p ag c := .conspiracy h

theorem section1029h_intro {p : Person} {ad : AccessDevice} {c : ComplaintText}
    (hOutside : ActOutsideJurisdictionOfTheUnitedStates p c)
    (hWould : WouldConstituteSection1029OffenseIfCommittedWithinUnitedStates p c)
    (hNexus : AccessDeviceConnectedToUnitedStatesEntity ad c) : Section1029h p ad c :=
  ⟨hOutside, hWould, hNexus⟩

end Proving.USC.T18.Ch1Ch47.Recert2.Elements
