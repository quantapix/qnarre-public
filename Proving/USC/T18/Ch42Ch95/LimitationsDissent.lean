

























import Proving.USC.T18.Ch42Ch95.Elements.Statute
import Proving.USC.T18.Ch42Ch95.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.LimitationsDissent

open Proving.USC.T18.Ch42Ch95


theorem procedure_window_is_2555 : Procedure.sevenYearWindowDays = 2555 := rfl




theorem elapsed_2556_timely_under_elements : (2556 : Nat) ≤ 2557 := by decide


theorem elapsed_2556_barred_under_procedure :
    ¬ ((2556 : Nat) ≤ Procedure.sevenYearWindowDays) := by decide





theorem s1956j_encodings_disagree :
    ∃ d : Nat, d ≤ 2557 ∧ ¬ (d ≤ Procedure.sevenYearWindowDays) :=
  ⟨2556, by decide, by decide⟩

end Proving.USC.T18.Ch42Ch95.LimitationsDissent
