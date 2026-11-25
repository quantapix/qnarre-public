import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements.Predicates










set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements

open Proving.USC.Common




structure Section111a1 (d v : Person) (c : ComplaintText) : Prop where
  forcibleAct : ForciblyAssaultsOrImpedes d v c
  protectedOfficer : IsSection1114ProtectedOfficer v c
  dutiesNexus : EngagedInOrOnAccountOfOfficialDuties v c


structure Section111a2 (d v : Person) (c : ComplaintText) : Prop where
  forcibleAct : ForciblyAssaultsOrIntimidates d v c
  formerOfficer : IsFormerSection1114ProtectedOfficer v c
  dutiesNexus : OnAccountOfDutiesDuringTermOfService v c


inductive Section111a (d v : Person) (c : ComplaintText) : Prop where
  | serving (h : Section111a1 d v c)
  | former (h : Section111a2 d v c)


inductive Section111bAggravator (d v : Person) (w : DangerousWeapon)
    (c : ComplaintText) : Prop where
  | weapon (h : UsesDeadlyOrDangerousWeapon d w c)
  | injury (h : InflictsBodilyInjury d v c)


structure Section111b (d v : Person) (w : DangerousWeapon)
    (c : ComplaintText) : Prop where
  base : Section111a d v c
  aggravator : Section111bAggravator d v w c


inductive Section111EnhancedCircumstance (d v : Person) (c : ComplaintText) : Prop where
  | contact (h : PhysicalContactWithVictim d v c)
  | felonyIntent (h : IntentToCommitAnotherFelony d c)


abbrev ExtraterritorialReachCh7 (c : ComplaintText) : Prop :=
  ExtraterritorialJurisdictionOverConduct c



structure Section112aAttackOnPerson (d v : Person) (c : ComplaintText) : Prop where
  protectedPerson : IsProtectedForeignPerson v c
  attack : ViolentAttackOnPerson d v c

structure Section112aAttackOnPremises (d v : Person) (c : ComplaintText) : Prop where
  protectedPerson : IsProtectedForeignPerson v c
  attack : ViolentAttackOnProtectedPremises d v c
  endangerment : LikelyToEndangerPersonOrLiberty v c

structure Section112aAttempt (d v : Person) (c : ComplaintText) : Prop where
  protectedPerson : IsProtectedForeignPerson v c
  attempt : AttemptsProhibitedAttack d v c


inductive Section112aRoute (d v : Person) (c : ComplaintText) : Prop where
  | person (h : Section112aAttackOnPerson d v c)
  | premises (h : Section112aAttackOnPremises d v c)
  | attempt (h : Section112aAttempt d v c)


structure Section112a (d v : Person) (c : ComplaintText) : Prop where
  route : Section112aRoute d v c
  notProtectedSpeech : ¬ ExercisesProtectedFirstAmendmentRight d c


inductive Section112b1Conduct (d v : Person) (c : ComplaintText) : Prop where
  | harass (h : IntimidatesCoercesThreatensOrHarasses d v c)
  | obstruct (h : ObstructsForeignOfficialInDuties d v c)

structure Section112b1 (d v : Person) (c : ComplaintText) : Prop where
  willful : ActedWithScienter d c
  protectedPerson : IsProtectedForeignPerson v c
  conduct : Section112b1Conduct d v c

structure Section112b2 (d v : Person) (c : ComplaintText) : Prop where
  willful : ActedWithScienter d c
  protectedPerson : IsProtectedForeignPerson v c
  attempt : AttemptsIntimidationOrObstruction d v c

structure Section112b3 (d : Person) (c : ComplaintText) : Prop where
  willful : ActedWithScienter d c
  proximity : WithinOneHundredFeetOfProtectedPremises d c
  congregation : CongregatesWithTwoOrMoreOthers d c
  intent : IntentToViolateSection112 d c

