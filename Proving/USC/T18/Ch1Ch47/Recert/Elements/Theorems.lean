




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Types
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Elements

open Proving.USC.Common



theorem diplomaticPremises_mission_intro {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesMissionPremisesAbroad l c) : DiplomaticPremises l c := .mission h

theorem diplomaticPremises_residence_intro {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesPersonnelResidenceAbroad l c) : DiplomaticPremises l c := .residence h

theorem specialMaritimeTerritorialJurisdiction_highSeas_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (h : IsHighSeasOrAdmiraltyWaters l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .highSeas h

theorem specialMaritimeTerritorialJurisdiction_unitedStatesVessel_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hVessel : IsUnitedStatesConnectedVessel l c)
    (hSitus : VesselWithinAdmiraltyOutsideStateJurisdiction l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .unitedStatesVessel hVessel hSitus

theorem specialMaritimeTerritorialJurisdiction_greatLakesVessel_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hRegistry : IsUnitedStatesRegisteredVessel l c)
    (hSitus : OnGreatLakesOrSaintLawrenceBoundary l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .greatLakesVessel hRegistry hSitus

theorem specialMaritimeTerritorialJurisdiction_reservedLand_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hLand : IsLandReservedOrAcquiredForUnitedStates l c)
    (hJurisdiction : UnderExclusiveOrConcurrentUnitedStatesJurisdiction l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .reservedLand hLand hJurisdiction

theorem specialMaritimeTerritorialJurisdiction_purchasedWithConsent_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (h : IsPlacePurchasedWithStateConsentForNeedfulBuilding l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .purchasedWithConsent h

theorem specialMaritimeTerritorialJurisdiction_guanoIsland_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (h : IsGuanoIslandAppertainingToUnitedStates l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .guanoIsland h

theorem specialMaritimeTerritorialJurisdiction_unitedStatesAircraft_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hAircraft : IsUnitedStatesConnectedAircraft l c)
    (hSitus : AircraftInFlightOverAdmiraltyWaters l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .unitedStatesAircraft hAircraft hSitus

theorem specialMaritimeTerritorialJurisdiction_spaceVehicle_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hRegistry : IsUnitedStatesRegisteredSpaceVehicle l c)
    (hInFlight : SpaceVehicleInFlight l c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .spaceVehicle hRegistry hInFlight

theorem specialMaritimeTerritorialJurisdiction_outsideAnyNation_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hSitus : IsPlaceOutsideJurisdictionOfAnyNation l c)
    (hNational : OffenseByOrAgainstUnitedStatesNational o c) :
    SpecialMaritimeTerritorialJurisdiction l o p c := .outsideAnyNation hSitus hNational

theorem specialMaritimeTerritorialJurisdiction_foreignVessel_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hInternationalLaw : PermittedByInternationalLaw l c)
    (hVessel : IsForeignVesselOnScheduledUnitedStatesVoyage l c)
    (hNational : OffenseByOrAgainstUnitedStatesNational o c) :
    SpecialMaritimeTerritorialJurisdiction l o p c :=
  .foreignVessel hInternationalLaw hVessel hNational

theorem specialMaritimeTerritorialJurisdiction_diplomaticPremises_intro
    {l : Locus} {o : Offense} {p : Person} {c : ComplaintText}
    (hPremises : DiplomaticPremises l c)
    (hNational : OffenseByOrAgainstUnitedStatesNational o c)
    (hNoTreatyConflict : ¬ ConflictingTreatyOrInternationalAgreement l c)
    (hNotSection3261aPerson : ¬ OffenseCommittedByPersonDescribedInSection3261a p c) :
    SpecialMaritimeTerritorialJurisdiction l o p c :=
  .diplomaticPremises hPremises hNational hNoTreatyConflict hNotSection3261aPerson



theorem financialInstitution_insuredDepository_intro {i : Institution} {c : ComplaintText}
    (h : IsInsuredDepositoryInstitution i c) : FinancialInstitution i c := .insuredDepository h

theorem financialInstitution_insuredCreditUnion_intro {i : Institution} {c : ComplaintText}
    (h : IsInsuredCreditUnion i c) : FinancialInstitution i c := .insuredCreditUnion h

theorem financialInstitution_homeLoanBank_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBankOrMember i c) : FinancialInstitution i c := .homeLoanBank h

