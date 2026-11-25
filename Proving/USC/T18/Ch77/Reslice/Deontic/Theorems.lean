
















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Deontic.Types
import Proving.USC.T18.Ch77.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch77.Reslice.Deontic.Statute

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch77.Reslice.Deontic




theorem prohibition1590aViolated_intro {p v : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hCondition : LaborOrServicesInViolationOfChapter1590a v c)
    (hScienter : ActedKnowingly1590a p c)
    (hAct : TraffickingActOccurred1590a p v c) :
    Prohibition1590aViolated p v c :=
  ⟨⟨hAddressee, hCondition⟩, hScienter, hAct⟩


theorem prohibition1590aAggravated_intro {p v : Person} {c : ComplaintText}
    (hBase : Prohibition1590aViolated p v c)
    (hAggravator : AggravatingResultOccurred1590a p v c) :
    Prohibition1590aAggravated p v c :=
  ⟨hBase, hAggravator⟩


theorem prohibition1590bViolated_intro {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hAct : ObstructedEnforcement1590b p c) :
    Prohibition1590bViolated p c :=
  ⟨⟨hAddressee⟩, hAct⟩




theorem prohibitedActBranch1591a_recruitment_intro
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (hNexus : JurisdictionalNexus1591a1 p c)
    (hAct : RecruitmentActOccurred1591a1 p v c) :
    ProhibitedActBranch1591a p v ven c :=
  ProhibitedActBranch1591a.recruitment hNexus hAct


theorem prohibitedActBranch1591a_benefit_intro
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (hVenture : IsVenture1591e6 ven c)
    (hParticipation : IsParticipationInVenture1591e4 p ven c)
    (hBenefit : BenefitedFromVenture1591a2 p ven c)
    (hEngaged : VentureEngagedInProhibitedAct1591a2 ven v c) :
    ProhibitedActBranch1591a p v ven c :=
  ProhibitedActBranch1591a.benefit hVenture hParticipation hBenefit hEngaged


theorem prohibition1591aViolated_intro
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hScienter : ActedKnowingly1591a p c)
    (hMensRea : MensReaObject1591a p v c)
    (hBranch : ProhibitedActBranch1591a p v ven c) :
    Prohibition1591aViolated p v ven c :=
  ⟨⟨hAddressee, hScienter, hMensRea⟩, hBranch⟩


theorem penaltyTier1591b_aggravated_intro
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (hViolation : Prohibition1591aViolated p v ven c)
    (hTrigger : EffectedByProscribedMeans1591b1 p v c ∨ VictimUnderFourteen1591b1 v c) :
    PenaltyTier1591b p v ven c :=
  PenaltyTier1591b.aggravated hViolation hTrigger


theorem penaltyTier1591b_standard_intro
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (hViolation : Prohibition1591aViolated p v ven c)
    (hNotEffected : ¬ EffectedByProscribedMeans1591b1 p v c)
    (hAgeBand : VictimAtLeastFourteenUnderEighteen1591b2 v c) :
    PenaltyTier1591b p v ven c :=
  PenaltyTier1591b.standard hViolation hNotEffected hAgeBand


theorem permission1591cAvailable_intro {p v : Person} {c : ComplaintText}
    (hAddressee : AddresseeGovernment c)
    (hPosture : ProsecutionUnderSubsection1591a1 p c)
    (hCondition : ReasonableOpportunityToObserve1591c p v c) :
    Permission1591cAvailable p v c :=
  ⟨hAddressee, hPosture, hCondition⟩


theorem permission1591cExercised_intro {p v : Person} {c : ComplaintText}
    (hAvailable : Permission1591cAvailable p v c)
    (hOmission : OmitsProofOfAgeKnowledge1591c c) :
    Permission1591cExercised p v c :=
  ⟨hAvailable, hOmission⟩


theorem prohibition1591dViolated_intro {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hAct : ObstructedEnforcement1591d p c) :
    Prohibition1591dViolated p c :=
  ⟨⟨hAddressee⟩, hAct⟩




theorem prohibition1592aViolated_intro
    {p v : Person} {d : Document} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hScienter : ActedKnowingly1592a p c)
    (hDocument : IsCoveredDocument1592a d v c)
    (hCondition : CircumstanceBranch1592a p v c)
    (hNotExempt : ¬ Exempt1592b p c)
    (hAct : DocumentActOccurred1592a p d v c) :
    Prohibition1592aViolated p v d c :=
  ⟨⟨hAddressee, hScienter, hDocument, hCondition, hNotExempt⟩, hAct⟩


theorem prohibition1592cViolated_intro {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeWhoever p c)
    (hAct : ObstructedEnforcement1592c p c) :
    Prohibition1592cViolated p c :=
  ⟨⟨hAddressee⟩, hAct⟩








theorem exempt1592b_blocks_prohibition1592aViolated
    {p v : Person} {d : Document} {c : ComplaintText}
    (hExempt : Exempt1592b p c) : ¬ Prohibition1592aViolated p v d c :=
  fun hViolated => hViolated.1.notExempt hExempt



theorem penaltyTier1591b_implies_prohibition1591aViolated
    {p v : Person} {ven : Venture} {c : ComplaintText}
    (h : PenaltyTier1591b p v ven c) : Prohibition1591aViolated p v ven c := by
  cases h with
  | aggravated hViolation _ => exact hViolation
  | standard hViolation _ _ => exact hViolation




theorem advertising_forces_actual_knowledge_1591a
    {p v : Person} {c : ComplaintText}
    (hAdvertising : ActConstitutingViolationIsAdvertising1591a p c)
    (hMensRea : MensReaObject1591a p v c) :
    KnewProscribedMeansOrMinority1591a p v c := by
  cases hMensRea with
  | inl hKnew => exact hKnew
  | inr hReckless => exact absurd hAdvertising hReckless.2

end Proving.USC.T18.Ch77.Reslice.Deontic
