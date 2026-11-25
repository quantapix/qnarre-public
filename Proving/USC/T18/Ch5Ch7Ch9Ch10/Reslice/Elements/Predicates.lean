import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements.Types
import Proving.USC.Common.Predicates









set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements

open Proving.USC.Common


axiom ForciblyAssaultsOrImpedes (d v : Person) (c : ComplaintText) : Prop

axiom IsSection1114ProtectedOfficer (v : Person) (c : ComplaintText) : Prop

axiom EngagedInOrOnAccountOfOfficialDuties (v : Person) (c : ComplaintText) : Prop

axiom ForciblyAssaultsOrIntimidates (d v : Person) (c : ComplaintText) : Prop

axiom IsFormerSection1114ProtectedOfficer (v : Person) (c : ComplaintText) : Prop

axiom OnAccountOfDutiesDuringTermOfService (v : Person) (c : ComplaintText) : Prop

axiom UsesDeadlyOrDangerousWeapon (d : Person) (w : DangerousWeapon) (c : ComplaintText) : Prop

axiom InflictsBodilyInjury (d v : Person) (c : ComplaintText) : Prop

axiom PhysicalContactWithVictim (d v : Person) (c : ComplaintText) : Prop

axiom IntentToCommitAnotherFelony (d : Person) (c : ComplaintText) : Prop

axiom ExtraterritorialJurisdictionOverConduct (c : ComplaintText) : Prop

axiom IsProtectedForeignPerson (v : Person) (c : ComplaintText) : Prop

axiom ViolentAttackOnPerson (d v : Person) (c : ComplaintText) : Prop

axiom ViolentAttackOnProtectedPremises (d v : Person) (c : ComplaintText) : Prop

axiom LikelyToEndangerPersonOrLiberty (v : Person) (c : ComplaintText) : Prop

axiom AttemptsProhibitedAttack (d v : Person) (c : ComplaintText) : Prop

axiom IntimidatesCoercesThreatensOrHarasses (d v : Person) (c : ComplaintText) : Prop

axiom ObstructsForeignOfficialInDuties (d v : Person) (c : ComplaintText) : Prop

axiom AttemptsIntimidationOrObstruction (d v : Person) (c : ComplaintText) : Prop

axiom WithinOneHundredFeetOfProtectedPremises (d : Person) (c : ComplaintText) : Prop

axiom CongregatesWithTwoOrMoreOthers (d : Person) (c : ComplaintText) : Prop

axiom IntentToViolateSection112 (d : Person) (c : ComplaintText) : Prop

axiom ExercisesProtectedFirstAmendmentRight (d : Person) (c : ComplaintText) : Prop

axiom VictimIsInternationallyProtectedPersonAbroad (v : Person) (c : ComplaintText) : Prop

axiom VictimIsUnitedStatesRepresentativeOrAgent (v : Person) (c : ComplaintText) : Prop

axiom OffenderIsNationalOfTheUnitedStates (d : Person) (c : ComplaintText) : Prop

axiom OffenderFoundInTheUnitedStates (d : Person) (c : ComplaintText) : Prop

axiom WithinSpecialMaritimeAndTerritorialJurisdiction (c : ComplaintText) : Prop

axiom CommitsAssault (d v : Person) (c : ComplaintText) : Prop

axiom IntentToCommitMurderOrSexualAbuse (d : Person) (c : ComplaintText) : Prop

axiom IntentToCommitFelony (d : Person) (c : ComplaintText) : Prop

axiom AssaultWithDangerousWeapon (d : Person) (w : DangerousWeapon) (c : ComplaintText) : Prop

axiom IntentToDoBodilyHarm (d : Person) (c : ComplaintText) : Prop

axiom AssaultByStrikingBeatingOrWounding (d v : Person) (c : ComplaintText) : Prop

axiom IsSimpleAssault (d v : Person) (c : ComplaintText) : Prop

axiom VictimUnderSixteen (v : Person) (c : ComplaintText) : Prop

