import Proving.USC.T18.Ch113B.MaterialSupport.Deontic.Types








set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Deontic

open Proving.USC.Common



axiom AddresseeInClass2339 (p : Person) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339 (p : Person) (w : Person) (c : ComplaintText) : Prop



axiom IsEnumeratedOffense2339 (o : Offense) (c : ComplaintText) : Prop



axiom ConditionMet2339 (p : Person) (w : Person) (o : Offense) (c : ComplaintText) : Prop



axiom IsProsecutingAuthority (p : Person) (c : ComplaintText) : Prop



axiom VenuePermittedDistrict2339b (d : JudicialDistrict) (o : Offense) (c : ComplaintText) : Prop



axiom AddresseeInClass2339A (p : Person) (c : ComplaintText) : Prop



axiom IsMaterialSupportOrResources2339A (m : MaterialSupport) (c : ComplaintText) : Prop



axiom IsTraining2339A (m : MaterialSupport) (c : ComplaintText) : Prop



axiom IsExpertAdviceOrAssistance2339A (m : MaterialSupport) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339A (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop



axiom IsEnumeratedOffense2339A (o : Offense) (c : ComplaintText) : Prop



axiom ConditionMet2339A (p : Person) (m : MaterialSupport) (o : Offense) (c : ComplaintText) : Prop



axiom AddresseeInClass2339Ba1 (p : Person) (c : ComplaintText) : Prop



axiom IsForeignTerroristOrganization2339B (g : Organization) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339Ba1 (p : Person) (m : MaterialSupport) (g : Organization) (c : ComplaintText) : Prop



axiom ConditionMet2339Ba1 (p : Person) (g : Organization) (c : ComplaintText) : Prop



axiom IsNationalOrLawfulPermanentResident (p : Person) (c : ComplaintText) : Prop



axiom IsStatelessPersonHabituallyResidentInUS (p : Person) (c : ComplaintText) : Prop



axiom BroughtIntoOrFoundInTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom OffenseOccursInWholeOrPartInTheUnitedStates (o : Offense) (c : ComplaintText) : Prop



axiom OffenseAffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop



axiom AidsAbetsOrConspiresWithJurisdictionalOffender (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom AddresseeInClass2339Ba2 (f : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsFunds2339B (u : Funds) (c : ComplaintText) : Prop



axiom ConditionMet2339Ba2 (f : FinancialInstitution) (u : Funds) (g : Organization) (c : ComplaintText) : Prop



axiom SecretaryAuthorizationApplies2339Ba2 (f : FinancialInstitution) (u : Funds) (c : ComplaintText) : Prop



axiom RetainedPossessionOrControl2339Ba2A (f : FinancialInstitution) (u : Funds) (c : ComplaintText) : Prop



axiom ReportedToSecretary2339Ba2B (f : FinancialInstitution) (u : Funds) (c : ComplaintText) : Prop



axiom KnowinglyFailedToComply2339Bb (f : FinancialInstitution) (u : Funds) (c : ComplaintText) : Prop



axiom amountRequiredToBeRetained2339Bb (f : FinancialInstitution) (u : Funds) (c : ComplaintText) : Nat



axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop



axiom IsSecretaryOfTheTreasury2339B (p : Person) (c : ComplaintText) : Prop



axiom AppearsEngagedOrAboutToEngageInViolation2339Bc (s : Person) (d : Person) (c : ComplaintText) : Prop



axiom CivilInjunctionActionInitiated2339Bc (a : Person) (d : Person) (c : ComplaintText) : Prop



axiom PossibleViolationUnderInvestigation2339Be1 (c : ComplaintText) : Prop



axiom InvestigationConducted2339Be1 (a : Person) (c : ComplaintText) : Prop



axiom InvestigationRelatesToFinancialInstitutionComplianceOrPenalty2339Be2 (c : ComplaintText) : Prop



axiom CoordinatedWithSecretary2339Be2 (a : Person) (c : ComplaintText) : Prop



axiom CriminalViolationEvidenceArose2339Be3 (c : ComplaintText) : Prop



axiom EvidenceReferredImmediatelyToAttorneyGeneral2339Be3 (c : ComplaintText) : Prop



axiom SecretaryTimelyNotifiedOfActionOnReferral2339Be3 (a : Person) (c : ComplaintText) : Prop



axiom ReferredToSecretaryForRemedialAction2339Be3 (a : Person) (c : ComplaintText) : Prop



axiom IsCivilProceedingUnderSection2339B (r : CivilProceeding) (c : ComplaintText) : Prop



axiom ExParteWrittenRequestByUnitedStates2339Bf1 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom SufficientShowingMade2339Bf1 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom CourtAuthorizedRedactionOrSubstitution2339Bf1 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom RequestGranted2339Bf1 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom DocumentsSealedAndPreserved2339Bf1B (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom SubstituteSufficientToPrepareDefense2339Bf2 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom CourtGrantedSubstitutionRequest2339Bf2 (r : CivilProceeding) (q : ClassifiedInfoRequest) (c : ComplaintText) : Prop



axiom DefendantSeeksToIntroduceClassifiedInformation2339Bf3 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom DefendantEstablishedRelevanceAndMateriality2339Bf3 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom PretrialOrderAppealed2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom daysFromPretrialOrderToNoticeOfAppeal2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Nat



axiom TrialCommencedBeforeAppealResolved2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom AppealTakenDuringTrial2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom TrialAdjournedUntilAppealResolved2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom AppealExpeditedByCourtOfAppeals2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop



axiom daysFromAdjournmentToArgument2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Nat



axiom daysFromArgumentToDecision2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Nat



axiom ProsecutionRestsOnPersonnelTheory2339Bh (p : Person) (c : ComplaintText) : Prop



axiom ProvidedPersonnelUnderOrganizationDirectionOrControl2339Bh (p : Person) (g : Organization) (c : ComplaintText) : Prop



axiom IsAuthorityConstruingOrApplyingSection2339Bi (p : Person) (c : ComplaintText) : Prop



axiom ConstructionAbridgesFirstAmendmentRights2339Bi (p : Person) (c : ComplaintText) : Prop



axiom ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory2339Bj (p : Person) (c : ComplaintText) : Prop



axiom SecretaryOfStateApprovedWithAttorneyGeneralConcurrence2339Bj (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop



axiom IsSecretaryOfState2339Bj (p : Person) (c : ComplaintText) : Prop



axiom ApprovalOfProvisionGranted2339Bj (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop



axiom MaterialSupportMayBeUsedToCarryOutTerroristActivity2339Bj (m : MaterialSupport) (c : ComplaintText) : Prop



axiom AddresseeInClass2339Ca1 (p : Person) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339Ca1 (p : Person) (u : Funds) (c : ComplaintText) : Prop



axiom IsTreatyOffense2339Ca1A (o : Offense) (c : ComplaintText) : Prop



axiom IsIntimidationOrCompulsionAct2339Ca1B (o : Offense) (c : ComplaintText) : Prop



axiom ConditionMet2339Ca1 (p : Person) (u : Funds) (o : Offense) (c : ComplaintText) : Prop



axiom OffenseTakesPlaceInTheUnitedStates2339Cb (o : Offense) (c : ComplaintText) : Prop



axiom ForeignNexusCircumstance2339Cb1 (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ExtraterritorialNexusCircumstance2339Cb2 (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom CommittedOnUnitedStatesVesselOrAircraft2339Cb (o : Offense) (c : ComplaintText) : Prop



axiom DirectedAtCompellingTheUnitedStates2339Cb5 (o : Offense) (c : ComplaintText) : Prop



axiom IsInTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsUnitedStatesNationalOrDomesticLegalEntity (p : Person) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339Cc (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop



axiom ConditionMet2339Cc (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop



axiom IsDomesticLegalEntity2339Cf (l : LegalEntity) (c : ComplaintText) : Prop



axiom ManagerCommittedSubsectionAOffense2339Cf (l : LegalEntity) (p : Person) (c : ComplaintText) : Prop



axiom sumPaidToUnitedStates2339Cf (l : LegalEntity) (c : ComplaintText) : Nat



axiom AddresseeInClass2339D (p : Person) (c : ComplaintText) : Prop



axiom IsMilitaryTypeTraining2339D (t : MilitaryTraining) (c : ComplaintText) : Prop



axiom RegulatedActOccurred2339D (p : Person) (t : MilitaryTraining) (g : Organization) (c : ComplaintText) : Prop



axiom OrganizationDesignatedAtTimeOfTraining2339D (g : Organization) (t : MilitaryTraining) (c : ComplaintText) : Prop



axiom ConditionMet2339D (p : Person) (g : Organization) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.MaterialSupport.Deontic
