












import Proving.USC.T29.LMRA.Structure.Predicates

namespace Proving.USC.T29.LMRA.Structure

open Proving.USC.Common (ComplaintText)



structure Coherent172 (c : ComplaintText) : Prop where
  payRegimeExists : ReferencedSectionExists edge_172b_incorporates_t5_pay c
  transferHonored : IncorporationHonored edge_172d_incorporates_29s51 c



structure Coherent173 (c : ComplaintText) : Prop where
  committeeRouteHonored : IncorporationHonored edge_173e_incorporates_175a c
  adrRouteExists        : ReferencedSectionExists edge_173f_incorporates_t5_adr c



structure Coherent175a (c : ComplaintText) : Prop where
  organizingGuardHonored : IncorporationHonored edge_175a_incorporates_157 c



structure Coherent177 (c : ComplaintText) : Prop where
  subpoenaPowerExists : ReferencedSectionExists edge_177c_incorporates_t15 c
  subpoenaHonored     : IncorporationHonored edge_177c_incorporates_t15 c




structure Coherent178 (c : ComplaintText) : Prop where
  reportIncorporated : IncorporationHonored edge_178a_incorporates_176 c
  norrisOverride     : OverrideTriggered edge_178b_overrides_ch6 c
  reviewRouteExists  : ReferencedSectionExists edge_178c_incorporates_t28 c



structure Coherent179 (c : ComplaintText) : Prop where
  injunctionIncorporated : IncorporationHonored edge_179a_incorporates_178 c



structure Coherent182 (c : ComplaintText) : Prop where
  rlaExists        : ReferencedSectionExists edge_182_except_rla c
  exemptionApplies : ExceptionApplies edge_182_except_rla c



structure Coherent183 (c : ComplaintText) : Prop where
  noticeClausesHonored : IncorporationHonored edge_183a_incorporates_158d c




structure Coherent185 (c : ComplaintText) : Prop where
  chapterDefsHonored : IncorporationHonored edge_185_incorporates_chapDefs c





structure Coherent186 (c : ComplaintText) : Prop where
  motorVehicleDefExists : ReferencedSectionExists edge_186b_incorporates_t49 c
  committeeCrossRef      : IncorporationHonored edge_186c9_incorporates_175a c
  noticeSubjectTo        : ReferencedSectionExists edge_186e_subjectTo_t28s381 c
  antiInjunctionOverride : OverrideTriggered edge_186e_overrides_antiInjunction c




structure Coherent187 (c : ComplaintText) : Prop where
  ulpDefIncorporated : IncorporationHonored edge_187a_incorporates_158b4 c
  s185Limitations    : ReferencedSectionExists edge_187b_subjectTo_185 c





inductive InjunctionOverridePath (c : ComplaintText) : Prop where
  | nationalEmergency (h : OverrideTriggered edge_178b_overrides_ch6 c) :
      InjunctionOverridePath c
  | financialRestriction (h : OverrideTriggered edge_186e_overrides_antiInjunction c) :
      InjunctionOverridePath c

end Proving.USC.T29.LMRA.Structure
