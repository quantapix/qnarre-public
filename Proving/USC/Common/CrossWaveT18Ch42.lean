































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42.Scienter.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch42

open Proving.USC.Common




























axiom corr_t18ch42_mentalstate_iff {p : Person} {rung : MentalState} {c : ComplaintText} :
    Proving.USC.T18.Ch42.Scienter.MentalStateProven p rung c ↔ MentalStateProven p rung c



theorem collapse_t18ch42_mentalstate {p : Person} {rung : MentalState} {c : ComplaintText}
    (h : Proving.USC.T18.Ch42.Scienter.MentalStateProven p rung c) : MentalStateProven p rung c :=
  corr_t18ch42_mentalstate_iff.mp h



theorem collapse_mentalStateProven_iff {p : Person} {rung : MentalState} {c : ComplaintText} :
    Proving.USC.T18.Ch42.Scienter.MentalStateProven p rung c ↔ MentalStateProven p rung c :=
  corr_t18ch42_mentalstate_iff

end Proving.USC.Common.CrossWaveT18Ch42
