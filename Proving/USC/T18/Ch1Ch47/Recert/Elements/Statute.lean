




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Types
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Elements

open Proving.USC.Common




inductive DiplomaticPremises (l : Locus) (c : ComplaintText) : Prop where
  | mission (h : IsUnitedStatesMissionPremisesAbroad l c)
  | residence (h : IsUnitedStatesPersonnelResidenceAbroad l c)





inductive SpecialMaritimeTerritorialJurisdiction
    (l : Locus) (o : Offense) (p : Person) (c : ComplaintText) : Prop where

  | highSeas (h : IsHighSeasOrAdmiraltyWaters l c)

  | unitedStatesVessel
      (hVessel : IsUnitedStatesConnectedVessel l c)
      (hSitus : VesselWithinAdmiraltyOutsideStateJurisdiction l c)

  | greatLakesVessel
      (hRegistry : IsUnitedStatesRegisteredVessel l c)
      (hSitus : OnGreatLakesOrSaintLawrenceBoundary l c)

  | reservedLand
      (hLand : IsLandReservedOrAcquiredForUnitedStates l c)
      (hJurisdiction : UnderExclusiveOrConcurrentUnitedStatesJurisdiction l c)

  | purchasedWithConsent (h : IsPlacePurchasedWithStateConsentForNeedfulBuilding l c)

  | guanoIsland (h : IsGuanoIslandAppertainingToUnitedStates l c)

  | unitedStatesAircraft
      (hAircraft : IsUnitedStatesConnectedAircraft l c)
      (hSitus : AircraftInFlightOverAdmiraltyWaters l c)

  | spaceVehicle
      (hRegistry : IsUnitedStatesRegisteredSpaceVehicle l c)
      (hInFlight : SpaceVehicleInFlight l c)

  | outsideAnyNation
      (hSitus : IsPlaceOutsideJurisdictionOfAnyNation l c)
      (hNational : OffenseByOrAgainstUnitedStatesNational o c)

  | foreignVessel
      (hInternationalLaw : PermittedByInternationalLaw l c)
      (hVessel : IsForeignVesselOnScheduledUnitedStatesVoyage l c)
      (hNational : OffenseByOrAgainstUnitedStatesNational o c)

  | diplomaticPremises
      (hPremises : DiplomaticPremises l c)
      (hNational : OffenseByOrAgainstUnitedStatesNational o c)
      (hNoTreatyConflict : ¬ ConflictingTreatyOrInternationalAgreement l c)
      (hNotSection3261aPerson : ¬ OffenseCommittedByPersonDescribedInSection3261a p c)





inductive FinancialInstitution (i : Institution) (c : ComplaintText) : Prop where
  | insuredDepository (h : IsInsuredDepositoryInstitution i c)
  | insuredCreditUnion (h : IsInsuredCreditUnion i c)
  | homeLoanBank (h : IsFederalHomeLoanBankOrMember i c)
  | farmCredit (h : IsFarmCreditSystemInstitution i c)
  | smallBusinessInvestment (h : IsSmallBusinessInvestmentCompany i c)
  | holdingCompany (h : IsDepositoryInstitutionHoldingCompany i c)
  | federalReserve (h : IsFederalReserveBankOrMemberBank i c)
  | edgeActOrganization (h : IsEdgeActOrganization i c)
  | foreignBankBranch (h : IsBranchOrAgencyOfForeignBank i c)
  | mortgageLender (h : IsMortgageLendingBusinessOrFederallyRelatedLender i c)




