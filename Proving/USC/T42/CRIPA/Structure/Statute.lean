











import Proving.USC.T42.CRIPA.Structure.Predicates

namespace Proving.USC.T42.CRIPA.Structure

open Proving.USC.Common (ComplaintText)



structure Coherent1997a (c : ComplaintText) : Prop where
  defExists      : ReferencedSectionExists edge_1997a_incorporates_1997 c
  defHonored     : IncorporationHonored edge_1997a_incorporates_1997 c
  jailLimitHonored : IncorporationHonored edge_1997a_incorporates_1997_1Bii c


structure Coherent1997b (c : ComplaintText) : Prop where
  actionExists  : ReferencedSectionExists edge_1997b_incorporates_1997a c
  actionHonored : IncorporationHonored edge_1997b_incorporates_1997a c



structure Coherent1997c (c : ComplaintText) : Prop where
  defExists  : ReferencedSectionExists edge_1997c_incorporates_1997 c
  defHonored : IncorporationHonored edge_1997c_incorporates_1997 c






structure Coherent1997e (c : ComplaintText) : Prop where
  s1983Exists         : ReferencedSectionExists edge_1997e_subjectTo_1983 c
  exhaustionFires     : OverrideTriggered edge_1997e_subjectTo_1983 c
  grievanceExc1997a   : ExceptionApplies edge_1997e_exceptAsProvided_1997a c
  grievanceExc1997c   : ExceptionApplies edge_1997e_exceptAsProvided_1997c c
  feeRegimeExists     : ReferencedSectionExists edge_1997e_subjectTo_1988 c
  rate3006AHonored    : IncorporationHonored edge_1997e_incorporates_t18_3006A c
  sexualAct2246Honored : IncorporationHonored edge_1997e_incorporates_t18_2246 c






inductive Section1997eGate (c : ComplaintText) : Prop where
  | exhaustion (h : OverrideTriggered edge_1997e_subjectTo_1983 c) : Section1997eGate c
  | grievance1997a (h : ExceptionApplies edge_1997e_exceptAsProvided_1997a c) : Section1997eGate c
  | grievance1997c (h : ExceptionApplies edge_1997e_exceptAsProvided_1997c c) : Section1997eGate c
  | waiverNotwithstanding (h : OverrideTriggered edge_1997e_notwithstanding_procedure c) : Section1997eGate c


structure Coherent1997f (c : ComplaintText) : Prop where
  reportVehicleExists : ReferencedSectionExists edge_1997f_incorporates_t28_522 c



structure Coherent1997h (c : ComplaintText) : Prop where
  investExists  : ReferencedSectionExists edge_1997h_incorporates_1997a c
  intervExists  : ReferencedSectionExists edge_1997h_incorporates_1997c c
  investHonored : IncorporationHonored edge_1997h_incorporates_1997a c
  intervHonored : IncorporationHonored edge_1997h_incorporates_1997c c



structure CoherentSavings (c : ComplaintText) : Prop where
  noStandards    : SavingsClauseRespected edge_1997i_savings_subchapter c
  noExpandRestrict : SavingsClauseRespected edge_1997j_savings_existing_law c



structure CoherentCRIPA (c : ComplaintText) : Prop where
  c1997a   : Coherent1997a c
  c1997b   : Coherent1997b c
  c1997c   : Coherent1997c c
  c1997e   : Coherent1997e c
  c1997f   : Coherent1997f c
  c1997h   : Coherent1997h c
  savings  : CoherentSavings c

end Proving.USC.T42.CRIPA.Structure