theorem financialInstitution_farmCredit_intro {i : Institution} {c : ComplaintText}
    (h : IsFarmCreditSystemInstitution i c) : FinancialInstitution i c := .farmCredit h

theorem financialInstitution_smallBusinessInvestment_intro {i : Institution} {c : ComplaintText}
    (h : IsSmallBusinessInvestmentCompany i c) : FinancialInstitution i c :=
  .smallBusinessInvestment h

theorem financialInstitution_holdingCompany_intro {i : Institution} {c : ComplaintText}
    (h : IsDepositoryInstitutionHoldingCompany i c) : FinancialInstitution i c := .holdingCompany h

theorem financialInstitution_federalReserve_intro {i : Institution} {c : ComplaintText}
    (h : IsFederalReserveBankOrMemberBank i c) : FinancialInstitution i c := .federalReserve h

theorem financialInstitution_edgeActOrganization_intro {i : Institution} {c : ComplaintText}
    (h : IsEdgeActOrganization i c) : FinancialInstitution i c := .edgeActOrganization h

theorem financialInstitution_foreignBankBranch_intro {i : Institution} {c : ComplaintText}
    (h : IsBranchOrAgencyOfForeignBank i c) : FinancialInstitution i c := .foreignBankBranch h

theorem financialInstitution_mortgageLender_intro {i : Institution} {c : ComplaintText}
    (h : IsMortgageLendingBusinessOrFederallyRelatedLender i c) : FinancialInstitution i c :=
  .mortgageLender h



theorem officialRepresentationSource_byFederalOfficer_intro
    {p : Person} {pr : Property} {c : ComplaintText}
    (h : RepresentationByFederalLawEnforcementOfficer p pr c) :
    OfficialRepresentationSource p pr c := .byFederalOfficer h

theorem officialRepresentationSource_atOfficerDirection_intro
    {p : Person} {pr : Property} {c : ComplaintText}
    (h : RepresentationAtDirectionOrApprovalOfFederalOfficer p pr c) :
    OfficialRepresentationSource p pr c := .atOfficerDirection h

theorem officialRepresentation_intro {p : Person} {pr : Property} {c : ComplaintText}
    (hNature : RepresentationAsToNatureOfProperty p pr c)
    (hSource : OfficialRepresentationSource p pr c) : OfficialRepresentation p pr c :=
  ⟨hNature, hSource⟩

theorem section21ActualRoute_intro {p : Person} {pr : Property} {c : ComplaintText}
    (hCharacter : PropertyOfStolenOrCounterfeitCharacter pr c)
    (hKnowledge : DefendantKnewPropertyCharacter p pr c) : Section21ActualRoute p pr c :=
  ⟨hCharacter, hKnowledge⟩

theorem section21RepresentationRoute_intro {p : Person} {pr : Property} {c : ComplaintText}
    (hRepresentation : OfficialRepresentation p pr c)
    (hBelief : DefendantBelievedPropertyOfSuchCharacter p pr c)
    (hCausation : BeliefResultedFromOfficialRepresentation p pr c) :
    Section21RepresentationRoute p pr c := ⟨hRepresentation, hBelief, hCausation⟩

theorem stolenOrCounterfeitNatureElement_actual_intro
    {p : Person} {pr : Property} {c : ComplaintText}
    (h : Section21ActualRoute p pr c) : StolenOrCounterfeitNatureElement p pr c := .actual h

theorem stolenOrCounterfeitNatureElement_byOfficialRepresentation_intro
    {p : Person} {pr : Property} {c : ComplaintText}
    (h : Section21RepresentationRoute p pr c) : StolenOrCounterfeitNatureElement p pr c :=
  .byOfficialRepresentation h



theorem courtOfTheUnitedStates_guam_intro {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam ct c) : CourtOfTheUnitedStates ct c := .guam h

theorem courtOfTheUnitedStates_northernMarianaIslands_intro {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtForNorthernMarianaIslands ct c) : CourtOfTheUnitedStates ct c :=
  .northernMarianaIslands h

theorem courtOfTheUnitedStates_virginIslands_intro {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfVirginIslands ct c) : CourtOfTheUnitedStates ct c := .virginIslands h

