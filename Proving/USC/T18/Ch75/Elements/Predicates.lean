








import Proving.USC.T18.Ch75.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch75.Elements

open Proving.USC.Common





axiom MakesFalseStatementInPassportApplication (p : Person) (c : ComplaintText) : Prop




axiom WithIntentToSecurePassportIssuance (p : Person) (c : ComplaintText) : Prop




axiom ContraryToPassportLaws (p : Person) (c : ComplaintText) : Prop




axiom UsesPassportSecuredByFalseStatement (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom PassportIssueSecuredByFalseStatement (pp : Passport) (c : ComplaintText) : Prop






axiom FalselyMakesOrForgesPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop



axiom WithIntentForgedPassportBeUsed (p : Person) (c : ComplaintText) : Prop





axiom UsesForgedOrVoidPassport (p : Person) (pp : Passport) (c : ComplaintText) : Prop






axiom UsesPassportIssuedForAnother (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom UsesPassportInViolationOfRestrictions (p : Person) (pp : Passport) (c : ComplaintText) : Prop




axiom FurnishesPassportForUseByAnother (p : Person) (pp : Passport) (c : ComplaintText) : Prop






axiom ForgesOrUsesEntryDocument (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop





axiom EntryDocumentIsFalseOrFraudulent (d : EntryDocument) (c : ComplaintText) : Prop





axiom PossessesPermitPlateOrDistinctivePaper (p : Person) (c : ComplaintText) : Prop





axiom AuthorizedByAttorneyGeneral (p : Person) (c : ComplaintText) : Prop






axiom ImpersonatesOrEvadesInVisaApplication (p : Person) (c : ComplaintText) : Prop





axiom MakesFalseStatementUnderOathInImmigrationDocument (p : Person) (c : ComplaintText) : Prop




axiom FalseStatementConcernsMaterialFact (c : ComplaintText) : Prop





axiom UsesIdentificationDocumentOrFalseAttestation (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop




axiom KnowsIdentificationDocumentUnlawfulOrFalse (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop




axiom ToSatisfyEmploymentVerificationRequirement (p : Person) (c : ComplaintText) : Prop









axiom LawEnforcementActivityException (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Elements
