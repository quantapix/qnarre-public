import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements.Statute









set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements

open Proving.USC.Common



theorem section111a1_intro {d v : Person} {c : ComplaintText}
    (hAct : ForciblyAssaultsOrImpedes d v c)
    (hOfficer : IsSection1114ProtectedOfficer v c)
    (hDuties : EngagedInOrOnAccountOfOfficialDuties v c) :
    Section111a1 d v c := ⟨hAct, hOfficer, hDuties⟩

theorem section111a2_intro {d v : Person} {c : ComplaintText}
    (hAct : ForciblyAssaultsOrIntimidates d v c)
    (hFormer : IsFormerSection1114ProtectedOfficer v c)
    (hDuties : OnAccountOfDutiesDuringTermOfService v c) :
    Section111a2 d v c := ⟨hAct, hFormer, hDuties⟩

theorem section111a_intro_serving {d v : Person} {c : ComplaintText}
    (h : Section111a1 d v c) : Section111a d v c := .serving h

theorem section111a_intro_former {d v : Person} {c : ComplaintText}
    (h : Section111a2 d v c) : Section111a d v c := .former h

theorem section111bAggravator_intro_weapon {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : UsesDeadlyOrDangerousWeapon d w c) :
    Section111bAggravator d v w c := .weapon h

theorem section111bAggravator_intro_injury {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : InflictsBodilyInjury d v c) :
    Section111bAggravator d v w c := .injury h

theorem section111b_intro {d v : Person} {w : DangerousWeapon} {c : ComplaintText}
    (hBase : Section111a d v c) (hAgg : Section111bAggravator d v w c) :
    Section111b d v w c := ⟨hBase, hAgg⟩

theorem section111EnhancedCircumstance_intro_contact {d v : Person}
    {c : ComplaintText} (h : PhysicalContactWithVictim d v c) :
    Section111EnhancedCircumstance d v c := .contact h

theorem section111EnhancedCircumstance_intro_felonyIntent {d v : Person}
    {c : ComplaintText} (h : IntentToCommitAnotherFelony d c) :
    Section111EnhancedCircumstance d v c := .felonyIntent h



theorem section112aAttackOnPerson_intro {d v : Person} {c : ComplaintText}
    (hProtected : IsProtectedForeignPerson v c)
    (hAttack : ViolentAttackOnPerson d v c) :
    Section112aAttackOnPerson d v c := ⟨hProtected, hAttack⟩

theorem section112aAttackOnPremises_intro {d v : Person} {c : ComplaintText}
    (hProtected : IsProtectedForeignPerson v c)
    (hAttack : ViolentAttackOnProtectedPremises d v c)
    (hEndanger : LikelyToEndangerPersonOrLiberty v c) :
    Section112aAttackOnPremises d v c := ⟨hProtected, hAttack, hEndanger⟩

theorem section112aAttempt_intro {d v : Person} {c : ComplaintText}
    (hProtected : IsProtectedForeignPerson v c)
    (hAttempt : AttemptsProhibitedAttack d v c) :
    Section112aAttempt d v c := ⟨hProtected, hAttempt⟩

theorem section112aRoute_intro_person {d v : Person} {c : ComplaintText}
    (h : Section112aAttackOnPerson d v c) : Section112aRoute d v c := .person h

theorem section112aRoute_intro_premises {d v : Person} {c : ComplaintText}
    (h : Section112aAttackOnPremises d v c) : Section112aRoute d v c := .premises h

theorem section112aRoute_intro_attempt {d v : Person} {c : ComplaintText}
    (h : Section112aAttempt d v c) : Section112aRoute d v c := .attempt h

theorem section112a_intro {d v : Person} {c : ComplaintText}
    (hRoute : Section112aRoute d v c)
    (hSpeech : ¬ ExercisesProtectedFirstAmendmentRight d c) :
    Section112a d v c := ⟨hRoute, hSpeech⟩

theorem section112b1Conduct_intro_harass {d v : Person} {c : ComplaintText}
    (h : IntimidatesCoercesThreatensOrHarasses d v c) :
    Section112b1Conduct d v c := .harass h

theorem section112b1Conduct_intro_obstruct {d v : Person} {c : ComplaintText}
    (h : ObstructsForeignOfficialInDuties d v c) :
    Section112b1Conduct d v c := .obstruct h

theorem section112b1_intro {d v : Person} {c : ComplaintText}
    (hWillful : ActedWithScienter d c)
    (hProtected : IsProtectedForeignPerson v c)
    (hConduct : Section112b1Conduct d v c) :
    Section112b1 d v c := ⟨hWillful, hProtected, hConduct⟩

theorem section112b2_intro {d v : Person} {c : ComplaintText}
    (hWillful : ActedWithScienter d c)
    (hProtected : IsProtectedForeignPerson v c)
    (hAttempt : AttemptsIntimidationOrObstruction d v c) :
    Section112b2 d v c := ⟨hWillful, hProtected, hAttempt⟩

theorem section112b3_intro {d : Person} {c : ComplaintText}
    (hWillful : ActedWithScienter d c)
    (hProximity : WithinOneHundredFeetOfProtectedPremises d c)
    (hCongregate : CongregatesWithTwoOrMoreOthers d c)
    (hIntent : IntentToViolateSection112 d c) :
    Section112b3 d c := ⟨hWillful, hProximity, hCongregate, hIntent⟩

theorem section112bRoute_intro_intimidation {d v : Person} {c : ComplaintText}
    (h : Section112b1 d v c) : Section112bRoute d v c := .intimidation h

theorem section112bRoute_intro_attempt {d v : Person} {c : ComplaintText}
    (h : Section112b2 d v c) : Section112bRoute d v c := .attempt h

theorem section112bRoute_intro_congregation {d v : Person} {c : ComplaintText}
    (h : Section112b3 d c) : Section112bRoute d v c := .congregation h

theorem section112b_intro {d v : Person} {c : ComplaintText}
    (hRoute : Section112bRoute d v c)
    (hSpeech : ¬ ExercisesProtectedFirstAmendmentRight d c) :
    Section112b d v c := ⟨hRoute, hSpeech⟩

theorem section112eBasis_intro_unitedStatesAgent {d v : Person} {c : ComplaintText}
    (h : VictimIsUnitedStatesRepresentativeOrAgent v c) :
    Section112eBasis d v c := .unitedStatesAgent h

theorem section112eBasis_intro_nationalOffender {d v : Person} {c : ComplaintText}
    (h : OffenderIsNationalOfTheUnitedStates d c) :
    Section112eBasis d v c := .nationalOffender h

