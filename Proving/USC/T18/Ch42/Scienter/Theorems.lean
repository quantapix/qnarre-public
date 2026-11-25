







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42.Scienter.Types
import Proving.USC.T18.Ch42.Scienter.Predicates
import Proving.USC.T18.Ch42.Scienter.Statute

namespace Proving.USC.T18.Ch42.Scienter

open Proving.USC.Common


theorem scienter892Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState892) (hProv : MentalStateProven p rung c) :
    Scienter892Culpable p c := ⟨rung, hReach, hProv⟩


theorem scienter893Advance_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState893Advance) (hProv : MentalStateProven p rung c) :
    Scienter893Advance p c := ⟨rung, hReach, hProv⟩


theorem scienter893Belief_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState893Belief) (hProv : MentalStateProven p rung c) :
    Scienter893Belief p c := ⟨rung, hReach, hProv⟩


theorem scienter893Culpable_intro {p : Person} {c : ComplaintText}
    (hAdv : Scienter893Advance p c) (hBel : Scienter893Belief p c) :
    Scienter893Culpable p c := ⟨hAdv, hBel⟩



theorem scienter894Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState894) (hProv : MentalStateProven p rung c) :
    Scienter894Culpable p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch42.Scienter
