








































import Proving.USC.T31.Elements.Statute
import Proving.USC.T31.Deontic.Statute
import Proving.USC.T31.Ontology.Statute
import Proving.USC.T31.Procedure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T31.Bridge

open Proving.USC.Common



















axiom corr_5313a_addressee {fi : Elements.FinancialInstitution} {e : Entity}
    {c : ComplaintText} :
    Elements.IsDomesticFinancialInstitution fi c →
    Deontic.IsDomesticFinancialInstitution e c



axiom corr_5313a_covered {fi : Elements.FinancialInstitution} {e : Entity}
    {t : Elements.Transaction} {c : ComplaintText} :
    Elements.InvolvedInCurrencyTransaction fi t c →
    Elements.MeetsPrescribedReportingThreshold t c →
    Deontic.InvolvedInCoveredCurrencyTransaction e c




axiom corr_5313a_failure {fi : Elements.FinancialInstitution} {e : Entity}
    {t : Elements.Transaction} {c : ComplaintText} :
    Elements.InstitutionFailedToFileReport fi t c →
    ¬ Deontic.FiledRequiredCurrencyReport e c





theorem s5313a_elements_implies_deontic
    {fi : Elements.FinancialInstitution} {e : Entity}
    {t : Elements.Transaction} {c : ComplaintText}
    (h : Elements.Section5313aInstitutionViolation fi t c) :
    Deontic.ObligationBreached5313a e c :=
  ⟨⟨corr_5313a_addressee h.domesticInstitution,
    corr_5313a_covered h.involvedInTransaction h.prescribedThreshold⟩,
   corr_5313a_failure h.failedToFile⟩













axiom corr_5313c1_addressee {p : Person} {t : Elements.Transaction}
    {c : ComplaintText} :
    Elements.IsPrescribedParticipant p t c →
    Deontic.RequiredToFileCurrencyReport p c



axiom corr_5313c1_channel {p : Person} {t : Elements.Transaction}
    {c : ComplaintText} :
    Elements.ParticipantFailedToFileReport p t c →
    ¬ Deontic.FiledReportThroughPrescribedChannel p c



axiom corr_5313a_agent {p : Person} {e : Entity} {t : Elements.Transaction}
    {c : ComplaintText} :
    Elements.ActingForAnotherPerson p t c →
    Deontic.ActedAsAgentForAnother p e c



axiom corr_5313a_identify {p : Person} {t : Elements.Transaction}
    {c : ComplaintText} :
    Elements.FailedToIdentifyPrincipal p t c →
    ¬ Deontic.IdentifiedPrincipalInReport p c





theorem s5313a_participant_elements_implies_deontic
    {p : Person} {fi : Elements.FinancialInstitution} {e : Entity}
    {t : Elements.Transaction} {c : ComplaintText}
    (h : Elements.Section5313aParticipantViolation p fi t c) :
    Deontic.ObligationBreached5313c1 p c ∨
      Deontic.ObligationBreached5313aAgent p e c :=
  match h.breach with
  | .failedToFile hf =>
      .inl ⟨⟨corr_5313c1_addressee h.prescribedParticipant⟩,
            corr_5313c1_channel hf⟩
  | .failedToIdentify hAgent hf =>
      .inr ⟨⟨corr_5313a_agent hAgent,
             corr_5313a_covered h.involvedInTransaction h.prescribedThreshold⟩,
            corr_5313a_identify hf⟩












axiom corr_5313a_notFiledTimely {fi : Elements.FinancialInstitution}
    {fiP : Procedure.FinancialInstitution} {t : Elements.Transaction}
    {tP : Procedure.Transaction} {c : ComplaintText} :
    Elements.InstitutionFailedToFileReport fi t c →
    ¬ (Procedure.ReportFiled fiP tP c ∧
       Procedure.FiledAtPrescribedTimeAndWay fiP tP c)




axiom corr_5313de_notExempt {fi : Elements.FinancialInstitution}
    {fiP : Procedure.FinancialInstitution} {t : Elements.Transaction}
    {tP : Procedure.Transaction} {c : ComplaintText} :
    ¬ Elements.TransactionWithExemptEntity fi t c →
    ¬ Elements.TransactionExemptQualifiedCustomer fi t c →
    ¬ Procedure.ExemptionGranted fiP tP c




