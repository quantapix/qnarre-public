








import Proving.USC.T42.TitleVII.Structure.Predicates

namespace Proving.USC.T42.TitleVII.Structure

open Proving.USC.Common






structure Coherent2000e2 (c : ComplaintText) : Prop where
  incorporatesDefs   : IncorporationHonored edge_2000e2_incorporates_2000e c
  enforcementExists  : ReferencedSectionExists edge_2000e2_subjectTo_2000e5 c
  bfoqResolves       : ReferencedSectionExists edge_2000e2_exceptAsProvided_bfoq c
  seniorityResolves  : ReferencedSectionExists edge_2000e2h_notwithstanding_2000e2a c



structure Coherent2000e3 (c : ComplaintText) : Prop where
  incorporatesDefs      : IncorporationHonored edge_2000e3_incorporates_2000e c
  incorporatesPractices : IncorporationHonored edge_2000e3_incorporates_2000e2 c



structure Coherent2000e5 (c : ComplaintText) : Prop where
  incorporatesDefs       : IncorporationHonored edge_2000e5_incorporates_2000e c
  incorporatesCommission : IncorporationHonored edge_2000e5_incorporates_2000e4 c




structure Coherent2000e16 (c : ComplaintText) : Prop where
  importsRemedies   : IncorporationHonored edge_2000e16_incorporates_2000e5 c
  importsPractices  : IncorporationHonored edge_2000e16_incorporates_2000e2 c
  remediesExist     : ReferencedSectionExists edge_2000e16_incorporates_2000e5 c







inductive StructuralDefense2000e2 (c : ComplaintText) : Prop
  | exemption   (h : ExceptionApplies edge_2000e1_exceptAsProvided_2000e2 c)
  | bfoq        (h : ExceptionApplies edge_2000e2_exceptAsProvided_bfoq c)
  | seniority   (h : OverrideTriggered edge_2000e2h_notwithstanding_2000e2a c)
  | foreignLaw  (h : SavingsClauseHonored edge_2000e1_savings c)




structure CoherentTitleVII (c : ComplaintText) : Prop where
  prohibition : Coherent2000e2 c
  retaliation : Coherent2000e3 c
  enforcement : Coherent2000e5 c
  federal     : Coherent2000e16 c
  contractRev : ReferencedSectionExists edge_2000e17_subjectTo_2000e5 c

end Proving.USC.T42.TitleVII.Structure
