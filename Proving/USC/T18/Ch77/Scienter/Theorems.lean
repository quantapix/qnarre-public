import Proving.USC.T18.Ch77.Scienter.Types
import Proving.USC.T18.Ch77.Scienter.Predicates
import Proving.USC.T18.Ch77.Scienter.Statute
import Proving.USC.Common.Types
set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Scienter

open Proving.USC.Common



theorem scienterCulpable_intro {required : MentalState} {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast required)
    (hProv : MentalStateProven p rung c) :
    ScienterCulpable required p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1581_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1581)
    (hProv : MentalStateProven p rung c) :
    Scienter1581Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1583_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1583)
    (hProv : MentalStateProven p rung c) :
    Scienter1583Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1589_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1589)
    (hProv : MentalStateProven p rung c) :
    Scienter1589Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1589Venture_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1589Venture)
    (hProv : MentalStateProven p rung c) :
    Scienter1589VentureCulpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1590_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1590)
    (hProv : MentalStateProven p rung c) :
    Scienter1590Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1591_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1591)
    (hProv : MentalStateProven p rung c) :
    Scienter1591Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1591Fact_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1591Fact)
    (hProv : MentalStateProven p rung c) :
    Scienter1591FactCulpable p c :=
  scienterCulpable_intro rung hReach hProv



theorem scienter1591Age_fromObservation_intro {p : Person} {c : ComplaintText}
    (hObs : HadReasonableOpportunityToObserve p c) :
    Scienter1591AgeCulpable p c :=
  Or.inl hObs



theorem scienter1591Age_fromProven_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1591Fact)
    (hProv : MentalStateProven p rung c) :
    Scienter1591AgeCulpable p c :=
  Or.inr (scienterCulpable_intro rung hReach hProv)


theorem scienter1592_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1592)
    (hProv : MentalStateProven p rung c) :
    Scienter1592Culpable p c :=
  scienterCulpable_intro rung hReach hProv


theorem scienter1592Purpose_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState1592Purpose)
    (hProv : MentalStateProven p rung c) :
    Scienter1592PurposeCulpable p c :=
  scienterCulpable_intro rung hReach hProv

end Proving.USC.T18.Ch77.Scienter
