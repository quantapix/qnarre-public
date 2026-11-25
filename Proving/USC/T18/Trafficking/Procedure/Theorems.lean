



import Proving.USC.T18.Trafficking.Procedure.Statute

namespace Proving.USC.T18.Trafficking.Procedure
open Proving.USC.Common



theorem timelyProsecution_intro
    {p : Person} {d : ChargingDates} {c : ComplaintText}
    (hAcc : OffenseAccrued p c)
    (hCom : ProsecutionCommenced p c)
    (hDates : ChargingDatesPleaded d c)
    (hWin : d.timely)
    : TimelyProsecution p d c :=
  ⟨hAcc, hCom, hDates, hWin⟩


theorem enforcementObstruction_intro
    {p : Person} {c : ComplaintText}
    (hObs : ObstructedEnforcement p c)
    : EnforcementObstruction p c :=
  ⟨hObs⟩


theorem ageProofRelieved_intro
    {p : Person} {c : ComplaintText}
    (hObs : ReasonableOpportunityToObserve p c)
    : AgeProofRelieved p c :=
  ⟨hObs⟩



theorem timely_reaches_charged
    {p : Person} {d : ChargingDates} {c : ComplaintText}
    (h : TimelyProsecution p d c)
    : reachedState d = State.charged := by
  unfold reachedState
  simp [h.inWindow]

end Proving.USC.T18.Trafficking.Procedure
