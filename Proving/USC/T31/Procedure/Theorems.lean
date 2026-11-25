






import Proving.USC.T31.Procedure.Types
import Proving.USC.T31.Procedure.Predicates
import Proving.USC.T31.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T31.Procedure

open Proving.USC.Common (Person ComplaintText)



theorem timelyCtrFiling_intro {fi : FinancialInstitution} {t : Transaction}
    {c : ComplaintText}
    (hOcc : CoveredCurrencyTransactionOccurred fi t c)
    (hFiled : ReportFiled fi t c)
    (hTimely : FiledAtPrescribedTimeAndWay fi t c) :
    TimelyCtrFiling fi t c :=
  ⟨hOcc, hFiled, hTimely⟩



theorem ctrObligationSatisfied_intro {fi : FinancialInstitution}
    {t : Transaction} {c : ComplaintText}
    (h : TimelyCtrFiling fi t c) : CtrObligationSatisfied fi t c :=
  CtrObligationSatisfied.filed h



theorem agentFiling_intro {p : Person} {t : Transaction} {c : ComplaintText}
    (hId : AgentIdentifiedPrincipal p t c)
    (hCh : FiledThroughProperChannel p t c) : AgentFiling p t c :=
  ⟨hId, hCh⟩



theorem maintainedExemption_intro {fi : FinancialInstitution}
    {t : Transaction} {c : ComplaintText}
    (hGrant : ExemptionGranted fi t c)
    (hRev : AnnualExemptionReviewCompleted fi c) :
    MaintainedExemption fi t c :=
  ⟨hGrant, hRev⟩



theorem exemptionSafeHarborException_intro {fi : FinancialInstitution}
    {c : ComplaintText}
    (h : KnowinglyFiledFalseExemptionInfo fi c) :
    ExemptionSafeHarborException fi c :=
  ExemptionSafeHarborException.knowingFalsity h



theorem structuringAct_intro {p : Person} {fi : FinancialInstitution}
    {c : ComplaintText}
    (h : CausedFailureToFile p fi c) : StructuringAct p fi c :=
  StructuringAct.causedFailure h



theorem structuringViolation_intro {p : Person} {fi : FinancialInstitution}
    {c : ComplaintText}
    (hPurp : EvasivePurpose p c)
    (hAct : StructuringAct p fi c) : StructuringViolation p fi c :=
  ⟨hPurp, hAct⟩





theorem aggravatedPattern_intro {p : Person} {c : ComplaintText}
    (amountUsd spanMonths : Nat)
    (hAmt : IllegalActivityAmountExtracted p c amountUsd)
    (hSpan : IllegalActivitySpanExtracted p c spanMonths)
    (hGt : amountUsd > 100000) (hLe : spanMonths ≤ 12) :
    AggravatedPattern p c :=
  ⟨amountUsd, spanMonths, hAmt, hSpan, hGt, hLe⟩




theorem penaltyAggravation_intro {p : Person} {c : ComplaintText}
    (h : ViolatedWhileViolatingOtherLaw p c) : PenaltyAggravation p c :=
  PenaltyAggravation.otherLaw h



theorem aggravatedStructuringViolation_intro {p : Person}
    {fi : FinancialInstitution} {c : ComplaintText}
    (hBase : StructuringViolation p fi c)
    (hAgg : PenaltyAggravation p c) : AggravatedStructuringViolation p fi c :=
  ⟨hBase, hAgg⟩

end Proving.USC.T31.Procedure