inductive Section112bRoute (d v : Person) (c : ComplaintText) : Prop where
  | intimidation (h : Section112b1 d v c)
  | attempt (h : Section112b2 d v c)
  | congregation (h : Section112b3 d c)


structure Section112b (d v : Person) (c : ComplaintText) : Prop where
  route : Section112bRoute d v c
  notProtectedSpeech : ¬ ExercisesProtectedFirstAmendmentRight d c


inductive Section112eBasis (d v : Person) (c : ComplaintText) : Prop where
  | unitedStatesAgent (h : VictimIsUnitedStatesRepresentativeOrAgent v c)
  | nationalOffender (h : OffenderIsNationalOfTheUnitedStates d c)
  | foundInUnitedStates (h : OffenderFoundInTheUnitedStates d c)

structure Section112eJurisdiction (d v : Person) (c : ComplaintText) : Prop where
  protectedPersonAbroad : VictimIsInternationallyProtectedPersonAbroad v c
  basis : Section112eBasis d v c




structure Section113Core (d v : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialMaritimeAndTerritorialJurisdiction c
  assault : CommitsAssault d v c

structure Section113a1 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  intent : IntentToCommitMurderOrSexualAbuse d c

structure Section113a2 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  intent : IntentToCommitFelony d c

structure Section113a3 (d v : Person) (w : DangerousWeapon)
    (c : ComplaintText) : Prop where
  core : Section113Core d v c
  weapon : AssaultWithDangerousWeapon d w c
  intent : IntentToDoBodilyHarm d c

structure Section113a4 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  manner : AssaultByStrikingBeatingOrWounding d v c

structure Section113a5 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  simple : IsSimpleAssault d v c

structure Section113a6 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  injury : ResultsInSeriousBodilyInjury d v c


inductive Section113a7Victim (d v : Person) (c : ComplaintText) : Prop where
  | partner (h : IsSpouseIntimateOrDatingPartner d v c)
  | minor (h : VictimUnderSixteen v c)

structure Section113a7 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  injury : ResultsInSubstantialBodilyInjury d v c
  victimClass : Section113a7Victim d v c

structure Section113a8 (d v : Person) (c : ComplaintText) : Prop where
  core : Section113Core d v c
  partner : IsSpouseIntimateOrDatingPartner d v c
  manner : AssaultByStranglingOrSuffocating d v c


inductive Section113a (d v : Person) (w : DangerousWeapon)
    (c : ComplaintText) : Prop where
  | intentMurderOrSexualAbuse (h : Section113a1 d v c)
  | intentFelony (h : Section113a2 d v c)
  | dangerousWeapon (h : Section113a3 d v w c)
  | strikingBeatingWounding (h : Section113a4 d v c)
  | simpleAssault (h : Section113a5 d v c)
  | seriousBodilyInjury (h : Section113a6 d v c)
  | substantialBodilyInjury (h : Section113a7 d v c)
  | stranglingOrSuffocating (h : Section113a8 d v c)



inductive Section114Actus (d v : Person) (c : ComplaintText) : Prop where
  | mutilation (h : MutilatesOrDisablesBodyPart d v c)
  | corrosive (h : ThrowsCorrosiveOrScaldingSubstance d v c)

structure Section114 (d v : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialMaritimeAndTerritorialJurisdiction c
  intent : IntentToTortureMaimOrDisfigure d c
  actus : Section114Actus d v c




inductive Section115Conduct (d t : Person) (c : ComplaintText) : Prop where
  | completed (h : AssaultsKidnapsOrMurders d t c)
  | inchoate (h : AttemptsOrConspiresToKidnapOrMurder d t c)
  | threat (h : ThreatensToAssaultKidnapOrMurder d t c)


inductive Section115Intent (d : Person) (c : ComplaintText) : Prop where
  | impede (h : IntentToImpedeOrInterfereWithOfficialDuties d c)
  | retaliate (h : IntentToRetaliateForOfficialDuties d c)


structure Section115a1A (d fm v : Person) (c : ComplaintText) : Prop where
  official : IsCoveredFederalOfficial v c
  family : IsImmediateFamilyMember fm v c
  conduct : Section115Conduct d fm c
  intent : Section115Intent d c


structure Section115a1B (d v : Person) (c : ComplaintText) : Prop where
  official : IsCoveredFederalOfficial v c
  threat : ThreatensToAssaultKidnapOrMurder d v c
  intent : Section115Intent d c


inductive Section115a2Target (d fm v : Person) (c : ComplaintText) : Prop where
  | official (h : Section115Conduct d v c)
  | family (hf : IsImmediateFamilyMember fm v c) (h : Section115Conduct d fm c)

structure Section115a2 (d fm v : Person) (c : ComplaintText) : Prop where
  formerOfficial : IsFormerCoveredFederalOfficial v c
  target : Section115a2Target d fm v c
  intent : IntentToRetaliateForOfficialDuties d c

inductive Section115a (d fm v : Person) (c : ComplaintText) : Prop where
  | familyTarget (h : Section115a1A d fm v c)
  | officialThreat (h : Section115a1B d v c)
  | formerService (h : Section115a2 d fm v c)



inductive Section116Conduct (d v : Person) (c : ComplaintText) : Prop where
  | performs (h : PerformsFemaleGenitalMutilation d v c)
  | facilitates (h : ParentOrGuardianFacilitatesOrConsents d v c)
  | transports (h : TransportsForPurposeOfMutilation d v c)


inductive Section116dCircumstance (d : Person) (c : ComplaintText) : Prop where
  | travel (h : DefendantOrVictimTraveledInCommerce d c)
  | instrumentality (h : UsedInstrumentalityOfCommerce d c)
  | payment (h : PaymentMadeUsingCommerce d c)
  | communication (h : TransmittedCommunicationInCommerce d c)
  | object (h : ObjectUsedTraveledInCommerce d c)
  | federalTerritory (h : ConductWithinFederalTerritory d c)
  | otherwiseCommerce (h : ConductOtherwiseAffectedCommerce d c)



inductive Section116bException (d v : Person) (c : ComplaintText) : Prop where
  | healthNecessity (h : OperationNecessaryToHealth v c)
      (hp : PerformedByLicensedMedicalPractitioner d c)
  | laborOrBirth (h : OperationForLaborOrBirthPurposes v c)
      (hp : PerformedByLicensedMidwifeOrTrainee d c)

structure Section116a (d v : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  conduct : Section116Conduct d v c
  minorVictim : VictimUnderEighteen v c
  circumstance : Section116dCircumstance d c
  noMedicalException : ¬ Section116bException d v c



inductive QualifyingPriorOffense (pc : PriorConviction) (c : ComplaintText) : Prop where
  | domesticViolent (h : PriorOffenseAgainstSpouseOrChild pc c)
  | chapter110A (h : PriorOffenseUnderChapter110A pc c)

structure QualifyingPriorConviction (pc : PriorConviction)
    (c : ComplaintText) : Prop where
  final : PriorConvictionIsFinal pc c
  offense : QualifyingPriorOffense pc c



abbrev HasTwoOrMorePriorQualifyingConvictions (d : Person)
    (c : ComplaintText) : Prop :=
  PriorQualifyingConvictionCount d c ≥ 2


structure DomesticAssault (d v : Person) (c : ComplaintText) : Prop where
  assault : CommitsAssault d v c
  relationship : IsDomesticRelationship d v c

structure Section117 (d v : Person) (pc₁ pc₂ : PriorConviction)
    (c : ComplaintText) : Prop where
  jurisdiction : WithinFederalOrIndianCountryJurisdiction c
  domesticAssault : DomesticAssault d v c
  firstPrior : QualifyingPriorConviction pc₁ c
  secondPrior : QualifyingPriorConviction pc₂ c
  priorCount : HasTwoOrMorePriorQualifyingConvictions d c


structure Section117Enhanced (d v : Person) (pc₁ pc₂ : PriorConviction)
    (c : ComplaintText) : Prop where
  base : Section117 d v pc₁ pc₂ c
  injury : ResultsInSubstantialBodilyInjury d v c



structure Section118 (d v : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  conduct : ObstructsResistsOrInterferes d v c
  agent : IsFederalLawEnforcementAgent v c
  protectiveFunction : EngagedInStatutoryProtectiveFunctions v c
  jurisdiction : WithinUnitedStatesOrSpecialJurisdiction c




inductive CoveredPerson119 (v : Person) (c : ComplaintText) : Prop where
  | section1114Designee (h : IsSection1114ProtectedOfficer v c)
  | courtOfficer (h : IsCourtOfficerJurorOrWitness v c)
  | informant (h : IsFederalInformantOrWitness v c)
  | stateOrLocalAssistant (h : IsStateOrLocalOfficerAssistingFederalInvestigation v c)



inductive Section119Subject (v fm : Person) (c : ComplaintText) : Prop where
  | coveredPerson (h : CoveredPerson119 v c)
  | familyMember (h : CoveredPerson119 v c) (hf : IsImmediateFamilyMember fm v c)

inductive Section119Intent (d : Person) (c : ComplaintText) : Prop where
  | toThreaten (h : IntentToThreatenIntimidateOrInciteViolence d c)
  | knowledgeOfUse (h : IntentAndKnowledgeInformationWillBeUsedToThreaten d c)

structure Section119 (d v fm : Person) (i : RestrictedPersonalInfo)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  subject : Section119Subject v fm c
  restrictedInfo : IsRestrictedPersonalInformation i v c
  publication : MakesRestrictedInformationPubliclyAvailable d i c
  intent : Section119Intent d c



structure Section151Debtor (dbtr : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  petition : PetitionFiledUnderTitle11 dbtr bc c


abbrev IsDebtorUnderTitle11 (dbtr : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop := Section151Debtor dbtr bc c



structure Section152P1 (d : Person) (pr : EstateProperty)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  concealment : ConcealsPropertyFromEstateOfficer d pr c
  estateProperty : PropertyBelongsToDebtorEstate pr c

structure Section152P2 (d : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  falseOath : MakesFalseOathOrAccount d c
  caseNexus : InOrInRelationToTitle11Case bc c

structure Section152P3 (d : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  falseDeclaration : MakesFalseDeclarationUnderPenaltyOfPerjury d c
  caseNexus : InOrInRelationToTitle11Case bc c

structure Section152P4 (d : Person) (cl : ProofOfClaim)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  presentation : PresentsOrUsesClaimAgainstEstate d cl c
  falsity : ClaimIsFalse cl c

structure Section152P5 (d : Person) (pr : EstateProperty) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  receipt : ReceivesMaterialAmountOfPropertyFromDebtor d pr c
  afterFiling : AfterFilingOfTitle11Case bc c
  intent : IntentToDefeatTitle11 d c

structure Section152P6 (d : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  consideration : GivesOrObtainsUnlawfulConsideration d c
  purpose : ForActingOrForbearingInTitle11Case d c
  caseNexus : InOrInRelationToTitle11Case bc c


inductive Section152P7Predicate (d : Person) (c : ComplaintText) : Prop where
  | contemplation (h : InContemplationOfTitle11Case d c)
  | intentToDefeat (h : IntentToDefeatTitle11 d c)

structure Section152P7 (d : Person) (pr : EstateProperty)
    (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  transfer : TransfersOrConcealsProperty d pr c
  predicate : Section152P7Predicate d c


inductive Section152P8Timing (d : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  | afterFiling (h : AfterFilingOfTitle11Case bc c)
  | contemplation (h : InContemplationOfTitle11Case d c)

structure Section152P8 (d : Person) (doc : RecordedInformation)
    (bc : BankruptcyCase) (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  timing : Section152P8Timing d bc c
  falsification : ConcealsDestroysOrFalsifiesRecordedInformation d doc c
  relevance : RecordedInformationRelatesToDebtorAffairs doc c

structure Section152P9 (d : Person) (doc : RecordedInformation)
    (bc : BankruptcyCase) (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  afterFiling : AfterFilingOfTitle11Case bc c
  withholding : WithholdsRecordedInformationFromOfficer d doc c
  entitlement : OfficerEntitledToPossession doc c
  relevance : RecordedInformationRelatesToDebtorAffairs doc c


inductive Section152 (d : Person) (pr : EstateProperty) (doc : RecordedInformation)
    (cl : ProofOfClaim) (bc : BankruptcyCase) (c : ComplaintText) : Prop where
  | concealment (h : Section152P1 d pr c)
  | falseOath (h : Section152P2 d bc c)
  | falseDeclaration (h : Section152P3 d bc c)
  | falseClaim (h : Section152P4 d cl c)
  | receiptFromDebtor (h : Section152P5 d pr bc c)
  | bribery (h : Section152P6 d bc c)
  | fraudulentTransfer (h : Section152P7 d pr c)
  | recordFalsification (h : Section152P8 d doc bc c)
  | recordWithholding (h : Section152P9 d doc bc c)




structure Section153Fiduciary (d : Person) (c : ComplaintText) : Prop where
  participation : ParticipatesInEstateAdministration d c
  access : HasAccessToEstatePropertyOrDocuments d c

inductive Section153Actus (d : Person) (pr : EstateProperty)
    (doc : RecordedInformation) (c : ComplaintText) : Prop where
  | property (h : AppropriatesEmbezzlesOrTransfersEstateProperty d pr c)
  | document (h : SecretesOrDestroysEstateDocument d doc c)

structure Section153 (d : Person) (pr : EstateProperty)
    (doc : RecordedInformation) (c : ComplaintText) : Prop where
  scienter : ActsKnowinglyAndFraudulently d c
  fiduciary : Section153Fiduciary d c
  actus : Section153Actus d pr doc c



structure Section154P1 (d : Person) (pr : EstateProperty)
    (c : ComplaintText) : Prop where
  officer : IsCourtOfficerInTitle11Case d c
  scienter : ActedWithScienter d c
  purchase : PurchasesPropertyOfEstate d pr c

structure Section154P2 (d : Person) (c : ComplaintText) : Prop where
  officer : IsCourtOfficerInTitle11Case d c
  scienter : ActedWithScienter d c
  refusal : RefusesInspectionByPartiesInInterest d c
  courtDirection : CourtDirectedInspection d c

structure Section154P3 (d : Person) (c : ComplaintText) : Prop where
  officer : IsCourtOfficerInTitle11Case d c
  scienter : ActedWithScienter d c
  refusal : RefusesInspectionByUnitedStatesTrustee d c

inductive Section154 (d : Person) (pr : EstateProperty)
    (c : ComplaintText) : Prop where
  | selfDealingPurchase (h : Section154P1 d pr c)
  | refusalToPartiesInInterest (h : Section154P2 d c)
  | refusalToUnitedStatesTrustee (h : Section154P3 d c)



structure Section155 (d : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  partyInInterest : IsPartyInInterestOrAttorney d c
  forum : InReceivershipOrTitle11CaseInUnitedStatesCourt c
  scienter : ActsKnowinglyAndFraudulently d c
  agreement : AgreementAmongTwoOrMore ag c
  counterparty : AgreementWithAnotherPartyInInterest ag c
  feeFixingPurpose : AgreementFixesFeesFromEstateAssets ag c



structure Section156 (d : Person) (bc : BankruptcyCase)
    (c : ComplaintText) : Prop where
  preparer : IsBankruptcyPetitionPreparer d c
  disregard : KnowingAttemptToDisregardBankruptcyRequirements d c
  dismissal : CaseOrProceedingDismissed bc c
  causation : DismissalCausedByPreparerDisregard d bc c



inductive Section157Actus (d : Person) (bc : BankruptcyCase)
    (doc : RecordedInformation) (c : ComplaintText) : Prop where
  | petition (h : FilesPetitionUnderTitle11 d bc c)
  | document (h : FilesDocumentInTitle11Proceeding d doc c)
  | representation (h : MakesFalseRepresentationConcerningTitle11Proceeding d c)

structure Section157 (d : Person) (bc : BankruptcyCase)
    (doc : RecordedInformation) (c : ComplaintText) : Prop where
  scheme : DevisedOrIntendedSchemeToDefraud d c
  purpose : ForPurposeOfExecutingOrConcealingScheme d c
  actus : Section157Actus d bc doc c



structure Section158 (v : Person) (c : ComplaintText) : Prop where
  designation : AttorneyGeneralDesignatesEnforcementIndividuals c
  designee : DesigneeIsUnitedStatesAttorneyOrFbiAgent v c
  reaffirmationScope : DesignationCoversAbusiveReaffirmationEnforcement c
  scheduleScope : DesignationCoversMateriallyFraudulentSchedules c
  referralProcedures : BankruptcyCourtsEstablishReferralProcedures c



inductive BiologicalAgentCapability (m : BioMaterial) (c : ComplaintText) : Prop where
  | organism (h : CapableOfCausingDeathDiseaseOrMalfunction m c)
  | materials (h : CapableOfCausingDeteriorationOfMaterials m c)
  | environment (h : CapableOfDeleteriousAlterationOfEnvironment m c)

structure IsBiologicalAgent (m : BioMaterial) (c : ComplaintText) : Prop where
  substance : IsMicroorganismOrInfectiousSubstance m c
  capability : BiologicalAgentCapability m c

inductive IsToxin (m : BioMaterial) (c : ComplaintText) : Prop where
  | toxicMaterial (h : IsToxicMaterialOrProduct m c)
  | engineeredProduct (h : IsPoisonousSubstanceOrBiologicalProduct m c)
  | derivative (h : IsPoisonousIsomerHomologOrDerivative m c)

inductive IsDeliverySystem (m : BioMaterial) (c : ComplaintText) : Prop where
  | designedDelivery (h : SpecificallyDesignedToDeliverAgentOrToxin m c)
  | vector (h : IsVector m c)

inductive IsBiologicalAgentToxinOrDeliverySystem (m : BioMaterial)
    (c : ComplaintText) : Prop where
  | agent (h : IsBiologicalAgent m c)
  | toxin (h : IsToxin m c)
  | delivery (h : IsDeliverySystem m c)




abbrev ForUseAsWeapon (m : BioMaterial) (c : ComplaintText) : Prop :=
  LacksProphylacticProtectiveOrPeacefulPurpose m c

inductive Section175aConduct (d : Person) (m : BioMaterial) (org : Entity)
    (c : ComplaintText) : Prop where
  | weaponisation (h : DevelopsProducesOrPossessesBioMaterial d m c)
      (hw : ForUseAsWeapon m c)
  | assistance (h : AssistsForeignStateOrOrganization d org c)
  | inchoate (h : AttemptsThreatensOrConspiresToViolate d c)


structure Section175ProhibitedUse (d : Person) (m : BioMaterial) (org : Entity)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  material : IsBiologicalAgentToxinOrDeliverySystem m c
  conduct : Section175aConduct d m org c


structure Section175UnjustifiedPossession (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  material : IsBiologicalAgentToxinOrDeliverySystem m c
  possession : PossessesBioMaterial d m c
  unjustified : QuantityOrTypeNotReasonablyJustified m c
  notNaturallyOccurring : ¬ NaturallyOccurringAndUnextracted m c


structure Section175ExtraterritorialReach (d : Person)
    (c : ComplaintText) : Prop where
  nationalNexus : ExtraterritorialJurisdictionOverUnitedStatesNational d c



structure Section175aMilitaryAssistanceRequest (c : ComplaintText) : Prop where
  emergency : EmergencyInvolvingBiologicalWeaponOfMassDestruction c
  request : AttorneyGeneralRequestsMilitaryAssistance c
  enforcementPurpose : RequestSupportsSection175Enforcement c




inductive RestrictedPersonStatus (p : Person) (c : ComplaintText) : Prop where
  | underIndictment (h : UnderIndictmentForFelony p c)
  | convicted (h : ConvictedOfFelony p c)
  | fugitive (h : IsFugitiveFromJustice p c)
  | unlawfulDrugUser (h : IsUnlawfulUserOfControlledSubstance p c)
  | unlawfulAlien (h : IsAlienUnlawfullyInTheUnitedStates p c)
  | mentalAdjudication (h : AdjudicatedMentalDefectiveOrCommitted p c)
  | stateSponsorNational (h : IsNationalOrAgentOfStateSponsorOfTerrorism p c)
  | dishonorableDischarge (h : DischargedUnderDishonorableConditions p c)
  | terroristOrganization (h : IsMemberOrAgentOfTerroristOrganization p c)


abbrev IsRestrictedPerson (p : Person) (c : ComplaintText) : Prop :=
  RestrictedPersonStatus p c


structure IsListedSelectAgent (m : BioMaterial) (c : ComplaintText) : Prop where
  listed : ListedAsSelectAgentUnderPart73 m c
  notExempt : NotExcludedOrExemptedUnderPart73 m c

inductive Section175bA1Conduct (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  | shipTransportPossess (h : ShipsTransportsOrPossessesInCommerce d m c)
  | receive (h : ReceivesAgentShippedInCommerce d m c)

structure Section175bA (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  restricted : IsRestrictedPerson d c
  scienter : ActedWithScienter d c
  selectAgent : IsListedSelectAgent m c
  conduct : Section175bA1Conduct d m c
  notAuthorizedActivity : ¬ DulyAuthorizedUnitedStatesGovernmentalActivity d c

structure Section175bB1 (d tr : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  transfer : TransfersSelectAgentToTransferee d tr m c
  knowledge : TransferorKnowsOrHasReasonableCauseToBelieveUnregistered d tr c
  unregistered : TransfereeNotRegisteredUnderPublicHealthServiceAct tr c

structure Section175bB2 (d tr : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  listedAgent : AgentListedUnderAgriculturalBioterrorismAct m c
  transfer : TransfersSelectAgentToTransferee d tr m c
  knowledge : TransferorKnowsOrHasReasonableCauseToBelieveUnregistered d tr c
  unregistered : TransfereeNotRegisteredUnderAgriculturalBioterrorismAct tr c

structure Section175bC1 (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  possession : PossessesBioMaterial d m c
  selectAgent : IsListedSelectAgent m c
  unregistered : PossessorLacksRegistrationUnderPublicHealthServiceAct d m c

structure Section175bC2 (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  possession : PossessesBioMaterial d m c
  listedAgent : AgentListedUnderAgriculturalBioterrorismAct m c
  unregistered : PossessorLacksRegistrationUnderAgriculturalBioterrorismAct d m c

inductive Section175b (d tr : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  | restrictedPersonHandling (h : Section175bA d m c)
  | transferToUnregisteredSelectAgent (h : Section175bB1 d tr m c)
  | transferToUnregisteredAgricultural (h : Section175bB2 d tr m c)
  | unregisteredPossessionSelectAgent (h : Section175bC1 d m c)
  | unregisteredPossessionAgricultural (h : Section175bC2 d m c)




inductive Section175cJurisdiction (d v : Person) (c : ComplaintText) : Prop where
  | commerce (h : OffenseOccursInOrAffectsCommerce c)
  | abroadByNational (h : OffenseOutsideUnitedStatesByUnitedStatesNational d c)
  | againstNationalAbroad (h : OffenseAgainstUnitedStatesNationalAbroad v c)
  | againstUnitedStatesProperty (h : OffenseAgainstUnitedStatesProperty c)
  | aiderOrConspirator (h : AidsAbetsOrConspiresWithCoveredOffender d c)

structure Section175c (d v : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter d c
  variola : IsVariolaVirus m c
  conduct : HandlesOrUsesVariolaVirus d m c
  notSecretarialAuthority :
    ¬ ActsUnderAuthorityOfSecretaryOfHealthAndHumanServices d c
  jurisdiction : Section175cJurisdiction d v c

structure Section175cEnhancedUse (d v : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  base : Section175c d v m c
  use : UsesOrThreatensToUseVariolaVirus d m c

structure Section175cDeathResulting (d v : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  base : Section175c d v m c
  death : DeathResultsFromViolation c



inductive Section176SeizureAuthority (m : BioMaterial)
    (c : ComplaintText) : Prop where
  | warrant (h : SeizureWarrantIssued m c)
  | exigent (h : ExigentCircumstancesWithProbableCause m c)


structure Section176SeizureProhibitedConduct (m : BioMaterial)
    (c : ComplaintText) : Prop where
  ground : PertainsToConductProhibitedBySection175 m c
  authority : Section176SeizureAuthority m c


structure Section176SeizureNoJustification (m : BioMaterial)
    (c : ComplaintText) : Prop where
  ground : NoApparentPeacefulJustification m c
  authority : Section176SeizureAuthority m c



structure Section176Defense (m : BioMaterial) (c : ComplaintText) : Prop where
  peacefulPurpose : MaterialForProphylacticProtectiveOrPeacefulPurpose m c
  reasonableQuantity : TypeAndQuantityReasonableForPurpose m c


structure Section176ForfeitureProcess (c : ComplaintText) : Prop where
  notice : NoticeToPotentialClaimantsGiven c
  hearing : OpportunityForHearingProvided c
  burden : GovernmentCarriesPreponderanceBurden c

structure Section176ForfeitureProhibitedConduct (m : BioMaterial)
    (c : ComplaintText) : Prop where
  seizure : Section176SeizureProhibitedConduct m c
  process : Section176ForfeitureProcess c

structure Section176ForfeitureNoJustification (m : BioMaterial)
    (c : ComplaintText) : Prop where
  seizure : Section176SeizureNoJustification m c
  process : Section176ForfeitureProcess c
  noDefense : ¬ Section176Defense m c

inductive Section176Forfeiture (m : BioMaterial) (c : ComplaintText) : Prop where
  | prohibitedConduct (h : Section176ForfeitureProhibitedConduct m c)
  | noJustification (h : Section176ForfeitureNoJustification m c)





structure Section177Defense (m : BioMaterial) (c : ComplaintText) : Prop where
  peacefulPurpose : MaterialForProphylacticProtectiveOrPeacefulPurpose m c
  reasonableQuantity : TypeAndQuantityReasonableForPurpose m c

structure Section177ProhibitedConduct (d : Person) (c : ComplaintText) : Prop where
  civilAction : UnitedStatesBringsCivilAction c
  ground : ConductProhibitedBySection175 d c

structure Section177Inchoate (d : Person) (c : ComplaintText) : Prop where
  civilAction : UnitedStatesBringsCivilAction c
  ground : PreparationSolicitationAttemptThreatOrConspiracy d c

structure Section177Unjustified (d : Person) (m : BioMaterial)
    (c : ComplaintText) : Prop where
  civilAction : UnitedStatesBringsCivilAction c
  ground : UnjustifiedDevelopmentOrPossession d m c
  noDefense : ¬ Section177Defense m c

inductive Section177 (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop where
  | prohibitedConduct (h : Section177ProhibitedConduct d c)
  | inchoate (h : Section177Inchoate d c)
  | unjustified (h : Section177Unjustified d m c)

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements
