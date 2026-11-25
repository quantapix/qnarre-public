













import Proving.USC.T09.Structure.Predicates

namespace Proving.USC.T09.Structure

open Proving.USC.Common




structure Coherent2 (c : ComplaintText) : Prop where
  defsExist     : ReferencedSectionExists edge_s2_incorporates_s1 c
  defsHonored   : IncorporationHonored edge_s2_incorporates_s1 c
  savingsExists : ReferencedSectionExists edge_s2_savings_contractLaw c
  ch4Exists     : ReferencedSectionExists edge_s2_exceptAsProvided_ch4 c



structure Coherent16 (c : ComplaintText) : Prop where
  s3Exists     : ReferencedSectionExists edge_s16_incorporates_s3 c
  s4Exists     : ReferencedSectionExists edge_s16_incorporates_s4 c
  s206Exists   : ReferencedSectionExists edge_s16_incorporates_s206 c
  t28Exists    : ReferencedSectionExists edge_s16_exceptAsProvided_t28_1292b c



structure Coherent202 (c : ComplaintText) : Prop where
  s2Exists   : ReferencedSectionExists edge_s202_incorporates_s2 c
  s2Honored  : IncorporationHonored edge_s202_incorporates_s2 c



structure Coherent208 (c : ComplaintText) : Prop where
  ch1Exists  : ReferencedSectionExists edge_s208_incorporates_ch1 c
  ch1Honored : IncorporationHonored edge_s208_incorporates_ch1 c
  ch4Exists  : ReferencedSectionExists edge_s208_subjectTo_ch4 c



structure Coherent302 (c : ComplaintText) : Prop where
  s202Honored : IncorporationHonored edge_s302_incorporates_s202 c
  s203Honored : IncorporationHonored edge_s302_incorporates_s203 c
  s204Honored : IncorporationHonored edge_s302_incorporates_s204 c
  s205Honored : IncorporationHonored edge_s302_incorporates_s205 c
  s207Honored : IncorporationHonored edge_s302_incorporates_s207 c


structure Coherent307 (c : ComplaintText) : Prop where
  ch1Exists  : ReferencedSectionExists edge_s307_incorporates_ch1 c
  ch1Honored : IncorporationHonored edge_s307_incorporates_ch1 c
  ch4Exists  : ReferencedSectionExists edge_s307_subjectTo_ch4 c



structure Coherent401 (c : ComplaintText) : Prop where
  t18Exists  : ReferencedSectionExists edge_s401_incorporates_t18_2246 c
  t18Honored : IncorporationHonored edge_s401_incorporates_t18_2246 c




inductive OverridePath (c : ComplaintText) : Prop where

  | ch4SexualMisconduct  (h : OverrideTriggered edge_s402_notwithstanding_title c)        : OverridePath c

  | ch4OverConvention208 (h : OverrideTriggered edge_s208_subjectTo_ch4 c)                : OverridePath c
  | ch4OverConvention307 (h : OverrideTriggered edge_s307_subjectTo_ch4 c)                : OverridePath c

  | panamaOverNY         (h : OverrideTriggered edge_s305_lexSpecialis_panamaOverNY c)    : OverridePath c

end Proving.USC.T09.Structure
