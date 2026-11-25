







import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Remedy.Types
import Proving.USC.T18.Spec.Remedy.Predicates
import Proving.USC.T18.Spec.Remedy.Statute

namespace Proving.USC.T18.Spec.Remedy

open Proving.USC.Common


theorem standing1964c_intro {p : Person} {c : ComplaintText}
    (hPR : HasPrivateRightOfAction p c) (hViol : ViolationEstablished c)
    (hInj : InjuryCognizable p c) (hCaus : CausedByViolation p c) :
    Standing1964c p c :=
  ⟨hPR, hViol, hInj, hCaus⟩


theorem governmentCivil1964ab_intro {c : ComplaintText}
    (hViol : ViolationEstablished c) (hAG : AttorneyGeneralProceeding c)
    (hInj : InjunctiveReliefAvailable c) :
    GovernmentCivil1964ab c :=
  ⟨hViol, hAG, hInj⟩


theorem criminalForfeiture1963_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hConv : CriminalConviction p c) (hForf : ForfeitableInterest e c) :
    CriminalForfeiture1963 p e c :=
  ⟨hConv, hForf⟩


theorem chapterRemedy_private_intro {p : Person} {e : Entity} {c : ComplaintText}
    (h : Standing1964c p c) : ChapterRemedy p e c :=
  .privateTreble h


theorem chapterRemedy_government_intro {p : Person} {e : Entity} {c : ComplaintText}
    (h : GovernmentCivil1964ab c) : ChapterRemedy p e c :=
  .governmentCivil h


theorem chapterRemedy_criminal_intro {p : Person} {e : Entity} {c : ComplaintText}
    (h : CriminalForfeiture1963 p e c) : ChapterRemedy p e c :=
  .criminal h

end Proving.USC.T18.Spec.Remedy