inductive OfficialRepresentationSource (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  | byFederalOfficer (h : RepresentationByFederalLawEnforcementOfficer p pr c)
  | atOfficerDirection (h : RepresentationAtDirectionOrApprovalOfFederalOfficer p pr c)



structure OfficialRepresentation (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  asToNature : RepresentationAsToNatureOfProperty p pr c
  source : OfficialRepresentationSource p pr c



structure Section21ActualRoute (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  character : PropertyOfStolenOrCounterfeitCharacter pr c
  knowledge : DefendantKnewPropertyCharacter p pr c



structure Section21RepresentationRoute (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  representation : OfficialRepresentation p pr c
  belief : DefendantBelievedPropertyOfSuchCharacter p pr c
  causation : BeliefResultedFromOfficialRepresentation p pr c



inductive StolenOrCounterfeitNatureElement
    (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  | actual (h : Section21ActualRoute p pr c)
  | byOfficialRepresentation (h : Section21RepresentationRoute p pr c)





inductive CourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop where
  | guam (h : IsDistrictCourtOfGuam ct c)
  | northernMarianaIslands (h : IsDistrictCourtForNorthernMarianaIslands ct c)
  | virginIslands (h : IsDistrictCourtOfVirginIslands ct c)
  | apartFromSection23 (h : IsCourtOfTheUnitedStatesApartFromSection23 ct c)



structure CourtOfTheUnitedStatesElement (ct : Court) (c : ComplaintText) : Prop where
  notOtherwiseProvided : ¬ OtherwiseExpresslyProvidedInProvision c
  isCourt : CourtOfTheUnitedStates ct c




structure HealthCareBenefitPlan (hp : HealthProgram) (c : ComplaintText) : Prop where
  planOrContract : IsPublicOrPrivatePlanOrContract hp c
  commerce : ProgramAffectsCommerce hp c
  medicalBenefit : ProvidesMedicalBenefitItemOrService hp c



inductive HealthCareBenefitProgram (hp : HealthProgram) (c : ComplaintText) : Prop where
  | plan (h : HealthCareBenefitPlan hp c)
  | providerIncluded (h : IsProviderOfMedicalBenefitPayableUnderPlan hp c)


structure FederalHealthCareOffenseCoreRoute (o : Offense) (c : ComplaintText) : Prop where
  violationOrConspiracy : IsViolationOrCriminalConspiracyToViolate o c
  enumerated : IsEnumeratedCoreHealthCareProvision o c




structure FederalHealthCareOffenseRelatedRoute (o : Offense) (c : ComplaintText) : Prop where
  violationOrConspiracy : IsViolationOrCriminalConspiracyToViolate o c
  enumerated : IsEnumeratedGeneralFraudProvision o c
  relatedness : RelatesToHealthCareBenefitProgram o c


inductive FederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop where
  | core (h : FederalHealthCareOffenseCoreRoute o c)
  | relatedToProgram (h : FederalHealthCareOffenseRelatedRoute o c)




structure Section1028a1 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  withoutLawfulAuthority : ActedWithoutLawfulAuthority p act c
  production : ProducedIdentificationDocumentOrFeature p act c


structure Section1028a2 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  transfer : TransferredIdentificationDocumentOrFeature p act c
  knowledgeOfTaint : KnewDocumentStolenOrProducedWithoutAuthority p act c



structure Section1028a3 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  possession : PossessedIdentificationDocuments p act c
  intent : IntentToUseOrTransferUnlawfully p act c
  notPossessorsOwn : DocumentsNotLawfullyIssuedToPossessor p act c
  quantity : 5 ≤ identificationDocumentCount act c


structure Section1028a4 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  possession : PossessedIdentificationDocuments p act c
  notPossessorsOwn : DocumentsNotLawfullyIssuedToPossessor p act c
  intent : IntentDocumentUsedToDefraudUnitedStates p act c


structure Section1028a5 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  conduct : ProducedTransferredOrPossessedImplementOrFeature p act c
  intent : IntentImplementUsedToProduceFalseDocument p act c


structure Section1028a6 (p : Person) (d : IdDocument) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  possession : PossessedIdentificationDocuments p act c
  federalOrSpecialEventAppearance : DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued d c
  taint : DocumentStolenOrProducedWithoutAuthority d c
  knowledgeOfTaint : KnewDocumentStolenOrProducedWithoutAuthority p act c


structure Section1028a7
    (p : Person) (m : MeansOfIdentification) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  withoutLawfulAuthority : ActedWithoutLawfulAuthority p act c
  conduct : TransferredPossessedOrUsedMeansOfIdentification p m act c
  ofAnother : MeansOfIdentificationOfAnotherPerson m c
  intent : IntentToCommitOrAidUnlawfulActivity p act c
  predicateUnlawfulActivity : UnlawfulActivityIsFederalViolationOrStateFelony act c


structure Section1028a8
    (p : Person) (af : AuthFeature) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  trafficking : TraffickedInAuthenticationFeatures p act c
  intendedUse : AuthenticationFeatureIntendedForFalseDocuments af c



inductive Section1028Circumstance
    (d : IdDocument) (impl : DocMakingImplement) (act : Conduct) (c : ComplaintText) : Prop where

  | federalOrSpecialEventDocument (h : DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued d c)

  | implementSuited (h : ImplementDesignedOrSuitedForSuchDocument impl c)

  | subsectionA4Offense (h : OffenseChargedUnderSubsectionA4 c)

  | affectsCommerce (h : AffectsInterstateOrForeignCommerce act c)

  | mailTransport (h : TransportedInTheMailDuringConduct act c)


inductive Section1028Theory
    (p : Person) (d : IdDocument) (af : AuthFeature) (impl : DocMakingImplement)
    (m : MeansOfIdentification) (act : Conduct) (c : ComplaintText) : Prop where
  | produce (h : Section1028a1 p act c)
  | transfer (h : Section1028a2 p act c)
  | possessFiveOrMore (h : Section1028a3 p act c)
  | possessToDefraudUnitedStates (h : Section1028a4 p act c)
  | implementOrFeature (h : Section1028a5 p act c)
  | possessFederalDocument (h : Section1028a6 p d act c)
  | meansOfIdentification (h : Section1028a7 p m act c)
  | traffickingFeatures (h : Section1028a8 p af act c)




structure Section1028Offense
    (p : Person) (d : IdDocument) (af : AuthFeature) (impl : DocMakingImplement)
    (m : MeansOfIdentification) (act : Conduct) (c : ComplaintText) : Prop where
  theory : Section1028Theory p d af impl m act c
  circumstance : Section1028Circumstance d impl act c
  notExemptActivity : ¬ LawfullyAuthorizedInvestigativeActivity act c



structure Section1028Conspiracy
    (p : Person) (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  membership : IsPartyToConspiracy p ag c
  objectOffense : ObjectOfAgreementIsSection1028Offense ag act c


inductive Section1028InchoateOffense
    (p : Person) (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop where
  | attempt (h : AttemptedSection1028Offense p act c)
  | conspiracy (h : Section1028Conspiracy p ag act c)




structure Section1029a1 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : ProducedUsedOrTraffickedInCounterfeitAccessDevices p act c


structure Section1029a2 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : TraffickedInOrUsedUnauthorizedAccessDevices p act c
  oneYearPeriod : ConductWithinOneYearPeriod act c
  obtainedByConduct : ValueObtainedByChargedConduct p act c
  threshold : 1000 ≤ valueObtainedInPeriodDollars act c


structure Section1029a3 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  possession : PossessedCounterfeitOrUnauthorizedAccessDevices p act c
  quantity : 15 ≤ counterfeitOrUnauthorizedAccessDeviceCount act c


structure Section1029a4
    (p : Person) (dme : DeviceMakingEquipment) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : ProducedTraffickedControlledOrPossessedDeviceMakingEquipment p dme act c


structure Section1029a5 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  transactions : EffectedTransactionsWithAnothersAccessDevices p act c
  oneYearPeriod : ConductWithinOneYearPeriod act c
  threshold : 1000 ≤ aggregateTransactionValueDollars act c


inductive Section1029a6Purpose (act : Conduct) (c : ComplaintText) : Prop where
  | offering (h : PurposeOfferingAccessDevice act c)
  | sellingInformation (h : PurposeSellingAccessDeviceInformation act c)


structure Section1029a6 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  withoutIssuerAuthorization : WithoutAuthorizationOfIssuer p act c
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  solicitation : SolicitedPersonRegardingAccessDevice p act c
  purpose : Section1029a6Purpose act c


structure Section1029a7
    (p : Person) (ti : TelecomInstrument) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : UsedProducedOrPossessedTelecommunicationsInstrument p ti act c
  modification : InstrumentModifiedForUnauthorizedTelecomUse ti c


structure Section1029a8
    (p : Person) (sr : ScanningReceiver) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : UsedProducedOrPossessedScanningReceiver p sr act c






structure Section1029a9
    (p : Person) (hw : TelecomConfigurable) (act : Conduct) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly p act c
  conduct : UsedProducedOrPossessedTelecomHardwareOrSoftware p hw act c
  knowledgeOfConfiguration : KnewHardwareConfiguredToModifyTelecomIdentifyingInformation p act c
  configurationEffect : ConfigurationEnablesUnauthorizedTelecomService hw c
  notCarrierProtectiveConduct : ¬ CarrierProtectiveConductExemption p act c


structure Section1029a10 (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  withoutMemberAuthorization : WithoutAuthorizationOfCreditCardSystemMember p act c
  knowingly : ActedKnowingly p act c
  intentToDefraud : ActedWithIntentToDefraud p act c
  conduct : CausedOrArrangedPresentmentOfTransactionRecords p act c


inductive Section1029Theory
    (p : Person) (dme : DeviceMakingEquipment) (ti : TelecomInstrument)
    (sr : ScanningReceiver) (hw : TelecomConfigurable) (act : Conduct)
    (c : ComplaintText) : Prop where
  | counterfeitDevices (h : Section1029a1 p act c)
  | unauthorizedDevices (h : Section1029a2 p act c)
  | possessFifteenOrMore (h : Section1029a3 p act c)
  | deviceMakingEquipment (h : Section1029a4 p dme act c)
  | transactionsWithAnothersDevices (h : Section1029a5 p act c)
  | solicitation (h : Section1029a6 p act c)
  | telecomInstrument (h : Section1029a7 p ti act c)
  | scanningReceiver (h : Section1029a8 p sr act c)
  | telecomHardwareOrSoftware (h : Section1029a9 p hw act c)
  | presentmentOfRecords (h : Section1029a10 p act c)




structure Section1029Offense
    (p : Person) (dme : DeviceMakingEquipment) (ti : TelecomInstrument)
    (sr : ScanningReceiver) (hw : TelecomConfigurable) (act : Conduct)
    (c : ComplaintText) : Prop where
  theory : Section1029Theory p dme ti sr hw act c
  commerce : AffectsInterstateOrForeignCommerce act c
  notExemptActivity : ¬ LawfullyAuthorizedInvestigativeActivity act c



structure Section1029Conspiracy
    (p : Person) (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  membership : IsPartyToConspiracy p ag c
  objectOffense : ObjectOfAgreementIsSection1029Offense ag act c
  overtAct : ConductInFurtheranceByAnyParty ag act c


inductive Section1029InchoateOffense
    (p : Person) (ag : Agreement) (act : Conduct) (c : ComplaintText) : Prop where
  | attempt (h : AttemptedSection1029Offense p act c)
  | conspiracy (h : Section1029Conspiracy p ag act c)


structure Section1029ExtraterritorialLiability
    (p : Person) (ad : AccessDevice) (act : Conduct) (c : ComplaintText) : Prop where
  outsideJurisdiction : ActOutsideUnitedStatesJurisdiction p act c
  wouldConstituteOffense : ConductWouldConstituteSection1029Offense p act c
  unitedStatesNexus : AccessDeviceControlledByUnitedStatesEntity ad c

end Proving.USC.T18.Ch1Ch47.Recert.Elements
