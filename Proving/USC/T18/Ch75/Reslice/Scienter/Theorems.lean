








import Proving.USC.T18.Ch75.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Scienter

open Proving.USC.Common




theorem MentalState.eq_strictLiability_of_rank_zero {m : MentalState}
    (h : m.rank = 0) : m = MentalState.StrictLiability := by
  cases m
  · rfl
  all_goals simp [MentalState.rank] at h


theorem mentalState_atLeast_refl (a : MentalState) : a.atLeast a :=
  Nat.le_refl a.rank


theorem mentalState_atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c := by
  have h1 : b.rank ≤ a.rank := hab
  have h2 : c.rank ≤ b.rank := hbc
  exact Nat.le_trans h2 h1







theorem scienterSatisfied_strictLiability (p : Person) (el : ScienterElement)
    (c : ComplaintText) : ScienterSatisfied MentalState.StrictLiability p el c :=
  Or.inl rfl


theorem scienterSatisfied_intro {required : MentalState} {p : Person}
    {el : ScienterElement} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast required) (hProv : MentalStateProven p rung el c) :
    ScienterSatisfied required p el c :=
  Or.inr ⟨rung, hReach, hProv⟩



theorem scienterSatisfied_weaken {required weaker : MentalState} {p : Person}
    {el : ScienterElement} {c : ComplaintText}
    (hLower : required.atLeast weaker)
    (hs : ScienterSatisfied required p el c) :
    ScienterSatisfied weaker p el c := by
  have hLe : weaker.rank ≤ required.rank := hLower
  cases hs with
  | inl hSL =>
    have hz : required.rank = 0 := by rw [hSL]; rfl
    have hz' : weaker.rank = 0 := by omega
    exact Or.inl (MentalState.eq_strictLiability_of_rank_zero hz')
  | inr hEx =>
    cases hEx with
    | intro rung hRest =>
      have hReach : required.rank ≤ rung.rank := hRest.left
      exact Or.inr ⟨rung, Nat.le_trans hLe hReach, hRest.right⟩



theorem section1542FalseApplicationCulpable_intro {s : Scienter1542} {c : ComplaintText}
    (hStatement : ScienterSatisfied s.falseStatementRung s.addressee
      .FalseStatementInPassportApplication c)
    (hIntent : ScienterSatisfied s.intentToInduceRung s.addressee
      .IntentToInduceIssuanceOfPassport c) :
    Section1542FalseApplicationCulpable s c :=
  ⟨hStatement, hIntent⟩

theorem section1542FraudulentUseCulpable_intro {s : Scienter1542} {c : ComplaintText}
    (hUse : ScienterSatisfied s.fraudulentUseRung s.addressee
      .UseOfFraudulentlySecuredPassport c) :
    Section1542FraudulentUseCulpable s c :=
  hUse

theorem section1542Culpable_intro_falseApplication {s : Scienter1542} {c : ComplaintText}
    (h : Section1542FalseApplicationCulpable s c) : Section1542Culpable s c :=
  .falseApplication h

theorem section1542Culpable_intro_fraudulentUse {s : Scienter1542} {c : ComplaintText}
    (h : Section1542FraudulentUseCulpable s c) : Section1542Culpable s c :=
  .fraudulentUse h



theorem section1543ForgeryCulpable_intro {s : Scienter1543} {c : ComplaintText}
    (hIntent : ScienterSatisfied s.intentThatForgedPassportBeUsedRung s.addressee
      .IntentThatForgedPassportBeUsed c) :
    Section1543ForgeryCulpable s c :=
  hIntent

theorem section1543ForgedUseCulpable_intro {s : Scienter1543} {c : ComplaintText}
    (hUse : ScienterSatisfied s.forgedUseRung s.addressee .UseOfForgedPassport c) :
    Section1543ForgedUseCulpable s c :=
  hUse

theorem section1543Culpable_intro_forgery {s : Scienter1543} {c : ComplaintText}
    (h : Section1543ForgeryCulpable s c) : Section1543Culpable s c :=
  .forgery h

theorem section1543Culpable_intro_forgedUse {s : Scienter1543} {c : ComplaintText}
    (h : Section1543ForgedUseCulpable s c) : Section1543Culpable s c :=
  .forgedUse h



theorem section1544AnothersPassportCulpable_intro {s : Scienter1544} {c : ComplaintText}
    (hUse : ScienterSatisfied s.anothersPassportRung s.addressee
      .UseOfAnothersPassport c) :
    Section1544AnothersPassportCulpable s c :=
  hUse

theorem section1544ContraryToConditionsCulpable_intro {s : Scienter1544} {c : ComplaintText}
    (hUse : ScienterSatisfied s.contraryToConditionsRung s.addressee
      .UseOfPassportContraryToConditions c) :
    Section1544ContraryToConditionsCulpable s c :=
  hUse

theorem section1544FurnishingCulpable_intro {s : Scienter1544} {c : ComplaintText}
    (hFurnish : ScienterSatisfied s.furnishingRung s.addressee
      .FurnishingPassportForUseByAnother c) :
    Section1544FurnishingCulpable s c :=
  hFurnish

theorem section1544Culpable_intro_anothersPassport {s : Scienter1544} {c : ComplaintText}
    (h : Section1544AnothersPassportCulpable s c) : Section1544Culpable s c :=
  .anothersPassport h

theorem section1544Culpable_intro_contraryToConditions {s : Scienter1544} {c : ComplaintText}
    (h : Section1544ContraryToConditionsCulpable s c) : Section1544Culpable s c :=
  .contraryToConditions h

theorem section1544Culpable_intro_furnishing {s : Scienter1544} {c : ComplaintText}
    (h : Section1544FurnishingCulpable s c) : Section1544Culpable s c :=
  .furnishing h



theorem section1546aForgeryCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.forgeryRung s.addressee .ForgeryOfImmigrationDocument c) :
    Section1546aForgeryCulpable s c :=
  h

