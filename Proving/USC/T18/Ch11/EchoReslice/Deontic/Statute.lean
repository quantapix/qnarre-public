







import Proving.USC.T18.Ch11.EchoReslice.Deontic.Types
import Proving.USC.T18.Ch11.EchoReslice.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Deontic

open Proving.USC.Common (Person ComplaintText)







def modality201a1 : Modality := .definition


def modality201a2 : Modality := .definition


def modality201a3 : Modality := .definition


def Term201a1PublicOfficial (p : Person) (c : ComplaintText) : Prop :=
  IsPublicOfficial p c


def Term201a2SelectedOfficial (p : Person) (c : ComplaintText) : Prop :=
  IsPersonSelectedToBePublicOfficial p c


def Term201a3OfficialAct (a : OfficialAct) (c : ComplaintText) : Prop :=
  IsOfficialAct a c





def OfficialOrSelectee (p : Person) (c : ComplaintText) : Prop :=
  IsPublicOfficial p c ∨ IsPersonSelectedToBePublicOfficial p c



def OfficialFormerOrSelectee (p : Person) (c : ComplaintText) : Prop :=
  IsPublicOfficial p c ∨ IsFormerPublicOfficial p c ∨
    IsPersonSelectedToBePublicOfficial p c




def modality201b1 : Modality := .prohibition



structure Prohibition201b1 (giver recipient : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever giver c
  recipientInClass : OfficialOrSelectee recipient c


inductive Intent201b1 (giver recipient : Person) (a : OfficialAct)
    (c : ComplaintText) : Prop where

  | influenceOfficialAct
      (hAct : IsOfficialAct a c)
      (hIntent : IntentToInfluenceOfficialAct giver a c)


  | influenceFraudOnUnitedStates
      (hIntent : IntentToInfluenceCommissionOfFraudOnUnitedStates giver recipient c)

  | induceViolationOfLawfulDuty
      (hIntent : IntentToInduceViolationOfLawfulDuty giver recipient c)



def ProhibitionViolated201b1 (giver recipient : Person) (v : ThingOfValue)
    (a : OfficialAct) (c : ComplaintText) : Prop :=
  Prohibition201b1 giver recipient c ∧
    GivesOffersOrPromisesThingOfValue giver recipient v c ∧
    ActsCorruptly giver c ∧
    Intent201b1 giver recipient a c




def modality201b2 : Modality := .prohibition



structure Prohibition201b2 (taker : Person) (c : ComplaintText) : Prop where
  addressee : OfficialOrSelectee taker c


inductive ReturnFor201b2 (taker : Person) (a : OfficialAct)
    (c : ComplaintText) : Prop where

  | influencedInOfficialAct
      (hAct : IsOfficialAct a c)
      (hReturn : InReturnForBeingInfluencedInOfficialAct taker a c)

  | influencedToCommitFraudOnUnitedStates
      (hReturn : InReturnForBeingInfluencedToCommitFraudOnUnitedStates taker c)

  | inducedToViolateOfficialDuty
      (hReturn : InReturnForBeingInducedToViolateOfficialDuty taker c)


def ProhibitionViolated201b2 (taker : Person) (v : ThingOfValue)
    (a : OfficialAct) (c : ComplaintText) : Prop :=
  Prohibition201b2 taker c ∧
    DemandsSeeksReceivesOrAcceptsThingOfValue taker v c ∧
    ActsCorruptly taker c ∧
    ReturnFor201b2 taker a c




def modality201b3 : Modality := .prohibition



structure Prohibition201b3 (giver witness : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever giver c
  witnessCondition : IsWitnessInFederalProceeding witness pr c


inductive Intent201b3 (giver witness : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where

  | influenceTestimony (h : IntentToInfluenceTestimony giver witness pr c)

  | induceAbsence (h : IntentToInduceAbsenceFromProceeding giver witness pr c)





def ProhibitionViolated201b3 (giver witness : Person) (v : ThingOfValue)
    (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition201b3 giver witness pr c ∧
    GivesOffersOrPromisesThingOfValue giver witness v c ∧
    ActsCorruptly giver c ∧
    Intent201b3 giver witness pr c ∧
    ¬ WitnessFeeOrExpenseExemptionApplies v pr c




def modality201b4 : Modality := .prohibition



structure Prohibition201b4 (taker : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever taker c
  witnessCondition : IsWitnessInFederalProceeding taker pr c


inductive ReturnFor201b4 (taker : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where

  | influencedInTestimony (h : InReturnForBeingInfluencedInTestimony taker pr c)

  | absentingFromProceeding (h : InReturnForAbsentingFromProceeding taker pr c)



def ProhibitionViolated201b4 (taker : Person) (v : ThingOfValue)
    (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition201b4 taker pr c ∧
    DemandsSeeksReceivesOrAcceptsThingOfValue taker v c ∧
    ActsCorruptly taker c ∧
    ReturnFor201b4 taker pr c ∧
    ¬ WitnessFeeOrExpenseExemptionApplies v pr c




def modality201c1A : Modality := .prohibition




structure Prohibition201c1A (giver recipient : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever giver c
  recipientInClass : OfficialFormerOrSelectee recipient c





def ProhibitionViolated201c1A (giver recipient : Person) (v : ThingOfValue)
    (a : OfficialAct) (c : ComplaintText) : Prop :=
  Prohibition201c1A giver recipient c ∧
    GivesOffersOrPromisesThingOfValue giver recipient v c ∧
    OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c ∧
    IsOfficialAct a c ∧
    ForOrBecauseOfOfficialActPerformedOrToBePerformed v a c




def modality201c1B : Modality := .prohibition



structure Prohibition201c1B (taker : Person) (c : ComplaintText) : Prop where
  addressee : OfficialFormerOrSelectee taker c



def ProhibitionViolated201c1B (taker : Person) (v : ThingOfValue)
    (a : OfficialAct) (c : ComplaintText) : Prop :=
  Prohibition201c1B taker c ∧
    DemandsSeeksReceivesOrAcceptsThingOfValue taker v c ∧
    ReceivesThingOfValuePersonally taker v c ∧
    OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c ∧
    IsOfficialAct a c ∧
    ForOrBecauseOfOfficialActPerformedOrToBePerformed v a c




def modality201c2 : Modality := .prohibition


structure Prohibition201c2 (giver witness : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever giver c
  witnessCondition : IsWitnessInFederalProceeding witness pr c



def ProhibitionViolated201c2 (giver witness : Person) (v : ThingOfValue)
    (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition201c2 giver witness pr c ∧
    GivesOffersOrPromisesThingOfValue giver witness v c ∧
    ForOrBecauseOfTestimonyOrAbsence v pr c ∧
    ¬ WitnessFeeOrExpenseExemptionApplies v pr c




def modality201c3 : Modality := .prohibition


structure Prohibition201c3 (taker : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever taker c
  witnessCondition : IsWitnessInFederalProceeding taker pr c



def ProhibitionViolated201c3 (taker : Person) (v : ThingOfValue)
    (pr : Proceeding) (c : ComplaintText) : Prop :=
  Prohibition201c3 taker pr c ∧
    DemandsSeeksReceivesOrAcceptsThingOfValue taker v c ∧
    ReceivesThingOfValuePersonally taker v c ∧
    ForOrBecauseOfTestimonyOrAbsence v pr c ∧
    ¬ WitnessFeeOrExpenseExemptionApplies v pr c






def modality201bPenalty : Modality := .obligation



structure Obligation201bPenalty (defendant : Person) (c : ComplaintText) : Prop where
  condition : ConvictedUnderSubsectionB defendant c



def ObligationBreached201bPenalty (defendant : Person) (c : ComplaintText) : Prop :=
  Obligation201bPenalty defendant c ∧ ¬ FineOrImprisonmentImposed defendant c




def SentenceWithinStatutoryMaximum201b (defendant : Person) (v : ThingOfValue)
    (c : ComplaintText) : Prop :=
  fineImposed defendant c ≤
      max (titleEighteenFineCap defendant c) (3 * monetaryEquivalentOfThingOfValue v c) ∧
    monthsOfImprisonmentImposed defendant c ≤ 180


def modality201bDisqualification : Modality := .power





structure Power201bDisqualification (defendant : Person) (o : Office)
    (c : ComplaintText) : Prop where
  condition : ConvictedUnderSubsectionB defendant c
  officeInClass : IsOfficeOfHonorTrustOrProfitUnderUnitedStates o c


def PowerExercised201bDisqualification (defendant : Person) (o : Office)
    (c : ComplaintText) : Prop :=
  Power201bDisqualification defendant o c ∧
    DisqualificationFromOfficeImposed defendant o c




def modality201cPenalty : Modality := .obligation



structure Obligation201cPenalty (defendant : Person) (c : ComplaintText) : Prop where
  condition : ConvictedUnderSubsectionC defendant c


def ObligationBreached201cPenalty (defendant : Person) (c : ComplaintText) : Prop :=
  Obligation201cPenalty defendant c ∧ ¬ FineOrImprisonmentImposed defendant c



def SentenceWithinStatutoryMaximum201c (defendant : Person) (c : ComplaintText) : Prop :=
  monthsOfImprisonmentImposed defendant c ≤ 24




def modality201d : Modality := .permission





structure Permission201d (v : ThingOfValue) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  exemption : WitnessFeeOrExpenseExemptionApplies v pr c


def PermissionAvailable201d (v : ThingOfValue) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  Permission201d v pr c




def modality201e : Modality := .permission




structure Permission201e (defendant : Person) (c : ComplaintText) : Prop where
  underThisSection : PunishedUnderThisSection defendant c
  underCompanionOffense : PunishedUnderSection1503Or1504Or1505 defendant c


def PermissionExercised201e (defendant : Person) (c : ComplaintText) : Prop :=
  Permission201e defendant c





inductive Section201Violated (c : ComplaintText) : Prop where
  | b1 (giver recipient : Person) (v : ThingOfValue) (a : OfficialAct)
      (h : ProhibitionViolated201b1 giver recipient v a c)
  | b2 (taker : Person) (v : ThingOfValue) (a : OfficialAct)
      (h : ProhibitionViolated201b2 taker v a c)
  | b3 (giver witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : ProhibitionViolated201b3 giver witness v pr c)
  | b4 (taker : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : ProhibitionViolated201b4 taker v pr c)
  | c1A (giver recipient : Person) (v : ThingOfValue) (a : OfficialAct)
      (h : ProhibitionViolated201c1A giver recipient v a c)
  | c1B (taker : Person) (v : ThingOfValue) (a : OfficialAct)
      (h : ProhibitionViolated201c1B taker v a c)
  | c2 (giver witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : ProhibitionViolated201c2 giver witness v pr c)
  | c3 (taker : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : ProhibitionViolated201c3 taker v pr c)

end Proving.USC.T18.Ch11.EchoReslice.Deontic