theorem s5313a_elements_implies_procedure
    {fi : Elements.FinancialInstitution} {fiP : Procedure.FinancialInstitution}
    {t : Elements.Transaction} {tP : Procedure.Transaction} {c : ComplaintText}
    (h : Elements.Section5313aInstitutionViolation fi t c) :
    ¬ Procedure.CtrObligationSatisfied fiP tP c :=
  fun hs => match hs with
    | .filed hf =>
        corr_5313a_notFiledTimely h.failedToFile ⟨hf.filed, hf.timely⟩
    | .exempt he =>
        corr_5313de_notExempt h.notExemptEntity h.notExemptQualifiedCustomer he















axiom corr_5313a_filedTimely {fiP : Procedure.FinancialInstitution}
    {e : Entity} {tP : Procedure.Transaction} {c : ComplaintText} :
    Procedure.ReportFiled fiP tP c →
    Procedure.FiledAtPrescribedTimeAndWay fiP tP c →
    Deontic.FiledRequiredCurrencyReport e c






theorem s5313a_deontic_implies_procedure_modulo_gaps
    {e : Entity} {fiP : Procedure.FinancialInstitution}
    {tP : Procedure.Transaction} {c : ComplaintText}
    (gap_5313_exemption : ¬ Procedure.ExemptionGranted fiP tP c)
    (h : Deontic.ObligationBreached5313a e c) :
    ¬ Procedure.CtrObligationSatisfied fiP tP c :=
  fun hs => match hs with
    | .filed hf => h.2 (corr_5313a_filedTimely hf.filed hf.timely)
    | .exempt he => gap_5313_exemption he











axiom corr_5313f1_falsity {fiP : Procedure.FinancialInstitution} {e : Entity}
    {c : ComplaintText} :
    Procedure.KnowinglyFiledFalseExemptionInfo fiP c →
    Deontic.KnowinglyFiledFalseExemptionInfo e c


axiom corr_5313f1_belief {fiP : Procedure.FinancialInstitution} {e : Entity}
    {c : ComplaintText} :
    Procedure.HadReasonToBelieveIneligible fiP c →
    Deontic.HadReasonToBelieveExemptionInvalid e c





theorem s5313f1_deontic_implies_procedure
    {e : Entity} {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (h : Deontic.Prohibition5313f1 e c) :
    ¬ Procedure.ExemptionSafeHarborException fiP c :=
  fun hx => match hx with
    | .knowingFalsity hf => h.noKnowingFalsity (corr_5313f1_falsity hf)
    | .reasonToBelieve hb => h.noReasonToBelieve (corr_5313f1_belief hb)










axiom corr_5313g_fra {e : Entity} {c : ComplaintText} :
    Ontology.HasFederalReserveActMeaning e c → Deontic.IsDepositoryInstitution e c


axiom corr_5313g_iba {e : Entity} {c : ComplaintText} :
    Ontology.IsBranchAgencyOrCommercialLendingCompany e c →
    Deontic.IsDepositoryInstitution e c


axiom corr_5313g_edge {e : Entity} {c : ComplaintText} :
    Ontology.IsEdgeActCorporation e c → Deontic.IsDepositoryInstitution e c


axiom corr_5313g_agreement {e : Entity} {c : ComplaintText} :
    Ontology.IsAgreementCorporation e c → Deontic.IsDepositoryInstitution e c




theorem s5313g_ontology_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Ontology.DepositoryInstitutionDef e c) :
    Deontic.IsDepositoryInstitution e c :=
  match h with
  | .fraMeaning hf => corr_5313g_fra hf
  | .branchAgencyOrCLC hb => corr_5313g_iba hb
  | .edgeActCorporation he => corr_5313g_edge he
  | .agreementCorporation ha => corr_5313g_agreement ha











