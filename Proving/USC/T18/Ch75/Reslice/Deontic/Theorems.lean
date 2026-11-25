







import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Deontic.Types
import Proving.USC.T18.Ch75.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch75.Reslice.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Deontic

open Proving.USC.Common




theorem prohibition1542ApplicationViolated_intro
    (p : Person) (a : PassportApplication) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hInt : IntentToSecureIssuanceOfPassport p a c)
    (hCon : ContraryToPassportIssuanceLaws a c)
    (hAct : MakesFalseStatementInPassportApplication p a c) :
    Prohibition1542ApplicationViolated p a c :=
  ⟨⟨hAddr, hSci, hInt, hCon⟩, hAct⟩


theorem prohibition1542UseViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hTaint : PassportIssuanceSecuredByFalseStatement pp c)
    (hAct : UsesOrFurnishesPassport p pp c) :
    Prohibition1542UseViolated p pp c :=
  ⟨⟨hAddr, hSci, hTaint⟩, hAct⟩


theorem section1542Violated_falseApplication_intro
    (p : Person) (a : PassportApplication) (c : ComplaintText)
    (h : Prohibition1542ApplicationViolated p a c) : Section1542Violated p c :=
  Section1542Violated.falseApplication a h


theorem section1542Violated_taintedUse_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1542UseViolated p pp c) : Section1542Violated p c :=
  Section1542Violated.taintedUse pp h




theorem prohibition1543FalsificationViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hInt : IntentThatPassportBeUsed p pp c)
    (hAct : FalselyMakesOrAltersPassport p pp c) :
    Prohibition1543FalsificationViolated p pp c :=
  ⟨⟨hAddr, hInt⟩, hAct⟩


theorem taintedPassport1543_falsified_intro
    (pp : Passport) (c : ComplaintText)
    (h : PassportFalselyMadeOrAltered pp c) : TaintedPassport1543 pp c :=
  TaintedPassport1543.falsified h


theorem taintedPassport1543_voided_intro
    (pp : Passport) (c : ComplaintText)
    (h : PassportVoidedByPrescribedCondition pp c) : TaintedPassport1543 pp c :=
  TaintedPassport1543.voided h


theorem prohibition1543UseViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hTaint : TaintedPassport1543 pp c)
    (hAct : UsesOrFurnishesTaintedPassport p pp c) :
    Prohibition1543UseViolated p pp c :=
  ⟨⟨hAddr, hSci, hTaint⟩, hAct⟩


theorem section1543Violated_falsification_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1543FalsificationViolated p pp c) : Section1543Violated p c :=
  Section1543Violated.falsification pp h


theorem section1543Violated_taintedUse_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1543UseViolated p pp c) : Section1543Violated p c :=
  Section1543Violated.taintedUse pp h




theorem prohibition1544UseOfAnothersViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hOwn : PassportIssuedOrDesignedForAnother p pp c)
    (hAct : UsesPassport p pp c) :
    Prohibition1544UseOfAnothersViolated p pp c :=
  ⟨⟨hAddr, hSci, hOwn⟩, hAct⟩


theorem prohibition1544ConditionViolationViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hRes : UseViolatesPassportConditionsOrRules p pp c)
    (hAct : UsesPassport p pp c) :
    Prohibition1544ConditionViolationViolated p pp c :=
  ⟨⟨hAddr, hSci, hRes⟩, hAct⟩


theorem prohibition1544FurnishingViolated_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedWillfullyAndKnowingly p c)
    (hPur : FurnishedForUseByOtherThanOriginalHolder p pp c)
    (hAct : FurnishesPassportToPerson p pp c) :
    Prohibition1544FurnishingViolated p pp c :=
  ⟨⟨hAddr, hSci, hPur⟩, hAct⟩


theorem section1544Violated_useOfAnothers_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1544UseOfAnothersViolated p pp c) : Section1544Violated p c :=
  Section1544Violated.useOfAnothers pp h


theorem section1544Violated_conditionViolation_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1544ConditionViolationViolated p pp c) : Section1544Violated p c :=
  Section1544Violated.conditionViolation pp h


