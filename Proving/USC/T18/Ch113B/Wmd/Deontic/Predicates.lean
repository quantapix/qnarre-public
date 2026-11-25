







import Proving.USC.T18.Ch113B.Wmd.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Deontic

open Proving.USC.Common






axiom AddresseeAnyPerson2332aA (p : Person) (c : ComplaintText) : Prop





axiom RegulatedActUseOfWeaponOfMassDestruction2332a
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop






axiom HasLawfulAuthorityForWeaponOfMassDestructionUse2332a
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop





axiom ConditionAgainstUnitedStatesNationalAbroad2332aA1
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop




axiom ConditionAgainstPersonOrPropertyWithinUnitedStates2332aA2
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop




axiom ConditionInterstateOrForeignCommerceNexus2332aA2
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop





axiom ConditionAgainstUnitedStatesProperty2332aA3
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop




axiom ConditionAgainstForeignGovernmentPropertyWithinUnitedStates2332aA4
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop





axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ConditionConductOutsideTheUnitedStates2332aB
    (cd : Conduct) (c : ComplaintText) : Prop







axiom AddresseeAnyPerson2332bA (p : Person) (c : ComplaintText) : Prop





axiom ConditionConductTranscendingNationalBoundaries2332b
    (cd : Conduct) (c : ComplaintText) : Prop




axiom ConditionCircumstanceUnderSubsectionB2332bB1
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop




axiom ConditionInViolationOfStateOrFederalLaw2332bA1
    (cd : Conduct) (c : ComplaintText) : Prop





axiom RegulatedActViolenceAgainstPersonWithinUnitedStates2332bA1A
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop






axiom RegulatedActPropertyDestructionRiskingSeriousBodilyInjury2332bA1B
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop




axiom RegulatedActThreatAttemptOrConspiracy2332bA2
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop




axiom AddresseeUnitedStatesAsProsecutingSovereign2332b
    (o : Office) (c : ComplaintText) : Prop




axiom ConditionCircumstanceApplicableToAtLeastOneOffender2332bB2
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom PowerActJurisdictionOverAllParticipants2332bB2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop





axiom ConditionOffenseOrAccessoryConductUnderSubsectionA2332bE
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom PowerActExtraterritorialFederalJurisdiction2332bE
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop




axiom AddresseeSentencingCourt2332bC2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ConditionPersonConvictedOfViolationOfThisSection2332bC2
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom RegulatedActPlacingConvictedPersonOnProbation2332bC2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop





axiom RegulatedActImposingConcurrentTermOfImprisonment2332bC2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop




axiom AddresseeProsecution2332bD1
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ConditionProsecutionUnderThisSection2332bD
    (pr : Proceeding) (c : ComplaintText) : Prop





axiom PermittedActProceedWithoutProvingKnowledgeOfJurisdictionalBase2332bD1
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop




axiom AddresseeAttorneyGeneral2332bF (o : Office) (c : ComplaintText) : Prop






axiom ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF
    (cd : Conduct) (c : ComplaintText) : Prop




axiom RequiredActExercisePrimaryInvestigativeResponsibility2332bF
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop



axiom AddresseeSecretaryOfTheTreasury2332bF (o : Office) (c : ComplaintText) : Prop




axiom ConditionAttorneyGeneralRequestedAssistance2332bF
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop




axiom RequiredActAssistAttorneyGeneral2332bF
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop





axiom AddresseeUnitedStatesSecretService2332bF (o : Office) (c : ComplaintText) : Prop




axiom PowerActExerciseAuthorityUnderSection3056Unimpaired2332bF
    (o : Office) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Deontic
