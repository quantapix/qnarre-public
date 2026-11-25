






import Proving.USC.T18.Ch75.Reslice.Elements.Types
import Proving.USC.T18.Ch75.Reslice.Elements.Predicates
import Proving.USC.T18.Ch75.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Elements

open Proving.USC.Common



theorem willfulAndKnowing_intro {p : Person} {c : ComplaintText}
    (hWillful : ActedWillfully p c) (hKnowing : ActedKnowingly p c) :
    WillfulAndKnowing p c :=
  ⟨hWillful, hKnowing⟩



theorem actedWillfullyAndKnowingly_intro {p : Person} {c : ComplaintText}
    (hWillful : ActedWillfully p c) (hKnowing : ActedKnowingly p c) :
    ActedWillfullyAndKnowingly p c :=
  ⟨hWillful, hKnowing⟩



theorem passportPenaltyTier_ofTerrorism {p : Person} {c : ComplaintText}
    (h : CommittedToFacilitateInternationalTerrorism p c) : PassportPenaltyTier p c :=
  .terrorism h

theorem passportPenaltyTier_ofDrugTrafficking {p : Person} {c : ComplaintText}
    (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
    (h : CommittedToFacilitateDrugTraffickingCrime p c) : PassportPenaltyTier p c :=
  .drugTrafficking hNotTerror h

theorem passportPenaltyTier_ofFirstOrSecond {p : Person} {c : ComplaintText}
    (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
    (hNotDrugs : ¬ CommittedToFacilitateDrugTraffickingCrime p c)
    (h : IsFirstOrSecondSuchOffense p c) : PassportPenaltyTier p c :=
  .firstOrSecond hNotTerror hNotDrugs h

theorem passportPenaltyTier_ofOther {p : Person} {c : ComplaintText}
    (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
    (hNotDrugs : ¬ CommittedToFacilitateDrugTraffickingCrime p c)
    (hNotFirstOrSecond : ¬ IsFirstOrSecondSuchOffense p c) : PassportPenaltyTier p c :=
  .other hNotTerror hNotDrugs hNotFirstOrSecond



theorem section1542Para1_intro {p : Person} {s : Statement} {a : PassportApplication}
    {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hInApp : MakesStatementInPassportApplication p s a c)
    (hFalse : StatementIsFalse s c)
    (hIntent : IntendsToInduceOrSecureIssuance p a c)
    (hUSAuthority : PassportSoughtUnderUnitedStatesAuthority a c)
    (hUse : ForOwnUseOrUseOfAnother p a c)
    (hContrary : ContraryToPassportLawsOrRules a c) :
    Section1542Para1 p s a c :=
  ⟨hMens, hInApp, hFalse, hIntent, hUSAuthority, hUse, hContrary⟩

theorem section1542Para2_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hConduct : UseOrFurnishPassport p pp c)
    (hSecured : IssuanceSecuredByFalseStatement pp c) :
    Section1542Para2 p pp c :=
  ⟨hMens, hConduct, hSecured⟩

theorem section1542_ofFalseApplicationStatement {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {c : ComplaintText}
    (h : Section1542Para1 p s a c) : Section1542 p s a pp c :=
  .falseApplicationStatement h

theorem section1542_ofFalselySecuredPassport {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {c : ComplaintText}
    (h : Section1542Para2 p pp c) : Section1542 p s a pp c :=
  .falselySecuredPassport h



theorem section1543Para1_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hConduct : ForgeryConduct1543 p pp c)
    (hInstrument : IsPassportOrPurportedPassport pp c)
    (hIntent : IntendsThatPassportBeUsed p pp c) :
    Section1543Para1 p pp c :=
  ⟨hConduct, hInstrument, hIntent⟩

theorem section1543Para2_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hConduct : UseOrFurnishPassport p pp c)
    (hInstrument : IsPassportOrPurportedPassport pp c)
    (hDefect : DefectivePassport1543 pp c) :
    Section1543Para2 p pp c :=
  ⟨hMens, hConduct, hInstrument, hDefect⟩

theorem section1543_ofForgery {p : Person} {pp : Passport} {c : ComplaintText}
    (h : Section1543Para1 p pp c) : Section1543 p pp c :=
  .forgery h

theorem section1543_ofFalseUse {p : Person} {pp : Passport} {c : ComplaintText}
    (h : Section1543Para2 p pp c) : Section1543 p pp c :=
  .falseUse h



theorem section1544Para1_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hConduct : UseOrAttemptPassport p pp c)
    (hOfAnother : IsIssuedOrDesignedForUseOfAnother pp c) :
    Section1544Para1 p pp c :=
  ⟨hMens, hConduct, hOfAnother⟩

theorem section1544Para2_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hConduct : UseOrAttemptPassport p pp c)
    (hViolation : Violation1544 p pp c) :
    Section1544Para2 p pp c :=
  ⟨hMens, hConduct, hViolation⟩

