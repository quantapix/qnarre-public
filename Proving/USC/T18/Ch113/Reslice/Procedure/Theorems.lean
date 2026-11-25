






import Proving.USC.T18.Ch113.Reslice.Procedure.Types
import Proving.USC.T18.Ch113.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch113.Reslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113.Reslice.Procedure



theorem timelyCivilAction_intro {p : Person} {c : ComplaintText}
    (hAcc : ViolationDiscovered p c) (hCom : CivilActionCommenced p c)
    (hWin : WithinThreeYearWindow p c) : TimelyCivilAction p c :=
  ⟨hAcc, hCom, hWin⟩



theorem wellFoundedCivilAction_intro {p : Person} {c : ComplaintText}
    (hNexus : FederalProceduralJurisdictionNexus c) (hTimely : TimelyCivilAction p c)
    : WellFoundedCivilAction p c :=
  ⟨hNexus, hTimely⟩



theorem timelyElection_intro {p : Person} {c : ComplaintText}
    (hEl : StatutoryDamagesElected p c) (hBefore : ElectionBeforeFinalJudgment p c)
    : TimelyElection p c :=
  ⟨hEl, hBefore⟩



theorem trebleEnhancementTriggered_intro {p : Person} {c : ComplaintText}
    (hSub : SubsequentViolation p c) (hWin : WithinTrebleEnhancementWindow p c)
    : TrebleEnhancementTriggered p c :=
  ⟨hSub, hWin⟩


theorem repeatOffenderEnhancement_intro {p : Person} {c : ComplaintText}
    (hPrior : PriorConvictionUnderSubsectionA p c) : RepeatOffenderEnhancement p c :=
  ⟨hPrior⟩



theorem victimImpactStep_intro {p : Person} {c : ComplaintText}
    (hRep : PresentenceReportInPreparation p c) (hStmt : VictimImpactStatementSubmitted p c)
    : VictimImpactStep p c :=
  ⟨hRep, hStmt⟩



theorem annualAccountingObligation_intro {p : Person} {c : ComplaintText}
    (hInc : AttorneyGeneralAnnualReportIncluded p c) : AnnualAccountingObligation p c :=
  ⟨hInc⟩

end Proving.USC.T18.Ch113.Reslice.Procedure
