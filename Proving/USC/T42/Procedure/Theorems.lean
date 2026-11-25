









import Proving.USC.T42.Procedure.Statute

namespace Proving.USC.T42.Procedure

open Proving.USC.Common


theorem timelyFiling1986_intro {p c}
    (hAcc : ClaimAccrued p c) (hCom : ActionCommenced p c)
    (hWin : WithinOneYearWindow p c) : TimelyFiling1986 p c :=
  ⟨hAcc, hCom, hWin⟩


theorem ripeAction1985_intro {p c}
    (hOvert : OvertActInjured p c) (hCom : ActionCommenced p c) : RipeAction1985 p c :=
  ⟨hOvert, hCom⟩


theorem effectiveTermination_intro {ag prog c}
    (hNot : NoticeAndVoluntaryAttempt ag prog c) (hHear : HearingAndFinding ag prog c)
    (hRep : ReportFiled ag prog c) (hWin : ThirtyDayReportWindow ag prog c)
    : EffectiveTermination ag prog c :=
  ⟨hNot, hHear, hRep, hWin⟩


theorem suitAgainstStateMaintainable_intro {e c}
    (hState : IsStateDefendant e c) (hAfter : ViolationAfterEffectiveDate e c)
    : SuitAgainstStateMaintainable e c :=
  ⟨hState, hAfter⟩



theorem reachesEffective {ag prog c}
    (hNot : NoticeAndVoluntaryAttempt ag prog c) (hHear : HearingAndFinding ag prog c)
    (hRep : ReportFiled ag prog c) (hWin : ThirtyDayReportWindow ag prog c)
    : Reachable ag prog c State.Effective :=
  .toEffective (.toReported (.toTerminated (.toHearing .start hNot) hHear) hRep) hWin

end Proving.USC.T42.Procedure