theorem section112eBasis_intro_foundInUnitedStates {d v : Person}
    {c : ComplaintText} (h : OffenderFoundInTheUnitedStates d c) :
    Section112eBasis d v c := .foundInUnitedStates h

theorem section112eJurisdiction_intro {d v : Person} {c : ComplaintText}
    (hAbroad : VictimIsInternationallyProtectedPersonAbroad v c)
    (hBasis : Section112eBasis d v c) :
    Section112eJurisdiction d v c := ⟨hAbroad, hBasis⟩



theorem section113Core_intro {d v : Person} {c : ComplaintText}
    (hJur : WithinSpecialMaritimeAndTerritorialJurisdiction c)
    (hAssault : CommitsAssault d v c) : Section113Core d v c := ⟨hJur, hAssault⟩

theorem section113a1_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c) (hIntent : IntentToCommitMurderOrSexualAbuse d c) :
    Section113a1 d v c := ⟨hCore, hIntent⟩

theorem section113a2_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c) (hIntent : IntentToCommitFelony d c) :
    Section113a2 d v c := ⟨hCore, hIntent⟩

theorem section113a3_intro {d v : Person} {w : DangerousWeapon} {c : ComplaintText}
    (hCore : Section113Core d v c) (hWeapon : AssaultWithDangerousWeapon d w c)
    (hIntent : IntentToDoBodilyHarm d c) :
    Section113a3 d v w c := ⟨hCore, hWeapon, hIntent⟩

theorem section113a4_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c)
    (hManner : AssaultByStrikingBeatingOrWounding d v c) :
    Section113a4 d v c := ⟨hCore, hManner⟩

theorem section113a5_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c) (hSimple : IsSimpleAssault d v c) :
    Section113a5 d v c := ⟨hCore, hSimple⟩

theorem section113a6_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c) (hInjury : ResultsInSeriousBodilyInjury d v c) :
    Section113a6 d v c := ⟨hCore, hInjury⟩

theorem section113a7Victim_intro_partner {d v : Person} {c : ComplaintText}
    (h : IsSpouseIntimateOrDatingPartner d v c) :
    Section113a7Victim d v c := .partner h

theorem section113a7Victim_intro_minor {d v : Person} {c : ComplaintText}
    (h : VictimUnderSixteen v c) : Section113a7Victim d v c := .minor h

theorem section113a7_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c)
    (hInjury : ResultsInSubstantialBodilyInjury d v c)
    (hVictim : Section113a7Victim d v c) :
    Section113a7 d v c := ⟨hCore, hInjury, hVictim⟩

theorem section113a8_intro {d v : Person} {c : ComplaintText}
    (hCore : Section113Core d v c)
    (hPartner : IsSpouseIntimateOrDatingPartner d v c)
    (hManner : AssaultByStranglingOrSuffocating d v c) :
    Section113a8 d v c := ⟨hCore, hPartner, hManner⟩

theorem section113a_intro_intentMurderOrSexualAbuse {d v : Person}
    {w : DangerousWeapon} {c : ComplaintText} (h : Section113a1 d v c) :
    Section113a d v w c := .intentMurderOrSexualAbuse h

theorem section113a_intro_intentFelony {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : Section113a2 d v c) :
    Section113a d v w c := .intentFelony h

theorem section113a_intro_dangerousWeapon {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : Section113a3 d v w c) :
    Section113a d v w c := .dangerousWeapon h

theorem section113a_intro_strikingBeatingWounding {d v : Person}
    {w : DangerousWeapon} {c : ComplaintText} (h : Section113a4 d v c) :
    Section113a d v w c := .strikingBeatingWounding h

theorem section113a_intro_simpleAssault {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : Section113a5 d v c) :
    Section113a d v w c := .simpleAssault h

theorem section113a_intro_seriousBodilyInjury {d v : Person} {w : DangerousWeapon}
    {c : ComplaintText} (h : Section113a6 d v c) :
    Section113a d v w c := .seriousBodilyInjury h

theorem section113a_intro_substantialBodilyInjury {d v : Person}
    {w : DangerousWeapon} {c : ComplaintText} (h : Section113a7 d v c) :
    Section113a d v w c := .substantialBodilyInjury h

theorem section113a_intro_stranglingOrSuffocating {d v : Person}
    {w : DangerousWeapon} {c : ComplaintText} (h : Section113a8 d v c) :
    Section113a d v w c := .stranglingOrSuffocating h



theorem section114Actus_intro_mutilation {d v : Person} {c : ComplaintText}
    (h : MutilatesOrDisablesBodyPart d v c) : Section114Actus d v c := .mutilation h

theorem section114Actus_intro_corrosive {d v : Person} {c : ComplaintText}
    (h : ThrowsCorrosiveOrScaldingSubstance d v c) :
    Section114Actus d v c := .corrosive h

theorem section114_intro {d v : Person} {c : ComplaintText}
    (hJur : WithinSpecialMaritimeAndTerritorialJurisdiction c)
    (hIntent : IntentToTortureMaimOrDisfigure d c)
    (hActus : Section114Actus d v c) : Section114 d v c := ⟨hJur, hIntent, hActus⟩



theorem section115Conduct_intro_completed {d t : Person} {c : ComplaintText}
    (h : AssaultsKidnapsOrMurders d t c) : Section115Conduct d t c := .completed h

theorem section115Conduct_intro_inchoate {d t : Person} {c : ComplaintText}
    (h : AttemptsOrConspiresToKidnapOrMurder d t c) :
    Section115Conduct d t c := .inchoate h

theorem section115Conduct_intro_threat {d t : Person} {c : ComplaintText}
    (h : ThreatensToAssaultKidnapOrMurder d t c) :
    Section115Conduct d t c := .threat h

theorem section115Intent_intro_impede {d : Person} {c : ComplaintText}
    (h : IntentToImpedeOrInterfereWithOfficialDuties d c) :
    Section115Intent d c := .impede h

theorem section115Intent_intro_retaliate {d : Person} {c : ComplaintText}
    (h : IntentToRetaliateForOfficialDuties d c) :
    Section115Intent d c := .retaliate h

theorem section115a1A_intro {d fm v : Person} {c : ComplaintText}
    (hOfficial : IsCoveredFederalOfficial v c)
    (hFamily : IsImmediateFamilyMember fm v c)
    (hConduct : Section115Conduct d fm c) (hIntent : Section115Intent d c) :
    Section115a1A d fm v c := ⟨hOfficial, hFamily, hConduct, hIntent⟩