axiom corr_5324a_purpose {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeCurrencyReporting p c →
    Deontic.IntendedToEvadeCurrencyReporting p c


axiom corr_5324a_causeFailure {p : Person} {fi : Elements.FinancialInstitution}
    {c : ComplaintText} :
    Elements.CausedOrAttemptedFailureToFile p fi c →
    Deontic.CausedFailureToFileCurrencyReport p c


axiom corr_5324a_causeMisstatement {p : Person}
    {fi : Elements.FinancialInstitution} {c : ComplaintText} :
    Elements.CausedOrAttemptedMisstatedReport p fi c →
    Deontic.CausedMaterialMisstatementInCurrencyReport p c


axiom corr_5324a_structured {p : Person} {c : ComplaintText} :
    Elements.StructuredTransactionWithInstitution p c →
    Deontic.StructuredDomesticTransaction p c


theorem s5324a_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section5324a p c) : Deontic.ProhibitionViolated5324a p c :=
  ⟨⟨corr_5324a_purpose h.purposeToEvade⟩,
   match h.conduct with
   | .causedFailureToFile _ _ hc => .causedFailureToFile (corr_5324a_causeFailure hc)
   | .causedMisstatedReport _ _ hc => .causedMisstatement (corr_5324a_causeMisstatement hc)
   | .structuredTransaction hc => .structured (corr_5324a_structured hc)⟩


axiom corr_5324b_purpose {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeNonfinancialReporting p c →
    Deontic.IntendedToEvadeNonfinancialReporting p c


axiom corr_5324b_causeFailure {p : Person} {b : Elements.NonfinancialBusiness}
    {c : ComplaintText} :
    Elements.CausedOrAttemptedBusinessFailureToFile p b c →
    Deontic.CausedFailureToFileNonfinancialReport p c


axiom corr_5324b_causeMisstatement {p : Person}
    {b : Elements.NonfinancialBusiness} {c : ComplaintText} :
    Elements.CausedOrAttemptedBusinessMisstatedReport p b c →
    Deontic.CausedMaterialMisstatementInNonfinancialReport p c


axiom corr_5324b_structured {p : Person} {c : ComplaintText} :
    Elements.StructuredTransactionWithBusiness p c →
    Deontic.StructuredNonfinancialTransaction p c


theorem s5324b_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section5324b p c) : Deontic.ProhibitionViolated5324b p c :=
  ⟨⟨corr_5324b_purpose h.purposeToEvade⟩,
   match h.conduct with
   | .causedFailureToFile _ _ hc => .causedFailureToFile (corr_5324b_causeFailure hc)
   | .causedMisstatedReport _ _ hc => .causedMisstatement (corr_5324b_causeMisstatement hc)
   | .structuredTransaction hc => .structured (corr_5324b_structured hc)⟩


axiom corr_5324c_purpose {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeInternationalReporting p c →
    Deontic.IntendedToEvadeTransportReporting p c


axiom corr_5324c_fail {p : Person} {c : ComplaintText} :
    Elements.FailedToFileInternationalReport p c →
    Deontic.FailedToFileTransportReport p c


axiom corr_5324c_misstate {p : Person} {c : ComplaintText} :
    Elements.MisstatedInternationalReport p c →
    Deontic.CausedMaterialMisstatementInTransportReport p c


axiom corr_5324c_transport {p : Person} {c : ComplaintText} :
    Elements.StructuredImportExportOfMonetaryInstruments p c →
    Deontic.StructuredMonetaryInstrumentTransport p c


theorem s5324c_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section5324c p c) : Deontic.ProhibitionViolated5324c p c :=
  ⟨⟨corr_5324c_purpose h.purposeToEvade⟩,
   match h.conduct with
   | .failedToFile hc => .failedToFile (corr_5324c_fail hc)
   | .misstatedReport hc => .causedMisstatement (corr_5324c_misstate hc)
   | .structuredTransport hc => .structured (corr_5324c_transport hc)⟩





theorem s5324_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section5324Violation p c) :
    Deontic.ProhibitionViolated5324a p c ∨ Deontic.ProhibitionViolated5324b p c ∨
      Deontic.ProhibitionViolated5324c p c :=
  match h with
  | .domesticFinancial ha => .inl (s5324a_elements_implies_deontic ha)
  | .nonfinancialBusiness hb => .inr (.inl (s5324b_elements_implies_deontic hb))
  | .international hc => .inr (.inr (s5324c_elements_implies_deontic hc))











