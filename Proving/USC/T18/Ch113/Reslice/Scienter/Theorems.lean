import Proving.USC.T18.Ch113.Reslice.Scienter.Statute

set_option autoImplicit false








namespace Proving.USC.T18.Ch113.Reslice.Scienter

open Proving.USC.Common


theorem scienter2315_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2315) (hProv : MentalStateProven p rung c) :
    Scienter2315Culpable p c := ⟨rung, hReach, hProv⟩


theorem scienter2318_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2318) (hProv : MentalStateProven p rung c) :
    Scienter2318Culpable p c := ⟨rung, hReach, hProv⟩



theorem scienter2320a_intro {p : Person} {c : ComplaintText}
    (rungT : MentalState) (hReachT : rungT.atLeast RequiredMentalState2320aTraffic)
    (hProvT : MentalStateProven p rungT c)
    (rungM : MentalState) (hReachM : rungM.atLeast RequiredMentalState2320aMark)
    (hProvM : MarkKnowledgeProven p rungM c) :
    Scienter2320aCulpable p c :=
  ⟨⟨rungT, hReachT, hProvT⟩, ⟨rungM, hReachM, hProvM⟩⟩



theorem scienter2320b2_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2320b2) (hProv : MentalStateProven p rung c) :
    Scienter2320b2Culpable p c := ⟨rung, hReach, hProv⟩

end Proving.USC.T18.Ch113.Reslice.Scienter
