






import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Deontic

open Proving.USC.Common






axiom AddresseeWhoever (p : Person) (c : ComplaintText) : Prop




axiom ActedWillfullyAndKnowingly (p : Person) (c : ComplaintText) : Prop



axiom ActedKnowingly (p : Person) (c : ComplaintText) : Prop






axiom MakesFalseStatementInPassportApplication
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop





axiom IntentToSecureIssuanceOfPassport
    (p : Person) (a : PassportApplication) (c : ComplaintText) : Prop





axiom ContraryToPassportIssuanceLaws (a : PassportApplication) (c : ComplaintText) : Prop




axiom UsesOrFurnishesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom PassportIssuanceSecuredByFalseStatement (pp : Passport) (c : ComplaintText) : Prop







axiom FalselyMakesOrAltersPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom IntentThatPassportBeUsed (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom UsesOrFurnishesTaintedPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom PassportFalselyMadeOrAltered (pp : Passport) (c : ComplaintText) : Prop





axiom PassportVoidedByPrescribedCondition (pp : Passport) (c : ComplaintText) : Prop






axiom UsesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom PassportIssuedOrDesignedForAnother
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop





axiom UseViolatesPassportConditionsOrRules
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom FurnishesPassportToPerson (p : Person) (pp : Passport) (c : ComplaintText) : Prop





axiom FurnishedForUseByOtherThanOriginalHolder
    (p : Person) (pp : Passport) (c : ComplaintText) : Prop








axiom IsPrescribedImmigrationDocument (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom ForgesOrFalselyMakesImmigrationDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop




axiom UttersUsesOrPossessesImmigrationDocument
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop






axiom KnowsDocumentTaintedOrUnlawfullyObtained
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop







axiom IsPermitPrintingArticle (ar : PermitPrintingArticle) (c : ComplaintText) : Prop






axiom PossessesOrMakesPermitPrintingArticle
    (p : Person) (ar : PermitPrintingArticle) (c : ComplaintText) : Prop






axiom ActedUnderProperOfficerDirection (p : Person) (c : ComplaintText) : Prop





axiom ApplyingForEntryDocumentOrAdmission (p : Person) (c : ComplaintText) : Prop






axiom PersonatesOrAppearsUnderFalseIdentity (p : Person) (c : ComplaintText) : Prop






axiom TransfersDocumentToUnauthorizedPerson
    (p : Person) (d : ImmigrationDocument) (c : ComplaintText) : Prop





axiom IsImmigrationFiling (f : ImmigrationFiling) (c : ComplaintText) : Prop





axiom MakesFalseStatementUnderOath
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop





axiom PresentsFilingWithFalseStatementOrNoReasonableBasis
    (p : Person) (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom FalseStatementIsMaterial (f : ImmigrationFiling) (c : ComplaintText) : Prop






axiom UsesIdentificationDocument
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop



axiom UsesAttestation (p : Person) (att : Attestation) (c : ComplaintText) : Prop




axiom DocumentNotLawfullyIssuedForPossessor
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop




axiom IdentificationDocumentIsFalse (d : IdentificationDocument) (c : ComplaintText) : Prop




axiom KnowsOrHasReasonToKnowDocumentDefect
    (p : Person) (d : IdentificationDocument) (c : ComplaintText) : Prop



axiom IsFalseAttestation (att : Attestation) (c : ComplaintText) : Prop





axiom ForPurposeOfSatisfyingEmploymentVerification (p : Person) (c : ComplaintText) : Prop










axiom LawfullyAuthorizedGovernmentActivity (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Reslice.Deontic
