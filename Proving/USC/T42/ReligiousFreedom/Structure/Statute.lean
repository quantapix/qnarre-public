













import Proving.USC.T42.ReligiousFreedom.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.ReligiousFreedom.Structure

open Proving.USC.Common (ComplaintText)





structure Coherent1996a (c : ComplaintText) : Prop where
  incPurpose    : IncorporationHonored edge_1996a_incorporates_1996 c
  incAlaska     : IncorporationHonored edge_1996a_incorporates_43usc1601 c
  rfraExistsB4  : ReferencedSectionExists edge_1996a_subjectTo_2000bb1_b4 c
  rfraSatB4     : ConstraintSatisfied edge_1996a_subjectTo_2000bb1_b4 c
  rfraSatB6     : ConstraintSatisfied edge_1996a_subjectTo_2000bb_b6 c
  rfraSatB7     : ConstraintSatisfied edge_1996a_subjectTo_2000bb1_b7 c
  override      : OverrideTriggered edge_1996a_notwithstanding_anyLaw c
  savings       : SavingsHonored edge_1996a_savings_indianRights c



structure Coherent1996b (c : ComplaintText) : Prop where
  titleVIExists : ReferencedSectionExists edge_1996b_incorporates_2000d c
  titleVIHonored : IncorporationHonored edge_1996b_incorporates_2000d c
  icwaSavings   : SavingsHonored edge_1996b_savings_25usc1901 c

end Proving.USC.T42.ReligiousFreedom.Structure
