









import Proving.USC.T08.Inadmissibility.Scienter.Statute

namespace Proving.USC.T08.Inadmissibility.Scienter

open Proving.USC.Common (MentalState)


theorem culpable_intro {addressee : Person} {required : MentalState} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast required)
    (hProv : MentalStateProven addressee rung c) :
    Culpable addressee required c :=
  ⟨rung, hReach, hProv⟩

theorem scienter1324aA1A_intro (s : Scienter1324aA1A) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1324aA2_intro (s : Scienter1324aA2) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1324aA1B_intro (s : Scienter1324aA1B) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1324aF1_intro (s : Scienter1324aF1) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1182A6Ci_intro (s : Scienter1182A6Ci) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1182A6Ei_intro (s : Scienter1182A6Ei) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

theorem scienter1182A2Ci_intro (s : Scienter1182A2Ci) {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast s.required)
    (hProv : MentalStateProven s.addressee rung c) : s.culpable c :=
  culpable_intro rung hReach hProv

end Proving.USC.T08.Inadmissibility.Scienter