theorem section115a1B_intro {d v : Person} {c : ComplaintText}
    (hOfficial : IsCoveredFederalOfficial v c)
    (hThreat : ThreatensToAssaultKidnapOrMurder d v c)
    (hIntent : Section115Intent d c) :
    Section115a1B d v c := ⟨hOfficial, hThreat, hIntent⟩

theorem section115a2Target_intro_official {d fm v : Person} {c : ComplaintText}
    (h : Section115Conduct d v c) : Section115a2Target d fm v c := .official h

theorem section115a2Target_intro_family {d fm v : Person} {c : ComplaintText}
    (hf : IsImmediateFamilyMember fm v c) (h : Section115Conduct d fm c) :
    Section115a2Target d fm v c := .family hf h

theorem section115a2_intro {d fm v : Person} {c : ComplaintText}
    (hFormer : IsFormerCoveredFederalOfficial v c)
    (hTarget : Section115a2Target d fm v c)
    (hIntent : IntentToRetaliateForOfficialDuties d c) :
    Section115a2 d fm v c := ⟨hFormer, hTarget, hIntent⟩

theorem section115a_intro_familyTarget {d fm v : Person} {c : ComplaintText}
    (h : Section115a1A d fm v c) : Section115a d fm v c := .familyTarget h

theorem section115a_intro_officialThreat {d fm v : Person} {c : ComplaintText}
    (h : Section115a1B d v c) : Section115a d fm v c := .officialThreat h

theorem section115a_intro_formerService {d fm v : Person} {c : ComplaintText}
    (h : Section115a2 d fm v c) : Section115a d fm v c := .formerService h



theorem section116Conduct_intro_performs {d v : Person} {c : ComplaintText}
    (h : PerformsFemaleGenitalMutilation d v c) :
    Section116Conduct d v c := .performs h

theorem section116Conduct_intro_facilitates {d v : Person} {c : ComplaintText}
    (h : ParentOrGuardianFacilitatesOrConsents d v c) :
    Section116Conduct d v c := .facilitates h

theorem section116Conduct_intro_transports {d v : Person} {c : ComplaintText}
    (h : TransportsForPurposeOfMutilation d v c) :
    Section116Conduct d v c := .transports h

theorem section116dCircumstance_intro_travel {d : Person} {c : ComplaintText}
    (h : DefendantOrVictimTraveledInCommerce d c) :
    Section116dCircumstance d c := .travel h

theorem section116dCircumstance_intro_instrumentality {d : Person}
    {c : ComplaintText} (h : UsedInstrumentalityOfCommerce d c) :
    Section116dCircumstance d c := .instrumentality h

theorem section116dCircumstance_intro_payment {d : Person} {c : ComplaintText}
    (h : PaymentMadeUsingCommerce d c) : Section116dCircumstance d c := .payment h

theorem section116dCircumstance_intro_communication {d : Person} {c : ComplaintText}
    (h : TransmittedCommunicationInCommerce d c) :
    Section116dCircumstance d c := .communication h

theorem section116dCircumstance_intro_object {d : Person} {c : ComplaintText}
    (h : ObjectUsedTraveledInCommerce d c) : Section116dCircumstance d c := .object h

theorem section116dCircumstance_intro_federalTerritory {d : Person}
    {c : ComplaintText} (h : ConductWithinFederalTerritory d c) :
    Section116dCircumstance d c := .federalTerritory h

theorem section116dCircumstance_intro_otherwiseCommerce {d : Person}
    {c : ComplaintText} (h : ConductOtherwiseAffectedCommerce d c) :
    Section116dCircumstance d c := .otherwiseCommerce h

theorem section116bException_intro_healthNecessity {d v : Person} {c : ComplaintText}
    (h : OperationNecessaryToHealth v c)
    (hp : PerformedByLicensedMedicalPractitioner d c) :
    Section116bException d v c := .healthNecessity h hp

theorem section116bException_intro_laborOrBirth {d v : Person} {c : ComplaintText}
    (h : OperationForLaborOrBirthPurposes v c)
    (hp : PerformedByLicensedMidwifeOrTrainee d c) :
    Section116bException d v c := .laborOrBirth h hp

theorem section116a_intro {d v : Person} {c : ComplaintText}
    (hScienter : ActedWithScienter d c) (hConduct : Section116Conduct d v c)
    (hMinor : VictimUnderEighteen v c)
    (hCircumstance : Section116dCircumstance d c)
    (hNoException : ¬ Section116bException d v c) :
    Section116a d v c := ⟨hScienter, hConduct, hMinor, hCircumstance, hNoException⟩



theorem qualifyingPriorOffense_intro_domesticViolent {pc : PriorConviction}
    {c : ComplaintText} (h : PriorOffenseAgainstSpouseOrChild pc c) :
    QualifyingPriorOffense pc c := .domesticViolent h

theorem qualifyingPriorOffense_intro_chapter110A {pc : PriorConviction}
    {c : ComplaintText} (h : PriorOffenseUnderChapter110A pc c) :
    QualifyingPriorOffense pc c := .chapter110A h

theorem qualifyingPriorConviction_intro {pc : PriorConviction} {c : ComplaintText}
    (hFinal : PriorConvictionIsFinal pc c) (hOffense : QualifyingPriorOffense pc c) :
    QualifyingPriorConviction pc c := ⟨hFinal, hOffense⟩

theorem domesticAssault_intro {d v : Person} {c : ComplaintText}
    (hAssault : CommitsAssault d v c) (hRel : IsDomesticRelationship d v c) :
    DomesticAssault d v c := ⟨hAssault, hRel⟩

theorem section117_intro {d v : Person} {pc₁ pc₂ : PriorConviction}
    {c : ComplaintText}
    (hJur : WithinFederalOrIndianCountryJurisdiction c)
    (hAssault : DomesticAssault d v c)
    (hFirst : QualifyingPriorConviction pc₁ c)
    (hSecond : QualifyingPriorConviction pc₂ c)
    (hCount : HasTwoOrMorePriorQualifyingConvictions d c) :
    Section117 d v pc₁ pc₂ c := ⟨hJur, hAssault, hFirst, hSecond, hCount⟩

theorem section117Enhanced_intro {d v : Person} {pc₁ pc₂ : PriorConviction}
    {c : ComplaintText} (hBase : Section117 d v pc₁ pc₂ c)
    (hInjury : ResultsInSubstantialBodilyInjury d v c) :
    Section117Enhanced d v pc₁ pc₂ c := ⟨hBase, hInjury⟩



