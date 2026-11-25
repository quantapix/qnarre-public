






import Proving.USC.T18.Ch75.Scienter.Statute

namespace Proving.USC.T18.Ch75.Scienter

open Proving.USC.Common (Person ComplaintText MentalState)


theorem culpable_intro {off : Ch75Offense} {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast (RequiredMentalState off))
    (hProv : MentalStateProven p rung c) : Culpable off p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1542_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1542))
    (hProv : MentalStateProven p rung c) : Scienter1542 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1543_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1543))
    (hProv : MentalStateProven p rung c) : Scienter1543 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1544_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1544))
    (hProv : MentalStateProven p rung c) : Scienter1544 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1546a_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1546a))
    (hProv : MentalStateProven p rung c) : Scienter1546a p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1546b_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1546b))
    (hProv : MentalStateProven p rung c) : Scienter1546b p c :=
  ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch75.Scienter
