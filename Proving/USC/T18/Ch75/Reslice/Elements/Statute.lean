







import Proving.USC.T18.Ch75.Reslice.Elements.Types
import Proving.USC.T18.Ch75.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Elements

open Proving.USC.Common





structure WillfulAndKnowing (p : Person) (c : ComplaintText) : Prop where
  willful : ActedWillfully p c
  knowing : ActedKnowingly p c



abbrev ActedWillfullyAndKnowingly (p : Person) (c : ComplaintText) : Prop :=
  WillfulAndKnowing p c








inductive PassportPenaltyTier (p : Person) (c : ComplaintText) : Prop where

  | terrorism (h : CommittedToFacilitateInternationalTerrorism p c)

  | drugTrafficking
      (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
      (h : CommittedToFacilitateDrugTraffickingCrime p c)

  | firstOrSecond
      (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
      (hNotDrugs : ¬ CommittedToFacilitateDrugTraffickingCrime p c)
      (h : IsFirstOrSecondSuchOffense p c)

  | other
      (hNotTerror : ¬ CommittedToFacilitateInternationalTerrorism p c)
      (hNotDrugs : ¬ CommittedToFacilitateDrugTraffickingCrime p c)
      (hNotFirstOrSecond : ¬ IsFirstOrSecondSuchOffense p c)





inductive UseOrFurnishPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | uses (h : UsesPassport p pp c)
  | attempts (h : AttemptsToUsePassport p pp c)
  | furnishes (h : FurnishesPassportToAnotherForUse p pp c)


inductive UseOrAttemptPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | uses (h : UsesPassport p pp c)
  | attempts (h : AttemptsToUsePassport p pp c)







structure Section1542Para1
    (p : Person) (s : Statement) (a : PassportApplication) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  inApplication : MakesStatementInPassportApplication p s a c
  falsity : StatementIsFalse s c
  intentToSecure : IntendsToInduceOrSecureIssuance p a c
  unitedStatesAuthority : PassportSoughtUnderUnitedStatesAuthority a c
  ownOrAnothersUse : ForOwnUseOrUseOfAnother p a c
  contraryToLaw : ContraryToPassportLawsOrRules a c



structure Section1542Para2 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  conduct : UseOrFurnishPassport p pp c
  falselySecured : IssuanceSecuredByFalseStatement pp c


inductive Section1542
    (p : Person) (s : Statement) (a : PassportApplication) (pp : Passport)
    (c : ComplaintText) : Prop where
  | falseApplicationStatement (h : Section1542Para1 p s a c)
  | falselySecuredPassport (h : Section1542Para2 p pp c)




inductive ForgeryConduct1543 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | falselyMakesOrForges (h : FalselyMakesOrForgesPassport p pp c)
  | counterfeits (h : CounterfeitsPassport p pp c)
  | mutilatesOrAlters (h : MutilatesOrAltersPassport p pp c)




structure Section1543Para1 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  conduct : ForgeryConduct1543 p pp c
  instrument : IsPassportOrPurportedPassport pp c
  intentThatItBeUsed : IntendsThatPassportBeUsed p pp c


inductive DefectivePassport1543 (pp : Passport) (c : ComplaintText) : Prop where
  | falsified (h : IsFalselyMadeForgedOrCounterfeitedPassport pp c)
  | tampered (h : IsMutilatedOrAlteredPassport pp c)
  | voided (h : IsVoidedByPrescribedCondition pp c)



structure Section1543Para2 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  conduct : UseOrFurnishPassport p pp c
  instrument : IsPassportOrPurportedPassport pp c
  defect : DefectivePassport1543 pp c


inductive Section1543 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | forgery (h : Section1543Para1 p pp c)
  | falseUse (h : Section1543Para2 p pp c)





structure Section1544Para1 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  conduct : UseOrAttemptPassport p pp c
  ofAnother : IsIssuedOrDesignedForUseOfAnother pp c


inductive Violation1544 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | conditionsOrRestrictions (h : ViolatesConditionsOrRestrictionsInPassport p pp c)
  | issuanceRules (h : ViolatesPassportIssuanceRules p pp c)



structure Section1544Para2 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  conduct : UseOrAttemptPassport p pp c
  violation : Violation1544 p pp c


inductive TransferConduct1544 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | furnishes (h : FurnishesPassport p pp c)
  | disposesOf (h : DisposesOfPassport p pp c)
  | delivers (h : DeliversPassport p pp c)



structure Section1544Para3 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  mensRea : ActedWillfullyAndKnowingly p c
  conduct : TransferConduct1544 p pp c
  forAnothersUse : ForUseByOtherThanOriginalIntendedUser pp c


inductive Section1544 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | usesAnothersPassport (h : Section1544Para1 p pp c)
  | usesInViolation (h : Section1544Para2 p pp c)
  | transfersForAnother (h : Section1544Para3 p pp c)










inductive FalsificationConduct1546a
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  | forgesOrCounterfeits (h : ForgesOrCounterfeitsDocument p d c)
  | altersOrFalselyMakes (h : AltersOrFalselyMakesDocument p d c)


structure Section1546aPara1Falsification
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  mensRea : ActedKnowingly p c
  conduct : FalsificationConduct1546a p d c
  coveredDocument : IsCoveredImmigrationDocument d c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c



inductive TraffickingConduct1546a
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  | uttersOrUses (h : UttersOrUsesDocument p d c)
  | possesses (h : PossessesDocument p d c)
  | obtainsAcceptsOrReceives (h : ObtainsAcceptsOrReceivesDocument p d c)




inductive GuiltyKnowledge1546a
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  | falsified (h : KnowsDocumentIsForgedOrFalselyMade p d c)
  | falseClaimOrStatement (h : KnowsDocumentProcuredByFalseClaimOrStatement p d c)
  | fraudOrUnlawful (h : KnowsDocumentProcuredByFraudOrUnlawfullyObtained p d c)



structure Section1546aPara1Trafficking
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  conduct : TraffickingConduct1546a p d c
  coveredDocument : IsCoveredImmigrationDocument d c
  guiltyKnowledge : GuiltyKnowledge1546a p d c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c


inductive Section1546aPara1
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  | falsification (h : Section1546aPara1Falsification p d c)
  | trafficking (h : Section1546aPara1Trafficking p d c)



inductive ContrabandConduct1546a
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop where
  | blankPermit (h : PossessesBlankPermit p art c)
  | engravesSellsOrImportsPlate (h : EngravesSellsOrImportsPlate p art c)
  | controlsOrPossessesPlate (h : ControlsOrPossessesPlate p art c)
  | likeness (h : MakesLikenessOfDocument p art c)
  | distinctivePaper (h : PossessesDistinctivePaper p art c)





structure Section1546aPara2
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop where
  mensRea : ActedKnowingly p c
  notUnderOfficialDirection : ¬ ActsUnderDirectionOfProperOfficer p c
  conduct : ContrabandConduct1546a p art c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c


inductive PersonationConduct1546a
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  | personates (h : PersonatesAnother p c)
  | deceasedName (h : FalselyAppearsInNameOfDeceased p c)
  | assumedName (h : EvadesImmigrationLawsUnderAssumedName p c)
  | disposesToUnauthorized (h : SellsOrDisposesOfDocumentToUnauthorizedPerson p d c)




structure Section1546aPara3
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop where
  applying : IsApplyingForDocumentOrAdmission p c
  conduct : PersonationConduct1546a p d c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c



inductive SwornAssertion1546a
    (p : Person) (s : Statement) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  | underOath (h : MakesStatementUnderOath p s f c)
  | penaltyOfPerjury (h : SubscribesAsTrueUnderPenaltyOfPerjury p s f c)



structure Section1546aPara4Sworn
    (p : Person) (s : Statement) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  mensRea : ActedKnowingly p c
  assertion : SwornAssertion1546a p s f c
  falsity : StatementIsFalse s c
  materiality : StatementConcernsMaterialFact s c
  requiredFiling : IsFilingRequiredByImmigrationLaws f c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c


inductive PresentationDefect1546a
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  | containsFalseStatement (h : PresentsFilingContainingFalseStatement p f c)
  | lacksReasonableBasis (h : PresentsFilingLackingReasonableBasis p f c)




structure Section1546aPara4Presentation
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  mensRea : ActedKnowingly p c
  defect : PresentationDefect1546a p f c
  requiredFiling : IsFilingRequiredByImmigrationLaws f c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c


inductive Section1546aPara4
    (p : Person) (s : Statement) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  | sworn (h : Section1546aPara4Sworn p s f c)
  | presentation (h : Section1546aPara4Presentation p f c)


inductive Section1546a
    (p : Person) (s : Statement) (d : ImmigrationDocument) (art : PrintingArticle)
    (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  | documentFraud (h : Section1546aPara1 p d c)
  | contraband (h : Section1546aPara2 p art c)
  | personation (h : Section1546aPara3 p d c)
  | falseStatement (h : Section1546aPara4 p s f c)




inductive Use1546b
    (p : Person) (idDoc : IdentificationDocument) (att : Attestation)
    (c : ComplaintText) : Prop where
  | notLawfullyIssued
      (hUse : UsesIdentificationDocument p idDoc c)
      (hKnow : KnowsOrHasReasonToKnowDocumentNotLawfullyIssued p idDoc c)
  | falseDocument
      (hUse : UsesIdentificationDocument p idDoc c)
      (hKnow : KnowsOrHasReasonToKnowDocumentIsFalse p idDoc c)
  | falseAttestation (h : UsesFalseAttestation p att c)



structure Section1546b
    (p : Person) (idDoc : IdentificationDocument) (att : Attestation)
    (c : ComplaintText) : Prop where
  use : Use1546b p idDoc att c
  purpose : ForPurposeOfSatisfyingEmploymentVerification p c
  notAuthorizedActivity : ¬ LawfullyAuthorizedGovernmentActivity p c




inductive Chapter75Offense
    (p : Person) (s : Statement) (a : PassportApplication) (pp : Passport)
    (d : ImmigrationDocument) (art : PrintingArticle) (f : ImmigrationFiling)
    (idDoc : IdentificationDocument) (att : Attestation) (c : ComplaintText) : Prop where
  | falseStatementInPassportApplication (h : Section1542 p s a pp c)
  | passportForgeryOrFalseUse (h : Section1543 p pp c)
  | passportMisuse (h : Section1544 p pp c)
  | visaFraud (h : Section1546a p s d art f c)
  | employmentVerificationDocumentFraud (h : Section1546b p idDoc att c)

end Proving.USC.T18.Ch75.Reslice.Elements