theorem courtOfTheUnitedStates_apartFromSection23_intro {ct : Court} {c : ComplaintText}
    (h : IsCourtOfTheUnitedStatesApartFromSection23 ct c) : CourtOfTheUnitedStates ct c :=
  .apartFromSection23 h

theorem courtOfTheUnitedStatesElement_intro {ct : Court} {c : ComplaintText}
    (hNotOtherwise : ¬ OtherwiseExpresslyProvidedInProvision c)
    (hCourt : CourtOfTheUnitedStates ct c) : CourtOfTheUnitedStatesElement ct c :=
  ⟨hNotOtherwise, hCourt⟩



theorem healthCareBenefitPlan_intro {hp : HealthProgram} {c : ComplaintText}
    (hPlan : IsPublicOrPrivatePlanOrContract hp c)
    (hCommerce : ProgramAffectsCommerce hp c)
    (hBenefit : ProvidesMedicalBenefitItemOrService hp c) : HealthCareBenefitPlan hp c :=
  ⟨hPlan, hCommerce, hBenefit⟩

theorem healthCareBenefitProgram_plan_intro {hp : HealthProgram} {c : ComplaintText}
    (h : HealthCareBenefitPlan hp c) : HealthCareBenefitProgram hp c := .plan h

theorem healthCareBenefitProgram_providerIncluded_intro {hp : HealthProgram} {c : ComplaintText}
    (h : IsProviderOfMedicalBenefitPayableUnderPlan hp c) : HealthCareBenefitProgram hp c :=
  .providerIncluded h

theorem federalHealthCareOffenseCoreRoute_intro {o : Offense} {c : ComplaintText}
    (hViolation : IsViolationOrCriminalConspiracyToViolate o c)
    (hEnumerated : IsEnumeratedCoreHealthCareProvision o c) :
    FederalHealthCareOffenseCoreRoute o c := ⟨hViolation, hEnumerated⟩

theorem federalHealthCareOffenseRelatedRoute_intro {o : Offense} {c : ComplaintText}
    (hViolation : IsViolationOrCriminalConspiracyToViolate o c)
    (hEnumerated : IsEnumeratedGeneralFraudProvision o c)
    (hRelated : RelatesToHealthCareBenefitProgram o c) :
    FederalHealthCareOffenseRelatedRoute o c := ⟨hViolation, hEnumerated, hRelated⟩

theorem federalHealthCareOffense_core_intro {o : Offense} {c : ComplaintText}
    (h : FederalHealthCareOffenseCoreRoute o c) : FederalHealthCareOffense o c := .core h

theorem federalHealthCareOffense_relatedToProgram_intro {o : Offense} {c : ComplaintText}
    (h : FederalHealthCareOffenseRelatedRoute o c) : FederalHealthCareOffense o c :=
  .relatedToProgram h



theorem section1028a1_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hAuthority : ActedWithoutLawfulAuthority p act c)
    (hProduction : ProducedIdentificationDocumentOrFeature p act c) : Section1028a1 p act c :=
  ⟨hKnowingly, hAuthority, hProduction⟩

theorem section1028a2_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hTransfer : TransferredIdentificationDocumentOrFeature p act c)
    (hTaint : KnewDocumentStolenOrProducedWithoutAuthority p act c) : Section1028a2 p act c :=
  ⟨hKnowingly, hTransfer, hTaint⟩

theorem section1028a3_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hPossession : PossessedIdentificationDocuments p act c)
    (hIntent : IntentToUseOrTransferUnlawfully p act c)
    (hNotOwn : DocumentsNotLawfullyIssuedToPossessor p act c)
    (hQuantity : 5 ≤ identificationDocumentCount act c) : Section1028a3 p act c :=
  ⟨hKnowingly, hPossession, hIntent, hNotOwn, hQuantity⟩

theorem section1028a4_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hPossession : PossessedIdentificationDocuments p act c)
    (hNotOwn : DocumentsNotLawfullyIssuedToPossessor p act c)
    (hIntent : IntentDocumentUsedToDefraudUnitedStates p act c) : Section1028a4 p act c :=
  ⟨hKnowingly, hPossession, hNotOwn, hIntent⟩

theorem section1028a5_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hConduct : ProducedTransferredOrPossessedImplementOrFeature p act c)
    (hIntent : IntentImplementUsedToProduceFalseDocument p act c) : Section1028a5 p act c :=
  ⟨hKnowingly, hConduct, hIntent⟩

