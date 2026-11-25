import Proving.USC.T18.Ch71.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Structure

open Proving.USC.Common


theorem coherent1462_intro {c : ComplaintText}
    (hCdaExists  : ReferencedSectionExists edge_1462_incorporates_cda230 c)
    (hCdaHonored : IncorporationHonored edge_1462_incorporates_cda230 c)
    (hFineExists : ReferencedSectionExists edge_1462_incorporates_3571 c)
    : Coherent1462 c := ⟨hCdaExists, hCdaHonored, hFineExists⟩


theorem coherent1465_intro {c : ComplaintText}
    (hCdaExists  : ReferencedSectionExists edge_1465_incorporates_cda230 c)
    (hCdaHonored : IncorporationHonored edge_1465_incorporates_cda230 c)
    (hFineExists : ReferencedSectionExists edge_1465_incorporates_3571 c)
    : Coherent1465 c := ⟨hCdaExists, hCdaHonored, hFineExists⟩

end Proving.USC.T18.Ch71.Reslice.Structure
