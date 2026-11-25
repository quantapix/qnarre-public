


import Proving.USC.T18.Procedure.Statute

namespace Proving.USC.T18.Procedure
open Proving.USC.Common

theorem timelyFiling_intro {p : Person} {c : ComplaintText}
    (hAcc : ClaimAccrued p c)
    (hFiled : ComplaintFiled p c)
    (hWin : WithinFourYearWindow p c)
    : TimelyFiling p c :=
  ⟨hAcc, hFiled, hWin⟩

end Proving.USC.T18.Procedure
