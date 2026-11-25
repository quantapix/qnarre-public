







import Proving.USC.T18.Ch113B.Wmd.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Deontic.Predicates
import Proving.USC.T18.Ch113B.Wmd.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Deontic

open Proving.USC.Common




theorem targetCircumstance2332aA_intro_nationalAbroad
    (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : ConditionAgainstUnitedStatesNationalAbroad2332aA1 cd t c) :
    TargetCircumstance2332aA cd t c :=
  TargetCircumstance2332aA.nationalAbroad h


theorem targetCircumstance2332aA_intro_withinUnitedStatesWithNexus
    (cd : Conduct) (t : Target) (c : ComplaintText)
    (hIn : ConditionAgainstPersonOrPropertyWithinUnitedStates2332aA2 cd t c)
    (hNexus : ConditionInterstateOrForeignCommerceNexus2332aA2 cd t c) :
    TargetCircumstance2332aA cd t c :=
  TargetCircumstance2332aA.withinUnitedStatesWithNexus hIn hNexus


theorem targetCircumstance2332aA_intro_unitedStatesProperty
    (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : ConditionAgainstUnitedStatesProperty2332aA3 cd t c) :
    TargetCircumstance2332aA cd t c :=
  TargetCircumstance2332aA.unitedStatesProperty h


theorem targetCircumstance2332aA_intro_foreignGovernmentProperty
    (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : ConditionAgainstForeignGovernmentPropertyWithinUnitedStates2332aA4 cd t c) :
    TargetCircumstance2332aA cd t c :=
  TargetCircumstance2332aA.foreignGovernmentProperty h


theorem prohibition2332aA_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332aA p c)
    (hCond : TargetCircumstance2332aA cd t c) :
    Prohibition2332aA p cd t c :=
  ⟨hAddr, hCond⟩


theorem prohibition2332aAViolated_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332aA p c)
    (hCond : TargetCircumstance2332aA cd t c)
    (hAct : RegulatedActUseOfWeaponOfMassDestruction2332a p cd c)
    (hNoAuth : ¬ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c) :
    Prohibition2332aAViolated p cd t c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoAuth⟩


theorem prohibition2332aAComplied_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332aA p c)
    (hCond : TargetCircumstance2332aA cd t c)
    (hExcuse : ¬ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
        ∨ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c) :
    Prohibition2332aAComplied p cd t c :=
  ⟨⟨hAddr, hCond⟩, hExcuse⟩




theorem prohibition2332aB_intro
    (p : Person) (cd : Conduct) (c : ComplaintText)
    (hAddr : IsNationalOfTheUnitedStates p c)
    (hCond : ConditionConductOutsideTheUnitedStates2332aB cd c) :
    Prohibition2332aB p cd c :=
  ⟨hAddr, hCond⟩


theorem prohibition2332aBViolated_intro
    (p : Person) (cd : Conduct) (c : ComplaintText)
    (hAddr : IsNationalOfTheUnitedStates p c)
    (hCond : ConditionConductOutsideTheUnitedStates2332aB cd c)
    (hAct : RegulatedActUseOfWeaponOfMassDestruction2332a p cd c)
    (hNoAuth : ¬ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c) :
    Prohibition2332aBViolated p cd c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoAuth⟩


theorem prohibition2332aBComplied_intro
    (p : Person) (cd : Conduct) (c : ComplaintText)
    (hAddr : IsNationalOfTheUnitedStates p c)
    (hCond : ConditionConductOutsideTheUnitedStates2332aB cd c)
    (hExcuse : ¬ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
        ∨ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c) :
    Prohibition2332aBComplied p cd c :=
  ⟨⟨hAddr, hCond⟩, hExcuse⟩


theorem section2332aViolated_intro_subsectionA
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : Prohibition2332aAViolated p cd t c) :
    Section2332aViolated p cd t c :=
  Section2332aViolated.subsectionA h


theorem section2332aViolated_intro_subsectionB
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : Prohibition2332aBViolated p cd c) :
    Section2332aViolated p cd t c :=
  Section2332aViolated.subsectionB h




theorem regulatedAct2332bA1_intro_violenceAgainstPerson
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : RegulatedActViolenceAgainstPersonWithinUnitedStates2332bA1A p cd t c) :
    RegulatedAct2332bA1 p cd t c :=
  RegulatedAct2332bA1.violenceAgainstPerson h


