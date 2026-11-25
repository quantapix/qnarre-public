













import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch117.Recert.Scienter.Types
import Proving.USC.T18.Ch117.Recert.Scienter.Predicates
import Proving.USC.T18.Ch117.Recert.Scienter.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Scienter

open Proving.USC.Common




theorem atLeast_refl (x : MentalState) : x.atLeast x := Nat.le_refl x.rank



theorem atLeast_trans {x y z : MentalState}
    (hxy : x.atLeast y) (hyz : y.atLeast z) : x.atLeast z :=
  Nat.le_trans hyz hxy



theorem lattice_ladder :
    MentalState.atLeast .Specific .Knowledge
    ∧ MentalState.atLeast .Knowledge .Recklessness
    ∧ MentalState.atLeast .Recklessness .Negligence
    ∧ MentalState.atLeast .Negligence .StrictLiability := by
  decide



theorem specific_reaches_all (x : MentalState) : MentalState.atLeast .Specific x := by
  cases x <;> decide




theorem recklessness_does_not_reach_knowledge :
    ¬ MentalState.atLeast .Recklessness .Knowledge := by
  decide



theorem required2421A_promoteFacilitate :
    RequiredRung2421A .PromoteFacilitateProstitution = some .Specific := rfl

theorem required2421A_trafficking :
    RequiredRung2421A .ContributionToSexTrafficking = some .Recklessness := rfl



theorem required2421A_fiveOrMore_unspecified :
    RequiredRung2421A .FiveOrMorePersons = none := rfl

theorem required2423_transportation :
    RequiredRung2423 .TransportationOfIndividual = some .Knowledge := rfl

theorem required2423_intendedProstitution :
    RequiredRung2423 .IntendedProstitutionOrChargeableSexualActivity = some .Specific := rfl

theorem required2423_intendedIllicit :
    RequiredRung2423 .IntendedIllicitSexualConduct = some .Specific := rfl

theorem required2423_engaging :
    RequiredRung2423 .EngagingInIllicitSexualConduct = some .StrictLiability := rfl

theorem required2423_organizational :
    RequiredRung2423 .OrganizationalActInFurtherance = some .Specific := rfl

theorem required2423_commercialGain :
    RequiredRung2423 .CommercialAdvantageOrPrivateFinancialGain = some .Specific := rfl

theorem required2423_travelerIntent :
    RequiredRung2423 .TravelerIntentToEngageInIllicitSexualConduct = some .Knowledge := rfl




theorem required2423_age_unspecified : RequiredRung2423 .AgeUnder18 = none := rfl


theorem required2423_travel_unspecified : RequiredRung2423 .TravelInCommerce = none := rfl



theorem required2423f_is_object_rung (target : Provision2423) :
    RequiredRung2423f target = OffenceRung2423 target := rfl





theorem scienterMet2421A_intro {p : Person} {req : MentalState}
    {el : ScienterElement2421A} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast req) (hProv : MentalStateProvenAsTo2421A p rung el c) :
    ScienterMet2421A p req el c :=
  ⟨rung, hReach, hProv⟩



theorem scienterMet2423_intro {p : Person} {req : MentalState}
    {el : ScienterElement2423} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast req) (hProv : MentalStateProvenAsTo2423 p rung el c) :
    ScienterMet2423 p req el c :=
  ⟨rung, hReach, hProv⟩





