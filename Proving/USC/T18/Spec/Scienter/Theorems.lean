









import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Scienter.Types
import Proving.USC.T18.Spec.Scienter.Predicates
import Proving.USC.T18.Spec.Scienter.Statute

namespace Proving.USC.T18.Spec.Scienter

open Proving.USC.Common


theorem scienter1962a_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1962a)
    (hProv : MentalStateProven p rung c) : Scienter1962a p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1962b_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1962b)
    (hProv : MentalStateProven p rung c) : Scienter1962b p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1962c_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1962c)
    (hProv : MentalStateProven p rung c) : Scienter1962c p c :=
  ⟨rung, hReach, hProv⟩



theorem scienter1962d_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1962d)
    (hProv : MentalStateProven p rung c) : Scienter1962d p c :=
  ⟨rung, hReach, hProv⟩



theorem scienter1963c_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1963c)
    (hProv : MentalStateProven p rung c) : Scienter1963c p c :=
  ⟨rung, hReach, hProv⟩





theorem specific_discharges_1962c {p : Person} {c : ComplaintText}
    (hProv : MentalStateProven p .Specific c) : Scienter1962c p c :=
  scienter1962c_intro .Specific
    (by unfold MentalState.atLeast RequiredMentalState1962c MentalState.rank; decide) hProv

end Proving.USC.T18.Spec.Scienter
