



import Proving.USC.T42.SchoolDesegregation.Structure.Statute

namespace Proving.USC.T42.SchoolDesegregation.Structure
open Proving.USC.Common

theorem coherent2000c6_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c6_incorporates_18s1001 c)
    (hInc : IncorporationHonored edge_2000c6_incorporates_18s1001 c)
    : Coherent2000c6 c :=
  ⟨hExists, hInc⟩

theorem coherent2000c8_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c8_savings_subchapter c)
    (hSav : SavingsClausePreserved edge_2000c8_savings_subchapter c)
    : Coherent2000c8 c :=
  ⟨hExists, hSav⟩

end Proving.USC.T42.SchoolDesegregation.Structure
