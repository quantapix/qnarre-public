







import Proving.USC.T18.Enf.Structure.Predicates

namespace Proving.USC.T18.Enf.Structure

open Proving.USC.Common




structure Coherent1963 (c : ComplaintText) : Prop where
  punishesViolation : IncorporationHonored edge_1963_incorporates_1962 c
  exceptionChannel  : ExceptionApplies edge_1963i_exceptAsProvided_1963l c
  treasuryOverride  : OverrideTriggered edge_1963f_notwithstanding_31_3302b c
  override31Exists  : ReferencedSectionExists edge_1963f_notwithstanding_31_3302b c


structure Coherent1964 (c : ComplaintText) : Prop where
  remediesViolation : IncorporationHonored edge_1964_incorporates_1962 c
  section1962Exists : ReferencedSectionExists edge_1964_incorporates_1962 c



structure Coherent1965 (c : ComplaintText) : Prop where
  servesUnder1964   : IncorporationHonored edge_1965b_incorporates_1964 c
  section1964Exists : ReferencedSectionExists edge_1965b_incorporates_1964 c
  chapterExists     : ReferencedSectionExists edge_1965_subjectTo_ch96 c




inductive CoherentEnforcement (c : ComplaintText) : Prop
  | criminal (h : Coherent1963 c) : CoherentEnforcement c
  | civil    (h : Coherent1964 c) : CoherentEnforcement c
  | venue    (h : Coherent1965 c) : CoherentEnforcement c

end Proving.USC.T18.Enf.Structure
