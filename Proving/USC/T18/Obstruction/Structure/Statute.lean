













import Proving.USC.Common.Types
import Proving.USC.T18.Obstruction.Structure.Types
import Proving.USC.T18.Obstruction.Structure.Predicates

namespace Proving.USC.T18.Obstruction.Structure

open Proving.USC.Common



structure Coherent1503 (c : ComplaintText) : Prop where
  penalty1111Exists  : ReferencedSectionExists edge_1503_incorporates_1111 c
  penalty1112Exists  : ReferencedSectionExists edge_1503_incorporates_1112 c
  penalty1111Honored : IncorporationHonored    edge_1503_incorporates_1111 c
  penalty1112Honored : IncorporationHonored    edge_1503_incorporates_1112 c




structure Coherent1512 (c : ComplaintText) : Prop where
  defs1515Exists      : ReferencedSectionExists edge_1512_incorporates_1515 c
  defs1515Honored     : IncorporationHonored    edge_1512_incorporates_1515 c
  penalty1111Exists   : ReferencedSectionExists edge_1512_incorporates_1111 c
  penalty1112Exists   : ReferencedSectionExists edge_1512_incorporates_1112 c
  penalty1111Honored  : IncorporationHonored    edge_1512_incorporates_1111 c
  penalty1112Honored  : IncorporationHonored    edge_1512_incorporates_1112 c






inductive Coherent1512Path (c : ComplaintText) : Prop
  | savings (h : ExceptionApplies  edge_1512_savings_1515c c)      : Coherent1512Path c
  | coVenue (h : OverrideTriggered edge_1512_lexSpecialis_1503 c)  : Coherent1512Path c




structure Coherent1513 (c : ComplaintText) : Prop where
  defs1515Exists      : ReferencedSectionExists edge_1513_incorporates_1515 c
  defs1515Honored     : IncorporationHonored    edge_1513_incorporates_1515 c
  penalty1111Exists   : ReferencedSectionExists edge_1513_incorporates_1111 c
  penalty1112Exists   : ReferencedSectionExists edge_1513_incorporates_1112 c
  penalty1111Honored  : IncorporationHonored    edge_1513_incorporates_1111 c
  penalty1112Honored  : IncorporationHonored    edge_1513_incorporates_1112 c

end Proving.USC.T18.Obstruction.Structure
