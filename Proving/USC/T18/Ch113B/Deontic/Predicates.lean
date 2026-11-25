










import Proving.USC.T18.Ch113B.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Deontic

open Proving.USC.Common






axiom IsNationalOfUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ConductOccurredOutsideUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom IsAttorneyGeneral (o : Official) (c : ComplaintText) : Prop




axiom IsSecretaryOfTheTreasury (o : Official) (c : ComplaintText) : Prop





axiom IsUnitedStatesPerson (p : Person) (c : ComplaintText) : Prop









axiom IsActOfInternationalTerrorism2331 (a : TerroristAct) (c : ComplaintText) : Prop






axiom KillsNationalOfUnitedStates2332A (p : Person) (c : ComplaintText) : Prop




axiom NationalOutsideUnitedStates2332A (c : ComplaintText) : Prop




axiom AttemptsOrConspiresToKillNational2332B (p : Person) (c : ComplaintText) : Prop



axiom EngagesInPhysicalViolence2332C (p : Person) (c : ComplaintText) : Prop





axiom IntendsOrCausesSeriousBodilyInjuryToNational2332C (p : Person) (c : ComplaintText) : Prop




axiom ProsecutionUndertakenByUnitedStates2332D (pr : Proceeding) (c : ComplaintText) : Prop



axiom OffenseDescribedInSection2332D (pr : Proceeding) (c : ComplaintText) : Prop







axiom AttorneyGeneralWrittenCertification2332D (pr : Proceeding) (c : ComplaintText) : Prop






axiom UsesThreatensAttemptsOrConspiresToUseWMD2332a
    (p : Person) (d : Device) (c : ComplaintText) : Prop





axiom IsWeaponOfMassDestruction2332a (d : Device) (c : ComplaintText) : Prop






axiom JurisdictionalCircumstance2332aA (p : Person) (c : ComplaintText) : Prop




axiom HasLawfulAuthority2332a (p : Person) (c : ComplaintText) : Prop









axiom CommitsEnumeratedViolentAct2332bA1 (p : Person) (c : ComplaintText) : Prop





axiom ConductTranscendsNationalBoundaries2332bA1 (p : Person) (c : ComplaintText) : Prop





axiom JurisdictionalCircumstance2332bB1 (p : Person) (c : ComplaintText) : Prop




axiom InViolationOfStateOrFederalLaw2332bA1 (p : Person) (c : ComplaintText) : Prop




axiom ThreatensAttemptsOrConspires2332bA2 (p : Person) (c : ComplaintText) : Prop





axiom CircumstanceAppliesToAtLeastOneOffender2332bB2 (c : ComplaintText) : Prop




axiom PlacesConvictedPersonOnProbation2332bC2 (pr : Proceeding) (c : ComplaintText) : Prop





axiom ImposesConcurrentTermOfImprisonment2332bC2 (pr : Proceeding) (c : ComplaintText) : Prop




axiom PersonConvictedUnderSection2332bC2 (pr : Proceeding) (c : ComplaintText) : Prop




axiom ProsecutionProceedsWithoutProvingJurisdictionalKnowledge2332bD1
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom JurisdictionalBaseAllegedInIndictment2332bD1 (pr : Proceeding) (c : ComplaintText) : Prop






axiom OffenseUnderSubsectionA2332bE (p : Person) (c : ComplaintText) : Prop




axiom FederalCrimeOfTerrorismOrEnumeratedViolation2332bF (c : ComplaintText) : Prop