theorem section118_intro {d v : Person} {c : ComplaintText}
    (hScienter : ActedWithScienter d c)
    (hConduct : ObstructsResistsOrInterferes d v c)
    (hAgent : IsFederalLawEnforcementAgent v c)
    (hFunction : EngagedInStatutoryProtectiveFunctions v c)
    (hJur : WithinUnitedStatesOrSpecialJurisdiction c) :
    Section118 d v c := ⟨hScienter, hConduct, hAgent, hFunction, hJur⟩



theorem coveredPerson119_intro_section1114Designee {v : Person} {c : ComplaintText}
    (h : IsSection1114ProtectedOfficer v c) :
    CoveredPerson119 v c := .section1114Designee h

theorem coveredPerson119_intro_courtOfficer {v : Person} {c : ComplaintText}
    (h : IsCourtOfficerJurorOrWitness v c) : CoveredPerson119 v c := .courtOfficer h

theorem coveredPerson119_intro_informant {v : Person} {c : ComplaintText}
    (h : IsFederalInformantOrWitness v c) : CoveredPerson119 v c := .informant h

theorem coveredPerson119_intro_stateOrLocalAssistant {v : Person}
    {c : ComplaintText} (h : IsStateOrLocalOfficerAssistingFederalInvestigation v c) :
    CoveredPerson119 v c := .stateOrLocalAssistant h

theorem section119Subject_intro_coveredPerson {v fm : Person} {c : ComplaintText}
    (h : CoveredPerson119 v c) : Section119Subject v fm c := .coveredPerson h

theorem section119Subject_intro_familyMember {v fm : Person} {c : ComplaintText}
    (h : CoveredPerson119 v c) (hf : IsImmediateFamilyMember fm v c) :
    Section119Subject v fm c := .familyMember h hf

theorem section119Intent_intro_toThreaten {d : Person} {c : ComplaintText}
    (h : IntentToThreatenIntimidateOrInciteViolence d c) :
    Section119Intent d c := .toThreaten h

theorem section119Intent_intro_knowledgeOfUse {d : Person} {c : ComplaintText}
    (h : IntentAndKnowledgeInformationWillBeUsedToThreaten d c) :
    Section119Intent d c := .knowledgeOfUse h

theorem section119_intro {d v fm : Person} {i : RestrictedPersonalInfo}
    {c : ComplaintText} (hScienter : ActedWithScienter d c)
    (hSubject : Section119Subject v fm c)
    (hRestricted : IsRestrictedPersonalInformation i v c)
    (hPublication : MakesRestrictedInformationPubliclyAvailable d i c)
    (hIntent : Section119Intent d c) :
    Section119 d v fm i c :=
  ⟨hScienter, hSubject, hRestricted, hPublication, hIntent⟩



theorem section151Debtor_intro {dbtr : Person} {bc : BankruptcyCase}
    {c : ComplaintText} (hPetition : PetitionFiledUnderTitle11 dbtr bc c) :
    Section151Debtor dbtr bc c := ⟨hPetition⟩



theorem section152P1_intro {d : Person} {pr : EstateProperty} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hConceal : ConcealsPropertyFromEstateOfficer d pr c)
    (hEstate : PropertyBelongsToDebtorEstate pr c) :
    Section152P1 d pr c := ⟨hScienter, hConceal, hEstate⟩

theorem section152P2_intro {d : Person} {bc : BankruptcyCase} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hOath : MakesFalseOathOrAccount d c)
    (hNexus : InOrInRelationToTitle11Case bc c) :
    Section152P2 d bc c := ⟨hScienter, hOath, hNexus⟩

theorem section152P3_intro {d : Person} {bc : BankruptcyCase} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hDecl : MakesFalseDeclarationUnderPenaltyOfPerjury d c)
    (hNexus : InOrInRelationToTitle11Case bc c) :
    Section152P3 d bc c := ⟨hScienter, hDecl, hNexus⟩

theorem section152P4_intro {d : Person} {cl : ProofOfClaim} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hPresent : PresentsOrUsesClaimAgainstEstate d cl c)
    (hFalse : ClaimIsFalse cl c) :
    Section152P4 d cl c := ⟨hScienter, hPresent, hFalse⟩

theorem section152P5_intro {d : Person} {pr : EstateProperty} {bc : BankruptcyCase}
    {c : ComplaintText} (hScienter : ActsKnowinglyAndFraudulently d c)
    (hReceipt : ReceivesMaterialAmountOfPropertyFromDebtor d pr c)
    (hAfter : AfterFilingOfTitle11Case bc c)
    (hIntent : IntentToDefeatTitle11 d c) :
    Section152P5 d pr bc c := ⟨hScienter, hReceipt, hAfter, hIntent⟩

theorem section152P6_intro {d : Person} {bc : BankruptcyCase} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hConsideration : GivesOrObtainsUnlawfulConsideration d c)
    (hPurpose : ForActingOrForbearingInTitle11Case d c)
    (hNexus : InOrInRelationToTitle11Case bc c) :
    Section152P6 d bc c := ⟨hScienter, hConsideration, hPurpose, hNexus⟩

theorem section152P7Predicate_intro_contemplation {d : Person} {c : ComplaintText}
    (h : InContemplationOfTitle11Case d c) :
    Section152P7Predicate d c := .contemplation h

theorem section152P7Predicate_intro_intentToDefeat {d : Person} {c : ComplaintText}
    (h : IntentToDefeatTitle11 d c) : Section152P7Predicate d c := .intentToDefeat h

theorem section152P7_intro {d : Person} {pr : EstateProperty} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hTransfer : TransfersOrConcealsProperty d pr c)
    (hPredicate : Section152P7Predicate d c) :
    Section152P7 d pr c := ⟨hScienter, hTransfer, hPredicate⟩

theorem section152P8Timing_intro_afterFiling {d : Person} {bc : BankruptcyCase}
    {c : ComplaintText} (h : AfterFilingOfTitle11Case bc c) :
    Section152P8Timing d bc c := .afterFiling h

theorem section152P8Timing_intro_contemplation {d : Person} {bc : BankruptcyCase}
    {c : ComplaintText} (h : InContemplationOfTitle11Case d c) :
    Section152P8Timing d bc c := .contemplation h

theorem section152P8_intro {d : Person} {doc : RecordedInformation}
    {bc : BankruptcyCase} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hTiming : Section152P8Timing d bc c)
    (hFalsify : ConcealsDestroysOrFalsifiesRecordedInformation d doc c)
    (hRelevance : RecordedInformationRelatesToDebtorAffairs doc c) :
    Section152P8 d doc bc c := ⟨hScienter, hTiming, hFalsify, hRelevance⟩

