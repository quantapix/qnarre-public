









import Proving.USC.Common.Types
import Proving.USC.T18.Obstruction.Structure.Types
import Proving.USC.T18.Obstruction.Structure.Predicates
import Proving.USC.T18.Obstruction.Structure.Statute

namespace Proving.USC.T18.Obstruction.Structure

open Proving.USC.Common

theorem coherent1503_intro {c : ComplaintText}
    (h1111Exists  : ReferencedSectionExists edge_1503_incorporates_1111 c)
    (h1112Exists  : ReferencedSectionExists edge_1503_incorporates_1112 c)
    (h1111Honored : IncorporationHonored    edge_1503_incorporates_1111 c)
    (h1112Honored : IncorporationHonored    edge_1503_incorporates_1112 c)
    : Coherent1503 c :=
  ⟨h1111Exists, h1112Exists, h1111Honored, h1112Honored⟩

theorem coherent1512_intro {c : ComplaintText}
    (hDefsExists     : ReferencedSectionExists edge_1512_incorporates_1515 c)
    (hDefsHonored    : IncorporationHonored    edge_1512_incorporates_1515 c)
    (h1111Exists     : ReferencedSectionExists edge_1512_incorporates_1111 c)
    (h1112Exists     : ReferencedSectionExists edge_1512_incorporates_1112 c)
    (h1111Honored    : IncorporationHonored    edge_1512_incorporates_1111 c)
    (h1112Honored    : IncorporationHonored    edge_1512_incorporates_1112 c)
    : Coherent1512 c :=
  ⟨hDefsExists, hDefsHonored, h1111Exists, h1112Exists, h1111Honored, h1112Honored⟩


theorem coherent1512Path_savings_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1512_savings_1515c c) : Coherent1512Path c :=
  .savings h


theorem coherent1512Path_coVenue_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1512_lexSpecialis_1503 c) : Coherent1512Path c :=
  .coVenue h

theorem coherent1513_intro {c : ComplaintText}
    (hDefsExists     : ReferencedSectionExists edge_1513_incorporates_1515 c)
    (hDefsHonored    : IncorporationHonored    edge_1513_incorporates_1515 c)
    (h1111Exists     : ReferencedSectionExists edge_1513_incorporates_1111 c)
    (h1112Exists     : ReferencedSectionExists edge_1513_incorporates_1112 c)
    (h1111Honored    : IncorporationHonored    edge_1513_incorporates_1111 c)
    (h1112Honored    : IncorporationHonored    edge_1513_incorporates_1112 c)
    : Coherent1513 c :=
  ⟨hDefsExists, hDefsHonored, h1111Exists, h1112Exists, h1111Honored, h1112Honored⟩

end Proving.USC.T18.Obstruction.Structure