theorem section1028a6_intro {p : Person} {d : IdDocument} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hPossession : PossessedIdentificationDocuments p act c)
    (hAppearance : DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued d c)
    (hTaintFact : DocumentStolenOrProducedWithoutAuthority d c)
    (hTaintKnowledge : KnewDocumentStolenOrProducedWithoutAuthority p act c) :
    Section1028a6 p d act c := ⟨hKnowingly, hPossession, hAppearance, hTaintFact, hTaintKnowledge⟩

theorem section1028a7_intro
    {p : Person} {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hAuthority : ActedWithoutLawfulAuthority p act c)
    (hConduct : TransferredPossessedOrUsedMeansOfIdentification p m act c)
    (hAnother : MeansOfIdentificationOfAnotherPerson m c)
    (hIntent : IntentToCommitOrAidUnlawfulActivity p act c)
    (hPredicate : UnlawfulActivityIsFederalViolationOrStateFelony act c) :
    Section1028a7 p m act c := ⟨hKnowingly, hAuthority, hConduct, hAnother, hIntent, hPredicate⟩

theorem section1028a8_intro {p : Person} {af : AuthFeature} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hTrafficking : TraffickedInAuthenticationFeatures p act c)
    (hIntendedUse : AuthenticationFeatureIntendedForFalseDocuments af c) :
    Section1028a8 p af act c := ⟨hKnowingly, hTrafficking, hIntendedUse⟩

theorem section1028Circumstance_federalOrSpecialEventDocument_intro
    {d : IdDocument} {impl : DocMakingImplement} {act : Conduct} {c : ComplaintText}
    (h : DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued d c) :
    Section1028Circumstance d impl act c := .federalOrSpecialEventDocument h

theorem section1028Circumstance_implementSuited_intro
    {d : IdDocument} {impl : DocMakingImplement} {act : Conduct} {c : ComplaintText}
    (h : ImplementDesignedOrSuitedForSuchDocument impl c) :
    Section1028Circumstance d impl act c := .implementSuited h

theorem section1028Circumstance_subsectionA4Offense_intro
    {d : IdDocument} {impl : DocMakingImplement} {act : Conduct} {c : ComplaintText}
    (h : OffenseChargedUnderSubsectionA4 c) : Section1028Circumstance d impl act c :=
  .subsectionA4Offense h

theorem section1028Circumstance_affectsCommerce_intro
    {d : IdDocument} {impl : DocMakingImplement} {act : Conduct} {c : ComplaintText}
    (h : AffectsInterstateOrForeignCommerce act c) : Section1028Circumstance d impl act c :=
  .affectsCommerce h

theorem section1028Circumstance_mailTransport_intro
    {d : IdDocument} {impl : DocMakingImplement} {act : Conduct} {c : ComplaintText}
    (h : TransportedInTheMailDuringConduct act c) : Section1028Circumstance d impl act c :=
  .mailTransport h

theorem section1028Theory_produce_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a1 p act c) : Section1028Theory p d af impl m act c := .produce h

theorem section1028Theory_transfer_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a2 p act c) : Section1028Theory p d af impl m act c := .transfer h

theorem section1028Theory_possessFiveOrMore_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a3 p act c) : Section1028Theory p d af impl m act c := .possessFiveOrMore h

theorem section1028Theory_possessToDefraudUnitedStates_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a4 p act c) : Section1028Theory p d af impl m act c :=
  .possessToDefraudUnitedStates h

theorem section1028Theory_implementOrFeature_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a5 p act c) : Section1028Theory p d af impl m act c := .implementOrFeature h

theorem section1028Theory_possessFederalDocument_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a6 p d act c) : Section1028Theory p d af impl m act c :=
  .possessFederalDocument h

theorem section1028Theory_meansOfIdentification_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a7 p m act c) : Section1028Theory p d af impl m act c :=
  .meansOfIdentification h

theorem section1028Theory_traffickingFeatures_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (h : Section1028a8 p af act c) : Section1028Theory p d af impl m act c :=
  .traffickingFeatures h