theorem section1546aUseCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.useOfFalseDocumentRung s.addressee
      .UseOfFalseImmigrationDocument c) :
    Section1546aUseCulpable s c :=
  h

theorem section1546aBlankPermitCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.blankPermitRung s.addressee .PossessionOfBlankPermit c) :
    Section1546aBlankPermitCulpable s c :=
  h

theorem section1546aEvasionCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.evasionRung s.addressee
      .EvasionOfImmigrationLawsByAssumedName c) :
    Section1546aEvasionCulpable s c :=
  h

theorem section1546aFalseOathCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.falseStatementUnderOathRung s.addressee
      .FalseStatementUnderOath c) :
    Section1546aFalseOathCulpable s c :=
  h

theorem section1546aPresentationCulpable_intro {s : Scienter1546a} {c : ComplaintText}
    (h : ScienterSatisfied s.presentationRung s.addressee
      .PresentationOfDocumentContainingFalseStatement c) :
    Section1546aPresentationCulpable s c :=
  h

theorem section1546aCulpable_intro_forgery {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aForgeryCulpable s c) : Section1546aCulpable s c :=
  .forgery h

theorem section1546aCulpable_intro_useOfFalseDocument {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aUseCulpable s c) : Section1546aCulpable s c :=
  .useOfFalseDocument h

theorem section1546aCulpable_intro_blankPermit {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aBlankPermitCulpable s c) : Section1546aCulpable s c :=
  .blankPermit h

theorem section1546aCulpable_intro_evasion {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aEvasionCulpable s c) : Section1546aCulpable s c :=
  .evasion h

theorem section1546aCulpable_intro_falseOath {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aFalseOathCulpable s c) : Section1546aCulpable s c :=
  .falseOath h

theorem section1546aCulpable_intro_presentation {s : Scienter1546a} {c : ComplaintText}
    (h : Section1546aPresentationCulpable s c) : Section1546aCulpable s c :=
  .presentation h



theorem section1546bUnlawfulDocumentCulpable_intro {s : Scienter1546b} {c : ComplaintText}
    (hStatus : ScienterSatisfied s.documentStatusRung s.addressee
      .UseOfUnlawfullyIssuedIdentificationDocument c)
    (hPurpose : ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c) :
    Section1546bUnlawfulDocumentCulpable s c :=
  ⟨hStatus, hPurpose⟩

theorem section1546bFalseDocumentCulpable_intro {s : Scienter1546b} {c : ComplaintText}
    (hStatus : ScienterSatisfied s.documentStatusRung s.addressee
      .UseOfFalseIdentificationDocument c)
    (hPurpose : ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c) :
    Section1546bFalseDocumentCulpable s c :=
  ⟨hStatus, hPurpose⟩

theorem section1546bFalseAttestationCulpable_intro {s : Scienter1546b} {c : ComplaintText}
    (hPurpose : ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c) :
    Section1546bFalseAttestationCulpable s c :=
  hPurpose

theorem section1546bCulpable_intro_unlawfulDocument {s : Scienter1546b} {c : ComplaintText}
    (h : Section1546bUnlawfulDocumentCulpable s c) : Section1546bCulpable s c :=
  .unlawfulDocument h

theorem section1546bCulpable_intro_falseDocument {s : Scienter1546b} {c : ComplaintText}
    (h : Section1546bFalseDocumentCulpable s c) : Section1546bCulpable s c :=
  .falseDocument h

theorem section1546bCulpable_intro_falseAttestation {s : Scienter1546b} {c : ComplaintText}
    (h : Section1546bFalseAttestationCulpable s c) : Section1546bCulpable s c :=
  .falseAttestation h



theorem committedToFacilitateInternationalTerrorism_intro {p : Person} {c : ComplaintText}
    (h : ScienterSatisfied MentalState.Specific p
      .PurposeToFacilitateInternationalTerrorism c) :
    CommittedToFacilitateInternationalTerrorism p c :=
  h

theorem committedToFacilitateDrugTraffickingCrime_intro {p : Person} {c : ComplaintText}
    (h : ScienterSatisfied MentalState.Specific p
      .PurposeToFacilitateDrugTraffickingCrime c) :
    CommittedToFacilitateDrugTraffickingCrime p c :=
  h







theorem section1546b_knowledge_satisfies_reason_to_know {p : Person} {c : ComplaintText}
    (hKnew : MentalStateProven p MentalState.Knowledge
      .UseOfFalseIdentificationDocument c) :
    ScienterSatisfied (scienter1546b p).documentStatusRung p
      .UseOfFalseIdentificationDocument c := by
  refine scienterSatisfied_intro MentalState.Knowledge ?_ hKnew
  show MentalState.rank MentalState.Negligence ≤ MentalState.rank MentalState.Knowledge
  decide

end Proving.USC.T18.Ch75.Reslice.Scienter