theorem scienterMet2421A_mono {p : Person} {req req' : MentalState}
    {el : ScienterElement2421A} {c : ComplaintText}
    (hOrder : req.atLeast req') (h : ScienterMet2421A p req el c) :
    ScienterMet2421A p req' el c :=
  match h with
  | ⟨rung, hReach, hProv⟩ => ⟨rung, atLeast_trans hReach hOrder, hProv⟩


theorem scienterMet2423_mono {p : Person} {req req' : MentalState}
    {el : ScienterElement2423} {c : ComplaintText}
    (hOrder : req.atLeast req') (h : ScienterMet2423 p req el c) :
    ScienterMet2423 p req' el c :=
  match h with
  | ⟨rung, hReach, hProv⟩ => ⟨rung, atLeast_trans hReach hOrder, hProv⟩


theorem culpable2421Aa_intro {p : Person} {c : ComplaintText}
    (hIntent : ScienterMet2421A p .Specific .PromoteFacilitateProstitution c) :
    Culpable2421Aa p c := hIntent


theorem culpable2421Ab1_intro {p : Person} {c : ComplaintText}
    (hIntent : ScienterMet2421A p .Specific .PromoteFacilitateProstitution c) :
    Culpable2421Ab1 p c := hIntent


theorem culpable2421Ab2_intro {p : Person} {c : ComplaintText}
    (hIntent : ScienterMet2421A p .Specific .PromoteFacilitateProstitution c)
    (hReckless : ScienterMet2421A p .Recklessness .ContributionToSexTrafficking c) :
    Culpable2421Ab2 p c := ⟨hIntent, hReckless⟩




theorem culpable2421AaUndefeated_intro {p : Person} {c : ComplaintText}
    (hCulpable : Culpable2421Aa p c)
    (hNoDefence : ¬ PromotionLegalInTargetedJurisdiction p c) :
    Culpable2421AaUndefeated p c := ⟨hCulpable, hNoDefence⟩


theorem culpable2421Ab1Undefeated_intro {p : Person} {c : ComplaintText}
    (hCulpable : Culpable2421Ab1 p c)
    (hNoDefence : ¬ PromotionLegalInTargetedJurisdiction p c) :
    Culpable2421Ab1Undefeated p c := ⟨hCulpable, hNoDefence⟩





theorem culpable2421Ab2_survives_jurisdictional_defence {p : Person} {c : ComplaintText}
    (hCulpable : Culpable2421Ab2 p c)
    (_hDefence : PromotionLegalInTargetedJurisdiction p c) :
    Culpable2421Ab2 p c := hCulpable


theorem culpable2423a_intro {p : Person} {c : ComplaintText}
    (hTransport : ScienterMet2423 p .Knowledge .TransportationOfIndividual c)
    (hPurpose : ScienterMet2423 p .Specific .IntendedProstitutionOrChargeableSexualActivity c)
    (hConcurrent : IntentHeldAtTimeOfTravel p c) :
    Culpable2423a p c := ⟨hTransport, hPurpose, hConcurrent⟩


theorem culpable2423b_intro {p : Person} {c : ComplaintText}
    (hPurpose : ScienterMet2423 p .Specific .IntendedIllicitSexualConduct c)
    (hConcurrent : IntentHeldAtTimeOfTravel p c) :
    Culpable2423b p c := ⟨hPurpose, hConcurrent⟩


theorem culpable2423c_intro {p : Person} {c : ComplaintText}
    (hEngaged : ScienterMet2423 p .StrictLiability .EngagingInIllicitSexualConduct c) :
    Culpable2423c p c := hEngaged


theorem culpable2423d_intro {p : Person} {c : ComplaintText}
    (hFurtherance : ScienterMet2423 p .Specific .OrganizationalActInFurtherance c) :
    Culpable2423d p c := hFurtherance


theorem culpable2423e_intro {p : Person} {c : ComplaintText}
    (hGain : ScienterMet2423 p .Specific .CommercialAdvantageOrPrivateFinancialGain c)
    (hKnows : ScienterMet2423 p .Knowledge .TravelerIntentToEngageInIllicitSexualConduct c) :
    Culpable2423e p c := ⟨hGain, hKnows⟩


theorem culpable2423f_intro {p : Person} {c : ComplaintText} {target : Provision2423}
    (rung : MentalState) (hReach : rung.atLeast (RequiredRung2423f target))
    (hProv : MentalStateProven p rung c) :
    Culpable2423f p target c := ⟨rung, hReach, hProv⟩



theorem notDefeatedByAgeBelief_intro {culpable : Prop} {p : Person} {c : ComplaintText}
    (hCulpable : culpable) (hNoDefence : ¬ ReasonableBeliefOfMajority p c) :
    NotDefeatedByAgeBelief culpable p c := ⟨hCulpable, hNoDefence⟩




theorem specific_pleading_meets_2423a_transport {p : Person} {c : ComplaintText}
    (h : ScienterMet2423 p .Specific .TransportationOfIndividual c) :
    ScienterMet2423 p .Knowledge .TransportationOfIndividual c :=
  scienterMet2423_mono (by decide) h

end Proving.USC.T18.Ch117.Recert.Scienter
