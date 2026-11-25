







import Proving.USC.T18.Ch77TailCompletion.Scienter.Statute

namespace Proving.USC.T18.Ch77TailCompletion.Scienter

open Proving.USC.Common

theorem culpable1583_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1583)) (hProv : MentalStateProven p rung c) :
    Culpable1583 p c := ⟨rung, hReach, hProv⟩

theorem culpable1584_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1584)) (hProv : MentalStateProven p rung c) :
    Culpable1584 p c := ⟨rung, hReach, hProv⟩

theorem culpable1593A_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1593A)) (hProv : MentalStateProven p rung c) :
    Culpable1593A p c := ⟨rung, hReach, hProv⟩

theorem culpable1594_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1594)) (hProv : MentalStateProven p rung c) :
    Culpable1594 p c := ⟨rung, hReach, hProv⟩

theorem culpable1595_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1595)) (hProv : MentalStateProven p rung c) :
    Culpable1595 p c := ⟨rung, hReach, hProv⟩

theorem culpable1597_intro {p c} (rung : MentalState)
    (hReach : rung.atLeast (RequiredMentalState .s1597)) (hProv : MentalStateProven p rung c) :
    Culpable1597 p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch77TailCompletion.Scienter
