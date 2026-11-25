






import Proving.USC.T31.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T31.Procedure

open Proving.USC.Common (Person ComplaintText)








axiom CoveredCurrencyTransactionOccurred
  (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop




axiom ReportFiled
  (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop





axiom FiledAtPrescribedTimeAndWay
  (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop





axiom AgentIdentifiedPrincipal
  (p : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom FiledThroughProperChannel
  (p : Person) (t : Transaction) (c : ComplaintText) : Prop






axiom InstitutionDesignatedAsAgent
  (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom ExemptionGranted
  (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop





axiom AnnualExemptionReviewCompleted
  (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom KnowinglyFiledFalseExemptionInfo
  (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom HadReasonToBelieveIneligible
  (fi : FinancialInstitution) (c : ComplaintText) : Prop







axiom EvasivePurpose (p : Person) (c : ComplaintText) : Prop





axiom CausedFailureToFile
  (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom CausedMisstatedFiling
  (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom StructuredTransaction
  (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop





axiom StructuredNonfinancialReporting (p : Person) (c : ComplaintText) : Prop






axiom StructuredInternationalTransport (p : Person) (c : ComplaintText) : Prop




axiom ViolatedWhileViolatingOtherLaw (p : Person) (c : ComplaintText) : Prop






axiom IllegalActivityAmountExtracted
  (p : Person) (c : ComplaintText) (amountUsd : Nat) : Prop






axiom IllegalActivitySpanExtracted
  (p : Person) (c : ComplaintText) (spanMonths : Nat) : Prop

end Proving.USC.T31.Procedure
