





























import Proving.USC.T18.Ch75.Reslice.Elements.Statute
import Proving.USC.T18.Ch75.Reslice.Deontic.Statute
import Proving.USC.T18.Ch75.Reslice.Ontology.Statute
import Proving.USC.T18.Ch75.Reslice.Procedure.Statute
import Proving.USC.T18.Ch75.Reslice.Scienter.Theorems
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Bridge

open Proving.USC.Common







axiom mapED_pp     : Elements.Passport               → Deontic.Passport
axiom mapED_app    : Elements.PassportApplication    → Deontic.PassportApplication
axiom mapED_doc    : Elements.ImmigrationDocument    → Deontic.ImmigrationDocument
axiom mapED_art    : Elements.PrintingArticle        → Deontic.PermitPrintingArticle
axiom mapED_filing : Elements.ImmigrationFiling      → Deontic.ImmigrationFiling
axiom mapED_id     : Elements.IdentificationDocument → Deontic.IdentificationDocument
axiom mapED_att    : Elements.Attestation            → Deontic.Attestation

axiom mapEO_pp     : Elements.Passport               → Ontology.Passport
axiom mapEO_app    : Elements.PassportApplication    → Ontology.PassportApplication
axiom mapEO_stmt   : Elements.Statement              → Ontology.Statement
axiom mapEO_doc    : Elements.ImmigrationDocument    → Ontology.EntryDocument




axiom mapEO_artDoc  : Elements.PrintingArticle       → Ontology.EntryDocument
axiom mapEO_artImpl : Elements.PrintingArticle       → Ontology.Implement
axiom mapEO_filing : Elements.ImmigrationFiling      → Ontology.ImmigrationFiling

axiom mapEP_ppDoc  : Elements.Passport               → Procedure.TravelDocument
axiom mapEP_appDoc : Elements.PassportApplication    → Procedure.TravelDocument
axiom mapEP_immDoc : Elements.ImmigrationDocument    → Procedure.TravelDocument
axiom mapEP_artDoc : Elements.PrintingArticle        → Procedure.TravelDocument
axiom mapEP_idDoc  : Elements.IdentificationDocument → Procedure.TravelDocument
axiom mapEP_filing : Elements.ImmigrationFiling      → Procedure.ImmigrationFiling


axiom mapEP_att    : Elements.Attestation            → Procedure.ImmigrationFiling









axiom corr_whoever (p : Person) (c : ComplaintText) : Deontic.AddresseeWhoever p c