axiom ResultsInSeriousBodilyInjury (d v : Person) (c : ComplaintText) : Prop

axiom ResultsInSubstantialBodilyInjury (d v : Person) (c : ComplaintText) : Prop

axiom IsSpouseIntimateOrDatingPartner (d v : Person) (c : ComplaintText) : Prop

axiom AssaultByStranglingOrSuffocating (d v : Person) (c : ComplaintText) : Prop

axiom IntentToTortureMaimOrDisfigure (d : Person) (c : ComplaintText) : Prop

axiom MutilatesOrDisablesBodyPart (d v : Person) (c : ComplaintText) : Prop

axiom ThrowsCorrosiveOrScaldingSubstance (d v : Person) (c : ComplaintText) : Prop

axiom IsCoveredFederalOfficial (v : Person) (c : ComplaintText) : Prop

axiom IsFormerCoveredFederalOfficial (v : Person) (c : ComplaintText) : Prop

axiom IsImmediateFamilyMember (fm v : Person) (c : ComplaintText) : Prop

axiom AssaultsKidnapsOrMurders (d v : Person) (c : ComplaintText) : Prop

axiom AttemptsOrConspiresToKidnapOrMurder (d v : Person) (c : ComplaintText) : Prop

axiom ThreatensToAssaultKidnapOrMurder (d v : Person) (c : ComplaintText) : Prop

axiom IntentToImpedeOrInterfereWithOfficialDuties (d : Person) (c : ComplaintText) : Prop

axiom IntentToRetaliateForOfficialDuties (d : Person) (c : ComplaintText) : Prop

axiom PerformsFemaleGenitalMutilation (d v : Person) (c : ComplaintText) : Prop

axiom ParentOrGuardianFacilitatesOrConsents (d v : Person) (c : ComplaintText) : Prop

axiom TransportsForPurposeOfMutilation (d v : Person) (c : ComplaintText) : Prop

axiom VictimUnderEighteen (v : Person) (c : ComplaintText) : Prop

axiom DefendantOrVictimTraveledInCommerce (d : Person) (c : ComplaintText) : Prop

axiom UsedInstrumentalityOfCommerce (d : Person) (c : ComplaintText) : Prop

axiom PaymentMadeUsingCommerce (d : Person) (c : ComplaintText) : Prop

axiom TransmittedCommunicationInCommerce (d : Person) (c : ComplaintText) : Prop

axiom ObjectUsedTraveledInCommerce (d : Person) (c : ComplaintText) : Prop

axiom ConductWithinFederalTerritory (d : Person) (c : ComplaintText) : Prop

axiom ConductOtherwiseAffectedCommerce (d : Person) (c : ComplaintText) : Prop

axiom OperationNecessaryToHealth (v : Person) (c : ComplaintText) : Prop

axiom PerformedByLicensedMedicalPractitioner (d : Person) (c : ComplaintText) : Prop

axiom OperationForLaborOrBirthPurposes (v : Person) (c : ComplaintText) : Prop

axiom PerformedByLicensedMidwifeOrTrainee (d : Person) (c : ComplaintText) : Prop

axiom IsDomesticRelationship (d v : Person) (c : ComplaintText) : Prop

axiom WithinFederalOrIndianCountryJurisdiction (c : ComplaintText) : Prop

axiom PriorConvictionIsFinal (pc : PriorConviction) (c : ComplaintText) : Prop

axiom PriorOffenseAgainstSpouseOrChild (pc : PriorConviction) (c : ComplaintText) : Prop

axiom PriorOffenseUnderChapter110A (pc : PriorConviction) (c : ComplaintText) : Prop

axiom ObstructsResistsOrInterferes (d v : Person) (c : ComplaintText) : Prop

axiom IsFederalLawEnforcementAgent (v : Person) (c : ComplaintText) : Prop

axiom EngagedInStatutoryProtectiveFunctions (v : Person) (c : ComplaintText) : Prop

axiom WithinUnitedStatesOrSpecialJurisdiction (c : ComplaintText) : Prop

