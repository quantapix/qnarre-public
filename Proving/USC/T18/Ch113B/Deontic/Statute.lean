






















import Proving.USC.T18.Ch113B.Deontic.Types
import Proving.USC.T18.Ch113B.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Deontic

open Proving.USC.Common






structure Prohibition2332A (c : ComplaintText) : Prop where
  condition : NationalOutsideUnitedStates2332A c


def Violated2332A (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332A c ∧ KillsNationalOfUnitedStates2332A p c





structure Prohibition2332B (p : Person) (c : ComplaintText) : Prop where
  condition : ConductOccurredOutsideUnitedStates p c


def Violated2332B (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332B p c ∧ AttemptsOrConspiresToKillNational2332B p c





structure Prohibition2332C (p : Person) (c : ComplaintText) : Prop where
  condition : ConductOccurredOutsideUnitedStates p c
  injury : IntendsOrCausesSeriousBodilyInjuryToNational2332C p c


def Violated2332C (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332C p c ∧ EngagesInPhysicalViolence2332C p c





structure Prohibition2332D (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : OffenseDescribedInSection2332D pr c



def Violated2332D (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2332D pr c ∧ ProsecutionUndertakenByUnitedStates2332D pr c ∧
    ¬ AttorneyGeneralWrittenCertification2332D pr c





structure Prohibition2332aA (p : Person) (d : Device) (c : ComplaintText) : Prop where
  weapon : IsWeaponOfMassDestruction2332a d c
  circumstance : JurisdictionalCircumstance2332aA p c


def Violated2332aA (p : Person) (d : Device) (c : ComplaintText) : Prop :=
  Prohibition2332aA p d c ∧ UsesThreatensAttemptsOrConspiresToUseWMD2332a p d c ∧
    ¬ HasLawfulAuthority2332a p c




structure Prohibition2332aB (p : Person) (d : Device) (c : ComplaintText) : Prop where
  addressee : IsNationalOfUnitedStates p c
  weapon : IsWeaponOfMassDestruction2332a d c
  condition : ConductOccurredOutsideUnitedStates p c


def Violated2332aB (p : Person) (d : Device) (c : ComplaintText) : Prop :=
  Prohibition2332aB p d c ∧ UsesThreatensAttemptsOrConspiresToUseWMD2332a p d c ∧
    ¬ HasLawfulAuthority2332a p c





structure Prohibition2332bA1 (p : Person) (c : ComplaintText) : Prop where
  transcends : ConductTranscendsNationalBoundaries2332bA1 p c
  circumstance : JurisdictionalCircumstance2332bB1 p c
  unlawful : InViolationOfStateOrFederalLaw2332bA1 p c


def Violated2332bA1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332bA1 p c ∧ CommitsEnumeratedViolentAct2332bA1 p c


structure Prohibition2332bA2 (p : Person) (c : ComplaintText) : Prop where
  transcends : ConductTranscendsNationalBoundaries2332bA1 p c
  circumstance : JurisdictionalCircumstance2332bB1 p c


def Violated2332bA2 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332bA2 p c ∧ ThreatensAttemptsOrConspires2332bA2 p c



structure Power2332bB2 (c : ComplaintText) : Prop where
  condition : CircumstanceAppliesToAtLeastOneOffender2332bB2 c



structure Prohibition2332bC2Probation (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PersonConvictedUnderSection2332bC2 pr c


def Violated2332bC2Probation (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2332bC2Probation pr c ∧ PlacesConvictedPersonOnProbation2332bC2 pr c



structure Prohibition2332bC2Concurrent (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PersonConvictedUnderSection2332bC2 pr c


def Violated2332bC2Concurrent (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2332bC2Concurrent pr c ∧ ImposesConcurrentTermOfImprisonment2332bC2 pr c




structure Permission2332bD1 (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : JurisdictionalBaseAllegedInIndictment2332bD1 pr c


def Exercised2332bD1 (pr : Proceeding) (c : ComplaintText) : Prop :=
  Permission2332bD1 pr c ∧
    ProsecutionProceedsWithoutProvingJurisdictionalKnowledge2332bD1 pr c



structure Power2332bE (p : Person) (c : ComplaintText) : Prop where
  condition : OffenseUnderSubsectionA2332bE p c




structure Obligation2332bF1 (o : Official) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral o c
  condition : FederalCrimeOfTerrorismOrEnumeratedViolation2332bF c


def Breached2332bF1 (o : Official) (c : ComplaintText) : Prop :=
  Obligation2332bF1 o c ∧ ¬ ExercisesPrimaryInvestigativeResponsibility2332bF o c



structure Obligation2332bF2 (o ag : Official) (c : ComplaintText) : Prop where
  addressee : IsSecretaryOfTheTreasury o c
  requester : IsAttorneyGeneral ag c
  request : AttorneyGeneralRequestsAssistance2332bF ag c


def Breached2332bF2 (o ag : Official) (c : ComplaintText) : Prop :=
  Obligation2332bF2 o ag c ∧ ¬ AssistsAttorneyGeneral2332bF o c






structure Prohibition2332d (p : Person) (k : Country) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesPerson p c
  designated : CountryDesignatedAsSupportingInternationalTerrorism2332d k c
  scienter : KnowsOrHasReasonableCauseToKnowDesignation2332d p k c


def Violated2332d (p : Person) (t : Transaction) (k : Country) (c : ComplaintText) : Prop :=
  Prohibition2332d p k c ∧ EngagesInFinancialTransactionWithGovernment2332d p t k c ∧
    ¬ TreasuryRegulationExempts2332d p t c




structure Power2332dRegulations (o : Official) (c : ComplaintText) : Prop where
  addressee : IsSecretaryOfTheTreasury o c
  consultation : InConsultationWithSecretaryOfState2332d o c


def Exercised2332dRegulations (o : Official) (c : ComplaintText) : Prop :=
  Power2332dRegulations o c ∧ IssuesRegulationsUnderSection2332d o c






structure Power2332e (o : Official) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral o c
  emergency : EmergencyInvolvingWeaponOfMassDestruction2332e c
  enforcement : SupportsEnforcementOfSection2332a c


def Exercised2332e (o : Official) (c : ComplaintText) : Prop :=
  Power2332e o c ∧ RequestsDefenseAssistanceUnderTitle10Section382 o c



structure Power2332eDelegated (o : Official) (c : ComplaintText) : Prop where
  addressee : IsDelegatedJusticeOfficial2332e o c
  emergency : EmergencyInvolvingWeaponOfMassDestruction2332e c
  enforcement : SupportsEnforcementOfSection2332a c


def Exercised2332eDelegated (o : Official) (c : ComplaintText) : Prop :=
  Power2332eDelegated o c ∧ RequestsDefenseAssistanceUnderTitle10Section382 o c






structure Prohibition2332fA1 (p : Person) (d : Device) (f : Facility)
    (c : ComplaintText) : Prop where
  device : IsExplosiveOrOtherLethalDevice2332f d c
  target : IsCoveredPlaceOrFacility2332f f c
  intent : IntendsDeathInjuryOrExtensiveDestruction2332fA1 p c
  jurisdiction : JurisdictionalCircumstance2332fB p c


def Violated2332fA1 (p : Person) (d : Device) (f : Facility) (c : ComplaintText) : Prop :=
  Prohibition2332fA1 p d f c ∧ DeliversPlacesDischargesOrDetonates2332fA1 p d f c ∧
    ¬ SectionInapplicable2332fD p c


structure Prohibition2332fA2 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : JurisdictionalCircumstance2332fB p c


def Violated2332fA2 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332fA2 p c ∧ AttemptsOrConspires2332fA2 p c ∧ ¬ SectionInapplicable2332fD p c



structure Power2332fB (p : Person) (c : ComplaintText) : Prop where
  condition : JurisdictionalCircumstance2332fB p c






structure Prohibition2332gA1 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  item : IsCoveredMissileSystemOrComponent2332g d c
  jurisdiction : JurisdictionalCircumstance2332gB p c



def Violated2332gA1 (p : Person) (d : Device) (c : ComplaintText) : Prop :=
  Prohibition2332gA1 p d c ∧ KnowinglyDealsInMissileSystem2332gA1 p d c ∧
    ¬ DeviceNotDesignedOrRedesignedAsWeapon2332gA2 d c ∧
    ¬ GovernmentAuthorityOrContract2332gA3 p c


structure Power2332gB (p : Person) (c : ComplaintText) : Prop where
  condition : JurisdictionalCircumstance2332gB p c



structure Obligation2332gC1 (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PersonConvictedUnderSubsectionA2332gC1 pr c


def Breached2332gC1 (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2332gC1 pr c ∧ ¬ SentencesToImprisonmentNotLessThanTwentyFiveYears2332gC1 pr c






structure Prohibition2332hA1 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  item : IsRadiologicalWeaponOrDevice2332h d c
  jurisdiction : JurisdictionalCircumstance2332hB p c


def Violated2332hA1 (p : Person) (d : Device) (c : ComplaintText) : Prop :=
  Prohibition2332hA1 p d c ∧ KnowinglyDealsInRadiologicalDevice2332hA1 p d c ∧
    ¬ GovernmentAuthorityOrContract2332hA2 p c


structure Power2332hB (p : Person) (c : ComplaintText) : Prop where
  condition : JurisdictionalCircumstance2332hB p c


structure Obligation2332hC1 (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PersonConvictedUnderSubsectionA2332hC1 pr c


def Breached2332hC1 (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2332hC1 pr c ∧ ¬ SentencesToImprisonmentNotLessThanTwentyFiveYears2332hC1 pr c





structure Prohibition2332iA1 (p : Person) (c : ComplaintText) : Prop where
  mens : HasRequisiteIntentOrKnowledge2332iA1 p c
  jurisdiction : JurisdictionalCircumstance2332iB p c


def Violated2332iA1 (p : Person) (d : Device) (c : ComplaintText) : Prop :=
  Prohibition2332iA1 p c ∧
    KnowinglyAndUnlawfullyPossessesOrUsesRadioactiveMaterial2332iA1 p d c ∧
    ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c


structure Prohibition2332iA2 (p : Person) (c : ComplaintText) : Prop where
  credibility : ThreatMayReasonablyBeBelieved2332iA2 p c
  jurisdiction : JurisdictionalCircumstance2332iB p c


def Violated2332iA2 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332iA2 p c ∧ ThreatensOrDemandsByThreatOrForce2332iA2 p c ∧
    ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c


structure Prohibition2332iA3 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : JurisdictionalCircumstance2332iB p c


def Violated2332iA3 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332iA3 p c ∧ AttemptsOrConspires2332iA3 p c ∧
    ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c


structure Power2332iB (p : Person) (c : ComplaintText) : Prop where
  condition : JurisdictionalCircumstance2332iB p c




structure Obligation2332iC (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PersonConvictedUnderSection2332iC pr c


def Breached2332iC (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2332iC pr c ∧ ¬ ImposesImprisonmentAndFine2332iC pr c





structure Permission2333A (p : Person) (a : TerroristAct) (c : ComplaintText) : Prop where
  addressee : IsNationalOfUnitedStates p c
  terrorism : IsActOfInternationalTerrorism2331 a c
  injury : InjuredByReasonOfActOfInternationalTerrorism2333A p a c


def Exercised2333A (p : Person) (a : TerroristAct) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  Permission2333A p a c ∧ SuesInDistrictCourt2333A p pr c




structure Obligation2333A (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : PrevailsInSection2333Action2333A p pr c


def Breached2333A (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation2333A p pr c ∧ ¬ AwardsThreefoldDamagesAndCosts2333A pr c




structure Prohibition2333B (pr : Proceeding) (c : ComplaintText) : Prop where
  condition : FinalJudgmentForUnitedStates2333B pr c


def Violated2333B (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2333B pr c ∧ DeniesEssentialAllegations2333B p pr c



structure Prohibition2333C (pr : Proceeding) (c : ComplaintText) : Prop where
  judgment : FinalJudgmentForForeignState2333C pr c
  fullFaith : JudgmentEntitledToFullFaithAndCredit2333C pr c


def Violated2333C (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2333C pr c ∧ DeniesEssentialAllegations2333C p pr c



structure Permission2333D (p : Person) (a : TerroristAct) (g : Organization)
    (c : ComplaintText) : Prop where
  designated : OrganizationDesignatedForeignTerroristOrganization2333D g c
  attribution : ActCommittedPlannedOrAuthorizedByOrganization2333D a g c
  participation : KnowinglyProvidesSubstantialAssistanceOrConspires2333D p c


def Exercised2333D (p : Person) (a : TerroristAct) (g : Organization) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  Permission2333D p a g c ∧ AssertsSecondaryLiability2333D p pr c






inductive Ch113BNormBroken (c : ComplaintText) : Prop where
  | v2332A (p : Person) (h : Violated2332A p c)
  | v2332B (p : Person) (h : Violated2332B p c)
  | v2332C (p : Person) (h : Violated2332C p c)
  | v2332D (pr : Proceeding) (h : Violated2332D pr c)
  | v2332aA (p : Person) (d : Device) (h : Violated2332aA p d c)
  | v2332aB (p : Person) (d : Device) (h : Violated2332aB p d c)
  | v2332bA1 (p : Person) (h : Violated2332bA1 p c)
  | v2332bA2 (p : Person) (h : Violated2332bA2 p c)
  | v2332bC2Probation (pr : Proceeding) (h : Violated2332bC2Probation pr c)
  | v2332bC2Concurrent (pr : Proceeding) (h : Violated2332bC2Concurrent pr c)
  | v2332d (p : Person) (t : Transaction) (k : Country) (h : Violated2332d p t k c)
  | v2332fA1 (p : Person) (d : Device) (f : Facility) (h : Violated2332fA1 p d f c)
  | v2332fA2 (p : Person) (h : Violated2332fA2 p c)
  | v2332gA1 (p : Person) (d : Device) (h : Violated2332gA1 p d c)
  | v2332hA1 (p : Person) (d : Device) (h : Violated2332hA1 p d c)
  | v2332iA1 (p : Person) (d : Device) (h : Violated2332iA1 p d c)
  | v2332iA2 (p : Person) (h : Violated2332iA2 p c)
  | v2332iA3 (p : Person) (h : Violated2332iA3 p c)
  | v2333B (p : Person) (pr : Proceeding) (h : Violated2333B p pr c)
  | v2333C (p : Person) (pr : Proceeding) (h : Violated2333C p pr c)
  | b2332bF1 (o : Official) (h : Breached2332bF1 o c)
  | b2332bF2 (o ag : Official) (h : Breached2332bF2 o ag c)
  | b2332gC1 (pr : Proceeding) (h : Breached2332gC1 pr c)
  | b2332hC1 (pr : Proceeding) (h : Breached2332hC1 pr c)
  | b2332iC (pr : Proceeding) (h : Breached2332iC pr c)
  | b2333A (p : Person) (pr : Proceeding) (h : Breached2333A p pr c)

end Proving.USC.T18.Ch113B.Deontic