theorem section1028Offense_intro
    {p : Person} {d : IdDocument} {af : AuthFeature} {impl : DocMakingImplement}
    {m : MeansOfIdentification} {act : Conduct} {c : ComplaintText}
    (hTheory : Section1028Theory p d af impl m act c)
    (hCircumstance : Section1028Circumstance d impl act c)
    (hNotExempt : ¬ LawfullyAuthorizedInvestigativeActivity act c) :
    Section1028Offense p d af impl m act c := ⟨hTheory, hCircumstance, hNotExempt⟩

theorem section1028Conspiracy_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hMembership : IsPartyToConspiracy p ag c)
    (hObject : ObjectOfAgreementIsSection1028Offense ag act c) :
    Section1028Conspiracy p ag act c := ⟨hAgreement, hMembership, hObject⟩

theorem section1028InchoateOffense_attempt_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (h : AttemptedSection1028Offense p act c) : Section1028InchoateOffense p ag act c := .attempt h

theorem section1028InchoateOffense_conspiracy_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (h : Section1028Conspiracy p ag act c) : Section1028InchoateOffense p ag act c := .conspiracy h



theorem section1029a1_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : ProducedUsedOrTraffickedInCounterfeitAccessDevices p act c) :
    Section1029a1 p act c := ⟨hKnowingly, hIntent, hConduct⟩

theorem section1029a2_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : TraffickedInOrUsedUnauthorizedAccessDevices p act c)
    (hPeriod : ConductWithinOneYearPeriod act c)
    (hObtained : ValueObtainedByChargedConduct p act c)
    (hThreshold : 1000 ≤ valueObtainedInPeriodDollars act c) : Section1029a2 p act c :=
  ⟨hKnowingly, hIntent, hConduct, hPeriod, hObtained, hThreshold⟩

theorem section1029a3_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hPossession : PossessedCounterfeitOrUnauthorizedAccessDevices p act c)
    (hQuantity : 15 ≤ counterfeitOrUnauthorizedAccessDeviceCount act c) : Section1029a3 p act c :=
  ⟨hKnowingly, hIntent, hPossession, hQuantity⟩

theorem section1029a4_intro
    {p : Person} {dme : DeviceMakingEquipment} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : ProducedTraffickedControlledOrPossessedDeviceMakingEquipment p dme act c) :
    Section1029a4 p dme act c := ⟨hKnowingly, hIntent, hConduct⟩

theorem section1029a5_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hTransactions : EffectedTransactionsWithAnothersAccessDevices p act c)
    (hPeriod : ConductWithinOneYearPeriod act c)
    (hThreshold : 1000 ≤ aggregateTransactionValueDollars act c) : Section1029a5 p act c :=
  ⟨hKnowingly, hIntent, hTransactions, hPeriod, hThreshold⟩

theorem section1029a6Purpose_offering_intro {act : Conduct} {c : ComplaintText}
    (h : PurposeOfferingAccessDevice act c) : Section1029a6Purpose act c := .offering h

theorem section1029a6Purpose_sellingInformation_intro {act : Conduct} {c : ComplaintText}
    (h : PurposeSellingAccessDeviceInformation act c) : Section1029a6Purpose act c :=
  .sellingInformation h

theorem section1029a6_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hIssuer : WithoutAuthorizationOfIssuer p act c)
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hSolicitation : SolicitedPersonRegardingAccessDevice p act c)
    (hPurpose : Section1029a6Purpose act c) : Section1029a6 p act c :=
  ⟨hIssuer, hKnowingly, hIntent, hSolicitation, hPurpose⟩

theorem section1029a7_intro
    {p : Person} {ti : TelecomInstrument} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : UsedProducedOrPossessedTelecommunicationsInstrument p ti act c)
    (hModification : InstrumentModifiedForUnauthorizedTelecomUse ti c) :
    Section1029a7 p ti act c := ⟨hKnowingly, hIntent, hConduct, hModification⟩

theorem section1029a8_intro
    {p : Person} {sr : ScanningReceiver} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : UsedProducedOrPossessedScanningReceiver p sr act c) :
    Section1029a8 p sr act c := ⟨hKnowingly, hIntent, hConduct⟩

theorem section1029a9_intro
    {p : Person} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (hKnowingly : ActedKnowingly p act c)
    (hConduct : UsedProducedOrPossessedTelecomHardwareOrSoftware p hw act c)
    (hKnowledge : KnewHardwareConfiguredToModifyTelecomIdentifyingInformation p act c)
    (hEffect : ConfigurationEnablesUnauthorizedTelecomService hw c)
    (hNotCarrier : ¬ CarrierProtectiveConductExemption p act c) : Section1029a9 p hw act c :=
  ⟨hKnowingly, hConduct, hKnowledge, hEffect, hNotCarrier⟩

