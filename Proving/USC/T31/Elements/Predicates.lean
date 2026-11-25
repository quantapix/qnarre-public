import Proving.USC.T31.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T31.Elements

open Proving.USC.Common





axiom IsDomesticFinancialInstitution (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom InvolvedInCurrencyTransaction (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop




axiom MeetsPrescribedReportingThreshold (t : Transaction) (c : ComplaintText) : Prop





axiom TransactionWithExemptEntity (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop




axiom TransactionExemptQualifiedCustomer (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop




axiom InstitutionFailedToFileReport (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop




axiom IsPrescribedParticipant (p : Person) (t : Transaction) (c : ComplaintText) : Prop




axiom ParticipantFailedToFileReport (p : Person) (t : Transaction) (c : ComplaintText) : Prop




axiom ActingForAnotherPerson (p : Person) (t : Transaction) (c : ComplaintText) : Prop




axiom FailedToIdentifyPrincipal (p : Person) (t : Transaction) (c : ComplaintText) : Prop







axiom PurposeToEvadeCurrencyReporting (p : Person) (c : ComplaintText) : Prop




axiom PurposeToEvadeNonfinancialReporting (p : Person) (c : ComplaintText) : Prop




axiom PurposeToEvadeInternationalReporting (p : Person) (c : ComplaintText) : Prop




axiom CausedOrAttemptedFailureToFile (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom CausedOrAttemptedMisstatedReport (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom StructuredTransactionWithInstitution (p : Person) (c : ComplaintText) : Prop



axiom IsNonfinancialTradeOrBusiness (b : NonfinancialBusiness) (c : ComplaintText) : Prop




axiom CausedOrAttemptedBusinessFailureToFile (p : Person) (b : NonfinancialBusiness) (c : ComplaintText) : Prop





axiom CausedOrAttemptedBusinessMisstatedReport (p : Person) (b : NonfinancialBusiness) (c : ComplaintText) : Prop





axiom StructuredTransactionWithBusiness (p : Person) (c : ComplaintText) : Prop




axiom FailedToFileInternationalReport (p : Person) (c : ComplaintText) : Prop




axiom MisstatedInternationalReport (p : Person) (c : ComplaintText) : Prop





axiom StructuredImportExportOfMonetaryInstruments (p : Person) (c : ComplaintText) : Prop



axiom ViolatedAnotherFederalLaw (p : Person) (c : ComplaintText) : Prop





axiom PatternIllegalActivityAmount (p : Person) (c : ComplaintText) (amountUSD : Nat) : Prop

end Proving.USC.T31.Elements
