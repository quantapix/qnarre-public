import Proving.USC.T31.Elements.Types
import Proving.USC.T31.Elements.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T31.Elements

open Proving.USC.Common






inductive ParticipantReportingBreach (p : Person) (t : Transaction) (c : ComplaintText) : Prop where
  | failedToFile (h : ParticipantFailedToFileReport p t c)
  | failedToIdentify (hAgent : ActingForAnotherPerson p t c)
      (h : FailedToIdentifyPrincipal p t c)




structure Section5313aInstitutionViolation (fi : FinancialInstitution) (t : Transaction)
    (c : ComplaintText) : Prop where
  domesticInstitution : IsDomesticFinancialInstitution fi c
  involvedInTransaction : InvolvedInCurrencyTransaction fi t c
  prescribedThreshold : MeetsPrescribedReportingThreshold t c
  notExemptEntity : ¬ TransactionWithExemptEntity fi t c
  notExemptQualifiedCustomer : ¬ TransactionExemptQualifiedCustomer fi t c
  failedToFile : InstitutionFailedToFileReport fi t c



structure Section5313aParticipantViolation (p : Person) (fi : FinancialInstitution)
    (t : Transaction) (c : ComplaintText) : Prop where
  domesticInstitution : IsDomesticFinancialInstitution fi c
  involvedInTransaction : InvolvedInCurrencyTransaction fi t c
  prescribedThreshold : MeetsPrescribedReportingThreshold t c
  prescribedParticipant : IsPrescribedParticipant p t c
  breach : ParticipantReportingBreach p t c





inductive Section5324aConduct (p : Person) (c : ComplaintText) : Prop where
  | causedFailureToFile (fi : FinancialInstitution)
      (hInstitution : IsDomesticFinancialInstitution fi c)
      (hConduct : CausedOrAttemptedFailureToFile p fi c)
  | causedMisstatedReport (fi : FinancialInstitution)
      (hInstitution : IsDomesticFinancialInstitution fi c)
      (hConduct : CausedOrAttemptedMisstatedReport p fi c)
  | structuredTransaction (hConduct : StructuredTransactionWithInstitution p c)


structure Section5324a (p : Person) (c : ComplaintText) : Prop where
  purposeToEvade : PurposeToEvadeCurrencyReporting p c
  conduct : Section5324aConduct p c



inductive Section5324bConduct (p : Person) (c : ComplaintText) : Prop where
  | causedFailureToFile (b : NonfinancialBusiness)
      (hBusiness : IsNonfinancialTradeOrBusiness b c)
      (hConduct : CausedOrAttemptedBusinessFailureToFile p b c)
  | causedMisstatedReport (b : NonfinancialBusiness)
      (hBusiness : IsNonfinancialTradeOrBusiness b c)
      (hConduct : CausedOrAttemptedBusinessMisstatedReport p b c)
  | structuredTransaction (hConduct : StructuredTransactionWithBusiness p c)


structure Section5324b (p : Person) (c : ComplaintText) : Prop where
  purposeToEvade : PurposeToEvadeNonfinancialReporting p c
  conduct : Section5324bConduct p c



inductive Section5324cConduct (p : Person) (c : ComplaintText) : Prop where
  | failedToFile (hConduct : FailedToFileInternationalReport p c)
  | misstatedReport (hConduct : MisstatedInternationalReport p c)
  | structuredTransport (hConduct : StructuredImportExportOfMonetaryInstruments p c)


structure Section5324c (p : Person) (c : ComplaintText) : Prop where
  purposeToEvade : PurposeToEvadeInternationalReporting p c
  conduct : Section5324cConduct p c



inductive Section5324Violation (p : Person) (c : ComplaintText) : Prop where
  | domesticFinancial (h : Section5324a p c)
  | nonfinancialBusiness (h : Section5324b p c)
  | international (h : Section5324c p c)




inductive Section5324d2Aggravator (p : Person) (c : ComplaintText) : Prop where
  | otherViolation (h : ViolatedAnotherFederalLaw p c)
  | pattern (amountUSD : Nat)
      (hAmount : PatternIllegalActivityAmount p c amountUSD)
      (hThreshold : amountUSD > 100000)



structure Section5324d2 (p : Person) (c : ComplaintText) : Prop where
  violation : Section5324Violation p c
  aggravator : Section5324d2Aggravator p c

end Proving.USC.T31.Elements
