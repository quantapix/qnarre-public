















import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Deontic.Types
import Proving.USC.T18.Ch75.Reslice.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Deontic

open Proving.USC.Common




def modality1542 : Modality := Modality.prohibition



structure Prohibition1542Application
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  intent : IntentToSecureIssuanceOfPassport p a c
  contrariety : ContraryToPassportIssuanceLaws a c



def Prohibition1542ApplicationViolated
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop :=
  Prohibition1542Application p a c ∧ MakesFalseStatementInPassportApplication p a c



structure Prohibition1542Use (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  taint : PassportIssuanceSecuredByFalseStatement pp c


def Prohibition1542UseViolated (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1542Use p pp c ∧ UsesOrFurnishesPassport p pp c


inductive Section1542Violated (p : Person) (c : ComplaintText) : Prop where
  | falseApplication (a : PassportApplication)
      (h : Prohibition1542ApplicationViolated p a c) : Section1542Violated p c
  | taintedUse (pp : Passport)
      (h : Prohibition1542UseViolated p pp c) : Section1542Violated p c




def modality1543 : Modality := Modality.prohibition




structure Prohibition1543Falsification
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  intent : IntentThatPassportBeUsed p pp c


def Prohibition1543FalsificationViolated
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1543Falsification p pp c ∧ FalselyMakesOrAltersPassport p pp c




inductive TaintedPassport1543 (pp : Passport) (c : ComplaintText) : Prop where
  | falsified (h : PassportFalselyMadeOrAltered pp c) : TaintedPassport1543 pp c
  | voided (h : PassportVoidedByPrescribedCondition pp c) : TaintedPassport1543 pp c



structure Prohibition1543Use (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  taint : TaintedPassport1543 pp c


def Prohibition1543UseViolated (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1543Use p pp c ∧ UsesOrFurnishesTaintedPassport p pp c


inductive Section1543Violated (p : Person) (c : ComplaintText) : Prop where
  | falsification (pp : Passport)
      (h : Prohibition1543FalsificationViolated p pp c) : Section1543Violated p c
  | taintedUse (pp : Passport)
      (h : Prohibition1543UseViolated p pp c) : Section1543Violated p c




def modality1544 : Modality := Modality.prohibition



structure Prohibition1544UseOfAnothers
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  ownership : PassportIssuedOrDesignedForAnother p pp c


def Prohibition1544UseOfAnothersViolated
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1544UseOfAnothers p pp c ∧ UsesPassport p pp c



structure Prohibition1544ConditionViolation
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  restriction : UseViolatesPassportConditionsOrRules p pp c


def Prohibition1544ConditionViolationViolated
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1544ConditionViolation p pp c ∧ UsesPassport p pp c



structure Prohibition1544Furnishing
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedWillfullyAndKnowingly p c
  purpose : FurnishedForUseByOtherThanOriginalHolder p pp c


def Prohibition1544FurnishingViolated
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop :=
  Prohibition1544Furnishing p pp c ∧ FurnishesPassportToPerson p pp c


inductive Section1544Violated (p : Person) (c : ComplaintText) : Prop where
  | useOfAnothers (pp : Passport)
      (h : Prohibition1544UseOfAnothersViolated p pp c) : Section1544Violated p c
  | conditionViolation (pp : Passport)
      (h : Prohibition1544ConditionViolationViolated p pp c) : Section1544Violated p c
  | furnishing (pp : Passport)
      (h : Prohibition1544FurnishingViolated p pp c) : Section1544Violated p c




def modality1546a : Modality := Modality.prohibition


structure Prohibition1546a1Forgery
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly p c
  documentClass : IsPrescribedImmigrationDocument d c


def Prohibition1546a1ForgeryViolated
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop :=
  Prohibition1546a1Forgery p d c ∧ ForgesOrFalselyMakesImmigrationDocument p d c


structure Prohibition1546a1KnowingUse
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly p c
  documentClass : IsPrescribedImmigrationDocument d c
  taintKnowledge : KnowsDocumentTaintedOrUnlawfullyObtained p d c


def Prohibition1546a1KnowingUseViolated
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop :=
  Prohibition1546a1KnowingUse p d c ∧ UttersUsesOrPossessesImmigrationDocument p d c





structure Prohibition1546a2PrintingArticle
    (p : Person) (ar : PermitPrintingArticle) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly p c
  articleClass : IsPermitPrintingArticle ar c
  noDirection : ¬ ActedUnderProperOfficerDirection p c


def Prohibition1546a2PrintingArticleViolated
    (p : Person) (ar : PermitPrintingArticle) (c : ComplaintText) : Prop :=
  Prohibition1546a2PrintingArticle p ar c ∧ PossessesOrMakesPermitPrintingArticle p ar c


structure Prohibition1546a3Personation (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  context : ApplyingForEntryDocumentOrAdmission p c


def Prohibition1546a3PersonationViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1546a3Personation p c ∧ PersonatesOrAppearsUnderFalseIdentity p c


structure Prohibition1546a3Transfer
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  context : ApplyingForEntryDocumentOrAdmission p c
  documentClass : IsPrescribedImmigrationDocument d c


def Prohibition1546a3TransferViolated
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop :=
  Prohibition1546a3Transfer p d c ∧ TransfersDocumentToUnauthorizedPerson p d c


structure Prohibition1546a4Oath
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly p c
  filingClass : IsImmigrationFiling f c
  materiality : FalseStatementIsMaterial f c


def Prohibition1546a4OathViolated
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop :=
  Prohibition1546a4Oath p f c ∧ MakesFalseStatementUnderOath p f c


structure Prohibition1546a4Presentation
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly p c
  filingClass : IsImmigrationFiling f c
  materiality : FalseStatementIsMaterial f c


def Prohibition1546a4PresentationViolated
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop :=
  Prohibition1546a4Presentation p f c ∧
    PresentsFilingWithFalseStatementOrNoReasonableBasis p f c




def modality1546b : Modality := Modality.prohibition



structure Prohibition1546bUnlawfulDocument
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : KnowsOrHasReasonToKnowDocumentDefect p d c
  defect : DocumentNotLawfullyIssuedForPossessor p d c
  purpose : ForPurposeOfSatisfyingEmploymentVerification p c


def Prohibition1546bUnlawfulDocumentViolated
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop :=
  Prohibition1546bUnlawfulDocument p d c ∧ UsesIdentificationDocument p d c


structure Prohibition1546bFalseDocument
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : KnowsOrHasReasonToKnowDocumentDefect p d c
  falsity : IdentificationDocumentIsFalse d c
  purpose : ForPurposeOfSatisfyingEmploymentVerification p c


def Prohibition1546bFalseDocumentViolated
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop :=
  Prohibition1546bFalseDocument p d c ∧ UsesIdentificationDocument p d c



structure Prohibition1546bFalseAttestation
    (p : Person) (att : Attestation) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  falsity : IsFalseAttestation att c
  purpose : ForPurposeOfSatisfyingEmploymentVerification p c


def Prohibition1546bFalseAttestationViolated
    (p : Person) (att : Attestation) (c : ComplaintText) : Prop :=
  Prohibition1546bFalseAttestation p att c ∧ UsesAttestation p att c


inductive Section1546bViolated (p : Person) (c : ComplaintText) : Prop where
  | unlawfulDocument (d : IdentificationDocument)
      (h : Prohibition1546bUnlawfulDocumentViolated p d c) : Section1546bViolated p c
  | falseDocument (d : IdentificationDocument)
      (h : Prohibition1546bFalseDocumentViolated p d c) : Section1546bViolated p c
  | falseAttestation (att : Attestation)
      (h : Prohibition1546bFalseAttestationViolated p att c) : Section1546bViolated p c





inductive Section1546ProhibitedConduct (p : Person) (c : ComplaintText) : Prop where
  | forgery (d : ImmigrationDocument)
      (h : Prohibition1546a1ForgeryViolated p d c) : Section1546ProhibitedConduct p c
  | knowingUse (d : ImmigrationDocument)
      (h : Prohibition1546a1KnowingUseViolated p d c) : Section1546ProhibitedConduct p c
  | printingArticle (ar : PermitPrintingArticle)
      (h : Prohibition1546a2PrintingArticleViolated p ar c) : Section1546ProhibitedConduct p c
  | personation
      (h : Prohibition1546a3PersonationViolated p c) : Section1546ProhibitedConduct p c
  | unauthorizedTransfer (d : ImmigrationDocument)
      (h : Prohibition1546a3TransferViolated p d c) : Section1546ProhibitedConduct p c
  | falseOath (f : ImmigrationFiling)
      (h : Prohibition1546a4OathViolated p f c) : Section1546ProhibitedConduct p c
  | falsePresentation (f : ImmigrationFiling)
      (h : Prohibition1546a4PresentationViolated p f c) : Section1546ProhibitedConduct p c
  | employmentVerification
      (h : Section1546bViolated p c) : Section1546ProhibitedConduct p c





def Section1546Violated (p : Person) (c : ComplaintText) : Prop :=
  Section1546ProhibitedConduct p c ∧ ¬ LawfullyAuthorizedGovernmentActivity p c




inductive Chapter75OffenseCommitted (p : Person) (c : ComplaintText) : Prop where
  | s1542 (h : Section1542Violated p c) : Chapter75OffenseCommitted p c
  | s1543 (h : Section1543Violated p c) : Chapter75OffenseCommitted p c
  | s1544 (h : Section1544Violated p c) : Chapter75OffenseCommitted p c
  | s1546 (h : Section1546Violated p c) : Chapter75OffenseCommitted p c

end Proving.USC.T18.Ch75.Reslice.Deontic
