







import Proving.USC.T18.Ch77Tail.Scienter.Statute

namespace Proving.USC.T18.Ch77Tail.Scienter

open Proving.USC.Common



def scienter1582_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1582) (hProv : MentalStateProven p rung c) :
    Scienter1582 p c := ⟨rung, hReach, hProv⟩

theorem culpable1582_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1582 p c) : Culpable1582 p c := ⟨s.proven, s.reaches, s.grounded⟩



def scienter1585_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1585) (hProv : MentalStateProven p rung c) :
    Scienter1585 p c := ⟨rung, hReach, hProv⟩

theorem culpable1585_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1585 p c) : Culpable1585 p c := ⟨s.proven, s.reaches, s.grounded⟩



def scienter1586_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1586) (hProv : MentalStateProven p rung c) :
    Scienter1586 p c := ⟨rung, hReach, hProv⟩

theorem culpable1586_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1586 p c) : Culpable1586 p c := ⟨s.proven, s.reaches, s.grounded⟩



def scienter1587_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1587) (hProv : MentalStateProven p rung c) :
    Scienter1587 p c := ⟨rung, hReach, hProv⟩

theorem culpable1587_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1587 p c) : Culpable1587 p c := ⟨s.proven, s.reaches, s.grounded⟩



def scienter1588_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1588) (hProv : MentalStateProven p rung c) :
    Scienter1588 p c := ⟨rung, hReach, hProv⟩

theorem culpable1588_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1588 p c) : Culpable1588 p c := ⟨s.proven, s.reaches, s.grounded⟩



def scienter1592_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState1592) (hProv : MentalStateProven p rung c) :
    Scienter1592 p c := ⟨rung, hReach, hProv⟩

theorem culpable1592_of_scienter {p : Person} {c : ComplaintText}
    (s : Scienter1592 p c) : Culpable1592 p c := ⟨s.proven, s.reaches, s.grounded⟩

end Proving.USC.T18.Ch77Tail.Scienter
