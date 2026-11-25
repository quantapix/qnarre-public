







import Proving.USC.T42.ADA.Procedure.Types
import Proving.USC.T42.ADA.Procedure.Predicates
import Proving.USC.T42.ADA.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Procedure

open Proving.USC.Common


theorem timelyEnforcement_intro
    {g : Grievance} {r : EnforcementRoute} {accrualDay filingDay : Nat} {c : ComplaintText}
    (hArose : GrievanceArisen g c)
    (hRouted : RoutedToCorrectRemedy g r c)
    (hAcc : AccrualDay g accrualDay c)
    (hFiling : ChargeFilingDay g filingDay c)
    (hCharged : AdministrativeChargeFiled g c)
    (hWindow : filingTimely accrualDay filingDay)
    : TimelyEnforcement g r accrualDay filingDay c :=
  ⟨hArose, hRouted, hAcc, hFiling, hCharged, hWindow⟩


theorem medicalExamTimely_intro
    {x : MedicalExam} {c : ComplaintText}
    (hOffer : ConditionalOfferMade x c)
    (hWindow : ExamWithinPostOfferWindow x c)
    : MedicalExamTimely x c :=
  ⟨hOffer, hWindow⟩


theorem solicitationInWindow_intro
    {s : Solicitation} {dayOffset : Nat} {c : ComplaintText}
    (hOffset : SolicitationDayOffset s dayOffset c)
    (hAfter : solicitationAfter30 dayOffset)
    : SolicitationInWindow s dayOffset c :=
  ⟨hOffset, hAfter⟩

end Proving.USC.T42.ADA.Procedure
