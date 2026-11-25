








import Proving.USC.T18.Ch71.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Structure

open Proving.USC.Common


theorem coherent1461_intro {c : ComplaintText}
    (hExists  : ReferencedSectionExists edge_1461_incorporates_t39s3001e c)
    (hHonored : IncorporationHonored     edge_1461_incorporates_t39s3001e c)
    : Coherent1461 c :=
  ⟨hExists, hHonored⟩


theorem coherent1465_intro {c : ComplaintText}
    (hExists  : ReferencedSectionExists edge_1465_incorporates_t47s230 c)
    (hHonored : IncorporationHonored     edge_1465_incorporates_t47s230 c)
    : Coherent1465 c :=
  ⟨hExists, hHonored⟩


theorem coherent1462_intro {c : ComplaintText}
    (hExists  : ReferencedSectionExists edge_1462_incorporates_t47s230 c)
    (hHonored : IncorporationHonored     edge_1462_incorporates_t47s230 c)
    : Coherent1462 c :=
  ⟨hExists, hHonored⟩

end Proving.USC.T18.Ch71.Structure
