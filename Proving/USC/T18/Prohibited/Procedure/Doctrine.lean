

















import Proving.USC.T18.Prohibited.Procedure.Types
import Proving.USC.T18.Prohibited.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Procedure

open Proving.USC.Common






def WithinFourYearWindow (p : Person) (c : ComplaintText) : Prop :=
  FilingDay p c - AccrualDay p c ≤ fourYearWindowDays







@[grind →]
theorem withinFourYearWindow_of_span {p : Person} {c : ComplaintText}
    (h : FilingDay p c - AccrualDay p c ≤ fourYearWindowDays) :
    WithinFourYearWindow p c := h

end Proving.USC.T18.Prohibited.Procedure
