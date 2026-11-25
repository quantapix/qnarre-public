












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Procedure

open Proving.USC.Common







axiom DesignatedForeignTerroristOrganization (x : Person) (c : ComplaintText) : Prop




axiom DesignatedSpeciallyDesignatedGlobalTerrorist (x : Person) (c : ComplaintText) : Prop




axiom CourtDeterminedNotMilitaryForce (x : Person) (c : ComplaintText) : Prop





axiom IsNationalOfTheUnitedStates (x : Person) (c : ComplaintText) : Prop






axiom ProsecutionUndertakenByUnitedStates (pr : Prosecution) (c : ComplaintText) : Prop



axiom WrittenCertificationFiledForProsecution
    (pr : Prosecution) (cert : Certification) (c : ComplaintText) : Prop





axiom CertifyingOfficialAuthorized (cert : Certification) (c : ComplaintText) : Prop





axiom CertificationRecitesCoerciveIntentJudgment
    (cert : Certification) (c : ComplaintText) : Prop



axiom dayOfCertification (cert : Certification) (c : ComplaintText) : Nat



axiom dayOfProsecutionCommencement (pr : Prosecution) (c : ComplaintText) : Nat






axiom Section2332aJurisdictionalCircumstance (o : Offense) (c : ComplaintText) : Prop






axiom Section2332bCircumstanceAppliesToAtLeastOneOffender
    (o : Offense) (c : ComplaintText) : Prop




axiom IsPrincipalCoconspiratorOrAccessoryAfterTheFact
    (x : Person) (o : Offense) (c : ComplaintText) : Prop




axiom JurisdictionalBaseAllegedInIndictment (o : Offense) (c : ComplaintText) : Prop



axiom OffenseBasedOnAdoptedStateLaw (o : Offense) (c : ComplaintText) : Prop




axiom StateLawOffenseElementsProved (o : Offense) (c : ComplaintText) : Prop




axiom IsOffenseUnderSection2332bSubsectionA (o : Offense) (c : ComplaintText) : Prop




