





import Proving.USC.T18.Ch71.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)



theorem scienter1462_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1462) (hProv : MentalStateProven p rung c) :
    Scienter1462 p c :=
  ⟨rung, hReach, hProv⟩



theorem scienter1465_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1465) (hProv : MentalStateProven p rung c) :
    Scienter1465 p c :=
  ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch71.Reslice.Scienter
