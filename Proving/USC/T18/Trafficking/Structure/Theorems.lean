







import Proving.USC.T18.Trafficking.Structure.Types
import Proving.USC.T18.Trafficking.Structure.Predicates
import Proving.USC.T18.Trafficking.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Trafficking.Structure

open Proving.USC.Common (ComplaintText)


theorem coherent1581_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1581b_incorporates_1581a c)
    (hHonored : IncorporationHonored edge_1581b_incorporates_1581a c)
    : Coherent1581 c :=
  ⟨hExists, hHonored⟩


theorem coherent1589_intro {c : ComplaintText}
    (hDefsE : ReferencedSectionExists edge_1589a_incorporates_1589c c)
    (hDefsH : IncorporationHonored edge_1589a_incorporates_1589c c)
    (hPenE : ReferencedSectionExists edge_1589b_incorporates_1589d c)
    (hPenH : IncorporationHonored edge_1589b_incorporates_1589d c)
    : Coherent1589 c :=
  ⟨hDefsE, hDefsH, hPenE, hPenH⟩


theorem coherent1590_intro {c : ComplaintText}
    (hChapE : ReferencedSectionExists edge_1590a_incorporates_ch77 c)
    (hChapH : IncorporationHonored edge_1590a_incorporates_ch77 c)
    : Coherent1590 c :=
  ⟨hChapE, hChapH⟩


theorem coherent1591_intro {c : ComplaintText}
    (hPredE : ReferencedSectionExists edge_1591a2_incorporates_1591a1 c)
    (hPredH : IncorporationHonored edge_1591a2_incorporates_1591a1 c)
    (hDefsE : ReferencedSectionExists edge_1591a_incorporates_1591e c)
    (hDefsH : IncorporationHonored edge_1591a_incorporates_1591e c)
    : Coherent1591 c :=
  ⟨hPredE, hPredH, hDefsE, hDefsH⟩


theorem coherentTraffickingCore_intro {c : ComplaintText}
    (hPeonage : Coherent1581 c)
    (hForced : Coherent1589 c)
    (hTraffick : Coherent1590 c)
    (hSex : Coherent1591 c)
    : CoherentTraffickingCore c :=
  ⟨hPeonage, hForced, hTraffick, hSex⟩

end Proving.USC.T18.Trafficking.Structure
