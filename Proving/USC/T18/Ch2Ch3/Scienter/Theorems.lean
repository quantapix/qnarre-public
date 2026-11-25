import Proving.USC.T18.Ch2Ch3.Scienter.Statute
set_option autoImplicit false
namespace Proving.USC.T18.Ch2Ch3.Scienter

open Proving.USC.Common









theorem scienter32Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState32) (hProv : MentalStateProven p rung c) :
    Scienter32Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter36Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState36) (hProv : MentalStateProven p rung c) :
    Scienter36Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter37Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState37) (hProv : MentalStateProven p rung c) :
    Scienter37Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter38Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState38) (hProv : MentalStateProven p rung c) :
    Scienter38Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter39Ba1Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState39Ba1) (hProv : MentalStateProven p rung c) :
    Scienter39Ba1Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter39Ba2Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState39Ba2) (hProv : MentalStateProven p rung c) :
    Scienter39Ba2Culpable p c := ⟨rung, hReach, hProv⟩

theorem scienter39BbCulpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState39Bb) (hProv : MentalStateProven p rung c) :
    Scienter39BbCulpable p c := ⟨rung, hReach, hProv⟩

theorem scienter40ACulpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState40A) (hProv : MentalStateProven p rung c) :
    Scienter40ACulpable p c := ⟨rung, hReach, hProv⟩

theorem scienter42bCulpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState42b) (hProv : MentalStateProven p rung c) :
    Scienter42bCulpable p c := ⟨rung, hReach, hProv⟩

theorem scienter42cCulpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState42c) (hProv : MentalStateProven p rung c) :
    Scienter42cCulpable p c := ⟨rung, hReach, hProv⟩

theorem scienter43Culpable_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState43) (hProv : MentalStateProven p rung c) :
    Scienter43Culpable p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch2Ch3.Scienter
