






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch1Ch47.Recert2.Elements





structure Smtj7Waters (l : Locus) (c : ComplaintText) : Prop where
  admiralty : IsWithinAdmiraltyAndMaritimeJurisdiction l c
  outsideState : IsOutsideJurisdictionOfAnyParticularState l c



structure Smtj7Vessel (l : Locus) (c : ComplaintText) : Prop where
  belonging : IsVesselBelongingToUnitedStatesOrCitizenOrCorporation l c
  admiralty : IsWithinAdmiraltyAndMaritimeJurisdiction l c
  outsideState : IsOutsideJurisdictionOfAnyParticularState l c


inductive Smtj7Paragraph1 (l : Locus) (c : ComplaintText) : Prop where
  | highSeas (h : IsHighSeas l c)
  | otherWaters (h : Smtj7Waters l c)
  | vessel (h : Smtj7Vessel l c)


structure Smtj7Paragraph2 (l : Locus) (c : ComplaintText) : Prop where
  registered : IsVesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw l c
  voyage : IsOnVoyageUponGreatLakesOrSaintLawrenceBoundary l c



structure Smtj7ReservedLand (l : Locus) (c : ComplaintText) : Prop where
  reservedOrAcquired : IsLandReservedOrAcquiredForUseOfUnitedStates l c
  jurisdiction : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction l c


inductive Smtj7Paragraph3 (l : Locus) (c : ComplaintText) : Prop where
  | reserved (h : Smtj7ReservedLand l c)
  | purchasedWithConsent (h : IsPlacePurchasedWithStateConsentForNeedfulBuilding l c)


structure Smtj7Paragraph4 (l : Locus) (c : ComplaintText) : Prop where
  guano : IsIslandRockOrKeyContainingGuanoDeposits l c
  appertaining : IsPresidentiallyConsideredAppertainingToUnitedStates l c


structure Smtj7Paragraph5 (l : Locus) (c : ComplaintText) : Prop where
  aircraft : IsAircraftBelongingToUnitedStatesOrCitizenOrCorporation l c
  inFlight : IsAircraftInFlightOverHighSeasOrAdmiraltyWaters l c


structure Smtj7Paragraph6 (l : Locus) (c : ComplaintText) : Prop where
  registry : IsSpaceVehicleOnUnitedStatesRegistry l c
  inFlight : IsSpaceVehicleInFlight l c