theorem section152P9_intro {d : Person} {doc : RecordedInformation}
    {bc : BankruptcyCase} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hAfter : AfterFilingOfTitle11Case bc c)
    (hWithhold : WithholdsRecordedInformationFromOfficer d doc c)
    (hEntitled : OfficerEntitledToPossession doc c)
    (hRelevance : RecordedInformationRelatesToDebtorAffairs doc c) :
    Section152P9 d doc bc c := ⟨hScienter, hAfter, hWithhold, hEntitled, hRelevance⟩

theorem section152_intro_concealment {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P1 d pr c) :
    Section152 d pr doc cl bc c := .concealment h

theorem section152_intro_falseOath {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P2 d bc c) :
    Section152 d pr doc cl bc c := .falseOath h

theorem section152_intro_falseDeclaration {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P3 d bc c) :
    Section152 d pr doc cl bc c := .falseDeclaration h

theorem section152_intro_falseClaim {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P4 d cl c) :
    Section152 d pr doc cl bc c := .falseClaim h

theorem section152_intro_receiptFromDebtor {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P5 d pr bc c) :
    Section152 d pr doc cl bc c := .receiptFromDebtor h

theorem section152_intro_bribery {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P6 d bc c) :
    Section152 d pr doc cl bc c := .bribery h

theorem section152_intro_fraudulentTransfer {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P7 d pr c) :
    Section152 d pr doc cl bc c := .fraudulentTransfer h

theorem section152_intro_recordFalsification {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P8 d doc bc c) :
    Section152 d pr doc cl bc c := .recordFalsification h