theorem section1544Violated_furnishing_intro
    (p : Person) (pp : Passport) (c : ComplaintText)
    (h : Prohibition1544FurnishingViolated p pp c) : Section1544Violated p c :=
  Section1544Violated.furnishing pp h




theorem prohibition1546a1ForgeryViolated_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedKnowingly p c)
    (hDoc : IsPrescribedImmigrationDocument d c)
    (hAct : ForgesOrFalselyMakesImmigrationDocument p d c) :
    Prohibition1546a1ForgeryViolated p d c :=
  ⟨⟨hAddr, hSci, hDoc⟩, hAct⟩


theorem prohibition1546a1KnowingUseViolated_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedKnowingly p c)
    (hDoc : IsPrescribedImmigrationDocument d c)
    (hKnow : KnowsDocumentTaintedOrUnlawfullyObtained p d c)
    (hAct : UttersUsesOrPossessesImmigrationDocument p d c) :
    Prohibition1546a1KnowingUseViolated p d c :=
  ⟨⟨hAddr, hSci, hDoc, hKnow⟩, hAct⟩





theorem prohibition1546a2PrintingArticleViolated_intro
    (p : Person) (ar : PermitPrintingArticle) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedKnowingly p c)
    (hArt : IsPermitPrintingArticle ar c)
    (hNoDir : ¬ ActedUnderProperOfficerDirection p c)
    (hAct : PossessesOrMakesPermitPrintingArticle p ar c) :
    Prohibition1546a2PrintingArticleViolated p ar c :=
  ⟨⟨hAddr, hSci, hArt, hNoDir⟩, hAct⟩


theorem prohibition1546a3PersonationViolated_intro
    (p : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCtx : ApplyingForEntryDocumentOrAdmission p c)
    (hAct : PersonatesOrAppearsUnderFalseIdentity p c) :
    Prohibition1546a3PersonationViolated p c :=
  ⟨⟨hAddr, hCtx⟩, hAct⟩


theorem prohibition1546a3TransferViolated_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCtx : ApplyingForEntryDocumentOrAdmission p c)
    (hDoc : IsPrescribedImmigrationDocument d c)
    (hAct : TransfersDocumentToUnauthorizedPerson p d c) :
    Prohibition1546a3TransferViolated p d c :=
  ⟨⟨hAddr, hCtx, hDoc⟩, hAct⟩


theorem prohibition1546a4OathViolated_intro
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedKnowingly p c)
    (hFil : IsImmigrationFiling f c)
    (hMat : FalseStatementIsMaterial f c)
    (hAct : MakesFalseStatementUnderOath p f c) :
    Prohibition1546a4OathViolated p f c :=
  ⟨⟨hAddr, hSci, hFil, hMat⟩, hAct⟩


theorem prohibition1546a4PresentationViolated_intro
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : ActedKnowingly p c)
    (hFil : IsImmigrationFiling f c)
    (hMat : FalseStatementIsMaterial f c)
    (hAct : PresentsFilingWithFalseStatementOrNoReasonableBasis p f c) :
    Prohibition1546a4PresentationViolated p f c :=
  ⟨⟨hAddr, hSci, hFil, hMat⟩, hAct⟩




theorem prohibition1546bUnlawfulDocumentViolated_intro
    (p : Person) (d : IdentificationDocument) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : KnowsOrHasReasonToKnowDocumentDefect p d c)
    (hDef : DocumentNotLawfullyIssuedForPossessor p d c)
    (hPur : ForPurposeOfSatisfyingEmploymentVerification p c)
    (hAct : UsesIdentificationDocument p d c) :
    Prohibition1546bUnlawfulDocumentViolated p d c :=
  ⟨⟨hAddr, hSci, hDef, hPur⟩, hAct⟩


theorem prohibition1546bFalseDocumentViolated_intro
    (p : Person) (d : IdentificationDocument) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hSci : KnowsOrHasReasonToKnowDocumentDefect p d c)
    (hFalse : IdentificationDocumentIsFalse d c)
    (hPur : ForPurposeOfSatisfyingEmploymentVerification p c)
    (hAct : UsesIdentificationDocument p d c) :
    Prohibition1546bFalseDocumentViolated p d c :=
  ⟨⟨hAddr, hSci, hFalse, hPur⟩, hAct⟩


