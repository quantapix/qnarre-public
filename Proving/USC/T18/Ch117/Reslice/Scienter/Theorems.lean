




import Proving.USC.T18.Ch117.Reslice.Scienter.Types
import Proving.USC.T18.Ch117.Reslice.Scienter.Predicates
import Proving.USC.T18.Ch117.Reslice.Scienter.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Scienter

open Proving.USC.Common



theorem meetsRequirement_intro {p : Person} {prov : Provision} {c : ComplaintText}
    (req rung : MentalState) (hReq : RequiredMentalState prov = some req)
    (hReach : rung.atLeast req) (hProv : MentalStateProven p prov rung c) :
    MeetsRequirement p prov c := ⟨req, rung, hReq, hReach, hProv⟩



theorem meetsRequirement_of_strict {p : Person} {prov : Provision} {c : ComplaintText}
    (rung : MentalState) (hReq : RequiredMentalState prov = some .StrictLiability)
    (hProv : MentalStateProven p prov rung c) : MeetsRequirement p prov c :=
  ⟨.StrictLiability, rung, hReq, MentalState.atLeast_strict rung, hProv⟩

theorem defenseEstablished_intro {p : Person} {d : Defense} {c : ComplaintText}
    (h : AffirmativeDefenseEstablished p d (RequiredStandard d) c) :
    DefenseEstablished p d c := h



theorem scienter2421Aa_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hRung : MeetsRequirement p .s2421A_a c)
    (hObj : IntentToPromoteOrFacilitateProstitution p s c) :
    Scienter2421Aa p s c := ⟨hRung, hObj⟩

theorem scienter2421AbChapeau_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hRung : MeetsRequirement p .s2421A_bChapeau c)
    (hObj : IntentToPromoteOrFacilitateProstitution p s c) :
    Scienter2421AbChapeau p s c := ⟨hRung, hObj⟩

theorem scienter2421Ab1_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hCh : Scienter2421AbChapeau p s c)
    (hCount : MeetsRequirement p .s2421A_b1 c) : Scienter2421Ab1 p s c := ⟨hCh, hCount⟩

theorem scienter2421Ab2_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hCh : Scienter2421AbChapeau p s c)
    (hReck : MeetsRequirement p .s2421A_b2 c) : Scienter2421Ab2 p s c := ⟨hCh, hReck⟩

theorem aggravated2421AScienter_intro_fiveOrMore {p : Person}
    {s : InteractiveComputerService} {c : ComplaintText} (h : Scienter2421Ab1 p s c) :
    Aggravated2421AScienter p s c := .fiveOrMore h

theorem aggravated2421AScienter_intro_reckless {p : Person}
    {s : InteractiveComputerService} {c : ComplaintText} (h : Scienter2421Ab2 p s c) :
    Aggravated2421AScienter p s c := .recklessTrafficking h

theorem culpable2421Aa_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hSc : Scienter2421Aa p s c)
    (hNoDef : ¬ DefenseEstablished p .jurisdictionLegality2421Ae c) :
    Culpable2421Aa p s c := ⟨hSc, hNoDef⟩

theorem culpable2421Ab1_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hSc : Scienter2421Ab1 p s c)
    (hNoDef : ¬ DefenseEstablished p .jurisdictionLegality2421Ae c) :
    Culpable2421Ab1 p s c := ⟨hSc, hNoDef⟩



theorem culpable2421Ab2_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hSc : Scienter2421Ab2 p s c) :
    Culpable2421Ab2 p s c := hSc



theorem scienter2423a_intro {p v : Person} {t : Conveyance} {c : ComplaintText}
    (hKnow : MeetsRequirement p .s2423_aTransport c)
    (hPurposeRung : MeetsRequirement p .s2423_aPurpose c)
    (hObj : IntentThatIndividualEngageInProhibitedSexualActivity p v c)
    (hConc : IntentConcurrentWithConveyance p t c) :
    Scienter2423a p v t c := ⟨hKnow, hPurposeRung, hObj, hConc⟩