theorem section152_intro_recordWithholding {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {cl : ProofOfClaim} {bc : BankruptcyCase}
    {c : ComplaintText} (h : Section152P9 d doc bc c) :
    Section152 d pr doc cl bc c := .recordWithholding h



theorem section153Fiduciary_intro {d : Person} {c : ComplaintText}
    (hParticipation : ParticipatesInEstateAdministration d c)
    (hAccess : HasAccessToEstatePropertyOrDocuments d c) :
    Section153Fiduciary d c := ⟨hParticipation, hAccess⟩

theorem section153Actus_intro_property {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {c : ComplaintText}
    (h : AppropriatesEmbezzlesOrTransfersEstateProperty d pr c) :
    Section153Actus d pr doc c := .property h

theorem section153Actus_intro_document {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {c : ComplaintText}
    (h : SecretesOrDestroysEstateDocument d doc c) :
    Section153Actus d pr doc c := .document h

theorem section153_intro {d : Person} {pr : EstateProperty}
    {doc : RecordedInformation} {c : ComplaintText}
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hFiduciary : Section153Fiduciary d c)
    (hActus : Section153Actus d pr doc c) :
    Section153 d pr doc c := ⟨hScienter, hFiduciary, hActus⟩



theorem section154P1_intro {d : Person} {pr : EstateProperty} {c : ComplaintText}
    (hOfficer : IsCourtOfficerInTitle11Case d c)
    (hScienter : ActedWithScienter d c)
    (hPurchase : PurchasesPropertyOfEstate d pr c) :
    Section154P1 d pr c := ⟨hOfficer, hScienter, hPurchase⟩

theorem section154P2_intro {d : Person} {c : ComplaintText}
    (hOfficer : IsCourtOfficerInTitle11Case d c)
    (hScienter : ActedWithScienter d c)
    (hRefusal : RefusesInspectionByPartiesInInterest d c)
    (hDirection : CourtDirectedInspection d c) :
    Section154P2 d c := ⟨hOfficer, hScienter, hRefusal, hDirection⟩

theorem section154P3_intro {d : Person} {c : ComplaintText}
    (hOfficer : IsCourtOfficerInTitle11Case d c)
    (hScienter : ActedWithScienter d c)
    (hRefusal : RefusesInspectionByUnitedStatesTrustee d c) :
    Section154P3 d c := ⟨hOfficer, hScienter, hRefusal⟩

theorem section154_intro_selfDealingPurchase {d : Person} {pr : EstateProperty}
    {c : ComplaintText} (h : Section154P1 d pr c) :
    Section154 d pr c := .selfDealingPurchase h

theorem section154_intro_refusalToPartiesInInterest {d : Person}
    {pr : EstateProperty} {c : ComplaintText} (h : Section154P2 d c) :
    Section154 d pr c := .refusalToPartiesInInterest h

theorem section154_intro_refusalToUnitedStatesTrustee {d : Person}
    {pr : EstateProperty} {c : ComplaintText} (h : Section154P3 d c) :
    Section154 d pr c := .refusalToUnitedStatesTrustee h



theorem section155_intro {d : Person} {ag : Agreement} {c : ComplaintText}
    (hParty : IsPartyInInterestOrAttorney d c)
    (hForum : InReceivershipOrTitle11CaseInUnitedStatesCourt c)
    (hScienter : ActsKnowinglyAndFraudulently d c)
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hCounterparty : AgreementWithAnotherPartyInInterest ag c)
    (hPurpose : AgreementFixesFeesFromEstateAssets ag c) :
    Section155 d ag c :=
  ⟨hParty, hForum, hScienter, hAgreement, hCounterparty, hPurpose⟩



theorem section156_intro {d : Person} {bc : BankruptcyCase} {c : ComplaintText}
    (hPreparer : IsBankruptcyPetitionPreparer d c)
    (hDisregard : KnowingAttemptToDisregardBankruptcyRequirements d c)
    (hDismissal : CaseOrProceedingDismissed bc c)
    (hCausation : DismissalCausedByPreparerDisregard d bc c) :
    Section156 d bc c := ⟨hPreparer, hDisregard, hDismissal, hCausation⟩



theorem section157Actus_intro_petition {d : Person} {bc : BankruptcyCase}
    {doc : RecordedInformation} {c : ComplaintText}
    (h : FilesPetitionUnderTitle11 d bc c) : Section157Actus d bc doc c := .petition h

theorem section157Actus_intro_document {d : Person} {bc : BankruptcyCase}
    {doc : RecordedInformation} {c : ComplaintText}
    (h : FilesDocumentInTitle11Proceeding d doc c) :
    Section157Actus d bc doc c := .document h

theorem section157Actus_intro_representation {d : Person} {bc : BankruptcyCase}
    {doc : RecordedInformation} {c : ComplaintText}
    (h : MakesFalseRepresentationConcerningTitle11Proceeding d c) :
    Section157Actus d bc doc c := .representation h

theorem section157_intro {d : Person} {bc : BankruptcyCase}
    {doc : RecordedInformation} {c : ComplaintText}
    (hScheme : DevisedOrIntendedSchemeToDefraud d c)
    (hPurpose : ForPurposeOfExecutingOrConcealingScheme d c)
    (hActus : Section157Actus d bc doc c) :
    Section157 d bc doc c := ⟨hScheme, hPurpose, hActus⟩



theorem section158_intro {v : Person} {c : ComplaintText}
    (hDesignation : AttorneyGeneralDesignatesEnforcementIndividuals c)
    (hDesignee : DesigneeIsUnitedStatesAttorneyOrFbiAgent v c)
    (hReaffirmation : DesignationCoversAbusiveReaffirmationEnforcement c)
    (hSchedules : DesignationCoversMateriallyFraudulentSchedules c)
    (hReferral : BankruptcyCourtsEstablishReferralProcedures c) :
    Section158 v c :=
  ⟨hDesignation, hDesignee, hReaffirmation, hSchedules, hReferral⟩



theorem biologicalAgentCapability_intro_organism {m : BioMaterial}
    {c : ComplaintText} (h : CapableOfCausingDeathDiseaseOrMalfunction m c) :
    BiologicalAgentCapability m c := .organism h

theorem biologicalAgentCapability_intro_materials {m : BioMaterial}
    {c : ComplaintText} (h : CapableOfCausingDeteriorationOfMaterials m c) :
    BiologicalAgentCapability m c := .materials h

theorem biologicalAgentCapability_intro_environment {m : BioMaterial}
    {c : ComplaintText} (h : CapableOfDeleteriousAlterationOfEnvironment m c) :
    BiologicalAgentCapability m c := .environment h

theorem isBiologicalAgent_intro {m : BioMaterial} {c : ComplaintText}
    (hSubstance : IsMicroorganismOrInfectiousSubstance m c)
    (hCapability : BiologicalAgentCapability m c) :
    IsBiologicalAgent m c := ⟨hSubstance, hCapability⟩

theorem isToxin_intro_toxicMaterial {m : BioMaterial} {c : ComplaintText}
    (h : IsToxicMaterialOrProduct m c) : IsToxin m c := .toxicMaterial h

theorem isToxin_intro_engineeredProduct {m : BioMaterial} {c : ComplaintText}
    (h : IsPoisonousSubstanceOrBiologicalProduct m c) :
    IsToxin m c := .engineeredProduct h

theorem isToxin_intro_derivative {m : BioMaterial} {c : ComplaintText}
    (h : IsPoisonousIsomerHomologOrDerivative m c) : IsToxin m c := .derivative h

theorem isDeliverySystem_intro_designedDelivery {m : BioMaterial}
    {c : ComplaintText} (h : SpecificallyDesignedToDeliverAgentOrToxin m c) :
    IsDeliverySystem m c := .designedDelivery h

theorem isDeliverySystem_intro_vector {m : BioMaterial} {c : ComplaintText}
    (h : IsVector m c) : IsDeliverySystem m c := .vector h

theorem isBiologicalAgentToxinOrDeliverySystem_intro_agent {m : BioMaterial}
    {c : ComplaintText} (h : IsBiologicalAgent m c) :
    IsBiologicalAgentToxinOrDeliverySystem m c := .agent h

theorem isBiologicalAgentToxinOrDeliverySystem_intro_toxin {m : BioMaterial}
    {c : ComplaintText} (h : IsToxin m c) :
    IsBiologicalAgentToxinOrDeliverySystem m c := .toxin h

theorem isBiologicalAgentToxinOrDeliverySystem_intro_delivery {m : BioMaterial}
    {c : ComplaintText} (h : IsDeliverySystem m c) :
    IsBiologicalAgentToxinOrDeliverySystem m c := .delivery h



theorem section175aConduct_intro_weaponisation {d : Person} {m : BioMaterial}
    {org : Entity} {c : ComplaintText}
    (h : DevelopsProducesOrPossessesBioMaterial d m c) (hw : ForUseAsWeapon m c) :
    Section175aConduct d m org c := .weaponisation h hw

theorem section175aConduct_intro_assistance {d : Person} {m : BioMaterial}
    {org : Entity} {c : ComplaintText}
    (h : AssistsForeignStateOrOrganization d org c) :
    Section175aConduct d m org c := .assistance h

theorem section175aConduct_intro_inchoate {d : Person} {m : BioMaterial}
    {org : Entity} {c : ComplaintText}
    (h : AttemptsThreatensOrConspiresToViolate d c) :
    Section175aConduct d m org c := .inchoate h

theorem section175ProhibitedUse_intro {d : Person} {m : BioMaterial} {org : Entity}
    {c : ComplaintText} (hScienter : ActedWithScienter d c)
    (hMaterial : IsBiologicalAgentToxinOrDeliverySystem m c)
    (hConduct : Section175aConduct d m org c) :
    Section175ProhibitedUse d m org c := ⟨hScienter, hMaterial, hConduct⟩

theorem section175UnjustifiedPossession_intro {d : Person} {m : BioMaterial}
    {c : ComplaintText} (hScienter : ActedWithScienter d c)
    (hMaterial : IsBiologicalAgentToxinOrDeliverySystem m c)
    (hPossession : PossessesBioMaterial d m c)
    (hUnjustified : QuantityOrTypeNotReasonablyJustified m c)
    (hNotNatural : ¬ NaturallyOccurringAndUnextracted m c) :
    Section175UnjustifiedPossession d m c :=
  ⟨hScienter, hMaterial, hPossession, hUnjustified, hNotNatural⟩

theorem section175ExtraterritorialReach_intro {d : Person} {c : ComplaintText}
    (hNexus : ExtraterritorialJurisdictionOverUnitedStatesNational d c) :
    Section175ExtraterritorialReach d c := ⟨hNexus⟩



theorem section175aMilitaryAssistanceRequest_intro {c : ComplaintText}
    (hEmergency : EmergencyInvolvingBiologicalWeaponOfMassDestruction c)
    (hRequest : AttorneyGeneralRequestsMilitaryAssistance c)
    (hPurpose : RequestSupportsSection175Enforcement c) :
    Section175aMilitaryAssistanceRequest c := ⟨hEmergency, hRequest, hPurpose⟩



theorem restrictedPersonStatus_intro_underIndictment {p : Person}
    {c : ComplaintText} (h : UnderIndictmentForFelony p c) :
    RestrictedPersonStatus p c := .underIndictment h

theorem restrictedPersonStatus_intro_convicted {p : Person} {c : ComplaintText}
    (h : ConvictedOfFelony p c) : RestrictedPersonStatus p c := .convicted h

theorem restrictedPersonStatus_intro_fugitive {p : Person} {c : ComplaintText}
    (h : IsFugitiveFromJustice p c) : RestrictedPersonStatus p c := .fugitive h

theorem restrictedPersonStatus_intro_unlawfulDrugUser {p : Person}
    {c : ComplaintText} (h : IsUnlawfulUserOfControlledSubstance p c) :
    RestrictedPersonStatus p c := .unlawfulDrugUser h

theorem restrictedPersonStatus_intro_unlawfulAlien {p : Person} {c : ComplaintText}
    (h : IsAlienUnlawfullyInTheUnitedStates p c) :
    RestrictedPersonStatus p c := .unlawfulAlien h

theorem restrictedPersonStatus_intro_mentalAdjudication {p : Person}
    {c : ComplaintText} (h : AdjudicatedMentalDefectiveOrCommitted p c) :
    RestrictedPersonStatus p c := .mentalAdjudication h

theorem restrictedPersonStatus_intro_stateSponsorNational {p : Person}
    {c : ComplaintText} (h : IsNationalOrAgentOfStateSponsorOfTerrorism p c) :
    RestrictedPersonStatus p c := .stateSponsorNational h

theorem restrictedPersonStatus_intro_dishonorableDischarge {p : Person}
    {c : ComplaintText} (h : DischargedUnderDishonorableConditions p c) :
    RestrictedPersonStatus p c := .dishonorableDischarge h

theorem restrictedPersonStatus_intro_terroristOrganization {p : Person}
    {c : ComplaintText} (h : IsMemberOrAgentOfTerroristOrganization p c) :
    RestrictedPersonStatus p c := .terroristOrganization h

theorem isListedSelectAgent_intro {m : BioMaterial} {c : ComplaintText}
    (hListed : ListedAsSelectAgentUnderPart73 m c)
    (hNotExempt : NotExcludedOrExemptedUnderPart73 m c) :
    IsListedSelectAgent m c := ⟨hListed, hNotExempt⟩

theorem section175bA1Conduct_intro_shipTransportPossess {d : Person}
    {m : BioMaterial} {c : ComplaintText}
    (h : ShipsTransportsOrPossessesInCommerce d m c) :
    Section175bA1Conduct d m c := .shipTransportPossess h

theorem section175bA1Conduct_intro_receive {d : Person} {m : BioMaterial}
    {c : ComplaintText} (h : ReceivesAgentShippedInCommerce d m c) :
    Section175bA1Conduct d m c := .receive h

theorem section175bA_intro {d : Person} {m : BioMaterial} {c : ComplaintText}
    (hRestricted : IsRestrictedPerson d c) (hScienter : ActedWithScienter d c)
    (hSelectAgent : IsListedSelectAgent m c)
    (hConduct : Section175bA1Conduct d m c)
    (hNotAuthorized : ¬ DulyAuthorizedUnitedStatesGovernmentalActivity d c) :
    Section175bA d m c :=
  ⟨hRestricted, hScienter, hSelectAgent, hConduct, hNotAuthorized⟩

theorem section175bB1_intro {d tr : Person} {m : BioMaterial} {c : ComplaintText}
    (hTransfer : TransfersSelectAgentToTransferee d tr m c)
    (hKnowledge : TransferorKnowsOrHasReasonableCauseToBelieveUnregistered d tr c)
    (hUnregistered : TransfereeNotRegisteredUnderPublicHealthServiceAct tr c) :
    Section175bB1 d tr m c := ⟨hTransfer, hKnowledge, hUnregistered⟩

theorem section175bB2_intro {d tr : Person} {m : BioMaterial} {c : ComplaintText}
    (hListed : AgentListedUnderAgriculturalBioterrorismAct m c)
    (hTransfer : TransfersSelectAgentToTransferee d tr m c)
    (hKnowledge : TransferorKnowsOrHasReasonableCauseToBelieveUnregistered d tr c)
    (hUnregistered : TransfereeNotRegisteredUnderAgriculturalBioterrorismAct tr c) :
    Section175bB2 d tr m c := ⟨hListed, hTransfer, hKnowledge, hUnregistered⟩

theorem section175bC1_intro {d : Person} {m : BioMaterial} {c : ComplaintText}
    (hScienter : ActedWithScienter d c) (hPossession : PossessesBioMaterial d m c)
    (hSelectAgent : IsListedSelectAgent m c)
    (hUnregistered : PossessorLacksRegistrationUnderPublicHealthServiceAct d m c) :
    Section175bC1 d m c := ⟨hScienter, hPossession, hSelectAgent, hUnregistered⟩

theorem section175bC2_intro {d : Person} {m : BioMaterial} {c : ComplaintText}
    (hScienter : ActedWithScienter d c) (hPossession : PossessesBioMaterial d m c)
    (hListed : AgentListedUnderAgriculturalBioterrorismAct m c)
    (hUnregistered :
      PossessorLacksRegistrationUnderAgriculturalBioterrorismAct d m c) :
    Section175bC2 d m c := ⟨hScienter, hPossession, hListed, hUnregistered⟩

theorem section175b_intro_restrictedPersonHandling {d tr : Person}
    {m : BioMaterial} {c : ComplaintText} (h : Section175bA d m c) :
    Section175b d tr m c := .restrictedPersonHandling h

theorem section175b_intro_transferToUnregisteredSelectAgent {d tr : Person}
    {m : BioMaterial} {c : ComplaintText} (h : Section175bB1 d tr m c) :
    Section175b d tr m c := .transferToUnregisteredSelectAgent h

theorem section175b_intro_transferToUnregisteredAgricultural {d tr : Person}
    {m : BioMaterial} {c : ComplaintText} (h : Section175bB2 d tr m c) :
    Section175b d tr m c := .transferToUnregisteredAgricultural h

theorem section175b_intro_unregisteredPossessionSelectAgent {d tr : Person}
    {m : BioMaterial} {c : ComplaintText} (h : Section175bC1 d m c) :
    Section175b d tr m c := .unregisteredPossessionSelectAgent h

theorem section175b_intro_unregisteredPossessionAgricultural {d tr : Person}
    {m : BioMaterial} {c : ComplaintText} (h : Section175bC2 d m c) :
    Section175b d tr m c := .unregisteredPossessionAgricultural h



theorem section175cJurisdiction_intro_commerce {d v : Person} {c : ComplaintText}
    (h : OffenseOccursInOrAffectsCommerce c) :
    Section175cJurisdiction d v c := .commerce h

theorem section175cJurisdiction_intro_abroadByNational {d v : Person}
    {c : ComplaintText} (h : OffenseOutsideUnitedStatesByUnitedStatesNational d c) :
    Section175cJurisdiction d v c := .abroadByNational h

theorem section175cJurisdiction_intro_againstNationalAbroad {d v : Person}
    {c : ComplaintText} (h : OffenseAgainstUnitedStatesNationalAbroad v c) :
    Section175cJurisdiction d v c := .againstNationalAbroad h

theorem section175cJurisdiction_intro_againstUnitedStatesProperty {d v : Person}
    {c : ComplaintText} (h : OffenseAgainstUnitedStatesProperty c) :
    Section175cJurisdiction d v c := .againstUnitedStatesProperty h

theorem section175cJurisdiction_intro_aiderOrConspirator {d v : Person}
    {c : ComplaintText} (h : AidsAbetsOrConspiresWithCoveredOffender d c) :
    Section175cJurisdiction d v c := .aiderOrConspirator h

theorem section175c_intro {d v : Person} {m : BioMaterial} {c : ComplaintText}
    (hScienter : ActedWithScienter d c) (hVariola : IsVariolaVirus m c)
    (hConduct : HandlesOrUsesVariolaVirus d m c)
    (hNotSecretary :
      ¬ ActsUnderAuthorityOfSecretaryOfHealthAndHumanServices d c)
    (hJurisdiction : Section175cJurisdiction d v c) :
    Section175c d v m c :=
  ⟨hScienter, hVariola, hConduct, hNotSecretary, hJurisdiction⟩

theorem section175cEnhancedUse_intro {d v : Person} {m : BioMaterial}
    {c : ComplaintText} (hBase : Section175c d v m c)
    (hUse : UsesOrThreatensToUseVariolaVirus d m c) :
    Section175cEnhancedUse d v m c := ⟨hBase, hUse⟩

theorem section175cDeathResulting_intro {d v : Person} {m : BioMaterial}
    {c : ComplaintText} (hBase : Section175c d v m c)
    (hDeath : DeathResultsFromViolation c) :
    Section175cDeathResulting d v m c := ⟨hBase, hDeath⟩



theorem section176SeizureAuthority_intro_warrant {m : BioMaterial}
    {c : ComplaintText} (h : SeizureWarrantIssued m c) :
    Section176SeizureAuthority m c := .warrant h

theorem section176SeizureAuthority_intro_exigent {m : BioMaterial}
    {c : ComplaintText} (h : ExigentCircumstancesWithProbableCause m c) :
    Section176SeizureAuthority m c := .exigent h

theorem section176SeizureProhibitedConduct_intro {m : BioMaterial}
    {c : ComplaintText} (hGround : PertainsToConductProhibitedBySection175 m c)
    (hAuthority : Section176SeizureAuthority m c) :
    Section176SeizureProhibitedConduct m c := ⟨hGround, hAuthority⟩

theorem section176SeizureNoJustification_intro {m : BioMaterial}
    {c : ComplaintText} (hGround : NoApparentPeacefulJustification m c)
    (hAuthority : Section176SeizureAuthority m c) :
    Section176SeizureNoJustification m c := ⟨hGround, hAuthority⟩

theorem section176Defense_intro {m : BioMaterial} {c : ComplaintText}
    (hPurpose : MaterialForProphylacticProtectiveOrPeacefulPurpose m c)
    (hQuantity : TypeAndQuantityReasonableForPurpose m c) :
    Section176Defense m c := ⟨hPurpose, hQuantity⟩

theorem section176ForfeitureProcess_intro {c : ComplaintText}
    (hNotice : NoticeToPotentialClaimantsGiven c)
    (hHearing : OpportunityForHearingProvided c)
    (hBurden : GovernmentCarriesPreponderanceBurden c) :
    Section176ForfeitureProcess c := ⟨hNotice, hHearing, hBurden⟩

theorem section176ForfeitureProhibitedConduct_intro {m : BioMaterial}
    {c : ComplaintText} (hSeizure : Section176SeizureProhibitedConduct m c)
    (hProcess : Section176ForfeitureProcess c) :
    Section176ForfeitureProhibitedConduct m c := ⟨hSeizure, hProcess⟩

theorem section176ForfeitureNoJustification_intro {m : BioMaterial}
    {c : ComplaintText} (hSeizure : Section176SeizureNoJustification m c)
    (hProcess : Section176ForfeitureProcess c)
    (hNoDefense : ¬ Section176Defense m c) :
    Section176ForfeitureNoJustification m c := ⟨hSeizure, hProcess, hNoDefense⟩

theorem section176Forfeiture_intro_prohibitedConduct {m : BioMaterial}
    {c : ComplaintText} (h : Section176ForfeitureProhibitedConduct m c) :
    Section176Forfeiture m c := .prohibitedConduct h

theorem section176Forfeiture_intro_noJustification {m : BioMaterial}
    {c : ComplaintText} (h : Section176ForfeitureNoJustification m c) :
    Section176Forfeiture m c := .noJustification h



theorem section177Defense_intro {m : BioMaterial} {c : ComplaintText}
    (hPurpose : MaterialForProphylacticProtectiveOrPeacefulPurpose m c)
    (hQuantity : TypeAndQuantityReasonableForPurpose m c) :
    Section177Defense m c := ⟨hPurpose, hQuantity⟩

theorem section177ProhibitedConduct_intro {d : Person} {c : ComplaintText}
    (hAction : UnitedStatesBringsCivilAction c)
    (hGround : ConductProhibitedBySection175 d c) :
    Section177ProhibitedConduct d c := ⟨hAction, hGround⟩

theorem section177Inchoate_intro {d : Person} {c : ComplaintText}
    (hAction : UnitedStatesBringsCivilAction c)
    (hGround : PreparationSolicitationAttemptThreatOrConspiracy d c) :
    Section177Inchoate d c := ⟨hAction, hGround⟩

theorem section177Unjustified_intro {d : Person} {m : BioMaterial}
    {c : ComplaintText} (hAction : UnitedStatesBringsCivilAction c)
    (hGround : UnjustifiedDevelopmentOrPossession d m c)
    (hNoDefense : ¬ Section177Defense m c) :
    Section177Unjustified d m c := ⟨hAction, hGround, hNoDefense⟩

theorem section177_intro_prohibitedConduct {d : Person} {m : BioMaterial}
    {c : ComplaintText} (h : Section177ProhibitedConduct d c) :
    Section177 d m c := .prohibitedConduct h

theorem section177_intro_inchoate {d : Person} {m : BioMaterial}
    {c : ComplaintText} (h : Section177Inchoate d c) :
    Section177 d m c := .inchoate h

theorem section177_intro_unjustified {d : Person} {m : BioMaterial}
    {c : ComplaintText} (h : Section177Unjustified d m c) :
    Section177 d m c := .unjustified h

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements
