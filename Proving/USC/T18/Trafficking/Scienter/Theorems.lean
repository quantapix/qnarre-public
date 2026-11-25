










import Proving.USC.T18.Trafficking.Scienter.Statute

namespace Proving.USC.T18.Trafficking.Scienter

open Proving.USC.Common (MentalState Person ComplaintText MentalStateProven)

theorem scienter1581_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1581)
    (hProv : MentalStateProven p rung c) : Scienter1581 p c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1589a_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1589a)
    (hProv : MentalStateProven p rung c) : Scienter1589a p c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1589b_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1589b)
    (hProv : MentalStateProven p rung c) : Scienter1589b p c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1590_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1590)
    (hProv : MentalStateProven p rung c) : Scienter1590 p c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1591_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1591)
    (hProv : MentalStateProven p rung c) : Scienter1591 p c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1591cAge_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1591cAge)
    (hProv : MentalStateProven p rung c) : Scienter1591cAge p c :=
  ⟨rung, hReach, hProv⟩


theorem section1589Culpable_introA {p : Person} {c : ComplaintText}
    (h : Scienter1589a p c) : Section1589Culpable p c := Or.inl h


theorem section1589Culpable_introB {p : Person} {c : ComplaintText}
    (h : Scienter1589b p c) : Section1589Culpable p c := Or.inr h

end Proving.USC.T18.Trafficking.Scienter
