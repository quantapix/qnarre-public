













import Proving.USC.T18.Ch13.Scienter.Statute

namespace Proving.USC.T18.Ch13.Scienter

open Proving.USC.Common (Person ComplaintText)


theorem scienter241_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState241) (hProv : MentalStateProven p rung c) :
    Scienter241 p c := ⟨rung, hReach, hProv⟩


theorem scienter242_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState242) (hProv : MentalStateProven p rung c) :
    Scienter242 p c := ⟨rung, hReach, hProv⟩


theorem scienter243_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hProv : MentalStateProven p rung c) : Scienter243 p c := ⟨rung, hProv⟩


theorem scienter244_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hProv : MentalStateProven p rung c) : Scienter244 p c := ⟨rung, hProv⟩


theorem scienter245_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState245) (hProv : MentalStateProven p rung c) :
    Scienter245 p c := ⟨rung, hReach, hProv⟩


theorem scienter246_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hProv : MentalStateProven p rung c) : Scienter246 p c := ⟨rung, hProv⟩


theorem scienter247_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState247) (hProv : MentalStateProven p rung c) :
    Scienter247 p c := ⟨rung, hReach, hProv⟩


theorem scienter248_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248) (hProv : MentalStateProven p rung c) :
    Scienter248 p c := ⟨rung, hReach, hProv⟩


theorem scienter249_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState249) (hProv : MentalStateProven p rung c) :
    Scienter249 p c := ⟨rung, hReach, hProv⟩


theorem scienter250_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hProv : MentalStateProven p rung c) : Scienter250 p c := ⟨rung, hProv⟩

end Proving.USC.T18.Ch13.Scienter