theorem regulatedAct2332bA1_intro_propertyDestruction
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : RegulatedActPropertyDestructionRiskingSeriousBodilyInjury2332bA1B p cd t c) :
    RegulatedAct2332bA1 p cd t c :=
  RegulatedAct2332bA1.propertyDestruction h


theorem prohibition2332bA1_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c)
    (hUnlawful : ConditionInViolationOfStateOrFederalLaw2332bA1 cd c) :
    Prohibition2332bA1 p cd t c :=
  ⟨hAddr, hTrans, hCirc, hUnlawful⟩


theorem prohibition2332bA1Violated_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c)
    (hUnlawful : ConditionInViolationOfStateOrFederalLaw2332bA1 cd c)
    (hAct : RegulatedAct2332bA1 p cd t c) :
    Prohibition2332bA1Violated p cd t c :=
  ⟨⟨hAddr, hTrans, hCirc, hUnlawful⟩, hAct⟩


theorem prohibition2332bA1Complied_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c)
    (hUnlawful : ConditionInViolationOfStateOrFederalLaw2332bA1 cd c)
    (hNoAct : ¬ RegulatedAct2332bA1 p cd t c) :
    Prohibition2332bA1Complied p cd t c :=
  ⟨⟨hAddr, hTrans, hCirc, hUnlawful⟩, hNoAct⟩




theorem prohibition2332bA2_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c) :
    Prohibition2332bA2 p cd t c :=
  ⟨hAddr, hTrans, hCirc⟩


theorem prohibition2332bA2Violated_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c)
    (hAct : RegulatedActThreatAttemptOrConspiracy2332bA2 p cd c) :
    Prohibition2332bA2Violated p cd t c :=
  ⟨⟨hAddr, hTrans, hCirc⟩, hAct⟩


theorem prohibition2332bA2Complied_intro
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (hAddr : AddresseeAnyPerson2332bA p c)
    (hTrans : ConditionConductTranscendingNationalBoundaries2332b cd c)
    (hCirc : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c)
    (hNoAct : ¬ RegulatedActThreatAttemptOrConspiracy2332bA2 p cd c) :
    Prohibition2332bA2Complied p cd t c :=
  ⟨⟨hAddr, hTrans, hCirc⟩, hNoAct⟩


theorem section2332bViolated_intro_substantive
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : Prohibition2332bA1Violated p cd t c) :
    Section2332bViolated p cd t c :=
  Section2332bViolated.substantive h


theorem section2332bViolated_intro_inchoate
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText)
    (h : Prohibition2332bA2Violated p cd t c) :
    Section2332bViolated p cd t c :=
  Section2332bViolated.inchoate h




theorem power2332bB2_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesAsProsecutingSovereign2332b o c)
    (hCond : ConditionCircumstanceApplicableToAtLeastOneOffender2332bB2 pr c) :
    Power2332bB2 o pr c :=
  ⟨hAddr, hCond⟩


theorem power2332bB2Conferred_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesAsProsecutingSovereign2332b o c)
    (hCond : ConditionCircumstanceApplicableToAtLeastOneOffender2332bB2 pr c)
    (hAct : PowerActJurisdictionOverAllParticipants2332bB2 o pr c) :
    Power2332bB2Conferred o pr c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power2332bE_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesAsProsecutingSovereign2332b o c)
    (hCond : ConditionOffenseOrAccessoryConductUnderSubsectionA2332bE pr c) :
    Power2332bE o pr c :=
  ⟨hAddr, hCond⟩


theorem power2332bEConferred_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesAsProsecutingSovereign2332b o c)
    (hCond : ConditionOffenseOrAccessoryConductUnderSubsectionA2332bE pr c)
    (hAct : PowerActExtraterritorialFederalJurisdiction2332bE o pr c) :
    Power2332bEConferred o pr c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem regulatedAct2332bC2_intro_probation
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (h : RegulatedActPlacingConvictedPersonOnProbation2332bC2 o pr c) :
    RegulatedAct2332bC2 o pr c :=
  RegulatedAct2332bC2.probation h


theorem regulatedAct2332bC2_intro_concurrentTerm
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (h : RegulatedActImposingConcurrentTermOfImprisonment2332bC2 o pr c) :
    RegulatedAct2332bC2 o pr c :=
  RegulatedAct2332bC2.concurrentTerm h


