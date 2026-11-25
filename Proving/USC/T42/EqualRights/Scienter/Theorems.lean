







import Proving.USC.T42.EqualRights.Scienter.Types
import Proving.USC.T42.EqualRights.Scienter.Predicates
import Proving.USC.T42.EqualRights.Scienter.Statute

namespace Proving.USC.T42.EqualRights.Scienter

open Proving.USC.Common



theorem scienter1981_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1981)
    (hProv : MentalStateProven p rung c) : Scienter1981 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1981a_a_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1981a_a)
    (hProv : MentalStateProven p rung c) : Scienter1981a_a p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1981a_b_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1981a_b)
    (hProv : MentalStateProven p rung c) : Scienter1981a_b p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1982_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1982)
    (hProv : MentalStateProven p rung c) : Scienter1982 p c :=
  ⟨rung, hReach, hProv⟩





theorem scienter1981a_a_implies_b {p : Person} {c : ComplaintText}
    (h : Scienter1981a_a p c) : Scienter1981a_b p c := by
  obtain ⟨rung, hReach, hProv⟩ := h
  have hstep : RequiredMentalState1981a_a.atLeast RequiredMentalState1981a_b := by
    show RequiredMentalState1981a_b.rank ≤ RequiredMentalState1981a_a.rank
    decide
  exact ⟨rung, MentalState.atLeast_trans hReach hstep, hProv⟩

end Proving.USC.T42.EqualRights.Scienter
