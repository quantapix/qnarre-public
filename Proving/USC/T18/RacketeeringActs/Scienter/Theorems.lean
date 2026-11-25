








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.RacketeeringActs.Scienter.Types
import Proving.USC.T18.RacketeeringActs.Scienter.Predicates
import Proving.USC.T18.RacketeeringActs.Scienter.Statute

namespace Proving.USC.T18.RacketeeringActs.Scienter

open Proving.USC.Common (MentalState)


theorem culpable_intro {p c required} (rung : MentalState)
    (hReach : rung.atLeast required) (hProv : MentalStateProven p rung c) :
    Culpable p c required := ⟨rung, hReach, hProv⟩


theorem scienter1951_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1951) (hProv : MentalStateProven p rung c) :
    Scienter1951 p c := ⟨rung, hReach, hProv⟩


theorem scienter1952_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1952) (hProv : MentalStateProven p rung c) :
    Scienter1952 p c := ⟨rung, hReach, hProv⟩


theorem scienter1956Intent_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1956Intent) (hProv : MentalStateProven p rung c) :
    Scienter1956Intent p c := ⟨rung, hReach, hProv⟩


theorem scienter1956Knowing_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1956Knowing) (hProv : MentalStateProven p rung c) :
    Scienter1956Knowing p c := ⟨rung, hReach, hProv⟩


theorem scienter1957_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1957) (hProv : MentalStateProven p rung c) :
    Scienter1957 p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.RacketeeringActs.Scienter