theorem section1029a10_intro {p : Person} {act : Conduct} {c : ComplaintText}
    (hMember : WithoutAuthorizationOfCreditCardSystemMember p act c)
    (hKnowingly : ActedKnowingly p act c)
    (hIntent : ActedWithIntentToDefraud p act c)
    (hConduct : CausedOrArrangedPresentmentOfTransactionRecords p act c) :
    Section1029a10 p act c := ⟨hMember, hKnowingly, hIntent, hConduct⟩

theorem section1029Theory_counterfeitDevices_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a1 p act c) : Section1029Theory p dme ti sr hw act c := .counterfeitDevices h

theorem section1029Theory_unauthorizedDevices_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a2 p act c) : Section1029Theory p dme ti sr hw act c := .unauthorizedDevices h

theorem section1029Theory_possessFifteenOrMore_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a3 p act c) : Section1029Theory p dme ti sr hw act c := .possessFifteenOrMore h

theorem section1029Theory_deviceMakingEquipment_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a4 p dme act c) : Section1029Theory p dme ti sr hw act c :=
  .deviceMakingEquipment h

theorem section1029Theory_transactionsWithAnothersDevices_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a5 p act c) : Section1029Theory p dme ti sr hw act c :=
  .transactionsWithAnothersDevices h

theorem section1029Theory_solicitation_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a6 p act c) : Section1029Theory p dme ti sr hw act c := .solicitation h

theorem section1029Theory_telecomInstrument_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a7 p ti act c) : Section1029Theory p dme ti sr hw act c := .telecomInstrument h

theorem section1029Theory_scanningReceiver_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a8 p sr act c) : Section1029Theory p dme ti sr hw act c := .scanningReceiver h

theorem section1029Theory_telecomHardwareOrSoftware_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a9 p hw act c) : Section1029Theory p dme ti sr hw act c :=
  .telecomHardwareOrSoftware h

theorem section1029Theory_presentmentOfRecords_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (h : Section1029a10 p act c) : Section1029Theory p dme ti sr hw act c :=
  .presentmentOfRecords h

theorem section1029Offense_intro
    {p : Person} {dme : DeviceMakingEquipment} {ti : TelecomInstrument}
    {sr : ScanningReceiver} {hw : TelecomConfigurable} {act : Conduct} {c : ComplaintText}
    (hTheory : Section1029Theory p dme ti sr hw act c)
    (hCommerce : AffectsInterstateOrForeignCommerce act c)
    (hNotExempt : ¬ LawfullyAuthorizedInvestigativeActivity act c) :
    Section1029Offense p dme ti sr hw act c := ⟨hTheory, hCommerce, hNotExempt⟩

theorem section1029Conspiracy_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hMembership : IsPartyToConspiracy p ag c)
    (hObject : ObjectOfAgreementIsSection1029Offense ag act c)
    (hOvertAct : ConductInFurtheranceByAnyParty ag act c) : Section1029Conspiracy p ag act c :=
  ⟨hAgreement, hMembership, hObject, hOvertAct⟩

theorem section1029InchoateOffense_attempt_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (h : AttemptedSection1029Offense p act c) : Section1029InchoateOffense p ag act c := .attempt h

theorem section1029InchoateOffense_conspiracy_intro
    {p : Person} {ag : Agreement} {act : Conduct} {c : ComplaintText}
    (h : Section1029Conspiracy p ag act c) : Section1029InchoateOffense p ag act c := .conspiracy h

theorem section1029ExtraterritorialLiability_intro
    {p : Person} {ad : AccessDevice} {act : Conduct} {c : ComplaintText}
    (hOutside : ActOutsideUnitedStatesJurisdiction p act c)
    (hWouldConstitute : ConductWouldConstituteSection1029Offense p act c)
    (hNexus : AccessDeviceControlledByUnitedStatesEntity ad c) :
    Section1029ExtraterritorialLiability p ad act c := ⟨hOutside, hWouldConstitute, hNexus⟩

end Proving.USC.T18.Ch1Ch47.Recert.Elements
