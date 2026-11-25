import Proving.USC.T18.Ch73.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch73.Structure

open Proving.USC.Common

theorem coherent1503_intro {c : ComplaintText}
    (hKill : IncorporationHonored edge_1503_incorporates_1111 c)
    (hMans : IncorporationHonored edge_1503_incorporates_1112 c)
    : Coherent1503 c := ⟨hKill, hMans⟩

theorem coherent1512_intro {c : ComplaintText}
    (hKill : IncorporationHonored edge_1512_incorporates_1111 c)
    (hMans : IncorporationHonored edge_1512_incorporates_1112 c)
    (hVenue : ReferencedSectionExists edge_1512_ref_1503 c)
    : Coherent1512 c := ⟨hKill, hMans, hVenue⟩

theorem coherent1513_intro {c : ComplaintText}
    (hKill : IncorporationHonored edge_1513_incorporates_1111 c)
    (hMans : IncorporationHonored edge_1513_incorporates_1112 c)
    : Coherent1513 c := ⟨hKill, hMans⟩

theorem ch73IncorporationsResolve_intro {c : ComplaintText}
    (h1503 : Coherent1503 c) (h1512 : Coherent1512 c) (h1513 : Coherent1513 c)
    : Ch73IncorporationsResolve c := ⟨h1503, h1512, h1513⟩

end Proving.USC.T18.Ch73.Structure
