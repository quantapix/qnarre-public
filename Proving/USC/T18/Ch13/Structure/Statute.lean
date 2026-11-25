import Proving.USC.T18.Ch13.Structure.Predicates












namespace Proving.USC.T18.Ch13.Structure

open Proving.USC.Common


structure Coherent241 (c : ComplaintText) : Prop where
  rights  : IncorporationHonored edge_241_rights c
  penalty : ReferencedSectionExists edge_241_penalty c


structure Coherent242 (c : ComplaintText) : Prop where
  rights  : IncorporationHonored edge_242_rights c
  penalty : ReferencedSectionExists edge_242_penalty c


structure Coherent244 (c : ComplaintText) : Prop where
  penalty : ReferencedSectionExists edge_244_penalty c




structure Coherent245 (c : ComplaintText) : Prop where
  internal4A   : IncorporationHonored edge_245_internal_4A c
  internal5    : IncorporationHonored edge_245_internal_5 c
  savingsState : SavingsClausePreserved edge_245_savings_state c
  leoCarveOut  : ExceptionApplies edge_245_leo_carveout c
  penalty      : ReferencedSectionExists edge_245_penalty c



structure Coherent246 (c : ComplaintText) : Prop where
  reliefActs : IncorporationHonored edge_246_relief_acts c
  penalty    : ReferencedSectionExists edge_246_penalty c



structure Coherent247 (c : ComplaintText) : Prop where
  commerce      : IncorporationHonored edge_247_a_to_b c
  punishRoute   : ReferencedSectionExists edge_247_c_to_d c
  punishApplies : ReferencedSectionExists edge_247_d_to_ac c




structure Coherent248 (c : ComplaintText) : Prop where
  civilFromCriminal : IncorporationHonored edge_248_c_to_a c
  savingsPreempt    : SavingsClausePreserved edge_248_savings_preempt c
  savingsFirstAmd   : SavingsClausePreserved edge_248_savings_firstamd c




structure Coherent249 (c : ComplaintText) : Prop where
  bodilyInjury : IncorporationHonored edge_249_bodilyInjury_1365 c
  explosive    : IncorporationHonored edge_249_explosive_232 c
  firearm      : IncorporationHonored edge_249_firearm_921 c
  sbi          : IncorporationHonored edge_249_sbi_2246 c
  supervised   : ReferencedSectionExists edge_249_supervised_3583 c
  limExcept    : ExceptionApplies edge_249_except_d1_d2 c




structure Coherent250 (c : ComplaintText) : Prop where
  chapterRef  : ReferencedSectionExists edge_250_chapter c
  fhaRef      : ReferencedSectionExists edge_250_fha_3631 c
  aggSexAbuse : IncorporationHonored edge_250_aggSexAbuse_2241 c
  sexAbuse    : IncorporationHonored edge_250_sexAbuse_2242 c
  sexAct      : IncorporationHonored edge_250_sexAct_2246 c
  contact     : IncorporationHonored edge_250_contact_2244 c



inductive ChapterOffenseCoherent (c : ComplaintText) : Prop where
  | via241 : Coherent241 c → ChapterOffenseCoherent c
  | via242 : Coherent242 c → ChapterOffenseCoherent c
  | via244 : Coherent244 c → ChapterOffenseCoherent c
  | via245 : Coherent245 c → ChapterOffenseCoherent c
  | via246 : Coherent246 c → ChapterOffenseCoherent c
  | via247 : Coherent247 c → ChapterOffenseCoherent c
  | via248 : Coherent248 c → ChapterOffenseCoherent c
  | via249 : Coherent249 c → ChapterOffenseCoherent c

end Proving.USC.T18.Ch13.Structure