theorem scienter2423b_intro {p : Person} {k : IllicitSexualConduct} {t : Conveyance}
    {c : ComplaintText} (hRung : MeetsRequirement p .s2423_b c)
    (hObj : IntentToEngageInIllicitSexualConduct p k c)
    (hConc : IntentConcurrentWithConveyance p t c) :
    Scienter2423b p k t c := ⟨hRung, hObj, hConc⟩

theorem scienter2423c_intro {p : Person} {c : ComplaintText}
    (h : MeetsRequirement p .s2423_c c) : Scienter2423c p c := h


theorem scienter2423c_of_anyRung {p : Person} {c : ComplaintText} (rung : MentalState)
    (hProv : MentalStateProven p .s2423_c rung c) : Scienter2423c p c :=
  meetsRequirement_of_strict rung rfl hProv

theorem scienter2423d_intro {p : Person} {e : Entity} {k : IllicitSexualConduct}
    {c : ComplaintText} (hRung : MeetsRequirement p .s2423_d c)
    (hFurther : PurposeOfIllicitSexualConductThroughOrganization p e k c) :
    Scienter2423d p e k c := ⟨hRung, hFurther⟩

theorem scienter2423e_intro {p t : Person} {c : ComplaintText}
    (hGainRung : MeetsRequirement p .s2423_eGain c)
    (hGain : PurposeOfCommercialAdvantageOrPrivateFinancialGain p c)
    (hKnowRung : MeetsRequirement p .s2423_eKnowledge c)
    (hKnow : KnowledgeOfTravelersIllicitIntent p t c) :
    Scienter2423e p t c := ⟨hGainRung, hGain, hKnowRung, hKnow⟩

theorem scienter2423_intro_transportMinor {p : Person} {c : ComplaintText}
    (v : Person) (t : Conveyance) (h : Scienter2423a p v t c) :
    Scienter2423 p c := .transportMinor v t h

theorem scienter2423_intro_travelWithIntent {p : Person} {c : ComplaintText}
    (k : IllicitSexualConduct) (t : Conveyance) (h : Scienter2423b p k t c) :
    Scienter2423 p c := .travelWithIntent k t h

theorem scienter2423_intro_engagedAbroad {p : Person} {c : ComplaintText}
    (h : Scienter2423c p c) : Scienter2423 p c := .engagedAbroad h

theorem scienter2423_intro_organisationalNexus {p : Person} {c : ComplaintText}
    (e : Entity) (k : IllicitSexualConduct) (h : Scienter2423d p e k c) :
    Scienter2423 p c := .organisationalNexus e k h

theorem scienter2423_intro_facilitationForGain {p : Person} {c : ComplaintText}
    (t : Person) (h : Scienter2423e p t c) : Scienter2423 p c := .facilitationForGain t h



theorem scienter2423f_intro {p : Person} {c : ComplaintText} (h : Scienter2423 p c) :
    Scienter2423f p c := h

theorem defense2423i_intro {p : Person} {c : ComplaintText}
    (hPosture : ProsecutionRestsOnCommercialSexActTheory c)
    (hCarried : DefenseEstablished p .reasonableBeliefAdult2423i c) :
    Defense2423i p c := ⟨hPosture, hCarried⟩

theorem culpable2423_intro {p : Person} {c : ComplaintText} (hSc : Scienter2423 p c)
    (hNoDef : ¬ Defense2423i p c) : Culpable2423 p c := ⟨hSc, hNoDef⟩



section Checks
#check (Person : Type)
#check (ComplaintText : Type)
#check (Entity : Type)
#check @MentalStateProven
#check @Culpable2423
#print axioms culpable2423_intro
#print axioms scienter2423c_of_anyRung
#print axioms culpable2421Aa_intro
end Checks

end Proving.USC.T18.Ch117.Reslice.Scienter