theorem prohibition1546bFalseAttestationViolated_intro
    (p : Person) (att : Attestation) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hFalse : IsFalseAttestation att c)
    (hPur : ForPurposeOfSatisfyingEmploymentVerification p c)
    (hAct : UsesAttestation p att c) :
    Prohibition1546bFalseAttestationViolated p att c :=
  ⟨⟨hAddr, hFalse, hPur⟩, hAct⟩


theorem section1546bViolated_unlawfulDocument_intro
    (p : Person) (d : IdentificationDocument) (c : ComplaintText)
    (h : Prohibition1546bUnlawfulDocumentViolated p d c) : Section1546bViolated p c :=
  Section1546bViolated.unlawfulDocument d h


theorem section1546bViolated_falseDocument_intro
    (p : Person) (d : IdentificationDocument) (c : ComplaintText)
    (h : Prohibition1546bFalseDocumentViolated p d c) : Section1546bViolated p c :=
  Section1546bViolated.falseDocument d h


theorem section1546bViolated_falseAttestation_intro
    (p : Person) (att : Attestation) (c : ComplaintText)
    (h : Prohibition1546bFalseAttestationViolated p att c) : Section1546bViolated p c :=
  Section1546bViolated.falseAttestation att h




theorem section1546ProhibitedConduct_forgery_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (h : Prohibition1546a1ForgeryViolated p d c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.forgery d h


theorem section1546ProhibitedConduct_knowingUse_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (h : Prohibition1546a1KnowingUseViolated p d c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.knowingUse d h


theorem section1546ProhibitedConduct_printingArticle_intro
    (p : Person) (ar : PermitPrintingArticle) (c : ComplaintText)
    (h : Prohibition1546a2PrintingArticleViolated p ar c) :
    Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.printingArticle ar h


theorem section1546ProhibitedConduct_personation_intro
    (p : Person) (c : ComplaintText)
    (h : Prohibition1546a3PersonationViolated p c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.personation h


theorem section1546ProhibitedConduct_unauthorizedTransfer_intro
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText)
    (h : Prohibition1546a3TransferViolated p d c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.unauthorizedTransfer d h


theorem section1546ProhibitedConduct_falseOath_intro
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText)
    (h : Prohibition1546a4OathViolated p f c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.falseOath f h


theorem section1546ProhibitedConduct_falsePresentation_intro
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText)
    (h : Prohibition1546a4PresentationViolated p f c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.falsePresentation f h


theorem section1546ProhibitedConduct_employmentVerification_intro
    (p : Person) (c : ComplaintText)
    (h : Section1546bViolated p c) : Section1546ProhibitedConduct p c :=
  Section1546ProhibitedConduct.employmentVerification h



theorem section1546Violated_intro
    (p : Person) (c : ComplaintText)
    (hConduct : Section1546ProhibitedConduct p c)
    (hNoEscape : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546Violated p c :=
  ⟨hConduct, hNoEscape⟩




theorem chapter75OffenseCommitted_s1542_intro
    (p : Person) (c : ComplaintText)
    (h : Section1542Violated p c) : Chapter75OffenseCommitted p c :=
  Chapter75OffenseCommitted.s1542 h


theorem chapter75OffenseCommitted_s1543_intro
    (p : Person) (c : ComplaintText)
    (h : Section1543Violated p c) : Chapter75OffenseCommitted p c :=
  Chapter75OffenseCommitted.s1543 h


theorem chapter75OffenseCommitted_s1544_intro
    (p : Person) (c : ComplaintText)
    (h : Section1544Violated p c) : Chapter75OffenseCommitted p c :=
  Chapter75OffenseCommitted.s1544 h


theorem chapter75OffenseCommitted_s1546_intro
    (p : Person) (c : ComplaintText)
    (h : Section1546Violated p c) : Chapter75OffenseCommitted p c :=
  Chapter75OffenseCommitted.s1546 h

end Proving.USC.T18.Ch75.Reslice.Deontic
