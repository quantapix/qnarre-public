





import Proving.USC.T18.Ch75.Elements.Statute

namespace Proving.USC.T18.Ch75.Elements

open Proving.USC.Common



theorem section1542FalseApplication_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hFalse : MakesFalseStatementInPassportApplication p c)
    (hIntent : WithIntentToSecurePassportIssuance p c)
    (hLaw : ContraryToPassportLaws p c) :
    Section1542FalseApplication p c :=
  ⟨hScienter, hFalse, hIntent, hLaw⟩

theorem section1542UseSecuredByFalsity_intro {p pp c}
    (hScienter : ActedWithScienter p c)
    (hUse : UsesPassportSecuredByFalseStatement p pp c)
    (hSecured : PassportIssueSecuredByFalseStatement pp c) :
    Section1542UseSecuredByFalsity p pp c :=
  ⟨hScienter, hUse, hSecured⟩



theorem section1543Forgery_intro {p pp c}
    (hForges : FalselyMakesOrForgesPassport p pp c)
    (hIntent : WithIntentForgedPassportBeUsed p c) :
    Section1543Forgery p pp c :=
  ⟨hForges, hIntent⟩

theorem section1543FalseUse_intro {p pp c}
    (hScienter : ActedWithScienter p c)
    (hUse : UsesForgedOrVoidPassport p pp c) :
    Section1543FalseUse p pp c :=
  ⟨hScienter, hUse⟩



theorem section1544UseOfAnothers_intro {p pp c}
    (hScienter : ActedWithScienter p c)
    (hUse : UsesPassportIssuedForAnother p pp c) :
    Section1544UseOfAnothers p pp c :=
  ⟨hScienter, hUse⟩

theorem section1544RestrictionViolation_intro {p pp c}
    (hScienter : ActedWithScienter p c)
    (hUse : UsesPassportInViolationOfRestrictions p pp c) :
    Section1544RestrictionViolation p pp c :=
  ⟨hScienter, hUse⟩

theorem section1544Furnishing_intro {p pp c}
    (hScienter : ActedWithScienter p c)
    (hFurnishes : FurnishesPassportForUseByAnother p pp c) :
    Section1544Furnishing p pp c :=
  ⟨hScienter, hFurnishes⟩



theorem section1546DocumentFraud_intro {p d c}
    (hScienter : ActedWithScienter p c)
    (hConduct : ForgesOrUsesEntryDocument p d c)
    (hFalsity : EntryDocumentIsFalseOrFraudulent d c)
    (hNotLE : ¬ LawEnforcementActivityException p c) :
    Section1546DocumentFraud p d c :=
  ⟨hScienter, hConduct, hFalsity, hNotLE⟩

theorem section1546PlatesAndPaper_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hConduct : PossessesPermitPlateOrDistinctivePaper p c)
    (hNotAuth : ¬ AuthorizedByAttorneyGeneral p c)
    (hNotLE : ¬ LawEnforcementActivityException p c) :
    Section1546PlatesAndPaper p c :=
  ⟨hScienter, hConduct, hNotAuth, hNotLE⟩

theorem section1546Impersonation_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hConduct : ImpersonatesOrEvadesInVisaApplication p c)
    (hNotLE : ¬ LawEnforcementActivityException p c) :
    Section1546Impersonation p c :=
  ⟨hScienter, hConduct, hNotLE⟩

theorem section1546FalseOath_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hConduct : MakesFalseStatementUnderOathInImmigrationDocument p c)
    (hMaterial : FalseStatementConcernsMaterialFact c)
    (hNotLE : ¬ LawEnforcementActivityException p c) :
    Section1546FalseOath p c :=
  ⟨hScienter, hConduct, hMaterial, hNotLE⟩

theorem section1546IdentificationDocumentUse_intro {p d c}
    (hUse : UsesIdentificationDocumentOrFalseAttestation p d c)
    (hKnows : KnowsIdentificationDocumentUnlawfulOrFalse p d c)
    (hPurpose : ToSatisfyEmploymentVerificationRequirement p c)
    (hNotLE : ¬ LawEnforcementActivityException p c) :
    Section1546IdentificationDocumentUse p d c :=
  ⟨hUse, hKnows, hPurpose, hNotLE⟩

end Proving.USC.T18.Ch75.Elements