axiom ExercisesPrimaryInvestigativeResponsibility2332bF
    (o : Official) (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestsAssistance2332bF (o : Official) (c : ComplaintText) : Prop




axiom AssistsAttorneyGeneral2332bF (o : Official) (c : ComplaintText) : Prop






axiom EngagesInFinancialTransactionWithGovernment2332d
    (p : Person) (t : Transaction) (k : Country) (c : ComplaintText) : Prop





axiom CountryDesignatedAsSupportingInternationalTerrorism2332d
    (k : Country) (c : ComplaintText) : Prop




axiom KnowsOrHasReasonableCauseToKnowDesignation2332d
    (p : Person) (k : Country) (c : ComplaintText) : Prop





axiom TreasuryRegulationExempts2332d
    (p : Person) (t : Transaction) (c : ComplaintText) : Prop




axiom IssuesRegulationsUnderSection2332d (o : Official) (c : ComplaintText) : Prop




axiom InConsultationWithSecretaryOfState2332d (o : Official) (c : ComplaintText) : Prop






axiom RequestsDefenseAssistanceUnderTitle10Section382
    (o : Official) (c : ComplaintText) : Prop




axiom EmergencyInvolvingWeaponOfMassDestruction2332e (c : ComplaintText) : Prop




axiom SupportsEnforcementOfSection2332a (c : ComplaintText) : Prop




axiom IsDelegatedJusticeOfficial2332e (o : Official) (c : ComplaintText) : Prop






axiom DeliversPlacesDischargesOrDetonates2332fA1
    (p : Person) (d : Device) (f : Facility) (c : ComplaintText) : Prop




axiom IsExplosiveOrOtherLethalDevice2332f (d : Device) (c : ComplaintText) : Prop





axiom IsCoveredPlaceOrFacility2332f (f : Facility) (c : ComplaintText) : Prop





axiom IntendsDeathInjuryOrExtensiveDestruction2332fA1
    (p : Person) (c : ComplaintText) : Prop




axiom AttemptsOrConspires2332fA2 (p : Person) (c : ComplaintText) : Prop





axiom JurisdictionalCircumstance2332fB (p : Person) (c : ComplaintText) : Prop





axiom SectionInapplicable2332fD (p : Person) (c : ComplaintText) : Prop








axiom KnowinglyDealsInMissileSystem2332gA1
    (p : Person) (d : Device) (c : ComplaintText) : Prop





axiom IsCoveredMissileSystemOrComponent2332g (d : Device) (c : ComplaintText) : Prop




axiom DeviceNotDesignedOrRedesignedAsWeapon2332gA2 (d : Device) (c : ComplaintText) : Prop





axiom GovernmentAuthorityOrContract2332gA3 (p : Person) (c : ComplaintText) : Prop




axiom JurisdictionalCircumstance2332gB (p : Person) (c : ComplaintText) : Prop





axiom SentencesToImprisonmentNotLessThanTwentyFiveYears2332gC1
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom PersonConvictedUnderSubsectionA2332gC1 (pr : Proceeding) (c : ComplaintText) : Prop







axiom KnowinglyDealsInRadiologicalDevice2332hA1
    (p : Person) (d : Device) (c : ComplaintText) : Prop






axiom IsRadiologicalWeaponOrDevice2332h (d : Device) (c : ComplaintText) : Prop






axiom GovernmentAuthorityOrContract2332hA2 (p : Person) (c : ComplaintText) : Prop




axiom JurisdictionalCircumstance2332hB (p : Person) (c : ComplaintText) : Prop





axiom SentencesToImprisonmentNotLessThanTwentyFiveYears2332hC1
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom PersonConvictedUnderSubsectionA2332hC1 (pr : Proceeding) (c : ComplaintText) : Prop









axiom KnowinglyAndUnlawfullyPossessesOrUsesRadioactiveMaterial2332iA1
    (p : Person) (d : Device) (c : ComplaintText) : Prop







axiom HasRequisiteIntentOrKnowledge2332iA1 (p : Person) (c : ComplaintText) : Prop





axiom ThreatensOrDemandsByThreatOrForce2332iA2 (p : Person) (c : ComplaintText) : Prop




axiom ThreatMayReasonablyBeBelieved2332iA2 (p : Person) (c : ComplaintText) : Prop





axiom AttemptsOrConspires2332iA3 (p : Person) (c : ComplaintText) : Prop




axiom JurisdictionalCircumstance2332iB (p : Person) (c : ComplaintText) : Prop





axiom ImposesImprisonmentAndFine2332iC (pr : Proceeding) (c : ComplaintText) : Prop




axiom PersonConvictedUnderSection2332iC (pr : Proceeding) (c : ComplaintText) : Prop





axiom ArmedForcesOrMilitaryActivityExemption2332iD (p : Person) (c : ComplaintText) : Prop







axiom InjuredByReasonOfActOfInternationalTerrorism2333A
    (p : Person) (a : TerroristAct) (c : ComplaintText) : Prop




axiom SuesInDistrictCourt2333A (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom AwardsThreefoldDamagesAndCosts2333A (pr : Proceeding) (c : ComplaintText) : Prop




axiom PrevailsInSection2333Action2333A
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom DeniesEssentialAllegations2333B
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom FinalJudgmentForUnitedStates2333B (pr : Proceeding) (c : ComplaintText) : Prop




axiom DeniesEssentialAllegations2333C
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom FinalJudgmentForForeignState2333C (pr : Proceeding) (c : ComplaintText) : Prop




axiom JudgmentEntitledToFullFaithAndCredit2333C (pr : Proceeding) (c : ComplaintText) : Prop




axiom AssertsSecondaryLiability2333D
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom OrganizationDesignatedForeignTerroristOrganization2333D
    (g : Organization) (c : ComplaintText) : Prop




axiom ActCommittedPlannedOrAuthorizedByOrganization2333D
    (a : TerroristAct) (g : Organization) (c : ComplaintText) : Prop





axiom KnowinglyProvidesSubstantialAssistanceOrConspires2333D
    (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Deontic