axiom corr_5324a_purpose_procedure {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeCurrencyReporting p c → Procedure.EvasivePurpose p c


axiom corr_5324b_purpose_procedure {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeNonfinancialReporting p c → Procedure.EvasivePurpose p c


axiom corr_5324c_purpose_procedure {p : Person} {c : ComplaintText} :
    Elements.PurposeToEvadeInternationalReporting p c → Procedure.EvasivePurpose p c


axiom corr_5324a_causeFailure_procedure {p : Person}
    {fi : Elements.FinancialInstitution} {fiP : Procedure.FinancialInstitution}
    {c : ComplaintText} :
    Elements.CausedOrAttemptedFailureToFile p fi c →
    Procedure.CausedFailureToFile p fiP c


axiom corr_5324a_causeMisstatement_procedure {p : Person}
    {fi : Elements.FinancialInstitution} {fiP : Procedure.FinancialInstitution}
    {c : ComplaintText} :
    Elements.CausedOrAttemptedMisstatedReport p fi c →
    Procedure.CausedMisstatedFiling p fiP c


axiom corr_5324a_structured_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText} :
    Elements.StructuredTransactionWithInstitution p c →
    Procedure.StructuredTransaction p fiP c


axiom corr_5324b_causeFailure_procedure {p : Person}
    {b : Elements.NonfinancialBusiness} {c : ComplaintText} :
    Elements.CausedOrAttemptedBusinessFailureToFile p b c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324b_causeMisstatement_procedure {p : Person}
    {b : Elements.NonfinancialBusiness} {c : ComplaintText} :
    Elements.CausedOrAttemptedBusinessMisstatedReport p b c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324b_structured_procedure {p : Person} {c : ComplaintText} :
    Elements.StructuredTransactionWithBusiness p c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324c_fail_procedure {p : Person} {c : ComplaintText} :
    Elements.FailedToFileInternationalReport p c →
    Procedure.StructuredInternationalTransport p c


axiom corr_5324c_misstate_procedure {p : Person} {c : ComplaintText} :
    Elements.MisstatedInternationalReport p c →
    Procedure.StructuredInternationalTransport p c


axiom corr_5324c_transport_procedure {p : Person} {c : ComplaintText} :
    Elements.StructuredImportExportOfMonetaryInstruments p c →
    Procedure.StructuredInternationalTransport p c




theorem s5324_elements_implies_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (h : Elements.Section5324Violation p c) :
    Procedure.StructuringViolation p fiP c :=
  match h with
  | .domesticFinancial ha =>
      ⟨corr_5324a_purpose_procedure ha.purposeToEvade,
       match ha.conduct with
       | .causedFailureToFile _ _ hc =>
           .causedFailure (corr_5324a_causeFailure_procedure hc)
       | .causedMisstatedReport _ _ hc =>
           .causedMisstatement (corr_5324a_causeMisstatement_procedure hc)
       | .structuredTransaction hc =>
           .structured (corr_5324a_structured_procedure hc)⟩
  | .nonfinancialBusiness hb =>
      ⟨corr_5324b_purpose_procedure hb.purposeToEvade,
       match hb.conduct with
       | .causedFailureToFile _ _ hc =>
           .nonfinancial (corr_5324b_causeFailure_procedure hc)
       | .causedMisstatedReport _ _ hc =>
           .nonfinancial (corr_5324b_causeMisstatement_procedure hc)
       | .structuredTransaction hc =>
           .nonfinancial (corr_5324b_structured_procedure hc)⟩
  | .international hc =>
      ⟨corr_5324c_purpose_procedure hc.purposeToEvade,
       match hc.conduct with
       | .failedToFile hcc => .international (corr_5324c_fail_procedure hcc)
       | .misstatedReport hcc => .international (corr_5324c_misstate_procedure hcc)
       | .structuredTransport hcc =>
           .international (corr_5324c_transport_procedure hcc)⟩




axiom corr_5324a_intent_procedure {p : Person} {c : ComplaintText} :
    Deontic.IntendedToEvadeCurrencyReporting p c → Procedure.EvasivePurpose p c


axiom corr_5324b_intent_procedure {p : Person} {c : ComplaintText} :
    Deontic.IntendedToEvadeNonfinancialReporting p c → Procedure.EvasivePurpose p c


axiom corr_5324c_intent_procedure {p : Person} {c : ComplaintText} :
    Deontic.IntendedToEvadeTransportReporting p c → Procedure.EvasivePurpose p c



axiom corr_5324a_deonticCause_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText} :
    Deontic.CausedFailureToFileCurrencyReport p c →
    Procedure.CausedFailureToFile p fiP c


axiom corr_5324a_deonticMisstate_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText} :
    Deontic.CausedMaterialMisstatementInCurrencyReport p c →
    Procedure.CausedMisstatedFiling p fiP c


