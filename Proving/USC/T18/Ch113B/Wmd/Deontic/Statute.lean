











import Proving.USC.T18.Ch113B.Wmd.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Deontic

open Proving.USC.Common




def modality2332aA : Modality := Modality.prohibition




inductive TargetCircumstance2332aA
    (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where

  | nationalAbroad :
      ConditionAgainstUnitedStatesNationalAbroad2332aA1 cd t c →
      TargetCircumstance2332aA cd t c


  | withinUnitedStatesWithNexus :
      ConditionAgainstPersonOrPropertyWithinUnitedStates2332aA2 cd t c →
      ConditionInterstateOrForeignCommerceNexus2332aA2 cd t c →
      TargetCircumstance2332aA cd t c

  | unitedStatesProperty :
      ConditionAgainstUnitedStatesProperty2332aA3 cd t c →
      TargetCircumstance2332aA cd t c

  | foreignGovernmentProperty :
      ConditionAgainstForeignGovernmentPropertyWithinUnitedStates2332aA4 cd t c →
      TargetCircumstance2332aA cd t c



structure Prohibition2332aA
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson2332aA p c
  condition : TargetCircumstance2332aA cd t c




def Prohibition2332aAViolated
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332aA p cd t c
    ∧ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
    ∧ ¬ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c




def Prohibition2332aAComplied
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332aA p cd t c
    ∧ (¬ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
        ∨ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c)




def modality2332aB : Modality := Modality.prohibition



structure Prohibition2332aB
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop where
  addressee : IsNationalOfTheUnitedStates p c
  condition : ConditionConductOutsideTheUnitedStates2332aB cd c


def Prohibition2332aBViolated
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop :=
  Prohibition2332aB p cd c
    ∧ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
    ∧ ¬ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c



def Prohibition2332aBComplied
    (p : Person) (cd : Conduct) (c : ComplaintText) : Prop :=
  Prohibition2332aB p cd c
    ∧ (¬ RegulatedActUseOfWeaponOfMassDestruction2332a p cd c
        ∨ HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c)



inductive Section2332aViolated
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where

  | subsectionA : Prohibition2332aAViolated p cd t c → Section2332aViolated p cd t c

  | subsectionB : Prohibition2332aBViolated p cd c → Section2332aViolated p cd t c




def modality2332bA1 : Modality := Modality.prohibition


inductive RegulatedAct2332bA1
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where

  | violenceAgainstPerson :
      RegulatedActViolenceAgainstPersonWithinUnitedStates2332bA1A p cd t c →
      RegulatedAct2332bA1 p cd t c


  | propertyDestruction :
      RegulatedActPropertyDestructionRiskingSeriousBodilyInjury2332bA1B p cd t c →
      RegulatedAct2332bA1 p cd t c


structure Prohibition2332bA1
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson2332bA p c
  transnational : ConditionConductTranscendingNationalBoundaries2332b cd c
  circumstance : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c
  unlawfulUnderOtherLaw : ConditionInViolationOfStateOrFederalLaw2332bA1 cd c


def Prohibition2332bA1Violated
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332bA1 p cd t c ∧ RegulatedAct2332bA1 p cd t c



def Prohibition2332bA1Complied
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332bA1 p cd t c ∧ ¬ RegulatedAct2332bA1 p cd t c




def modality2332bA2 : Modality := Modality.prohibition




structure Prohibition2332bA2
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson2332bA p c
  transnational : ConditionConductTranscendingNationalBoundaries2332b cd c
  circumstance : ConditionCircumstanceUnderSubsectionB2332bB1 cd t c


def Prohibition2332bA2Violated
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332bA2 p cd t c ∧ RegulatedActThreatAttemptOrConspiracy2332bA2 p cd c



def Prohibition2332bA2Complied
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop :=
  Prohibition2332bA2 p cd t c ∧ ¬ RegulatedActThreatAttemptOrConspiracy2332bA2 p cd c



inductive Section2332bViolated
    (p : Person) (cd : Conduct) (t : Target) (c : ComplaintText) : Prop where

  | substantive : Prohibition2332bA1Violated p cd t c → Section2332bViolated p cd t c

  | inchoate : Prohibition2332bA2Violated p cd t c → Section2332bViolated p cd t c




def modality2332bB2 : Modality := Modality.power


structure Power2332bB2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeUnitedStatesAsProsecutingSovereign2332b o c
  condition : ConditionCircumstanceApplicableToAtLeastOneOffender2332bB2 pr c



def Power2332bB2Conferred
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2332bB2 o pr c ∧ PowerActJurisdictionOverAllParticipants2332bB2 o pr c




def modality2332bE : Modality := Modality.power


structure Power2332bE
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeUnitedStatesAsProsecutingSovereign2332b o c
  condition : ConditionOffenseOrAccessoryConductUnderSubsectionA2332bE pr c



def Power2332bEConferred
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power2332bE o pr c ∧ PowerActExtraterritorialFederalJurisdiction2332bE o pr c




def modality2332bC2 : Modality := Modality.prohibition


inductive RegulatedAct2332bC2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop where

  | probation :
      RegulatedActPlacingConvictedPersonOnProbation2332bC2 o pr c →
      RegulatedAct2332bC2 o pr c

  | concurrentTerm :
      RegulatedActImposingConcurrentTermOfImprisonment2332bC2 o pr c →
      RegulatedAct2332bC2 o pr c


structure Prohibition2332bC2
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeSentencingCourt2332bC2 o pr c
  condition : ConditionPersonConvictedOfViolationOfThisSection2332bC2 pr c


def Prohibition2332bC2Violated
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2332bC2 o pr c ∧ RegulatedAct2332bC2 o pr c



def Prohibition2332bC2Complied
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition2332bC2 o pr c ∧ ¬ RegulatedAct2332bC2 o pr c





def modality2332bD1 : Modality := Modality.permission


structure Permission2332bD1
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeProsecution2332bD1 o pr c
  condition : ConditionProsecutionUnderThisSection2332bD pr c



def Permission2332bD1Exercised
    (o : Office) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Permission2332bD1 o pr c
    ∧ PermittedActProceedWithoutProvingKnowledgeOfJurisdictionalBase2332bD1 o pr c




def modality2332bFAttorneyGeneral : Modality := Modality.obligation


structure Obligation2332bFAttorneyGeneral
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop where
  addressee : AddresseeAttorneyGeneral2332bF o c
  condition : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c



def Obligation2332bFAttorneyGeneralBreached
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral o cd c
    ∧ ¬ RequiredActExercisePrimaryInvestigativeResponsibility2332bF o cd c



def Obligation2332bFAttorneyGeneralDischarged
    (o : Office) (cd : Conduct) (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral o cd c
    ∧ RequiredActExercisePrimaryInvestigativeResponsibility2332bF o cd c



def modality2332bFTreasury : Modality := Modality.obligation



structure Obligation2332bFTreasury
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText) : Prop where
  addressee : AddresseeSecretaryOfTheTreasury2332bF o c
  matter : ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c
  request : ConditionAttorneyGeneralRequestedAssistance2332bF ag cd c


def Obligation2332bFTreasuryBreached
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury o ag cd c ∧ ¬ RequiredActAssistAttorneyGeneral2332bF o cd c



def Obligation2332bFTreasuryDischarged
    (o : Office) (ag : Office) (cd : Conduct) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury o ag cd c ∧ RequiredActAssistAttorneyGeneral2332bF o cd c





def modality2332bFSecretService : Modality := Modality.power


structure Power2332bFSecretService (o : Office) (c : ComplaintText) : Prop where
  addressee : AddresseeUnitedStatesSecretService2332bF o c



def Power2332bFSecretServicePreserved (o : Office) (c : ComplaintText) : Prop :=
  Power2332bFSecretService o c
    ∧ PowerActExerciseAuthorityUnderSection3056Unimpaired2332bF o c

end Proving.USC.T18.Ch113B.Wmd.Deontic
