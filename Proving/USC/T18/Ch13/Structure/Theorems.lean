import Proving.USC.T18.Ch13.Structure.Statute









namespace Proving.USC.T18.Ch13.Structure

open Proving.USC.Common

theorem coherent241_intro {c : ComplaintText}
    (rights : IncorporationHonored edge_241_rights c)
    (penalty : ReferencedSectionExists edge_241_penalty c) :
    Coherent241 c := ⟨rights, penalty⟩

theorem coherent242_intro {c : ComplaintText}
    (rights : IncorporationHonored edge_242_rights c)
    (penalty : ReferencedSectionExists edge_242_penalty c) :
    Coherent242 c := ⟨rights, penalty⟩

theorem coherent244_intro {c : ComplaintText}
    (penalty : ReferencedSectionExists edge_244_penalty c) :
    Coherent244 c := ⟨penalty⟩

theorem coherent245_intro {c : ComplaintText}
    (internal4A : IncorporationHonored edge_245_internal_4A c)
    (internal5 : IncorporationHonored edge_245_internal_5 c)
    (savingsState : SavingsClausePreserved edge_245_savings_state c)
    (leoCarveOut : ExceptionApplies edge_245_leo_carveout c)
    (penalty : ReferencedSectionExists edge_245_penalty c) :
    Coherent245 c := ⟨internal4A, internal5, savingsState, leoCarveOut, penalty⟩

theorem coherent246_intro {c : ComplaintText}
    (reliefActs : IncorporationHonored edge_246_relief_acts c)
    (penalty : ReferencedSectionExists edge_246_penalty c) :
    Coherent246 c := ⟨reliefActs, penalty⟩

theorem coherent247_intro {c : ComplaintText}
    (commerce : IncorporationHonored edge_247_a_to_b c)
    (punishRoute : ReferencedSectionExists edge_247_c_to_d c)
    (punishApplies : ReferencedSectionExists edge_247_d_to_ac c) :
    Coherent247 c := ⟨commerce, punishRoute, punishApplies⟩

theorem coherent248_intro {c : ComplaintText}
    (civilFromCriminal : IncorporationHonored edge_248_c_to_a c)
    (savingsPreempt : SavingsClausePreserved edge_248_savings_preempt c)
    (savingsFirstAmd : SavingsClausePreserved edge_248_savings_firstamd c) :
    Coherent248 c := ⟨civilFromCriminal, savingsPreempt, savingsFirstAmd⟩

theorem coherent249_intro {c : ComplaintText}
    (bodilyInjury : IncorporationHonored edge_249_bodilyInjury_1365 c)
    (explosive : IncorporationHonored edge_249_explosive_232 c)
    (firearm : IncorporationHonored edge_249_firearm_921 c)
    (sbi : IncorporationHonored edge_249_sbi_2246 c)
    (supervised : ReferencedSectionExists edge_249_supervised_3583 c)
    (limExcept : ExceptionApplies edge_249_except_d1_d2 c) :
    Coherent249 c := ⟨bodilyInjury, explosive, firearm, sbi, supervised, limExcept⟩

theorem coherent250_intro {c : ComplaintText}
    (chapterRef : ReferencedSectionExists edge_250_chapter c)
    (fhaRef : ReferencedSectionExists edge_250_fha_3631 c)
    (aggSexAbuse : IncorporationHonored edge_250_aggSexAbuse_2241 c)
    (sexAbuse : IncorporationHonored edge_250_sexAbuse_2242 c)
    (sexAct : IncorporationHonored edge_250_sexAct_2246 c)
    (contact : IncorporationHonored edge_250_contact_2244 c) :
    Coherent250 c := ⟨chapterRef, fhaRef, aggSexAbuse, sexAbuse, sexAct, contact⟩



theorem chapterOffenseCoherent_via249_intro {c : ComplaintText}
    (h : Coherent249 c) : ChapterOffenseCoherent c :=
  .via249 h

end Proving.USC.T18.Ch13.Structure