theorem prohibition2332bC2_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeSentencingCourt2332bC2 o pr c)
    (hCond : ConditionPersonConvictedOfViolationOfThisSection2332bC2 pr c) :
    Prohibition2332bC2 o pr c :=
  ⟨hAddr, hCond⟩


theorem prohibition2332bC2Violated_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeSentencingCourt2332bC2 o pr c)
    (hCond : ConditionPersonConvictedOfViolationOfThisSection2332bC2 pr c)
    (hAct : RegulatedAct2332bC2 o pr c) :
    Prohibition2332bC2Violated o pr c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2332bC2Complied_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeSentencingCourt2332bC2 o pr c)
    (hCond : ConditionPersonConvictedOfViolationOfThisSection2332bC2 pr c)
    (hNoAct : ¬ RegulatedAct2332bC2 o pr c) :
    Prohibition2332bC2Complied o pr c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩




theorem permission2332bD1_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeProsecution2332bD1 o pr c)
    (hCond : ConditionProsecutionUnderThisSection2332bD pr c) :
    Permission2332bD1 o pr c :=
  ⟨hAddr, hCond⟩


theorem permission2332bD1Exercised_intro
    (o : Office) (pr : Proceeding) (c : ComplaintText)
    (hAddr : AddresseeProsecution2332bD1 o pr c)
    (hCond : ConditionProsecutionUnderThisSection2332bD pr c)
    (hAct : PermittedActProceedWithoutProvingKnowledgeOfJurisdictionalBase2332bD1 o pr c) :
    Permission2332bD1Exercised o pr c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem obligation2332bFAttorneyGeneral_intro
    (o : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeAttorneyGeneral2332bF o c)
    (hCond : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c) :
    Obligation2332bFAttorneyGeneral o cd c :=
  ⟨hAddr, hCond⟩


theorem obligation2332bFAttorneyGeneralBreached_intro
    (o : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeAttorneyGeneral2332bF o c)
    (hCond : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c)
    (hNoAct : ¬ RequiredActExercisePrimaryInvestigativeResponsibility2332bF o cd c) :
    Obligation2332bFAttorneyGeneralBreached o cd c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem obligation2332bFAttorneyGeneralDischarged_intro
    (o : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeAttorneyGeneral2332bF o c)
    (hCond : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c)
    (hAct : RequiredActExercisePrimaryInvestigativeResponsibility2332bF o cd c) :
    Obligation2332bFAttorneyGeneralDischarged o cd c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2332bFTreasury_intro
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeSecretaryOfTheTreasury2332bF o c)
    (hMatter : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c)
    (hReq : ConditionAttorneyGeneralRequestedAssistance2332bF ag cd c) :
    Obligation2332bFTreasury o ag cd c :=
  ⟨hAddr, hMatter, hReq⟩


theorem obligation2332bFTreasuryBreached_intro
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeSecretaryOfTheTreasury2332bF o c)
    (hMatter : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c)
    (hReq : ConditionAttorneyGeneralRequestedAssistance2332bF ag cd c)
    (hNoAct : ¬ RequiredActAssistAttorneyGeneral2332bF o cd c) :
    Obligation2332bFTreasuryBreached o ag cd c :=
  ⟨⟨hAddr, hMatter, hReq⟩, hNoAct⟩


theorem obligation2332bFTreasuryDischarged_intro
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText)
    (hAddr : AddresseeSecretaryOfTheTreasury2332bF o c)
    (hMatter : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c)
    (hReq : ConditionAttorneyGeneralRequestedAssistance2332bF ag cd c)
    (hAct : RequiredActAssistAttorneyGeneral2332bF o cd c) :
    Obligation2332bFTreasuryDischarged o ag cd c :=
  ⟨⟨hAddr, hMatter, hReq⟩, hAct⟩




theorem power2332bFSecretService_intro
    (o : Office) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesSecretService2332bF o c) :
    Power2332bFSecretService o c :=
  ⟨hAddr⟩


theorem power2332bFSecretServicePreserved_intro
    (o : Office) (c : ComplaintText)
    (hAddr : AddresseeUnitedStatesSecretService2332bF o c)
    (hAct : PowerActExerciseAuthorityUnderSection3056Unimpaired2332bF o c) :
    Power2332bFSecretServicePreserved o c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T18.Ch113B.Wmd.Deontic
