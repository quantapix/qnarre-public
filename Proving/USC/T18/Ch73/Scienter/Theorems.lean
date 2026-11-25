import Proving.USC.T18.Ch73.Scienter.Types
import Proving.USC.T18.Ch73.Scienter.Predicates
import Proving.USC.T18.Ch73.Scienter.Statute
import Proving.USC.Common.Types
set_option autoImplicit false










namespace Proving.USC.T18.Ch73.Scienter

open Proving.USC.Common




theorem MentalState.atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c :=
  Nat.le_trans hbc hab


theorem scienter1503_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1503) (hProv : MentalStateProven p rung c) :
    Scienter1503 p c := ⟨rung, hReach, hProv⟩


theorem scienter1512_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1512) (hProv : MentalStateProven p rung c) :
    Scienter1512 p c := ⟨rung, hReach, hProv⟩



theorem scienter1512Circumstance_intro : Scienter1512CircumstanceCulpable := trivial


theorem scienter1513_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1513) (hProv : MentalStateProven p rung c) :
    Scienter1513 p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch73.Scienter