axiom corr_5324a_deonticStructured_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText} :
    Deontic.StructuredDomesticTransaction p c →
    Procedure.StructuredTransaction p fiP c


axiom corr_5324b_deonticCause_procedure {p : Person} {c : ComplaintText} :
    Deontic.CausedFailureToFileNonfinancialReport p c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324b_deonticMisstate_procedure {p : Person} {c : ComplaintText} :
    Deontic.CausedMaterialMisstatementInNonfinancialReport p c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324b_deonticStructured_procedure {p : Person} {c : ComplaintText} :
    Deontic.StructuredNonfinancialTransaction p c →
    Procedure.StructuredNonfinancialReporting p c


axiom corr_5324c_deonticFail_procedure {p : Person} {c : ComplaintText} :
    Deontic.FailedToFileTransportReport p c →
    Procedure.StructuredInternationalTransport p c


axiom corr_5324c_deonticMisstate_procedure {p : Person} {c : ComplaintText} :
    Deontic.CausedMaterialMisstatementInTransportReport p c →
    Procedure.StructuredInternationalTransport p c


axiom corr_5324c_deonticTransport_procedure {p : Person} {c : ComplaintText} :
    Deontic.StructuredMonetaryInstrumentTransport p c →
    Procedure.StructuredInternationalTransport p c


theorem s5324a_deontic_implies_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated5324a p c) :
    Procedure.StructuringViolation p fiP c :=
  ⟨corr_5324a_intent_procedure h.1.condition,
   match h.2 with
   | .causedFailureToFile hc => .causedFailure (corr_5324a_deonticCause_procedure hc)
   | .causedMisstatement hc => .causedMisstatement (corr_5324a_deonticMisstate_procedure hc)
   | .structured hc => .structured (corr_5324a_deonticStructured_procedure hc)⟩


theorem s5324b_deontic_implies_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated5324b p c) :
    Procedure.StructuringViolation p fiP c :=
  ⟨corr_5324b_intent_procedure h.1.condition,
   match h.2 with
   | .causedFailureToFile hc => .nonfinancial (corr_5324b_deonticCause_procedure hc)
   | .causedMisstatement hc => .nonfinancial (corr_5324b_deonticMisstate_procedure hc)
   | .structured hc => .nonfinancial (corr_5324b_deonticStructured_procedure hc)⟩


theorem s5324c_deontic_implies_procedure {p : Person}
    {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated5324c p c) :
    Procedure.StructuringViolation p fiP c :=
  ⟨corr_5324c_intent_procedure h.1.condition,
   match h.2 with
   | .failedToFile hc => .international (corr_5324c_deonticFail_procedure hc)
   | .causedMisstatement hc => .international (corr_5324c_deonticMisstate_procedure hc)
   | .structured hc => .international (corr_5324c_deonticTransport_procedure hc)⟩
















axiom corr_5324d2_otherLaw {p : Person} {c : ComplaintText} :
    Elements.ViolatedAnotherFederalLaw p c →
    Procedure.ViolatedWhileViolatingOtherLaw p c



axiom corr_5324d2_amount {p : Person} {c : ComplaintText} {amountUSD : Nat} :
    Elements.PatternIllegalActivityAmount p c amountUSD →
    Procedure.IllegalActivityAmountExtracted p c amountUSD






theorem s5324d2_elements_implies_procedure_modulo_gaps
    {p : Person} {fiP : Procedure.FinancialInstitution} {c : ComplaintText}
    (gap_5324d2_span : ∃ spanMonths : Nat,
        Procedure.IllegalActivitySpanExtracted p c spanMonths ∧ spanMonths ≤ 12)
    (h : Elements.Section5324d2 p c) :
    Procedure.AggravatedStructuringViolation p fiP c :=
  ⟨s5324_elements_implies_procedure h.violation,
   match h.aggravator with
   | .otherViolation ho => .otherLaw (corr_5324d2_otherLaw ho)
   | .pattern amt hAmt hThr =>
       .pattern (match gap_5324d2_span with
         | ⟨span, hSpan, hLe⟩ =>
             ⟨amt, span, corr_5324d2_amount hAmt, hSpan, hThr, hLe⟩)⟩

end Proving.USC.T31.Bridge