axiom MakesRestrictedInformationPubliclyAvailable (d : Person) (i : RestrictedPersonalInfo) (c : ComplaintText) : Prop

axiom IsRestrictedPersonalInformation (i : RestrictedPersonalInfo) (v : Person) (c : ComplaintText) : Prop

axiom IsCourtOfficerJurorOrWitness (v : Person) (c : ComplaintText) : Prop

axiom IsFederalInformantOrWitness (v : Person) (c : ComplaintText) : Prop

axiom IsStateOrLocalOfficerAssistingFederalInvestigation (v : Person) (c : ComplaintText) : Prop

axiom IntentToThreatenIntimidateOrInciteViolence (d : Person) (c : ComplaintText) : Prop

axiom IntentAndKnowledgeInformationWillBeUsedToThreaten (d : Person) (c : ComplaintText) : Prop

axiom PetitionFiledUnderTitle11 (dbtr : Person) (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom ActsKnowinglyAndFraudulently (d : Person) (c : ComplaintText) : Prop

axiom InOrInRelationToTitle11Case (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom AfterFilingOfTitle11Case (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom InContemplationOfTitle11Case (d : Person) (c : ComplaintText) : Prop

axiom IntentToDefeatTitle11 (d : Person) (c : ComplaintText) : Prop

axiom ConcealsPropertyFromEstateOfficer (d : Person) (pr : EstateProperty) (c : ComplaintText) : Prop

axiom PropertyBelongsToDebtorEstate (pr : EstateProperty) (c : ComplaintText) : Prop

axiom MakesFalseOathOrAccount (d : Person) (c : ComplaintText) : Prop

axiom MakesFalseDeclarationUnderPenaltyOfPerjury (d : Person) (c : ComplaintText) : Prop

axiom PresentsOrUsesClaimAgainstEstate (d : Person) (cl : ProofOfClaim) (c : ComplaintText) : Prop

axiom ClaimIsFalse (cl : ProofOfClaim) (c : ComplaintText) : Prop

axiom ReceivesMaterialAmountOfPropertyFromDebtor (d : Person) (pr : EstateProperty) (c : ComplaintText) : Prop

axiom GivesOrObtainsUnlawfulConsideration (d : Person) (c : ComplaintText) : Prop

axiom ForActingOrForbearingInTitle11Case (d : Person) (c : ComplaintText) : Prop

axiom TransfersOrConcealsProperty (d : Person) (pr : EstateProperty) (c : ComplaintText) : Prop

axiom ConcealsDestroysOrFalsifiesRecordedInformation (d : Person) (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom RecordedInformationRelatesToDebtorAffairs (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom WithholdsRecordedInformationFromOfficer (d : Person) (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom OfficerEntitledToPossession (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom ParticipatesInEstateAdministration (d : Person) (c : ComplaintText) : Prop

axiom HasAccessToEstatePropertyOrDocuments (d : Person) (c : ComplaintText) : Prop

axiom AppropriatesEmbezzlesOrTransfersEstateProperty (d : Person) (pr : EstateProperty) (c : ComplaintText) : Prop

axiom SecretesOrDestroysEstateDocument (d : Person) (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom IsCourtOfficerInTitle11Case (d : Person) (c : ComplaintText) : Prop

axiom PurchasesPropertyOfEstate (d : Person) (pr : EstateProperty) (c : ComplaintText) : Prop

axiom RefusesInspectionByPartiesInInterest (d : Person) (c : ComplaintText) : Prop

axiom CourtDirectedInspection (d : Person) (c : ComplaintText) : Prop

axiom RefusesInspectionByUnitedStatesTrustee (d : Person) (c : ComplaintText) : Prop

axiom IsPartyInInterestOrAttorney (d : Person) (c : ComplaintText) : Prop

axiom AgreementWithAnotherPartyInInterest (ag : Agreement) (c : ComplaintText) : Prop

axiom AgreementFixesFeesFromEstateAssets (ag : Agreement) (c : ComplaintText) : Prop

axiom InReceivershipOrTitle11CaseInUnitedStatesCourt (c : ComplaintText) : Prop

axiom IsBankruptcyPetitionPreparer (d : Person) (c : ComplaintText) : Prop

axiom KnowingAttemptToDisregardBankruptcyRequirements (d : Person) (c : ComplaintText) : Prop

axiom CaseOrProceedingDismissed (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom DismissalCausedByPreparerDisregard (d : Person) (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom DevisedOrIntendedSchemeToDefraud (d : Person) (c : ComplaintText) : Prop

axiom ForPurposeOfExecutingOrConcealingScheme (d : Person) (c : ComplaintText) : Prop

axiom FilesPetitionUnderTitle11 (d : Person) (bc : BankruptcyCase) (c : ComplaintText) : Prop

axiom FilesDocumentInTitle11Proceeding (d : Person) (doc : RecordedInformation) (c : ComplaintText) : Prop

axiom MakesFalseRepresentationConcerningTitle11Proceeding (d : Person) (c : ComplaintText) : Prop

axiom AttorneyGeneralDesignatesEnforcementIndividuals (c : ComplaintText) : Prop

axiom DesigneeIsUnitedStatesAttorneyOrFbiAgent (v : Person) (c : ComplaintText) : Prop

axiom DesignationCoversAbusiveReaffirmationEnforcement (c : ComplaintText) : Prop

axiom DesignationCoversMateriallyFraudulentSchedules (c : ComplaintText) : Prop

axiom BankruptcyCourtsEstablishReferralProcedures (c : ComplaintText) : Prop

axiom DevelopsProducesOrPossessesBioMaterial (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom LacksProphylacticProtectiveOrPeacefulPurpose (m : BioMaterial) (c : ComplaintText) : Prop

axiom AssistsForeignStateOrOrganization (d : Person) (org : Entity) (c : ComplaintText) : Prop

axiom AttemptsThreatensOrConspiresToViolate (d : Person) (c : ComplaintText) : Prop

axiom PossessesBioMaterial (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom QuantityOrTypeNotReasonablyJustified (m : BioMaterial) (c : ComplaintText) : Prop

axiom NaturallyOccurringAndUnextracted (m : BioMaterial) (c : ComplaintText) : Prop

axiom ExtraterritorialJurisdictionOverUnitedStatesNational (d : Person) (c : ComplaintText) : Prop

axiom EmergencyInvolvingBiologicalWeaponOfMassDestruction (c : ComplaintText) : Prop

axiom AttorneyGeneralRequestsMilitaryAssistance (c : ComplaintText) : Prop

axiom RequestSupportsSection175Enforcement (c : ComplaintText) : Prop

axiom UnderIndictmentForFelony (p : Person) (c : ComplaintText) : Prop

axiom ConvictedOfFelony (p : Person) (c : ComplaintText) : Prop

axiom IsFugitiveFromJustice (p : Person) (c : ComplaintText) : Prop

axiom IsUnlawfulUserOfControlledSubstance (p : Person) (c : ComplaintText) : Prop

axiom IsAlienUnlawfullyInTheUnitedStates (p : Person) (c : ComplaintText) : Prop

axiom AdjudicatedMentalDefectiveOrCommitted (p : Person) (c : ComplaintText) : Prop

axiom IsNationalOrAgentOfStateSponsorOfTerrorism (p : Person) (c : ComplaintText) : Prop

axiom DischargedUnderDishonorableConditions (p : Person) (c : ComplaintText) : Prop

axiom IsMemberOrAgentOfTerroristOrganization (p : Person) (c : ComplaintText) : Prop

axiom ListedAsSelectAgentUnderPart73 (m : BioMaterial) (c : ComplaintText) : Prop

axiom NotExcludedOrExemptedUnderPart73 (m : BioMaterial) (c : ComplaintText) : Prop

axiom ShipsTransportsOrPossessesInCommerce (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom ReceivesAgentShippedInCommerce (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom DulyAuthorizedUnitedStatesGovernmentalActivity (d : Person) (c : ComplaintText) : Prop

axiom TransfersSelectAgentToTransferee (d tr : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom TransferorKnowsOrHasReasonableCauseToBelieveUnregistered (d tr : Person) (c : ComplaintText) : Prop

axiom TransfereeNotRegisteredUnderPublicHealthServiceAct (tr : Person) (c : ComplaintText) : Prop

axiom TransfereeNotRegisteredUnderAgriculturalBioterrorismAct (tr : Person) (c : ComplaintText) : Prop

axiom AgentListedUnderAgriculturalBioterrorismAct (m : BioMaterial) (c : ComplaintText) : Prop

axiom PossessorLacksRegistrationUnderPublicHealthServiceAct (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom PossessorLacksRegistrationUnderAgriculturalBioterrorismAct (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsVariolaVirus (m : BioMaterial) (c : ComplaintText) : Prop

axiom HandlesOrUsesVariolaVirus (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom ActsUnderAuthorityOfSecretaryOfHealthAndHumanServices (d : Person) (c : ComplaintText) : Prop

axiom OffenseOccursInOrAffectsCommerce (c : ComplaintText) : Prop

axiom OffenseOutsideUnitedStatesByUnitedStatesNational (d : Person) (c : ComplaintText) : Prop

axiom OffenseAgainstUnitedStatesNationalAbroad (v : Person) (c : ComplaintText) : Prop

axiom OffenseAgainstUnitedStatesProperty (c : ComplaintText) : Prop

axiom AidsAbetsOrConspiresWithCoveredOffender (d : Person) (c : ComplaintText) : Prop

axiom UsesOrThreatensToUseVariolaVirus (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom DeathResultsFromViolation (c : ComplaintText) : Prop

axiom PertainsToConductProhibitedBySection175 (m : BioMaterial) (c : ComplaintText) : Prop

axiom NoApparentPeacefulJustification (m : BioMaterial) (c : ComplaintText) : Prop

axiom SeizureWarrantIssued (m : BioMaterial) (c : ComplaintText) : Prop

axiom ExigentCircumstancesWithProbableCause (m : BioMaterial) (c : ComplaintText) : Prop

axiom NoticeToPotentialClaimantsGiven (c : ComplaintText) : Prop

axiom OpportunityForHearingProvided (c : ComplaintText) : Prop

axiom GovernmentCarriesPreponderanceBurden (c : ComplaintText) : Prop

axiom MaterialForProphylacticProtectiveOrPeacefulPurpose (m : BioMaterial) (c : ComplaintText) : Prop

axiom TypeAndQuantityReasonableForPurpose (m : BioMaterial) (c : ComplaintText) : Prop

axiom UnitedStatesBringsCivilAction (c : ComplaintText) : Prop

axiom ConductProhibitedBySection175 (d : Person) (c : ComplaintText) : Prop

axiom PreparationSolicitationAttemptThreatOrConspiracy (d : Person) (c : ComplaintText) : Prop

axiom UnjustifiedDevelopmentOrPossession (d : Person) (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsMicroorganismOrInfectiousSubstance (m : BioMaterial) (c : ComplaintText) : Prop

axiom CapableOfCausingDeathDiseaseOrMalfunction (m : BioMaterial) (c : ComplaintText) : Prop

axiom CapableOfCausingDeteriorationOfMaterials (m : BioMaterial) (c : ComplaintText) : Prop

axiom CapableOfDeleteriousAlterationOfEnvironment (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsToxicMaterialOrProduct (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsPoisonousSubstanceOrBiologicalProduct (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsPoisonousIsomerHomologOrDerivative (m : BioMaterial) (c : ComplaintText) : Prop

axiom SpecificallyDesignedToDeliverAgentOrToxin (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsVector (m : BioMaterial) (c : ComplaintText) : Prop

axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom PriorQualifyingConvictionCount (d : Person) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements
