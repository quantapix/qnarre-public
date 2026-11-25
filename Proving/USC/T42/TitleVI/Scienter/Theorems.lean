






import Proving.USC.T42.TitleVI.Scienter.Types
import Proving.USC.T42.TitleVI.Scienter.Predicates
import Proving.USC.T42.TitleVI.Scienter.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Scienter

open Proving.USC.Common (Person ComplaintText)



theorem scienter2000d_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000d)
    (hProv : MentalStateProven p rung c) :
    Scienter2000d p c :=
  ⟨⟨rung, hReach, hProv⟩⟩



theorem scienter2000d1_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000d1)
    (hProv : MentalStateProven p rung c) :
    Scienter2000d1 p c :=
  ⟨⟨rung, hReach, hProv⟩⟩

end Proving.USC.T42.TitleVI.Scienter