structure Smtj7Paragraph7 (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  outsideAnyNation : IsPlaceOutsideJurisdictionOfAnyNation l c
  nationalNexus : IsOffenseByOrAgainstNationalOfTheUnitedStates o c



structure Smtj7Paragraph8 (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  permitted : IsPermittedByInternationalLaw l o c
  foreignVessel : IsForeignVesselOnVoyageScheduledToOrFromUnitedStates l c
  nationalNexus : IsOffenseByOrAgainstNationalOfTheUnitedStates o c


inductive Smtj7MissionPlace (l : Locus) (c : ComplaintText) : Prop where
  | premises (h : IsUnitedStatesMissionPremisesInForeignState l c)
  | residence (h : IsResidenceInForeignStateUsedForMissionPurposes l c)



structure Smtj7Paragraph9 (p : Person) (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  nationalNexus : IsOffenseByOrAgainstNationalOfTheUnitedStates o c
  place : Smtj7MissionPlace l c
  noTreatyConflict : ¬ ConflictsWithTreatyOrInternationalAgreement l o c
  notSection3261aOffender : ¬ OffenderDescribedInSection3261a p c



inductive SpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  | highSeasOrVessel (h : Smtj7Paragraph1 l c)
  | greatLakesVessel (h : Smtj7Paragraph2 l c)
  | federalEnclave (h : Smtj7Paragraph3 l c)
  | guanoIsland (h : Smtj7Paragraph4 l c)
  | aircraft (h : Smtj7Paragraph5 l c)
  | spaceVehicle (h : Smtj7Paragraph6 l c)
  | placeOutsideAnyNation (h : Smtj7Paragraph7 l o c)
  | foreignVessel (h : Smtj7Paragraph8 l o c)
  | missionPremises (h : Smtj7Paragraph9 p l o c)


abbrev IsWithinSpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (l : Locus) (o : Offense) (c : ComplaintText) : Prop :=
  SpecialMaritimeAndTerritorialJurisdiction p l o c




inductive FinancialInstitution (i : Institution) (c : ComplaintText) : Prop where
  | insuredDepository (h : IsInsuredDepositoryInstitution i c)
  | creditUnion (h : IsCreditUnionWithInsuredAccounts i c)
  | homeLoanBank (h : IsFederalHomeLoanBankOrMember i c)
  | farmCredit (h : IsFarmCreditSystemInstitution i c)
  | sbic (h : IsSmallBusinessInvestmentCompany i c)
  | holdingCompany (h : IsDepositoryInstitutionHoldingCompany i c)
  | reserveBank (h : IsFederalReserveBankOrMemberBank i c)
  | edgeActOrganization (h : IsOrganizationOperatingUnderFederalReserveActSection25 i c)
  | foreignBankBranch (h : IsBranchOrAgencyOfForeignBank i c)
  | mortgageLender (h : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c)


abbrev IsFinancialInstitution (i : Institution) (c : ComplaintText) : Prop :=
  FinancialInstitution i c




inductive OfficialRepresentation (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  | byOfficer (h : RepresentationMadeByFederalLawEnforcementOfficer p pr c)
  | atOfficerDirection (h : RepresentationMadeAtDirectionOrApprovalOfFederalLawEnforcementOfficer p pr c)



structure ActualCharacterRoute (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  character : PropertyOfProscribedCharacter pr c
  knowledge : DefendantKnewPropertyOfProscribedCharacter p pr c



structure OfficialRepresentationRoute (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  representation : OfficialRepresentation p pr c
  belief : DefendantBelievedPropertyOfProscribedCharacter p pr c
  sequence : BeliefFollowedOfficialRepresentation p pr c



inductive StolenOrCounterfeitNatureElement (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  | actual (h : ActualCharacterRoute p pr c)
  | officialRepresentation (h : OfficialRepresentationRoute p pr c)


abbrev StolenOrCounterfeitNatureEstablished
    (p : Person) (pr : Property) (c : ComplaintText) : Prop :=
  StolenOrCounterfeitNatureElement p pr c





inductive CourtOfTheUnitedStatesRoute (t : Tribunal) (c : ComplaintText) : Prop where
  | guam (h : IsDistrictCourtOfGuam t c)
  | northernMariana (h : IsDistrictCourtForNorthernMarianaIslands t c)
  | virginIslands (h : IsDistrictCourtOfTheVirginIslands t c)
  | ordinaryMeaning (h : IsCourtOfTheUnitedStatesUnderOrdinaryMeaning t c)



structure CourtOfTheUnitedStates (t : Tribunal) (c : ComplaintText) : Prop where
  route : CourtOfTheUnitedStatesRoute t c
  notOtherwiseProvided : ¬ OtherwiseExpresslyProvided t c


abbrev IsCourtOfTheUnitedStates (t : Tribunal) (c : ComplaintText) : Prop :=
  CourtOfTheUnitedStates t c




inductive ViolationOrConspiracy (o : Offense) (c : ComplaintText) : Prop where
  | violation (h : IsCompletedViolation o c)
  | conspiracy (h : IsCriminalConspiracyToViolate o c)


structure FederalHealthCareOffenseParagraph1 (o : Offense) (c : ComplaintText) : Prop where
  mode : ViolationOrConspiracy o c
  listed : TargetsOffenseListedInSection24a1 o c



structure FederalHealthCareOffenseParagraph2 (o : Offense) (c : ComplaintText) : Prop where
  mode : ViolationOrConspiracy o c
  listed : TargetsOffenseListedInSection24a2 o c
  relatedness : RelatesToHealthCareBenefitProgram o c


inductive FederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop where
  | perSe (h : FederalHealthCareOffenseParagraph1 o c)
  | relatedFraud (h : FederalHealthCareOffenseParagraph2 o c)


abbrev IsFederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop :=
  FederalHealthCareOffense o c



structure HealthCareBenefitPlan (hp : HealthCareProgram) (c : ComplaintText) : Prop where
  planOrContract : IsPublicOrPrivatePlanOrContract hp c
  commerce : AffectsCommerce hp c
  medicalBenefit : ProvidesMedicalBenefitItemOrServiceToIndividual hp c



inductive HealthCareBenefitProgram (hp : HealthCareProgram) (c : ComplaintText) : Prop where
  | plan (h : HealthCareBenefitPlan hp c)
  | provider (h : IsProviderOfMedicalBenefitPayableUnderPlanOrContract hp c)


abbrev IsHealthCareBenefitProgram (hp : HealthCareProgram) (c : ComplaintText) : Prop :=
  HealthCareBenefitProgram hp c




inductive Circumstance1028 (d : Document) (o : Offense) (c : ComplaintText) : Prop where
  | federalOrSpecialEventDocument (h : DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c)
  | implementForSuchDocument (h : DocumentMakingImplementDesignedOrSuitedForSuchDocument d c)
  | defraudUnitedStatesOffense (h : OffenseIsUnderSection1028a4 o c)
  | commerce (h : ProhibitedConductAffectsInterstateOrForeignCommerce o c)
  | mails (h : ItemTransportedInTheMailInCourseOfProhibitedConduct o c)


structure Section1028a1 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  withoutAuthority : WithoutLawfulAuthorityOverDocument p d c
  produces : ProducesIdentificationDocumentOrAuthenticationFeature p d c



structure Section1028a2 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  transfers : TransfersIdentificationDocumentOrAuthenticationFeature p d c
  knowsTainted : KnowsDocumentStolenOrProducedWithoutLawfulAuthority p d c



structure Section1028a3 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  possesses : PossessesIdentificationDocumentOrAuthenticationFeature p d c
  notOwnLawfulDocuments : NotIssuedLawfullyForUseOfPossessor p d c
  unlawfulIntent : IntentToUseOrTransferUnlawfully p d c
  fiveOrMore : 5 ≤ identificationDocumentsPossessed p d c



structure Section1028a4 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  possesses : PossessesIdentificationDocumentOrAuthenticationFeature p d c
  notOwnLawfulDocuments : NotIssuedLawfullyForUseOfPossessor p d c
  intentToDefraudUnitedStates : IntentDocumentBeUsedToDefraudTheUnitedStates p d c


structure Section1028a5 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct : ProducesTransfersOrPossessesDocumentMakingImplement p d c
  productionIntent : IntentImplementUsedToProduceFalseDocumentOrImplement p d c



structure Section1028a6 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  possesses : PossessesIdentificationDocumentOrAuthenticationFeature p d c
  appearsUnitedStates : DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c
  tainted : DocumentStolenOrProducedWithoutLawfulAuthority d c
  knowsTainted : KnowsDocumentStolenOrProducedWithoutLawfulAuthority p d c



inductive UnlawfulActivity1028 (m : MeansOfIdentification) (c : ComplaintText) : Prop where
  | federal (h : UnlawfulActivityViolatesFederalLaw m c)
  | stateOrLocalFelony (h : UnlawfulActivityIsStateOrLocalFelony m c)


structure Section1028a7 (p : Person) (m : MeansOfIdentification) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct : TransfersPossessesOrUsesMeansOfIdentification p m c
  withoutAuthority : WithoutLawfulAuthorityOverMeansOfIdentification p m c
  ofAnother : MeansOfIdentificationOfAnotherPerson m c
  unlawfulPurpose : IntentOrConnectionWithUnlawfulActivity p m c
  predicateActivity : UnlawfulActivity1028 m c


structure Section1028a8 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  traffics : TrafficsInAuthenticationFeatures p d c
  intendedUse : AuthenticationFeaturesForUseInFalseDocumentsOrMeansOfIdentification d c


inductive Conduct1028
    (p : Person) (d : Document) (m : MeansOfIdentification) (c : ComplaintText) : Prop where
  | produces (h : Section1028a1 p d c)
  | transfers (h : Section1028a2 p d c)
  | possessesFiveOrMore (h : Section1028a3 p d c)
  | possessesToDefraudUnitedStates (h : Section1028a4 p d c)
  | documentMakingImplement (h : Section1028a5 p d c)
  | possessesStolenFederalDocument (h : Section1028a6 p d c)
  | meansOfIdentification (h : Section1028a7 p m c)
  | trafficsAuthenticationFeatures (h : Section1028a8 p d c)




structure Section1028a
    (p : Person) (d : Document) (m : MeansOfIdentification) (o : Offense) (c : ComplaintText) : Prop where
  conduct : Conduct1028 p d m c
  circumstance : Circumstance1028 d o c
  notExemptActivity : ¬ LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c


abbrev ViolatesSection1028a
    (p : Person) (d : Document) (m : MeansOfIdentification) (o : Offense) (c : ComplaintText) : Prop :=
  Section1028a p d m o c



inductive Section1028Inchoate (p : Person) (c : ComplaintText) : Prop where
  | attempt (h : AttemptsToCommitSection1028Offense p c)
  | conspiracy (h : ConspiresToCommitSection1028Offense p c)




structure Section1029a1 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : ProducesUsesOrTrafficsInAccessDevice p ad c
  counterfeit : IsCounterfeitAccessDevice ad c



structure Section1029a2 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : TrafficsInOrUsesAccessDevice p ad c
  unauthorized : IsUnauthorizedAccessDevice ad c
  oneYearPeriod : ConductOccurredWithinOneYearPeriod p ad c
  thresholdMet : 1000 ≤ valueObtainedDuringOneYearPeriodDollars p ad c


inductive CounterfeitOrUnauthorized (ad : AccessDevice) (c : ComplaintText) : Prop where
  | counterfeit (h : IsCounterfeitAccessDevice ad c)
  | unauthorized (h : IsUnauthorizedAccessDevice ad c)



structure Section1029a3 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  possesses : PossessesAccessDevices p ad c
  character : CounterfeitOrUnauthorized ad c
  fifteenOrMore : 15 ≤ counterfeitOrUnauthorizedDevicesPossessed p ad c


structure Section1029a4 (p : Person) (eq : Equipment) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : ProducesTrafficsControlsOrPossessesEquipment p eq c
  deviceMakingEquipment : IsDeviceMakingEquipment eq c



structure Section1029a5 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : EffectsTransactionsWithAccessDeviceIssuedToAnother p ad c
  oneYearPeriod : ConductOccurredWithinOneYearPeriod p ad c
  thresholdMet : 1000 ≤ aggregateTransactionValueDuringOneYearPeriodDollars p ad c


inductive SolicitationPurpose (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  | offering (h : PurposeOfOfferingAccessDevice p ad c)
  | sellingInformation (h : PurposeOfSellingAccessDeviceInformationOrApplication p ad c)


structure Section1029a6 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  withoutIssuerAuthorization : WithoutAuthorizationOfIssuer p ad c
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  solicits : SolicitsPersonRegardingAccessDevice p ad c
  purpose : SolicitationPurpose p ad c


structure Section1029a7 (p : Person) (eq : Equipment) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c
  modifiedInstrument : IsTelecommunicationsInstrumentModifiedForUnauthorizedUse eq c


structure Section1029a8 (p : Person) (eq : Equipment) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  conduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c
  scanningReceiver : IsScanningReceiver eq c





structure Section1029a9 (p : Person) (eq : Equipment) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct : UsesProducesTrafficsControlsOrPossessesEquipment p eq c
  configured : IsHardwareOrSoftwareConfiguredToAlterTelecommunicationIdentifyingInformation eq c
  knowsConfigured : KnowsHardwareOrSoftwareSoConfigured p eq c
  notCarrierProtection : ¬ CarrierProtectionExemption p eq c



structure Section1029a10 (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  withoutMemberAuthorization : WithoutAuthorizationOfCreditCardSystemMember p ad c
  scienter : ActedWithScienter p c
  fraudIntent : IntentToDefraud p c
  causesPresentment : CausesOrArrangesPresentmentOfTransactionRecords p ad c


inductive Conduct1029
    (p : Person) (ad : AccessDevice) (eq : Equipment) (c : ComplaintText) : Prop where
  | counterfeitDevices (h : Section1029a1 p ad c)
  | unauthorizedDevices (h : Section1029a2 p ad c)
  | fifteenOrMoreDevices (h : Section1029a3 p ad c)
  | deviceMakingEquipment (h : Section1029a4 p eq c)
  | transactionsOnAnothersDevice (h : Section1029a5 p ad c)
  | solicitation (h : Section1029a6 p ad c)
  | modifiedInstrument (h : Section1029a7 p eq c)
  | scanningReceiver (h : Section1029a8 p eq c)
  | cloningHardwareOrSoftware (h : Section1029a9 p eq c)
  | presentmentOfRecords (h : Section1029a10 p ad c)




structure Section1029a
    (p : Person) (ad : AccessDevice) (eq : Equipment) (o : Offense) (c : ComplaintText) : Prop where
  conduct : Conduct1029 p ad eq c
  commerce : OffenseAffectsInterstateOrForeignCommerce o c
  notExemptActivity : ¬ LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c


abbrev ViolatesSection1029a
    (p : Person) (ad : AccessDevice) (eq : Equipment) (o : Offense) (c : ComplaintText) : Prop :=
  Section1029a p ad eq o c



structure Section1029Conspiracy (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  membership : PartyToConspiracyToCommitSection1029Offense p ag c
  conductInFurtherance : PartyEngagedInConductInFurtherance ag c


inductive Section1029Inchoate (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt (h : AttemptsToCommitSection1029Offense p c)
  | conspiracy (h : Section1029Conspiracy p ag c)


structure Section1029h (p : Person) (ad : AccessDevice) (c : ComplaintText) : Prop where
  outsideJurisdiction : ActOutsideJurisdictionOfTheUnitedStates p c
  wouldBeOffense : WouldConstituteSection1029OffenseIfCommittedWithinUnitedStates p c
  unitedStatesNexus : AccessDeviceConnectedToUnitedStatesEntity ad c

end Proving.USC.T18.Ch1Ch47.Recert2.Elements
