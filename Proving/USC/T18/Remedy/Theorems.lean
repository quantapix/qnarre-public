


import Proving.USC.T18.Remedy.Statute

namespace Proving.USC.T18.Remedy
open Proving.USC.Common

theorem standing1964c_intro {p : Person} {c : ComplaintText}
    (hPR : HasPrivateRightOfAction p c)
    (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c)
    : Standing1964c p c :=
  ⟨hPR, hInj, hCaus⟩

end Proving.USC.T18.Remedy