axiom IsAccessoryAfterTheFactUnderSection3
    (x : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ConvictedOfSection2332bViolation (x : Person) (c : ComplaintText) : Prop



axiom ProbationImposed (s : Sentencing) (c : ComplaintText) : Prop




axiom TermOfImprisonmentRunsConcurrently (s : Sentencing) (c : ComplaintText) : Prop






axiom IsFederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop




axiom IsSection2332bfEnumeratedViolation (o : Offense) (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestedTreasuryAssistance (o : Offense) (c : ComplaintText) : Prop




axiom SecretServiceAuthorityDisplaced (o : Offense) (c : ComplaintText) : Prop






axiom CountryDesignatedAsSupportingInternationalTerrorism
    (s : ForeignState) (c : ComplaintText) : Prop



axiom TreasuryRegulationIssued (r : Regulation) (c : ComplaintText) : Prop




axiom TreasurySecretaryConsultedSecretaryOfState (r : Regulation) (c : ComplaintText) : Prop




axiom TransactionAuthorizedByTreasuryRegulation
    (r : Regulation) (x : Person) (s : ForeignState) (c : ComplaintText) : Prop





axiom IsUnitedStatesPerson (x : Person) (c : ComplaintText) : Prop



axiom dayOfCountryDesignation (s : ForeignState) (c : ComplaintText) : Nat



axiom dayOfFinancialTransaction (x : Person) (s : ForeignState) (c : ComplaintText) : Nat






axiom EmergencySituationInvolvingWeaponOfMassDestruction (c : ComplaintText) : Prop




axiom RequestMadeByAttorneyGeneral (r : AssistanceRequest) (c : ComplaintText) : Prop





axiom RequestMadeByDelegatedJusticeOfficial (r : AssistanceRequest) (c : ComplaintText) : Prop




axiom RequestSupportsSection2332aEnforcement (r : AssistanceRequest) (c : ComplaintText) : Prop





axiom OffenseTakesPlaceInUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom OffenseTakesPlaceOutsideUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom Section2332fDomesticNexusCircumstance (o : Offense) (c : ComplaintText) : Prop




axiom Section2332fForeignNexusCircumstance (o : Offense) (c : ComplaintText) : Prop




axiom ArmedForcesActivityDuringArmedConflict (o : Offense) (c : ComplaintText) : Prop




axiom MilitaryForcesOfStateOfficialDuties (o : Offense) (c : ComplaintText) : Prop






axiom Section2332fWhollyDomesticWithoutCommerceEffect (o : Offense) (c : ComplaintText) : Prop






axiom Section2332gJurisdictionalCircumstance (o : Offense) (c : ComplaintText) : Prop





axiom Section2332gConductUnderUnitedStatesOrStateAuthority
    (o : Offense) (c : ComplaintText) : Prop




axiom Section2332gConductPursuantToGovernmentContract (o : Offense) (c : ComplaintText) : Prop




axiom Section2332hJurisdictionalCircumstance (o : Offense) (c : ComplaintText) : Prop





axiom Section2332hConductUnderUnitedStatesAuthority (o : Offense) (c : ComplaintText) : Prop




axiom Section2332hConductPursuantToUnitedStatesContract (o : Offense) (c : ComplaintText) : Prop



axiom DeathResultedFromViolation (o : Offense) (c : ComplaintText) : Prop




axiom LifeImprisonmentImposed (s : Sentencing) (c : ComplaintText) : Prop




axiom yearsOfImprisonmentImposed (s : Sentencing) (c : ComplaintText) : Nat



axiom fineImposedDollars (s : Sentencing) (c : ComplaintText) : Nat






axiom Section2332iJurisdictionalCircumstance (o : Offense) (c : ComplaintText) : Prop






axiom Section2333ClaimAccrued (x : Person) (c : ComplaintText) : Prop




axiom IsEstateSurvivorOrHeirOfInjuredNational (x : Person) (c : ComplaintText) : Prop



axiom CivilActionCommenced (a : CivilAction) (x : Person) (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt (a : CivilAction) (c : ComplaintText) : Prop




axiom FinalJudgmentForUnitedStatesInCriminalProceeding
    (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom CriminalProceedingUnderSection2333bEnumeratedOffense
    (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom SameDefendantInCriminalAndCivilProceeding
    (x : Person) (j : CriminalJudgment) (a : CivilAction) (c : ComplaintText) : Prop




axiom FinalJudgmentForForeignStateInCriminalProceeding
    (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom JudgmentAccordedFullFaithAndCredit (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom ActCommittedPlannedOrAuthorizedByOrganization
    (org : Person) (a : CivilAction) (c : ComplaintText) : Prop




axiom KnowinglyProvidedSubstantialAssistance
    (x : Person) (a : CivilAction) (c : ComplaintText) : Prop




axiom ConspiredWithPersonWhoCommittedAct
    (x : Person) (a : CivilAction) (c : ComplaintText) : Prop




axiom ObtainedJudgmentAgainstTerroristParty
    (x : Person) (a : CivilAction) (c : ComplaintText) : Prop




axiom IsAssetOfTerroristParty (as_ : Asset) (a : CivilAction) (c : ComplaintText) : Prop




axiom AssetSeizedOrFrozenUnderKingpinAct (as_ : Asset) (c : ComplaintText) : Prop



axiom dayOfCriminalJudgment (j : CriminalJudgment) (c : ComplaintText) : Nat




axiom dayOfCivilActionCommencement (a : CivilAction) (c : ComplaintText) : Nat




axiom dayOfActOfInternationalTerrorism (a : CivilAction) (c : ComplaintText) : Nat




axiom dayDesignationTookEffect (d : Designation) (c : ComplaintText) : Nat




axiom dayDesignationCeasedToBeInForce (d : Designation) (c : ComplaintText) : Nat



axiom damagesSustainedDollars (a : CivilAction) (c : ComplaintText) : Nat




axiom costOfSuitDollars (a : CivilAction) (c : ComplaintText) : Nat




axiom judgmentAmountEnteredDollars (a : CivilAction) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch113B.Procedure
