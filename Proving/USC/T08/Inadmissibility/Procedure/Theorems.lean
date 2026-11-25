








import Proving.USC.T08.Inadmissibility.Procedure.Types
import Proving.USC.T08.Inadmissibility.Procedure.Predicates
import Proving.USC.T08.Inadmissibility.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Procedure

open Proving.USC.Common


theorem threeYearBar_intro {a : Alien} {c : ComplaintText}
    (hTrig : ThreeYearTrigger a c) (hDep : Departed a c)
    (hSeek : SeeksReadmission a c) (hWin : WithinThreeYearWindow a c)
    (hNoConsent : ¬ ConsentToReapply a c) : ThreeYearBar a c :=
  ⟨hTrig, hDep, hSeek, hWin, hNoConsent⟩


theorem tenYearBar_intro {a : Alien} {c : ComplaintText}
    (hTrig : TenYearTrigger a c) (hDep : Departed a c)
    (hSeek : SeeksReadmission a c) (hWin : WithinTenYearWindow a c)
    (hNoConsent : ¬ ConsentToReapply a c) : TenYearBar a c :=
  ⟨hTrig, hDep, hSeek, hWin, hNoConsent⟩


theorem timelyPetitionForReview_intro {e : Entity} {c : ComplaintText}
    (hAff : NoticeAndHearingAfforded e c) (hFin : FinalOrderIssued e c)
    (hPet : PetitionFiled e c) (hWin : WithinPetitionWindow e c)
    : TimelyPetitionForReview e c :=
  ⟨hAff, hFin, hPet, hWin⟩





theorem withinThreeYearWindow_imp_tenYear {a : Alien} {c : ComplaintText}
    (h : WithinThreeYearWindow a c) : WithinTenYearWindow a c := by
  simp only [WithinThreeYearWindow, WithinTenYearWindow, year] at h ⊢
  omega

end Proving.USC.T08.Inadmissibility.Procedure
