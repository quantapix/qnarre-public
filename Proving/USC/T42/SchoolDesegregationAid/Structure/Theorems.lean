








import Proving.USC.T42.SchoolDesegregationAid.Structure.Statute

namespace Proving.USC.T42.SchoolDesegregationAid.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent2000c2_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c2_incorporates_2000c c)
    (hInc    : IncorporationHonored    edge_2000c2_incorporates_2000c c)
    : Coherent2000c2 c := ⟨hExists, hInc⟩

theorem coherent2000c3_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c3_incorporates_2000c c)
    (hInc    : IncorporationHonored    edge_2000c3_incorporates_2000c c)
    : Coherent2000c3 c := ⟨hExists, hInc⟩

theorem coherent2000c4_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c4_incorporates_2000c c)
    (hInc    : IncorporationHonored    edge_2000c4_incorporates_2000c c)
    : Coherent2000c4 c := ⟨hExists, hInc⟩

theorem coherent2000c5_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c5_incorporates_subchapter c)
    (hInc    : IncorporationHonored    edge_2000c5_incorporates_subchapter c)
    : Coherent2000c5 c := ⟨hExists, hInc⟩

theorem coherent2000c7_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000c7_incorporates_subchapter c)
    (hInc    : IncorporationHonored    edge_2000c7_incorporates_subchapter c)
    : Coherent2000c7 c := ⟨hExists, hInc⟩

theorem coherent2000c9_intro {c : ComplaintText}
    (hExists  : ReferencedSectionExists edge_2000c9_savings_subchapter c)
    (hSavings : SavingsClauseHonored    edge_2000c9_savings_subchapter c)
    : Coherent2000c9 c := ⟨hExists, hSavings⟩

theorem coherentSubchapterIV_intro {c : ComplaintText}
    (h2 : Coherent2000c2 c) (h3 : Coherent2000c3 c) (h4 : Coherent2000c4 c)
    (h5 : Coherent2000c5 c) (h7 : Coherent2000c7 c) (h9 : Coherent2000c9 c)
    : CoherentSubchapterIV c := ⟨h2, h3, h4, h5, h7, h9⟩

end Proving.USC.T42.SchoolDesegregationAid.Structure
