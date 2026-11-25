










import Proving.USC.T18.Ch77TailCompletion.Procedure.Types
import Proving.USC.T18.Ch77TailCompletion.Procedure.Predicates
import Proving.USC.T18.Ch77TailCompletion.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Procedure

open Proving.USC.Common



def timelyCommencement_intro {p : Person} {c : ComplaintText}
    (arose majority commenced : Nat)
    (hVic : IsChapterVictim p c) (hFiled : CivilActionCommenced p c)
    (hArose : CauseOfActionAroseOn arose c) (hMaj : VictimMajorityDateOn majority c)
    (hCommenced : CommencementDateOn commenced c)
    (hWin : WithinTenYearWindow arose majority commenced)
    : TimelyCommencement p c :=
  { arose, majority, commenced, isVictim := hVic, filed := hFiled,
    aroseFact := hArose, majFact := hMaj, filedOn := hCommenced, inWindow := hWin }


theorem mandatoryStayDue_intro {p : Person} {c : ComplaintText}
    (hFiled : CivilActionCommenced p c) (hPending : CriminalActionPending p c)
    : MandatoryStayDue p c :=
  ⟨hFiled, hPending⟩


theorem parensPatriaeAction_intro {p : Person} {c : ComplaintText}
    (hInterest : StateHasParensPatriaeInterest p c) (hFiled : CivilActionCommenced p c)
    : ParensPatriaeAction p c :=
  ⟨hInterest, hFiled⟩


theorem timelyInjunctionProceeding_intro {p : Person} {c : ComplaintText}
    (hImminent : ImminentOrOngoingViolation p c) (hExpedited : ExpeditedHearingHeld p c)
    : TimelyInjunctionProceeding p c :=
  ⟨hImminent, hExpedited⟩


theorem sealingDuty_intro {p : Person} {c : ComplaintText}
    (hSealed : ActionSealedPendingIndictment p c) : SealingDuty p c :=
  ⟨hSealed⟩


theorem prosecutionPermitted_intro {p : Person} {c : ComplaintText}
    (hJur : ExtraterritorialJurisdictionExists p c)
    (hNotBarred : ¬ ForeignProsecutionPending p c ∨ AGApprovalToProsecute p c)
    : ProsecutionPermitted p c :=
  ⟨hJur, hNotBarred⟩


theorem restitutionMandate_intro {p : Person} {c : ComplaintText}
    (hOrdered : MandatoryRestitutionOrdered p c) : RestitutionMandate p c :=
  ⟨hOrdered⟩


theorem forfeitureMandate_intro {p : Person} {c : ComplaintText}
    (hForfeit : ForfeitureOrderedAtSentencing p c) : ForfeitureMandate p c :=
  ⟨hForfeit⟩






example : WithinTenYearWindow 1000 0 4000 := by decide



example : ¬ WithinTenYearWindow 1000 0 5000 := by decide


example : Reachable .Filed := .step .start .accrueToFile

end Proving.USC.T18.Ch77TailCompletion.Procedure
