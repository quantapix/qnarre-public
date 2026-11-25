










import Proving.USC.Common.Types
import Proving.USC.T08.Scienter.Types
import Proving.USC.T08.Scienter.Predicates
import Proving.USC.T08.Scienter.Statute

namespace Proving.USC.T08.Scienter

open Proving.USC.Common (MentalState)


theorem scienter1324_a1Ai_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1324_a1Ai)
    (hProv : MentalStateProven p rung c) : Scienter1324_a1Ai p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1324_transportHarborEncourage_intro {p : Person} {c : ComplaintText}
    (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1324_transportHarborEncourage)
    (hProv : MentalStateProven p rung c) : Scienter1324_transportHarborEncourage p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1324_financialGain_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1324_financialGain)
    (hProv : MentalStateProven p rung c) : Scienter1324_financialGain p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1324_a2_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1324_a2)
    (hProv : MentalStateProven p rung c) : Scienter1324_a2 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1324_a3_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1324_a3)
    (hProv : MentalStateProven p rung c) : Scienter1324_a3 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1327_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1327)
    (hProv : MentalStateProven p rung c) : Scienter1327 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1328_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1328)
    (hProv : MentalStateProven p rung c) : Scienter1328 p c :=
  ⟨rung, hReach, hProv⟩

end Proving.USC.T08.Scienter
