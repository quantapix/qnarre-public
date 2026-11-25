







import Proving.USC.T28.Structure.Types
import Proving.USC.T28.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T28.Structure

open Proving.USC.Common (ComplaintText)





structure Coherent1343 (c : ComplaintText) : Prop where
  conspiracyRefExists : ReferencedSectionExists edge_1343a1_incorporates_1985 c
  conspiracyHonored   : IncorporationHonored edge_1343a1_incorporates_1985 c
  preventionRefExists : ReferencedSectionExists edge_1343a2_incorporates_1985 c
  preventionHonored   : IncorporationHonored edge_1343a2_incorporates_1985 c
  constitutionHonored : IncorporationHonored edge_1343a3_incorporates_constitution c
  equalRightsHonored  : IncorporationHonored edge_1343a3_incorporates_equalRightsActs c
  civilRightsHonored  : IncorporationHonored edge_1343a4_incorporates_civilRightsActs c
  dcRuleHonored       : IncorporationHonored edge_1343a_incorporates_1343b c





inductive Grounded1343 (c : ComplaintText) : Prop
  | viaConspiracy
      (hEx : ReferencedSectionExists edge_1343a1_incorporates_1985 c)
      (hInc : IncorporationHonored edge_1343a1_incorporates_1985 c) : Grounded1343 c
  | viaPrevention
      (hEx : ReferencedSectionExists edge_1343a2_incorporates_1985 c)
      (hInc : IncorporationHonored edge_1343a2_incorporates_1985 c) : Grounded1343 c
  | viaEqualRights
      (hConst : IncorporationHonored edge_1343a3_incorporates_constitution c)
      (hActs : IncorporationHonored edge_1343a3_incorporates_equalRightsActs c) : Grounded1343 c
  | viaCivilRightsActs
      (hInc : IncorporationHonored edge_1343a4_incorporates_civilRightsActs c) : Grounded1343 c



structure Coherent1746 (c : ComplaintText) : Prop where
  withoutUSHonored : IncorporationHonored edge_1746p1_incorporates_perjuryLaw c
  withinUSHonored  : IncorporationHonored edge_1746p2_incorporates_perjuryLaw c




inductive Grounded1746 (c : ComplaintText) : Prop
  | viaWithoutUS
      (h : IncorporationHonored edge_1746p1_incorporates_perjuryLaw c) : Grounded1746 c
  | viaWithinUS
      (h : IncorporationHonored edge_1746p2_incorporates_perjuryLaw c) : Grounded1746 c

end Proving.USC.T28.Structure
