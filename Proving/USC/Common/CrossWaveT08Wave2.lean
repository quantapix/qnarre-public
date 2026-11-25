





























import Proving.USC.T08.Inadmissibility.Scienter.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT08Wave2

open Proving.USC.Common
open Proving.USC.T08.Inadmissibility
















axiom corr_t08w2_mentalstate_iff {p : Person} {rung : MentalState} {c : ComplaintText} :
    Scienter.MentalStateProven p rung c ↔ MentalStateProven p rung c



theorem collapse_t08w2_mentalstate {p : Person} {rung : MentalState} {c : ComplaintText}
    (h : Scienter.MentalStateProven p rung c) : MentalStateProven p rung c :=
  corr_t08w2_mentalstate_iff.mp h


theorem agree_t08w2_mentalstate {p : Person} {rung : MentalState} {c : ComplaintText} :
    Scienter.MentalStateProven p rung c ↔ MentalStateProven p rung c :=
  corr_t08w2_mentalstate_iff

end Proving.USC.Common.CrossWaveT08Wave2
