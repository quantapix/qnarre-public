






import Proving.USC.T31.Procedure.Types
import Proving.USC.T31.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T31.Procedure

open Proving.USC.Common (Person ComplaintText)






structure TimelyCtrFiling
    (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop where
  occurred : CoveredCurrencyTransactionOccurred fi t c
  filed    : ReportFiled fi t c
  timely   : FiledAtPrescribedTimeAndWay fi t c




inductive CtrObligationSatisfied
    (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop
  | filed  (h : TimelyCtrFiling fi t c) : CtrObligationSatisfied fi t c
  | exempt (h : ExemptionGranted fi t c) : CtrObligationSatisfied fi t c




structure AgentFiling (p : Person) (t : Transaction) (c : ComplaintText) : Prop where
  identified : AgentIdentifiedPrincipal p t c
  channel    : FiledThroughProperChannel p t c



structure MaintainedExemption
    (fi : FinancialInstitution) (t : Transaction) (c : ComplaintText) : Prop where
  granted : ExemptionGranted fi t c
  review  : AnnualExemptionReviewCompleted fi c



inductive ExemptionSafeHarborException
    (fi : FinancialInstitution) (c : ComplaintText) : Prop
  | knowingFalsity  (h : KnowinglyFiledFalseExemptionInfo fi c) :
      ExemptionSafeHarborException fi c
  | reasonToBelieve (h : HadReasonToBelieveIneligible fi c) :
      ExemptionSafeHarborException fi c




inductive StructuringAct
    (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop
  | causedFailure      (h : CausedFailureToFile p fi c) : StructuringAct p fi c
  | causedMisstatement (h : CausedMisstatedFiling p fi c) : StructuringAct p fi c
  | structured         (h : StructuredTransaction p fi c) : StructuringAct p fi c
  | nonfinancial       (h : StructuredNonfinancialReporting p c) : StructuringAct p fi c
  | international      (h : StructuredInternationalTransport p c) : StructuringAct p fi c



structure StructuringViolation
    (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop where
  purpose : EvasivePurpose p c
  act     : StructuringAct p fi c





def AggravatedPattern (p : Person) (c : ComplaintText) : Prop :=
  ∃ (amountUsd spanMonths : Nat),
    IllegalActivityAmountExtracted p c amountUsd ∧
    IllegalActivitySpanExtracted p c spanMonths ∧
    amountUsd > 100000 ∧ spanMonths ≤ 12



inductive PenaltyAggravation (p : Person) (c : ComplaintText) : Prop
  | otherLaw (h : ViolatedWhileViolatingOtherLaw p c) : PenaltyAggravation p c
  | pattern  (h : AggravatedPattern p c) : PenaltyAggravation p c




structure AggravatedStructuringViolation
    (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop where
  base        : StructuringViolation p fi c
  aggravation : PenaltyAggravation p c

end Proving.USC.T31.Procedure
