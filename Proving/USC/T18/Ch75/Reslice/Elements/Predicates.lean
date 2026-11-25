






import Proving.USC.T18.Ch75.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Elements

open Proving.USC.Common










axiom ActedWillfully (p : Person) (c : ComplaintText) : Prop




axiom ActedKnowingly (p : Person) (c : ComplaintText) : Prop












axiom CommittedToFacilitateInternationalTerrorism (p : Person) (c : ComplaintText) : Prop




axiom CommittedToFacilitateDrugTraffickingCrime (p : Person) (c : ComplaintText) : Prop




axiom IsFirstOrSecondSuchOffense (p : Person) (c : ComplaintText) : Prop





axiom UsesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom AttemptsToUsePassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom FurnishesPassportToAnotherForUse (p : Person) (pp : Passport) (c : ComplaintText) : Prop





axiom StatementIsFalse (s : Statement) (c : ComplaintText) : Prop






axiom MakesStatementInPassportApplication
    (p : Person) (s : Statement) (a : PassportApplication) (c : ComplaintText) : Prop




axiom IntendsToInduceOrSecureIssuance
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop




axiom PassportSoughtUnderUnitedStatesAuthority
    (a : PassportApplication) (c : ComplaintText) : Prop




axiom ForOwnUseOrUseOfAnother
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop





axiom ContraryToPassportLawsOrRules (a : PassportApplication) (c : ComplaintText) : Prop




axiom IssuanceSecuredByFalseStatement (pp : Passport) (c : ComplaintText) : Prop





axiom FalselyMakesOrForgesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom CounterfeitsPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom MutilatesOrAltersPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom IsPassportOrPurportedPassport (pp : Passport) (c : ComplaintText) : Prop





axiom IntendsThatPassportBeUsed (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom IsFalselyMadeForgedOrCounterfeitedPassport (pp : Passport) (c : ComplaintText) : Prop



axiom IsMutilatedOrAlteredPassport (pp : Passport) (c : ComplaintText) : Prop




axiom IsVoidedByPrescribedCondition (pp : Passport) (c : ComplaintText) : Prop






axiom IsIssuedOrDesignedForUseOfAnother (pp : Passport) (c : ComplaintText) : Prop




axiom ViolatesConditionsOrRestrictionsInPassport
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom ViolatesPassportIssuanceRules (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom FurnishesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom DisposesOfPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom DeliversPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom ForUseByOtherThanOriginalIntendedUser (pp : Passport) (c : ComplaintText) : Prop








axiom IsCoveredImmigrationDocument (d : ImmigrationDocument) (c : ComplaintText) : Prop



axiom ForgesOrCounterfeitsDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop



axiom AltersOrFalselyMakesDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom UttersOrUsesDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop



axiom PossessesDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom ObtainsAcceptsOrReceivesDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom KnowsDocumentIsForgedOrFalselyMade
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom KnowsDocumentProcuredByFalseClaimOrStatement
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom KnowsDocumentProcuredByFraudOrUnlawfullyObtained
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop






axiom ActsUnderDirectionOfProperOfficer (p : Person) (c : ComplaintText) : Prop



axiom PossessesBlankPermit (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop





axiom EngravesSellsOrImportsPlate
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop




axiom ControlsOrPossessesPlate
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop




axiom MakesLikenessOfDocument
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop




axiom PossessesDistinctivePaper
    (p : Person) (art : PrintingArticle) (c : ComplaintText) : Prop




axiom IsApplyingForDocumentOrAdmission (p : Person) (c : ComplaintText) : Prop



axiom PersonatesAnother (p : Person) (c : ComplaintText) : Prop




axiom FalselyAppearsInNameOfDeceased (p : Person) (c : ComplaintText) : Prop





axiom EvadesImmigrationLawsUnderAssumedName (p : Person) (c : ComplaintText) : Prop





axiom SellsOrDisposesOfDocumentToUnauthorizedPerson
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom MakesStatementUnderOath
    (p : Person) (s : Statement) (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom SubscribesAsTrueUnderPenaltyOfPerjury
    (p : Person) (s : Statement) (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom StatementConcernsMaterialFact (s : Statement) (c : ComplaintText) : Prop




axiom IsFilingRequiredByImmigrationLaws (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom PresentsFilingContainingFalseStatement
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom PresentsFilingLackingReasonableBasis
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop





axiom UsesIdentificationDocument
    (p : Person) (idDoc : IdentificationDocument) (c : ComplaintText) : Prop




axiom KnowsOrHasReasonToKnowDocumentNotLawfullyIssued
    (p : Person) (idDoc : IdentificationDocument) (c : ComplaintText) : Prop




axiom KnowsOrHasReasonToKnowDocumentIsFalse
    (p : Person) (idDoc : IdentificationDocument) (c : ComplaintText) : Prop



axiom UsesFalseAttestation
    (p : Person) (att : Attestation) (c : ComplaintText) : Prop




axiom ForPurposeOfSatisfyingEmploymentVerification (p : Person) (c : ComplaintText) : Prop










axiom LawfullyAuthorizedGovernmentActivity (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Reslice.Elements
