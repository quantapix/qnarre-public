









import Proving.USC.T18.Ch75.Elements.Predicates

namespace Proving.USC.T18.Ch75.Elements

open Proving.USC.Common




structure Section1542FalseApplication (p : Person) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  falseStatement : MakesFalseStatementInPassportApplication p c
  intent        : WithIntentToSecurePassportIssuance p c
  contraryToLaw : ContraryToPassportLaws p c


structure Section1542UseSecuredByFalsity (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  use      : UsesPassportSecuredByFalseStatement p pp c
  secured  : PassportIssueSecuredByFalseStatement pp c

inductive Section1542 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | falseApplication (h : Section1542FalseApplication p c)
  | useSecured       (h : Section1542UseSecuredByFalsity p pp c)




structure Section1543Forgery (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  forges : FalselyMakesOrForgesPassport p pp c
  intent : WithIntentForgedPassportBeUsed p c


structure Section1543FalseUse (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  use      : UsesForgedOrVoidPassport p pp c

inductive Section1543 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | forgery  (h : Section1543Forgery p pp c)
  | falseUse (h : Section1543FalseUse p pp c)




structure Section1544UseOfAnothers (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  use      : UsesPassportIssuedForAnother p pp c


structure Section1544RestrictionViolation (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  use      : UsesPassportInViolationOfRestrictions p pp c


structure Section1544Furnishing (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  scienter  : ActedWithScienter p c
  furnishes : FurnishesPassportForUseByAnother p pp c

inductive Section1544 (p : Person) (pp : Passport) (c : ComplaintText) : Prop where
  | useOfAnothers       (h : Section1544UseOfAnothers p pp c)
  | restrictionViolation (h : Section1544RestrictionViolation p pp c)
  | furnishing          (h : Section1544Furnishing p pp c)





structure Section1546DocumentFraud (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : ForgesOrUsesEntryDocument p d c
  falsity  : EntryDocumentIsFalseOrFraudulent d c
  notLawEnforcement : ¬ LawEnforcementActivityException p c



structure Section1546PlatesAndPaper (p : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : PossessesPermitPlateOrDistinctivePaper p c
  notAuthorized : ¬ AuthorizedByAttorneyGeneral p c
  notLawEnforcement : ¬ LawEnforcementActivityException p c


structure Section1546Impersonation (p : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : ImpersonatesOrEvadesInVisaApplication p c
  notLawEnforcement : ¬ LawEnforcementActivityException p c



structure Section1546FalseOath (p : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : MakesFalseStatementUnderOathInImmigrationDocument p c
  material : FalseStatementConcernsMaterialFact c
  notLawEnforcement : ¬ LawEnforcementActivityException p c



structure Section1546IdentificationDocumentUse (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop where
  use     : UsesIdentificationDocumentOrFalseAttestation p d c
  knows   : KnowsIdentificationDocumentUnlawfulOrFalse p d c
  purpose : ToSatisfyEmploymentVerificationRequirement p c
  notLawEnforcement : ¬ LawEnforcementActivityException p c

inductive Section1546 (p : Person) (d : EntryDocument) (c : ComplaintText) : Prop where
  | documentFraud           (h : Section1546DocumentFraud p d c)
  | platesAndPaper          (h : Section1546PlatesAndPaper p c)
  | impersonation           (h : Section1546Impersonation p c)
  | falseOath               (h : Section1546FalseOath p c)
  | identificationDocumentUse (h : Section1546IdentificationDocumentUse p d c)





inductive ValidPassportOrVisaFraudCharge
    (p : Person) (pp : Passport) (d : EntryDocument) (c : ComplaintText) : Prop where
  | s1542 (h : Section1542 p pp c)
  | s1543 (h : Section1543 p pp c)
  | s1544 (h : Section1544 p pp c)
  | s1546 (h : Section1546 p d c)

end Proving.USC.T18.Ch75.Elements