axiom corr_wk {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c → Deontic.ActedWillfullyAndKnowingly p c


axiom corr_knowing {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly p c → Deontic.ActedKnowingly p c




axiom corr_authorized {p : Person} {c : ComplaintText} :
    Deontic.LawfullyAuthorizedGovernmentActivity p c →
    Elements.LawfullyAuthorizedGovernmentActivity p c



axiom corr_officerDirection {p : Person} {c : ComplaintText} :
    Deontic.ActedUnderProperOfficerDirection p c →
    Elements.ActsUnderDirectionOfProperOfficer p c








theorem satisfied_specific {p : Person} {el : Scienter.ScienterElement}
    {c : ComplaintText}
    (h : Scienter.MentalStateProven p Scienter.MentalState.Specific el c) :
    Scienter.ScienterSatisfied Scienter.MentalState.Specific p el c :=
  Or.inr ⟨Scienter.MentalState.Specific,
          Scienter.mentalState_atLeast_refl Scienter.MentalState.Specific, h⟩


theorem satisfied_knowledge {p : Person} {el : Scienter.ScienterElement}
    {c : ComplaintText}
    (h : Scienter.MentalStateProven p Scienter.MentalState.Knowledge el c) :
    Scienter.ScienterSatisfied Scienter.MentalState.Knowledge p el c :=
  Or.inr ⟨Scienter.MentalState.Knowledge,
          Scienter.mentalState_atLeast_refl Scienter.MentalState.Knowledge, h⟩



theorem satisfied_negligence {p : Person} {el : Scienter.ScienterElement}
    {c : ComplaintText}
    (h : Scienter.MentalStateProven p Scienter.MentalState.Negligence el c) :
    Scienter.ScienterSatisfied Scienter.MentalState.Negligence p el c :=
  Or.inr ⟨Scienter.MentalState.Negligence,
          Scienter.mentalState_atLeast_refl Scienter.MentalState.Negligence, h⟩












axiom corr_1542_intent {p : Person} {a : Elements.PassportApplication}
    {c : ComplaintText} :
    Elements.IntendsToInduceOrSecureIssuance p a c →
    Elements.PassportSoughtUnderUnitedStatesAuthority a c →
    Elements.ForOwnUseOrUseOfAnother p a c →
    Deontic.IntentToSecureIssuanceOfPassport p (mapED_app a) c


axiom corr_1542_contrary {a : Elements.PassportApplication} {c : ComplaintText} :
    Elements.ContraryToPassportLawsOrRules a c →
    Deontic.ContraryToPassportIssuanceLaws (mapED_app a) c



axiom corr_1542_falseStatement {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {c : ComplaintText} :
    Elements.MakesStatementInPassportApplication p s a c →
    Elements.StatementIsFalse s c →
    Deontic.MakesFalseStatementInPassportApplication p (mapED_app a) c




axiom corr_1542_useOrFurnish {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.UseOrFurnishPassport p pp c →
    Deontic.UsesOrFurnishesPassport p (mapED_pp pp) c


axiom corr_1542_taint {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IssuanceSecuredByFalseStatement pp c →
    Deontic.PassportIssuanceSecuredByFalseStatement (mapED_pp pp) c



theorem s1542_elements_implies_deontic
    {p : Person} {s : Elements.Statement} {a : Elements.PassportApplication}
    {pp : Elements.Passport} {c : ComplaintText}
    (h : Elements.Section1542 p s a pp c) :
    Deontic.Section1542Violated p c :=
  match h with
  | .falseApplicationStatement h1 =>
      .falseApplication (mapED_app a)
        ⟨⟨corr_whoever p c, corr_wk h1.mensRea,
          corr_1542_intent h1.intentToSecure h1.unitedStatesAuthority
            h1.ownOrAnothersUse,
          corr_1542_contrary h1.contraryToLaw⟩,
         corr_1542_falseStatement h1.inApplication h1.falsity⟩
  | .falselySecuredPassport h2 =>
      .taintedUse (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_wk h2.mensRea, corr_1542_taint h2.falselySecured⟩,
         corr_1542_useOrFurnish h2.conduct⟩





axiom corr_sc_1542_falseStatement {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.FalseStatementInPassportApplication c



axiom corr_sc_1542_intent {p : Person} {a : Elements.PassportApplication}
    {c : ComplaintText} :
    Elements.IntendsToInduceOrSecureIssuance p a c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.IntentToInduceIssuanceOfPassport c



axiom corr_sc_1542_use {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfFraudulentlySecuredPassport c


theorem s1542_elements_implies_scienter
    {p : Person} {s : Elements.Statement} {a : Elements.PassportApplication}
    {pp : Elements.Passport} {c : ComplaintText}
    (h : Elements.Section1542 p s a pp c) :
    Scienter.Section1542Culpable (Scienter.scienter1542 p) c :=
  match h with
  | .falseApplicationStatement h1 =>
      .falseApplication
        ⟨satisfied_specific (corr_sc_1542_falseStatement h1.mensRea),
         satisfied_specific (corr_sc_1542_intent h1.intentToSecure)⟩
  | .falselySecuredPassport h2 =>
      .fraudulentUse (satisfied_specific (corr_sc_1542_use h2.mensRea))






def Section1542TermsInhabited (s : Elements.Statement)
    (a : Elements.PassportApplication) (pp : Elements.Passport)
    (c : ComplaintText) : Prop :=
  Ontology.PassportApplicationStatementMembership (mapEO_stmt s) (mapEO_app a) c ∨
  Ontology.FraudulentlySecuredPassportMembership (mapEO_pp pp) c



axiom corr_o_1542_isApplication {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {c : ComplaintText} :
    Elements.MakesStatementInPassportApplication p s a c →
    Ontology.IsPassportApplication (mapEO_app a) c



axiom corr_o_1542_falseInIt {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {c : ComplaintText} :
    Elements.MakesStatementInPassportApplication p s a c →
    Elements.StatementIsFalse s c →
    Ontology.IsFalseStatementInApplication (mapEO_stmt s) (mapEO_app a) c


axiom corr_o_1542_isPassport {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IssuanceSecuredByFalseStatement pp c →
    Ontology.IsPassport (mapEO_pp pp) c


axiom corr_o_1542_secured {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IssuanceSecuredByFalseStatement pp c →
    Ontology.IsPassportSecuredByFalseStatement (mapEO_pp pp) c


theorem s1542_elements_implies_ontology
    {p : Person} {s : Elements.Statement} {a : Elements.PassportApplication}
    {pp : Elements.Passport} {c : ComplaintText}
    (h : Elements.Section1542 p s a pp c) :
    Section1542TermsInhabited s a pp c :=
  match h with
  | .falseApplicationStatement h1 =>
      Or.inl ⟨corr_o_1542_isApplication h1.inApplication,
              corr_o_1542_falseInIt h1.inApplication h1.falsity⟩
  | .falselySecuredPassport h2 =>
      Or.inr ⟨corr_o_1542_isPassport h2.falselySecured,
              corr_o_1542_secured h2.falselySecured⟩





axiom corr_p_1542_applied {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {c : ComplaintText} :
    Elements.MakesStatementInPassportApplication p s a c →
    Procedure.ApplicationForPassportSubmitted (mapEP_appDoc a) c



axiom corr_p_1542_contraryRules {a : Elements.PassportApplication}
    {c : ComplaintText} :
    Elements.ContraryToPassportLawsOrRules a c →
    Procedure.ContraryToPassportIssuanceRules (mapEP_appDoc a) c



axiom corr_p_1542_issued {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IssuanceSecuredByFalseStatement pp c →
    Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c


axiom corr_p_1542_secured {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IssuanceSecuredByFalseStatement pp c →
    Procedure.IssuanceSecuredByFalseStatement (mapEP_ppDoc pp) c


axiom corr_p_1542_used {p : Person} {pp : Elements.Passport} {c : ComplaintText} :
    Elements.UseOrFurnishPassport p pp c →
    Procedure.DocumentUsedOrPresented (mapEP_ppDoc pp) c









theorem s1542_elements_implies_procedure_modulo_gaps
    {p : Person} {s : Elements.Statement} {a : Elements.PassportApplication}
    {pp : Elements.Passport} {c : ComplaintText}
    (gap_1542_issuanceActuallySecured :
      Procedure.IssuanceSecuredByFalseStatement (mapEP_appDoc a) c)
    (h : Elements.Section1542 p s a pp c) :
    ∃ d : Procedure.TravelDocument, Procedure.Section1542Track d c :=
  match h with
  | .falseApplicationStatement h1 =>
      ⟨mapEP_appDoc a,
       .falseApplication (.applied (corr_p_1542_applied h1.inApplication))
         (corr_p_1542_contraryRules h1.contraryToLaw)
         gap_1542_issuanceActuallySecured⟩
  | .falselySecuredPassport h2 =>
      ⟨mapEP_ppDoc pp,
       .useOfTaintedIssuance
         (.issuedOnRecord (corr_p_1542_issued h2.falselySecured))
         (corr_p_1542_secured h2.falselySecured)
         (corr_p_1542_used h2.conduct)⟩





axiom corr_dsc_1542_falseStatement {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.FalseStatementInPassportApplication c



axiom corr_dsc_1542_intent {p : Person} {a : Deontic.PassportApplication}
    {c : ComplaintText} :
    Deontic.IntentToSecureIssuanceOfPassport p a c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.IntentToInduceIssuanceOfPassport c



axiom corr_dsc_1542_use {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfFraudulentlySecuredPassport c


theorem s1542_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.Section1542Violated p c) :
    Scienter.Section1542Culpable (Scienter.scienter1542 p) c :=
  match h with
  | .falseApplication _ h1 =>
      .falseApplication
        ⟨satisfied_specific (corr_dsc_1542_falseStatement h1.1.scienter),
         satisfied_specific (corr_dsc_1542_intent h1.1.intent)⟩
  | .taintedUse _ h2 =>
      .fraudulentUse (satisfied_specific (corr_dsc_1542_use h2.1.scienter))










axiom corr_1543_forgeryConduct {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ForgeryConduct1543 p pp c →
    Deontic.FalselyMakesOrAltersPassport p (mapED_pp pp) c


axiom corr_1543_intent {p : Person} {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IntendsThatPassportBeUsed p pp c →
    Deontic.IntentThatPassportBeUsed p (mapED_pp pp) c



axiom corr_1543_falsified {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsFalselyMadeForgedOrCounterfeitedPassport pp c →
    Deontic.PassportFalselyMadeOrAltered (mapED_pp pp) c




axiom corr_1543_tampered {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsMutilatedOrAlteredPassport pp c →
    Deontic.PassportFalselyMadeOrAltered (mapED_pp pp) c


axiom corr_1543_voided {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsVoidedByPrescribedCondition pp c →
    Deontic.PassportVoidedByPrescribedCondition (mapED_pp pp) c


axiom corr_1543_taintedUse {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.UseOrFurnishPassport p pp c →
    Deontic.UsesOrFurnishesTaintedPassport p (mapED_pp pp) c




theorem s1543_elements_implies_deontic {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (h : Elements.Section1543 p pp c) :
    Deontic.Section1543Violated p c :=
  match h with
  | .forgery h1 =>
      .falsification (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_1543_intent h1.intentThatItBeUsed⟩,
         corr_1543_forgeryConduct h1.conduct⟩
  | .falseUse h2 =>
      .taintedUse (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_wk h2.mensRea,
          (match h2.defect with
           | .falsified hf => .falsified (corr_1543_falsified hf)
           | .tampered ht => .falsified (corr_1543_tampered ht)
           | .voided hv => .voided (corr_1543_voided hv))⟩,
         corr_1543_taintedUse h2.conduct⟩





axiom corr_sc_1543_intent {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.IntendsThatPassportBeUsed p pp c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.IntentThatForgedPassportBeUsed c



axiom corr_sc_1543_use {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfForgedPassport c




theorem s1543_elements_implies_scienter {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (h : Elements.Section1543 p pp c) :
    Scienter.Section1543Culpable (Scienter.scienter1543 p) c :=
  match h with
  | .forgery h1 =>
      .forgery (satisfied_specific (corr_sc_1543_intent h1.intentThatItBeUsed))
  | .falseUse h2 =>
      .forgedUse (satisfied_specific (corr_sc_1543_use h2.mensRea))






def Section1543TermsInhabited (pp : Elements.Passport) (c : ComplaintText) : Prop :=
  Ontology.FalsifiedPassportDocumentMembership (mapEO_pp pp) c ∨
  ∃ t : Time, Ontology.VoidedPassportMembership (mapEO_pp pp) t c





axiom corr_o_1543_instrument {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsPassportOrPurportedPassport pp c →
    Ontology.IsPassport (mapEO_pp pp) c ∨
      Ontology.PurportedPassportMembership (mapEO_pp pp) c



axiom corr_o_1543_forged {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ForgeryConduct1543 p pp c →
    Ontology.IsFalselyMadeOrAlteredPassport (mapEO_pp pp) c



axiom corr_o_1543_defectFalsified {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsFalselyMadeForgedOrCounterfeitedPassport pp c →
    Ontology.IsFalselyMadeOrAlteredPassport (mapEO_pp pp) c


axiom corr_o_1543_defectTampered {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsMutilatedOrAlteredPassport pp c →
    Ontology.IsFalselyMadeOrAlteredPassport (mapEO_pp pp) c









theorem s1543_elements_implies_ontology_modulo_gaps
    {p : Person} {pp : Elements.Passport} {c : ComplaintText}
    (gap_1543_voidedPassportTimeAndValidIssue :
      Elements.IsVoidedByPrescribedCondition pp c →
      ∃ t : Time, Ontology.VoidedPassportMembership (mapEO_pp pp) t c)
    (h : Elements.Section1543 p pp c) :
    Section1543TermsInhabited pp c :=
  match h with
  | .forgery h1 =>
      Or.inl (match corr_o_1543_instrument h1.instrument with
        | Or.inl hg => .genuinePassport hg (corr_o_1543_forged h1.conduct)
        | Or.inr hpu => .purportedInstrument hpu (corr_o_1543_forged h1.conduct))
  | .falseUse h2 =>
      match h2.defect with
      | .falsified hf =>
          Or.inl (match corr_o_1543_instrument h2.instrument with
            | Or.inl hg => .genuinePassport hg (corr_o_1543_defectFalsified hf)
            | Or.inr hpu => .purportedInstrument hpu (corr_o_1543_defectFalsified hf))
      | .tampered ht =>
          Or.inl (match corr_o_1543_instrument h2.instrument with
            | Or.inl hg => .genuinePassport hg (corr_o_1543_defectTampered ht)
            | Or.inr hpu => .purportedInstrument hpu (corr_o_1543_defectTampered ht))
      | .voided hv => Or.inr (gap_1543_voidedPassportTimeAndValidIssue hv)





axiom corr_p_1543_notIssued {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsFalselyMadeForgedOrCounterfeitedPassport pp c →
    ¬ Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c


axiom corr_p_1543_used {p : Person} {pp : Elements.Passport} {c : ComplaintText} :
    Elements.UseOrFurnishPassport p pp c →
    Procedure.DocumentUsedOrPresented (mapEP_ppDoc pp) c



















theorem s1543_elements_implies_procedure_modulo_gaps
    {p : Person} {pp : Elements.Passport} {c : ComplaintText}
    (gap_1543_forgeryTrackRequiresUse :
      Procedure.DocumentUsedOrPresented (mapEP_ppDoc pp) c)
    (gap_1543_alteredPassportNeverIssued :
      ¬ Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c)
    (gap_1543_voidedTrack :
      Elements.IsVoidedByPrescribedCondition pp c →
      Procedure.Section1543Track (mapEP_ppDoc pp) c)
    (h : Elements.Section1543 p pp c) :
    ∃ d : Procedure.TravelDocument, Procedure.Section1543Track d c :=
  match h with
  | .forgery _ =>
      ⟨mapEP_ppDoc pp,
       .useOfUnissuedInstrument gap_1543_alteredPassportNeverIssued
         gap_1543_forgeryTrackRequiresUse⟩
  | .falseUse h2 =>
      match h2.defect with
      | .falsified hf =>
          ⟨mapEP_ppDoc pp,
           .useOfUnissuedInstrument (corr_p_1543_notIssued hf)
             (corr_p_1543_used h2.conduct)⟩
      | .tampered _ =>
          ⟨mapEP_ppDoc pp,
           .useOfUnissuedInstrument gap_1543_alteredPassportNeverIssued
             (corr_p_1543_used h2.conduct)⟩
      | .voided hv => ⟨mapEP_ppDoc pp, gap_1543_voidedTrack hv⟩




axiom corr_dsc_1543_intent {p : Person} {pp : Deontic.Passport}
    {c : ComplaintText} :
    Deontic.IntentThatPassportBeUsed p pp c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.IntentThatForgedPassportBeUsed c


axiom corr_dsc_1543_use {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfForgedPassport c




theorem s1543_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.Section1543Violated p c) :
    Scienter.Section1543Culpable (Scienter.scienter1543 p) c :=
  match h with
  | .falsification _ h1 =>
      .forgery (satisfied_specific (corr_dsc_1543_intent h1.1.intent))
  | .taintedUse _ h2 =>
      .forgedUse (satisfied_specific (corr_dsc_1543_use h2.1.scienter))









axiom corr_1544_used {p : Person} {pp : Elements.Passport} {c : ComplaintText} :
    Elements.UseOrAttemptPassport p pp c →
    Deontic.UsesPassport p (mapED_pp pp) c


axiom corr_1544_ofAnother {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.IsIssuedOrDesignedForUseOfAnother pp c →
    Deontic.PassportIssuedOrDesignedForAnother p (mapED_pp pp) c



axiom corr_1544_violation {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.Violation1544 p pp c →
    Deontic.UseViolatesPassportConditionsOrRules p (mapED_pp pp) c



axiom corr_1544_transfer {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.TransferConduct1544 p pp c →
    Deontic.FurnishesPassportToPerson p (mapED_pp pp) c


axiom corr_1544_forAnother {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ForUseByOtherThanOriginalIntendedUser pp c →
    Deontic.FurnishedForUseByOtherThanOriginalHolder p (mapED_pp pp) c



theorem s1544_elements_implies_deontic {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (h : Elements.Section1544 p pp c) :
    Deontic.Section1544Violated p c :=
  match h with
  | .usesAnothersPassport h1 =>
      .useOfAnothers (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_wk h1.mensRea, corr_1544_ofAnother h1.ofAnother⟩,
         corr_1544_used h1.conduct⟩
  | .usesInViolation h2 =>
      .conditionViolation (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_wk h2.mensRea, corr_1544_violation h2.violation⟩,
         corr_1544_used h2.conduct⟩
  | .transfersForAnother h3 =>
      .furnishing (mapED_pp pp)
        ⟨⟨corr_whoever p c, corr_wk h3.mensRea,
          corr_1544_forAnother h3.forAnothersUse⟩,
         corr_1544_transfer h3.conduct⟩




axiom corr_sc_1544_anothers {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfAnothersPassport c


axiom corr_sc_1544_conditions {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfPassportContraryToConditions c


axiom corr_sc_1544_furnishing {p : Person} {c : ComplaintText} :
    Elements.WillfulAndKnowing p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.FurnishingPassportForUseByAnother c


theorem s1544_elements_implies_scienter {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (h : Elements.Section1544 p pp c) :
    Scienter.Section1544Culpable (Scienter.scienter1544 p) c :=
  match h with
  | .usesAnothersPassport h1 =>
      .anothersPassport (satisfied_specific (corr_sc_1544_anothers h1.mensRea))
  | .usesInViolation h2 =>
      .contraryToConditions (satisfied_specific (corr_sc_1544_conditions h2.mensRea))
  | .transfersForAnother h3 =>
      .furnishing (satisfied_specific (corr_sc_1544_furnishing h3.mensRea))







def Section1544TermsInhabited (p : Person) (pp : Elements.Passport)
    (c : ComplaintText) : Prop :=
  (∃ bearer : Person,
     Ontology.PassportOfAnotherMembership (mapEO_pp pp) bearer p c) ∨
  (∃ r : Ontology.PassportRule,
     Ontology.PassportUseNormMembership r (mapEO_pp pp) c)














theorem s1544_elements_implies_ontology_modulo_gaps
    {p : Person} {pp : Elements.Passport} {c : ComplaintText}
    (gap_1544_bearerIdentified :
      ∃ bearer : Person,
        Ontology.PassportOfAnotherMembership (mapEO_pp pp) bearer p c)
    (gap_1544_useNormIdentified :
      ∃ r : Ontology.PassportRule,
        Ontology.PassportUseNormMembership r (mapEO_pp pp) c)
    (h : Elements.Section1544 p pp c) :
    Section1544TermsInhabited p pp c :=
  match h with
  | .usesAnothersPassport _ => Or.inl gap_1544_bearerIdentified
  | .usesInViolation _ => Or.inr gap_1544_useNormIdentified
  | .transfersForAnother _ => Or.inl gap_1544_bearerIdentified





axiom corr_p_1544_issuedOfAnother {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsIssuedOrDesignedForUseOfAnother pp c →
    Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c


axiom corr_p_1544_designated {pp : Elements.Passport} {c : ComplaintText} :
    Elements.IsIssuedOrDesignedForUseOfAnother pp c →
    Procedure.DocumentDesignatedForUseOfAnother (mapEP_ppDoc pp) c



axiom corr_p_1544_issuedInViolation {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.Violation1544 p pp c →
    Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c



axiom corr_p_1544_conditions {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ViolatesConditionsOrRestrictionsInPassport p pp c →
    Procedure.UsedInViolationOfDocumentConditions (mapEP_ppDoc pp) c



axiom corr_p_1544_rules {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ViolatesPassportIssuanceRules p pp c →
    Procedure.ContraryToPassportIssuanceRules (mapEP_ppDoc pp) c


axiom corr_p_1544_used {p : Person} {pp : Elements.Passport} {c : ComplaintText} :
    Elements.UseOrAttemptPassport p pp c →
    Procedure.DocumentUsedOrPresented (mapEP_ppDoc pp) c



axiom corr_p_1544_furnished {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.TransferConduct1544 p pp c →
    Procedure.DocumentFurnishedForUseByAnother (mapEP_ppDoc pp) c




axiom corr_p_1544_issuedForAnother {pp : Elements.Passport} {c : ComplaintText} :
    Elements.ForUseByOtherThanOriginalIntendedUser pp c →
    Procedure.PassportIssuedUnderUSAuthority (mapEP_ppDoc pp) c


axiom corr_p_1544_designatedForAnother {pp : Elements.Passport}
    {c : ComplaintText} :
    Elements.ForUseByOtherThanOriginalIntendedUser pp c →
    Procedure.DocumentDesignatedForUseOfAnother (mapEP_ppDoc pp) c





theorem s1544_elements_implies_procedure {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (h : Elements.Section1544 p pp c) :
    ∃ d : Procedure.TravelDocument, Procedure.Section1544Track d c :=
  match h with
  | .usesAnothersPassport h1 =>
      ⟨mapEP_ppDoc pp,
       .useOfAnothersPassport
         (.issuedOnRecord (corr_p_1544_issuedOfAnother h1.ofAnother))
         (corr_p_1544_designated h1.ofAnother)
         (corr_p_1544_used h1.conduct)⟩
  | .usesInViolation h2 =>
      match h2.violation with
      | .conditionsOrRestrictions hc =>
          ⟨mapEP_ppDoc pp,
           .useContraryToConditions
             (.issuedOnRecord (corr_p_1544_issuedInViolation h2.violation))
             (corr_p_1544_conditions hc)
             (corr_p_1544_used h2.conduct)⟩
      | .issuanceRules hr =>
          ⟨mapEP_ppDoc pp,
           .useContraryToIssuanceRules
             (.issuedOnRecord (corr_p_1544_issuedInViolation h2.violation))
             (corr_p_1544_rules hr)
             (corr_p_1544_used h2.conduct)⟩
  | .transfersForAnother h3 =>
      ⟨mapEP_ppDoc pp,
       .furnishingToAnother
         (.issuedOnRecord (corr_p_1544_issuedForAnother h3.forAnothersUse))
         (corr_p_1544_designatedForAnother h3.forAnothersUse)
         (corr_p_1544_furnished h3.conduct)⟩




axiom corr_dsc_1544_anothers {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfAnothersPassport c


axiom corr_dsc_1544_conditions {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.UseOfPassportContraryToConditions c


axiom corr_dsc_1544_furnishing {p : Person} {c : ComplaintText} :
    Deontic.ActedWillfullyAndKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.FurnishingPassportForUseByAnother c


theorem s1544_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.Section1544Violated p c) :
    Scienter.Section1544Culpable (Scienter.scienter1544 p) c :=
  match h with
  | .useOfAnothers _ h1 =>
      .anothersPassport (satisfied_specific (corr_dsc_1544_anothers h1.1.scienter))
  | .conditionViolation _ h2 =>
      .contraryToConditions
        (satisfied_specific (corr_dsc_1544_conditions h2.1.scienter))
  | .furnishing _ h3 =>
      .furnishing (satisfied_specific (corr_dsc_1544_furnishing h3.1.scienter))














axiom corr_1546_docClass {d : Elements.ImmigrationDocument} {c : ComplaintText} :
    Elements.IsCoveredImmigrationDocument d c →
    Deontic.IsPrescribedImmigrationDocument (mapED_doc d) c



axiom corr_1546_forgeConduct {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.FalsificationConduct1546a p d c →
    Deontic.ForgesOrFalselyMakesImmigrationDocument p (mapED_doc d) c



axiom corr_1546_traffickConduct {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.TraffickingConduct1546a p d c →
    Deontic.UttersUsesOrPossessesImmigrationDocument p (mapED_doc d) c



axiom corr_1546_taintKnowledge {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.GuiltyKnowledge1546a p d c →
    Deontic.KnowsDocumentTaintedOrUnlawfullyObtained p (mapED_doc d) c




axiom corr_1546_knowingFromGuilt {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.GuiltyKnowledge1546a p d c → Deontic.ActedKnowingly p c



axiom corr_1546_articleClass {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.ContrabandConduct1546a p art c →
    Deontic.IsPermitPrintingArticle (mapED_art art) c


axiom corr_1546_contrabandAct {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.ContrabandConduct1546a p art c →
    Deontic.PossessesOrMakesPermitPrintingArticle p (mapED_art art) c


axiom corr_1546_applying {p : Person} {c : ComplaintText} :
    Elements.IsApplyingForDocumentOrAdmission p c →
    Deontic.ApplyingForEntryDocumentOrAdmission p c


axiom corr_1546_personates {p : Person} {c : ComplaintText} :
    Elements.PersonatesAnother p c →
    Deontic.PersonatesOrAppearsUnderFalseIdentity p c


axiom corr_1546_deceased {p : Person} {c : ComplaintText} :
    Elements.FalselyAppearsInNameOfDeceased p c →
    Deontic.PersonatesOrAppearsUnderFalseIdentity p c


axiom corr_1546_assumed {p : Person} {c : ComplaintText} :
    Elements.EvadesImmigrationLawsUnderAssumedName p c →
    Deontic.PersonatesOrAppearsUnderFalseIdentity p c



axiom corr_1546_disposalDocClass {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.SellsOrDisposesOfDocumentToUnauthorizedPerson p d c →
    Deontic.IsPrescribedImmigrationDocument (mapED_doc d) c


axiom corr_1546_disposal {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.SellsOrDisposesOfDocumentToUnauthorizedPerson p d c →
    Deontic.TransfersDocumentToUnauthorizedPerson p (mapED_doc d) c


axiom corr_1546_filingClass {f : Elements.ImmigrationFiling} {c : ComplaintText} :
    Elements.IsFilingRequiredByImmigrationLaws f c →
    Deontic.IsImmigrationFiling (mapED_filing f) c



axiom corr_1546_material {s : Elements.Statement} {f : Elements.ImmigrationFiling}
    {c : ComplaintText} :
    Elements.StatementIsFalse s c →
    Elements.StatementConcernsMaterialFact s c →
    Deontic.FalseStatementIsMaterial (mapED_filing f) c



axiom corr_1546_falseOath {p : Person} {s : Elements.Statement}
    {f : Elements.ImmigrationFiling} {c : ComplaintText} :
    Elements.SwornAssertion1546a p s f c → Elements.StatementIsFalse s c →
    Deontic.MakesFalseStatementUnderOath p (mapED_filing f) c



axiom corr_1546_presents {p : Person} {f : Elements.ImmigrationFiling}
    {c : ComplaintText} :
    Elements.PresentationDefect1546a p f c →
    Deontic.PresentsFilingWithFalseStatementOrNoReasonableBasis p
      (mapED_filing f) c









theorem s1546a_elements_implies_deontic_modulo_gaps
    {p : Person} {s : Elements.Statement} {d : Elements.ImmigrationDocument}
    {art : Elements.PrintingArticle} {f : Elements.ImmigrationFiling}
    {c : ComplaintText}
    (gap_1546a_presentationMateriality :
      Deontic.FalseStatementIsMaterial (mapED_filing f) c)
    (h : Elements.Section1546a p s d art f c) :
    Deontic.Section1546Violated p c :=
  match h with
  | .documentFraud h1 =>
      match h1 with
      | .falsification hf =>
          ⟨.forgery (mapED_doc d)
             ⟨⟨corr_whoever p c, corr_knowing hf.mensRea,
               corr_1546_docClass hf.coveredDocument⟩,
              corr_1546_forgeConduct hf.conduct⟩,
           fun hA => hf.notAuthorizedActivity (corr_authorized hA)⟩
      | .trafficking ht =>
          ⟨.knowingUse (mapED_doc d)
             ⟨⟨corr_whoever p c, corr_1546_knowingFromGuilt ht.guiltyKnowledge,
               corr_1546_docClass ht.coveredDocument,
               corr_1546_taintKnowledge ht.guiltyKnowledge⟩,
              corr_1546_traffickConduct ht.conduct⟩,
           fun hA => ht.notAuthorizedActivity (corr_authorized hA)⟩
  | .contraband h2 =>
      ⟨.printingArticle (mapED_art art)
         ⟨⟨corr_whoever p c, corr_knowing h2.mensRea,
           corr_1546_articleClass h2.conduct,
           fun hD => h2.notUnderOfficialDirection (corr_officerDirection hD)⟩,
          corr_1546_contrabandAct h2.conduct⟩,
       fun hA => h2.notAuthorizedActivity (corr_authorized hA)⟩
  | .personation h3 =>
      match h3.conduct with
      | .personates hp =>
          ⟨.personation
             ⟨⟨corr_whoever p c, corr_1546_applying h3.applying⟩,
              corr_1546_personates hp⟩,
           fun hA => h3.notAuthorizedActivity (corr_authorized hA)⟩
      | .deceasedName hd =>
          ⟨.personation
             ⟨⟨corr_whoever p c, corr_1546_applying h3.applying⟩,
              corr_1546_deceased hd⟩,
           fun hA => h3.notAuthorizedActivity (corr_authorized hA)⟩
      | .assumedName ha =>
          ⟨.personation
             ⟨⟨corr_whoever p c, corr_1546_applying h3.applying⟩,
              corr_1546_assumed ha⟩,
           fun hA => h3.notAuthorizedActivity (corr_authorized hA)⟩
      | .disposesToUnauthorized hs =>
          ⟨.unauthorizedTransfer (mapED_doc d)
             ⟨⟨corr_whoever p c, corr_1546_applying h3.applying,
               corr_1546_disposalDocClass hs⟩,
              corr_1546_disposal hs⟩,
           fun hA => h3.notAuthorizedActivity (corr_authorized hA)⟩
  | .falseStatement h4 =>
      match h4 with
      | .sworn hs =>
          ⟨.falseOath (mapED_filing f)
             ⟨⟨corr_whoever p c, corr_knowing hs.mensRea,
               corr_1546_filingClass hs.requiredFiling,
               corr_1546_material hs.falsity hs.materiality⟩,
              corr_1546_falseOath hs.assertion hs.falsity⟩,
           fun hA => hs.notAuthorizedActivity (corr_authorized hA)⟩
      | .presentation hpr =>
          ⟨.falsePresentation (mapED_filing f)
             ⟨⟨corr_whoever p c, corr_knowing hpr.mensRea,
               corr_1546_filingClass hpr.requiredFiling,
               gap_1546a_presentationMateriality⟩,
              corr_1546_presents hpr.defect⟩,
           fun hA => hpr.notAuthorizedActivity (corr_authorized hA)⟩


axiom corr_1546b_used {p : Person} {idDoc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.UsesIdentificationDocument p idDoc c →
    Deontic.UsesIdentificationDocument p (mapED_id idDoc) c



axiom corr_1546b_knowsNotLawful {p : Person}
    {idDoc : Elements.IdentificationDocument} {c : ComplaintText} :
    Elements.KnowsOrHasReasonToKnowDocumentNotLawfullyIssued p idDoc c →
    Deontic.KnowsOrHasReasonToKnowDocumentDefect p (mapED_id idDoc) c


axiom corr_1546b_knowsFalse {p : Person}
    {idDoc : Elements.IdentificationDocument} {c : ComplaintText} :
    Elements.KnowsOrHasReasonToKnowDocumentIsFalse p idDoc c →
    Deontic.KnowsOrHasReasonToKnowDocumentDefect p (mapED_id idDoc) c


axiom corr_1546b_attFalse {p : Person} {att : Elements.Attestation}
    {c : ComplaintText} :
    Elements.UsesFalseAttestation p att c →
    Deontic.IsFalseAttestation (mapED_att att) c


axiom corr_1546b_attUsed {p : Person} {att : Elements.Attestation}
    {c : ComplaintText} :
    Elements.UsesFalseAttestation p att c →
    Deontic.UsesAttestation p (mapED_att att) c


axiom corr_1546b_purpose {p : Person} {c : ComplaintText} :
    Elements.ForPurposeOfSatisfyingEmploymentVerification p c →
    Deontic.ForPurposeOfSatisfyingEmploymentVerification p c











theorem s1546b_elements_implies_deontic_modulo_gaps
    {p : Person} {idDoc : Elements.IdentificationDocument}
    {att : Elements.Attestation} {c : ComplaintText}
    (gap_1546b_notLawfullyIssuedAsFact :
      Deontic.DocumentNotLawfullyIssuedForPossessor p (mapED_id idDoc) c)
    (gap_1546b_documentFalseAsFact :
      Deontic.IdentificationDocumentIsFalse (mapED_id idDoc) c)
    (h : Elements.Section1546b p idDoc att c) :
    Deontic.Section1546Violated p c :=
  ⟨.employmentVerification
     (match h.use with
      | .notLawfullyIssued hUse hKnow =>
          .unlawfulDocument (mapED_id idDoc)
            ⟨⟨corr_whoever p c, corr_1546b_knowsNotLawful hKnow,
              gap_1546b_notLawfullyIssuedAsFact,
              corr_1546b_purpose h.purpose⟩,
             corr_1546b_used hUse⟩
      | .falseDocument hUse hKnow =>
          .falseDocument (mapED_id idDoc)
            ⟨⟨corr_whoever p c, corr_1546b_knowsFalse hKnow,
              gap_1546b_documentFalseAsFact,
              corr_1546b_purpose h.purpose⟩,
             corr_1546b_used hUse⟩
      | .falseAttestation hAtt =>
          .falseAttestation (mapED_att att)
            ⟨⟨corr_whoever p c, corr_1546b_attFalse hAtt,
              corr_1546b_purpose h.purpose⟩,
             corr_1546b_attUsed hAtt⟩),
   fun hA => h.notAuthorizedActivity (corr_authorized hA)⟩





axiom corr_sc_1546_forgery {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.ForgeryOfImmigrationDocument c



axiom corr_sc_1546_use {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.GuiltyKnowledge1546a p d c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.UseOfFalseImmigrationDocument c



axiom corr_sc_1546_blankPermit {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.PossessionOfBlankPermit c



axiom corr_sc_1546_evasion {p : Person} {c : ComplaintText} :
    Elements.EvadesImmigrationLawsUnderAssumedName p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.EvasionOfImmigrationLawsByAssumedName c



axiom corr_sc_1546_oath {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.FalseStatementUnderOath c


axiom corr_sc_1546_presentation {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.PresentationOfDocumentContainingFalseStatement c











theorem s1546a_elements_implies_scienter_modulo_gaps
    {p : Person} {s : Elements.Statement} {d : Elements.ImmigrationDocument}
    {art : Elements.PrintingArticle} {f : Elements.ImmigrationFiling}
    {c : ComplaintText}
    (gap_1546a_unclassifiedBranches :
      Scienter.Section1546aCulpable (Scienter.scienter1546a p) c)
    (h : Elements.Section1546a p s d art f c) :
    Scienter.Section1546aCulpable (Scienter.scienter1546a p) c :=
  match h with
  | .documentFraud h1 =>
      match h1 with
      | .falsification hf =>
          .forgery (satisfied_knowledge (corr_sc_1546_forgery hf.mensRea))
      | .trafficking ht =>
          .useOfFalseDocument
            (satisfied_knowledge (corr_sc_1546_use ht.guiltyKnowledge))
  | .contraband h2 =>
      match h2.conduct with
      | .blankPermit _ =>
          .blankPermit (satisfied_knowledge (corr_sc_1546_blankPermit h2.mensRea))
      | _ => gap_1546a_unclassifiedBranches
  | .personation h3 =>
      match h3.conduct with
      | .assumedName ha =>
          .evasion (satisfied_specific (corr_sc_1546_evasion ha))
      | _ => gap_1546a_unclassifiedBranches
  | .falseStatement h4 =>
      match h4 with
      | .sworn hs => .falseOath (satisfied_knowledge (corr_sc_1546_oath hs.mensRea))
      | .presentation hpr =>
          .presentation
            (satisfied_knowledge (corr_sc_1546_presentation hpr.mensRea))



axiom corr_sc_1546b_notLawful {p : Person}
    {idDoc : Elements.IdentificationDocument} {c : ComplaintText} :
    Elements.KnowsOrHasReasonToKnowDocumentNotLawfullyIssued p idDoc c →
    Scienter.MentalStateProven p Scienter.MentalState.Negligence
      Scienter.ScienterElement.UseOfUnlawfullyIssuedIdentificationDocument c


axiom corr_sc_1546b_false {p : Person}
    {idDoc : Elements.IdentificationDocument} {c : ComplaintText} :
    Elements.KnowsOrHasReasonToKnowDocumentIsFalse p idDoc c →
    Scienter.MentalStateProven p Scienter.MentalState.Negligence
      Scienter.ScienterElement.UseOfFalseIdentificationDocument c



axiom corr_sc_1546b_purpose {p : Person} {c : ComplaintText} :
    Elements.ForPurposeOfSatisfyingEmploymentVerification p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.PurposeOfSatisfyingEmploymentVerification c





theorem s1546b_elements_implies_scienter {p : Person}
    {idDoc : Elements.IdentificationDocument} {att : Elements.Attestation}
    {c : ComplaintText} (h : Elements.Section1546b p idDoc att c) :
    Scienter.Section1546bCulpable (Scienter.scienter1546b p) c :=
  match h.use with
  | .notLawfullyIssued _ hKnow =>
      .unlawfulDocument
        ⟨satisfied_negligence (corr_sc_1546b_notLawful hKnow),
         satisfied_specific (corr_sc_1546b_purpose h.purpose)⟩
  | .falseDocument _ hKnow =>
      .falseDocument
        ⟨satisfied_negligence (corr_sc_1546b_false hKnow),
         satisfied_specific (corr_sc_1546b_purpose h.purpose)⟩
  | .falseAttestation _ =>
      .falseAttestation (satisfied_specific (corr_sc_1546b_purpose h.purpose))





def Section1546TermsInhabited (d : Elements.ImmigrationDocument)
    (art : Elements.PrintingArticle) (f : Elements.ImmigrationFiling)
    (c : ComplaintText) : Prop :=
  Ontology.EntryDocumentMembership (mapEO_doc d) c ∨
  Ontology.BlankPermitMembership (mapEO_artDoc art) c ∨
  Ontology.CounterfeitingImplementMembership (mapEO_artImpl art) c ∨
  Ontology.IsImmigrationFiling (mapEO_filing f) c



axiom corr_o_1546_prescribed {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.IsCoveredImmigrationDocument d c →
    Ontology.IsPrescribedEntryOrStayDocument (mapEO_doc d) c



axiom corr_o_1546_isPermit {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.PossessesBlankPermit p art c →
    Ontology.IsPermit (mapEO_artDoc art) c


axiom corr_o_1546_isBlank {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.PossessesBlankPermit p art c →
    Ontology.IsBlankPermit (mapEO_artDoc art) c


axiom corr_o_1546_plateEngrave {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.EngravesSellsOrImportsPlate p art c →
    Ontology.IsPlateForPrintingPermits (mapEO_artImpl art) c


axiom corr_o_1546_plateControl {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.ControlsOrPossessesPlate p art c →
    Ontology.IsPlateForPrintingPermits (mapEO_artImpl art) c


axiom corr_o_1546_likeness {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.MakesLikenessOfDocument p art c →
    Ontology.IsLikenessImpressionOfEntryDocument (mapEO_artImpl art) c


axiom corr_o_1546_paper {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.PossessesDistinctivePaper p art c →
    Ontology.IsDistinctivePaperAdoptedForPrinting (mapEO_artImpl art) c


axiom corr_o_1546_filing {f : Elements.ImmigrationFiling} {c : ComplaintText} :
    Elements.IsFilingRequiredByImmigrationLaws f c →
    Ontology.IsImmigrationFiling (mapEO_filing f) c









theorem s1546a_elements_implies_ontology_modulo_gaps
    {p : Person} {s : Elements.Statement} {d : Elements.ImmigrationDocument}
    {art : Elements.PrintingArticle} {f : Elements.ImmigrationFiling}
    {c : ComplaintText}
    (gap_1546a_para3ObjectTerm :
      Elements.IsApplyingForDocumentOrAdmission p c →
      Ontology.EntryDocumentMembership (mapEO_doc d) c)
    (h : Elements.Section1546a p s d art f c) :
    Section1546TermsInhabited d art f c :=
  match h with
  | .documentFraud h1 =>
      match h1 with
      | .falsification hf =>
          Or.inl (.otherPrescribed (corr_o_1546_prescribed hf.coveredDocument))
      | .trafficking ht =>
          Or.inl (.otherPrescribed (corr_o_1546_prescribed ht.coveredDocument))
  | .contraband h2 =>
      match h2.conduct with
      | .blankPermit hb =>
          Or.inr (Or.inl ⟨corr_o_1546_isPermit hb, corr_o_1546_isBlank hb⟩)
      | .engravesSellsOrImportsPlate he =>
          Or.inr (Or.inr (Or.inl (.plate (corr_o_1546_plateEngrave he))))
      | .controlsOrPossessesPlate hcp =>
          Or.inr (Or.inr (Or.inl (.plate (corr_o_1546_plateControl hcp))))
      | .likeness hl =>
          Or.inr (Or.inr (Or.inl
            (.likenessImpression (corr_o_1546_likeness hl))))
      | .distinctivePaper hdp =>
          Or.inr (Or.inr (Or.inl
            (.distinctivePaper (corr_o_1546_paper hdp))))
  | .personation h3 => Or.inl (gap_1546a_para3ObjectTerm h3.applying)
  | .falseStatement h4 =>
      match h4 with
      | .sworn hs =>
          Or.inr (Or.inr (Or.inr (corr_o_1546_filing hs.requiredFiling)))
      | .presentation hpr =>
          Or.inr (Or.inr (Or.inr (corr_o_1546_filing hpr.requiredFiling)))




axiom corr_dsc_1546_forgery {p : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.ForgeryOfImmigrationDocument c


axiom corr_dsc_1546_use {p : Person} {d : Deontic.ImmigrationDocument}
    {c : ComplaintText} :
    Deontic.KnowsDocumentTaintedOrUnlawfullyObtained p d c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.UseOfFalseImmigrationDocument c


axiom corr_dsc_1546_oath {p : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.FalseStatementUnderOath c


axiom corr_dsc_1546_presentation {p : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly p c →
    Scienter.MentalStateProven p Scienter.MentalState.Knowledge
      Scienter.ScienterElement.PresentationOfDocumentContainingFalseStatement c



axiom corr_dsc_1546b_notLawful {p : Person} {d : Deontic.IdentificationDocument}
    {c : ComplaintText} :
    Deontic.KnowsOrHasReasonToKnowDocumentDefect p d c →
    Scienter.MentalStateProven p Scienter.MentalState.Negligence
      Scienter.ScienterElement.UseOfUnlawfullyIssuedIdentificationDocument c


axiom corr_dsc_1546b_false {p : Person} {d : Deontic.IdentificationDocument}
    {c : ComplaintText} :
    Deontic.KnowsOrHasReasonToKnowDocumentDefect p d c →
    Scienter.MentalStateProven p Scienter.MentalState.Negligence
      Scienter.ScienterElement.UseOfFalseIdentificationDocument c


axiom corr_dsc_1546b_purpose {p : Person} {c : ComplaintText} :
    Deontic.ForPurposeOfSatisfyingEmploymentVerification p c →
    Scienter.MentalStateProven p Scienter.MentalState.Specific
      Scienter.ScienterElement.PurposeOfSatisfyingEmploymentVerification c










theorem s1546_deontic_implies_scienter_modulo_gaps {p : Person}
    {c : ComplaintText}
    (gap_1546_unclassifiedBranches :
      Scienter.Section1546aCulpable (Scienter.scienter1546a p) c)
    (h : Deontic.Section1546Violated p c) :
    Scienter.Section1546aCulpable (Scienter.scienter1546a p) c ∨
      Scienter.Section1546bCulpable (Scienter.scienter1546b p) c :=
  match h.1 with
  | .forgery _ h1 =>
      Or.inl (.forgery (satisfied_knowledge (corr_dsc_1546_forgery h1.1.scienter)))
  | .knowingUse _ h2 =>
      Or.inl (.useOfFalseDocument
        (satisfied_knowledge (corr_dsc_1546_use h2.1.taintKnowledge)))
  | .printingArticle _ _ => Or.inl gap_1546_unclassifiedBranches
  | .personation _ => Or.inl gap_1546_unclassifiedBranches
  | .unauthorizedTransfer _ _ => Or.inl gap_1546_unclassifiedBranches
  | .falseOath _ h6 =>
      Or.inl (.falseOath (satisfied_knowledge (corr_dsc_1546_oath h6.1.scienter)))
  | .falsePresentation _ h7 =>
      Or.inl (.presentation
        (satisfied_knowledge (corr_dsc_1546_presentation h7.1.scienter)))
  | .employmentVerification hb =>
      Or.inr (match hb with
        | .unlawfulDocument _ h8 =>
            .unlawfulDocument
              ⟨satisfied_negligence (corr_dsc_1546b_notLawful h8.1.scienter),
               satisfied_specific (corr_dsc_1546b_purpose h8.1.purpose)⟩
        | .falseDocument _ h9 =>
            .falseDocument
              ⟨satisfied_negligence (corr_dsc_1546b_false h9.1.scienter),
               satisfied_specific (corr_dsc_1546b_purpose h9.1.purpose)⟩
        | .falseAttestation _ h10 =>
            .falseAttestation
              (satisfied_specific (corr_dsc_1546b_purpose h10.1.purpose)))








axiom corr_p_1546_officerDirection (p : Person) (pr : Procedure.Prosecution)
    (c : ComplaintText) :
    Procedure.UnderDirectionOfProperOfficer pr c →
    Elements.ActsUnderDirectionOfProperOfficer p c


axiom corr_p_1546_verificationPurpose (p : Person) (pr : Procedure.Prosecution)
    (c : ComplaintText) :
    Elements.ForPurposeOfSatisfyingEmploymentVerification p c →
    Procedure.UsedToSatisfySection274ABRequirement pr c



axiom corr_p_1546_controlsApparatus {p : Person} {art : Elements.PrintingArticle}
    {c : ComplaintText} :
    Elements.ContrabandConduct1546a p art c →
    Procedure.ControlsBlankPermitOrPrintingPlate (mapEP_artDoc art) c



axiom corr_p_1546_prescribed {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.IsCoveredImmigrationDocument d c →
    Procedure.DocumentPrescribedByStatuteOrRegulation (mapEP_immDoc d) c


axiom corr_p_1546_used {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.TraffickingConduct1546a p d c →
    Procedure.DocumentUsedOrPresented (mapEP_immDoc d) c



axiom corr_p_1546_procured {p : Person} {d : Elements.ImmigrationDocument}
    {c : ComplaintText} :
    Elements.KnowsDocumentProcuredByFalseClaimOrStatement p d c →
    Procedure.IssuanceSecuredByFalseStatement (mapEP_immDoc d) c



axiom corr_p_1546_required {f : Elements.ImmigrationFiling} {c : ComplaintText} :
    Elements.IsFilingRequiredByImmigrationLaws f c →
    Procedure.FilingRequiredByImmigrationLaws (mapEP_filing f) c



axiom corr_p_1546_sworn {p : Person} {s : Elements.Statement}
    {f : Elements.ImmigrationFiling} {c : ComplaintText} :
    Elements.SwornAssertion1546a p s f c →
    Procedure.SwornOrSubscribedUnderPenaltyOfPerjury (mapEP_filing f) c



axiom corr_p_1546_presented {p : Person} {f : Elements.ImmigrationFiling}
    {c : ComplaintText} :
    Elements.PresentationDefect1546a p f c →
    Procedure.FilingPresentedToAuthority (mapEP_filing f) c


axiom corr_p_1546_noBasis {p : Person} {f : Elements.ImmigrationFiling}
    {c : ComplaintText} :
    Elements.PresentsFilingLackingReasonableBasis p f c →
    Procedure.FilingLacksReasonableBasisInLawOrFact (mapEP_filing f) c

















theorem s1546a_elements_implies_procedure_modulo_gaps
    {p : Person} {s : Elements.Statement} {d : Elements.ImmigrationDocument}
    {art : Elements.PrintingArticle} {f : Elements.ImmigrationFiling}
    {c : ComplaintText} (pr : Procedure.Prosecution)
    (gap_1546a_falsificationUsed :
      Procedure.DocumentUsedOrPresented (mapEP_immDoc d) c)
    (gap_1546a_falsificationProcured :
      Procedure.IssuanceSecuredByFalseStatement (mapEP_immDoc d) c)
    (gap_1546a_para3Track :
      Elements.IsApplyingForDocumentOrAdmission p c →
      Procedure.Section1546aTrack pr p (mapEP_immDoc d) (mapEP_filing f) c)
    (gap_1546a_swornFilingPresented :
      Procedure.FilingPresentedToAuthority (mapEP_filing f) c)
    (gap_1546a_presentationNoBasis :
      Procedure.FilingLacksReasonableBasisInLawOrFact (mapEP_filing f) c)
    (h : Elements.Section1546a p s d art f c) :
    Procedure.Section1546aTrack pr p (mapEP_immDoc d) (mapEP_filing f) c ∨
      Procedure.Section1546aTrack pr p (mapEP_artDoc art) (mapEP_filing f) c :=
  match h with
  | .documentFraud h1 =>
      match h1 with
      | .falsification hf =>
          Or.inl (.prescribedDocumentProcuredByFraud
            (corr_p_1546_prescribed hf.coveredDocument)
            gap_1546a_falsificationProcured
            gap_1546a_falsificationUsed)
      | .trafficking ht =>
          Or.inl (.prescribedDocumentProcuredByFraud
            (corr_p_1546_prescribed ht.coveredDocument)
            gap_1546a_falsificationProcured
            (corr_p_1546_used ht.conduct))
  | .contraband h2 =>
      Or.inr (.issuanceApparatusWithoutAuthority
        (fun hD => h2.notUnderOfficialDirection
          (corr_p_1546_officerDirection p pr c hD))
        (corr_p_1546_controlsApparatus h2.conduct))
  | .personation h3 => Or.inl (gap_1546a_para3Track h3.applying)
  | .falseStatement h4 =>
      match h4 with
      | .sworn hs =>
          Or.inl (.falseSwornFiling
            (corr_p_1546_required hs.requiredFiling)
            (corr_p_1546_sworn hs.assertion)
            gap_1546a_swornFilingPresented)
      | .presentation hpr =>
          match hpr.defect with
          | .containsFalseStatement _ =>
              Or.inl (.filingWithoutReasonableBasis
                (corr_p_1546_required hpr.requiredFiling)
                (corr_p_1546_presented hpr.defect)
                gap_1546a_presentationNoBasis)
          | .lacksReasonableBasis hn =>
              Or.inl (.filingWithoutReasonableBasis
                (corr_p_1546_required hpr.requiredFiling)
                (corr_p_1546_presented hpr.defect)
                (corr_p_1546_noBasis hn))


axiom corr_p_1546b_used {p : Person} {idDoc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.UsesIdentificationDocument p idDoc c →
    Procedure.DocumentUsedOrPresented (mapEP_idDoc idDoc) c



axiom corr_p_1546b_attestation {p : Person} {att : Elements.Attestation}
    {c : ComplaintText} :
    Elements.UsesFalseAttestation p att c →
    Procedure.FalseAttestationMade (mapEP_att att) c










theorem s1546b_elements_implies_procedure_modulo_gaps
    {p : Person} {idDoc : Elements.IdentificationDocument}
    {att : Elements.Attestation} {c : ComplaintText}
    (pr : Procedure.Prosecution)
    (gap_1546b_defectAsFact :
      Procedure.DocumentNotLawfullyIssuedForPossessor (mapEP_idDoc idDoc) c)
    (h : Elements.Section1546b p idDoc att c) :
    Procedure.Section1546bTrack pr (mapEP_idDoc idDoc) (mapEP_att att) c :=
  match h.use with
  | .notLawfullyIssued hUse _ =>
      .unlawfulIdentificationDocument gap_1546b_defectAsFact
        (corr_p_1546b_used hUse)
        (corr_p_1546_verificationPurpose p pr c h.purpose)
  | .falseDocument hUse _ =>
      .unlawfulIdentificationDocument gap_1546b_defectAsFact
        (corr_p_1546b_used hUse)
        (corr_p_1546_verificationPurpose p pr c h.purpose)
  | .falseAttestation hAtt =>
      .falseAttestation (corr_p_1546b_attestation hAtt)
        (corr_p_1546_verificationPurpose p pr c h.purpose)

end Proving.USC.T18.Ch75.Reslice.Bridge
