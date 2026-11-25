










import Proving.USC.T18.Sec1961BPredicates.Scienter.Statute

namespace Proving.USC.T18.Sec1961BPredicates.Scienter

open Proving.USC.Common (Person ComplaintText)

theorem scienter2314_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2314) (hProv : MentalStateProven p rung c) :
    Section2314Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter2315_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2315) (hProv : MentalStateProven p rung c) :
    Section2315Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter1028_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1028) (hProv : MentalStateProven p rung c) :
    Section1028Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter1029_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1029) (hProv : MentalStateProven p rung c) :
    Section1029Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter1955_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1955) (hProv : MentalStateProven p rung c) :
    Section1955Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter1084_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1084) (hProv : MentalStateProven p rung c) :
    Section1084Culpable p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Sec1961BPredicates.Scienter