theorem section1544Para3_intro {p : Person} {pp : Passport} {c : ComplaintText}
    (hMens : ActedWillfullyAndKnowingly p c)
    (hConduct : TransferConduct1544 p pp c)
    (hForAnother : ForUseByOtherThanOriginalIntendedUser pp c) :
    Section1544Para3 p pp c :=
  ⟨hMens, hConduct, hForAnother⟩

theorem section1544_ofUsesAnothersPassport {p : Person} {pp : Passport} {c : ComplaintText}
    (h : Section1544Para1 p pp c) : Section1544 p pp c :=
  .usesAnothersPassport h

theorem section1544_ofUsesInViolation {p : Person} {pp : Passport} {c : ComplaintText}
    (h : Section1544Para2 p pp c) : Section1544 p pp c :=
  .usesInViolation h

theorem section1544_ofTransfersForAnother {p : Person} {pp : Passport} {c : ComplaintText}
    (h : Section1544Para3 p pp c) : Section1544 p pp c :=
  .transfersForAnother h



theorem section1546aPara1Falsification_intro {p : Person} {d : ImmigrationDocument}
    {c : ComplaintText}
    (hMens : ActedKnowingly p c)
    (hConduct : FalsificationConduct1546a p d c)
    (hCovered : IsCoveredImmigrationDocument d c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara1Falsification p d c :=
  ⟨hMens, hConduct, hCovered, hNotAuthorized⟩

theorem section1546aPara1Trafficking_intro {p : Person} {d : ImmigrationDocument}
    {c : ComplaintText}
    (hConduct : TraffickingConduct1546a p d c)
    (hCovered : IsCoveredImmigrationDocument d c)
    (hKnowledge : GuiltyKnowledge1546a p d c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara1Trafficking p d c :=
  ⟨hConduct, hCovered, hKnowledge, hNotAuthorized⟩

theorem section1546aPara1_ofFalsification {p : Person} {d : ImmigrationDocument}
    {c : ComplaintText} (h : Section1546aPara1Falsification p d c) :
    Section1546aPara1 p d c :=
  .falsification h

theorem section1546aPara1_ofTrafficking {p : Person} {d : ImmigrationDocument}
    {c : ComplaintText} (h : Section1546aPara1Trafficking p d c) :
    Section1546aPara1 p d c :=
  .trafficking h

theorem section1546aPara2_intro {p : Person} {art : PrintingArticle} {c : ComplaintText}
    (hMens : ActedKnowingly p c)
    (hNotDirected : ¬ ActsUnderDirectionOfProperOfficer p c)
    (hConduct : ContrabandConduct1546a p art c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara2 p art c :=
  ⟨hMens, hNotDirected, hConduct, hNotAuthorized⟩

theorem section1546aPara3_intro {p : Person} {d : ImmigrationDocument} {c : ComplaintText}
    (hApplying : IsApplyingForDocumentOrAdmission p c)
    (hConduct : PersonationConduct1546a p d c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara3 p d c :=
  ⟨hApplying, hConduct, hNotAuthorized⟩

theorem section1546aPara4Sworn_intro {p : Person} {s : Statement} {f : ImmigrationFiling}
    {c : ComplaintText}
    (hMens : ActedKnowingly p c)
    (hAssertion : SwornAssertion1546a p s f c)
    (hFalse : StatementIsFalse s c)
    (hMaterial : StatementConcernsMaterialFact s c)
    (hRequired : IsFilingRequiredByImmigrationLaws f c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara4Sworn p s f c :=
  ⟨hMens, hAssertion, hFalse, hMaterial, hRequired, hNotAuthorized⟩

theorem section1546aPara4Presentation_intro {p : Person} {f : ImmigrationFiling}
    {c : ComplaintText}
    (hMens : ActedKnowingly p c)
    (hDefect : PresentationDefect1546a p f c)
    (hRequired : IsFilingRequiredByImmigrationLaws f c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546aPara4Presentation p f c :=
  ⟨hMens, hDefect, hRequired, hNotAuthorized⟩

theorem section1546aPara4_ofSworn {p : Person} {s : Statement} {f : ImmigrationFiling}
    {c : ComplaintText} (h : Section1546aPara4Sworn p s f c) :
    Section1546aPara4 p s f c :=
  .sworn h

theorem section1546aPara4_ofPresentation {p : Person} {s : Statement}
    {f : ImmigrationFiling} {c : ComplaintText}
    (h : Section1546aPara4Presentation p f c) : Section1546aPara4 p s f c :=
  .presentation h

theorem section1546a_ofDocumentFraud {p : Person} {s : Statement}
    {d : ImmigrationDocument} {art : PrintingArticle} {f : ImmigrationFiling}
    {c : ComplaintText} (h : Section1546aPara1 p d c) : Section1546a p s d art f c :=
  .documentFraud h

theorem section1546a_ofContraband {p : Person} {s : Statement}
    {d : ImmigrationDocument} {art : PrintingArticle} {f : ImmigrationFiling}
    {c : ComplaintText} (h : Section1546aPara2 p art c) : Section1546a p s d art f c :=
  .contraband h

theorem section1546a_ofPersonation {p : Person} {s : Statement}
    {d : ImmigrationDocument} {art : PrintingArticle} {f : ImmigrationFiling}
    {c : ComplaintText} (h : Section1546aPara3 p d c) : Section1546a p s d art f c :=
  .personation h

theorem section1546a_ofFalseStatement {p : Person} {s : Statement}
    {d : ImmigrationDocument} {art : PrintingArticle} {f : ImmigrationFiling}
    {c : ComplaintText} (h : Section1546aPara4 p s f c) : Section1546a p s d art f c :=
  .falseStatement h



theorem section1546b_intro {p : Person} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText}
    (hUse : Use1546b p idDoc att c)
    (hPurpose : ForPurposeOfSatisfyingEmploymentVerification p c)
    (hNotAuthorized : ¬ LawfullyAuthorizedGovernmentActivity p c) :
    Section1546b p idDoc att c :=
  ⟨hUse, hPurpose, hNotAuthorized⟩



theorem chapter75Offense_ofSection1542 {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {d : ImmigrationDocument}
    {art : PrintingArticle} {f : ImmigrationFiling} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText} (h : Section1542 p s a pp c) :
    Chapter75Offense p s a pp d art f idDoc att c :=
  .falseStatementInPassportApplication h

theorem chapter75Offense_ofSection1543 {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {d : ImmigrationDocument}
    {art : PrintingArticle} {f : ImmigrationFiling} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText} (h : Section1543 p pp c) :
    Chapter75Offense p s a pp d art f idDoc att c :=
  .passportForgeryOrFalseUse h

theorem chapter75Offense_ofSection1544 {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {d : ImmigrationDocument}
    {art : PrintingArticle} {f : ImmigrationFiling} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText} (h : Section1544 p pp c) :
    Chapter75Offense p s a pp d art f idDoc att c :=
  .passportMisuse h

theorem chapter75Offense_ofSection1546a {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {d : ImmigrationDocument}
    {art : PrintingArticle} {f : ImmigrationFiling} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText} (h : Section1546a p s d art f c) :
    Chapter75Offense p s a pp d art f idDoc att c :=
  .visaFraud h

theorem chapter75Offense_ofSection1546b {p : Person} {s : Statement}
    {a : PassportApplication} {pp : Passport} {d : ImmigrationDocument}
    {art : PrintingArticle} {f : ImmigrationFiling} {idDoc : IdentificationDocument}
    {att : Attestation} {c : ComplaintText} (h : Section1546b p idDoc att c) :
    Chapter75Offense p s a pp d art f idDoc att c :=
  .employmentVerificationDocumentFraud h

end Proving.USC.T18.Ch75.Reslice.Elements
