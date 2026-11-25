import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Statute






namespace Proving.USC.T42.PublicAccommodations.Enforcement.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent2000a4_intro {c : ComplaintText}
    (hRef : ReferencedSectionExists edge_2000a4_incorporates_2000a3d c)
    (hInc : IncorporationHonored edge_2000a4_incorporates_2000a3d c)
    : Coherent2000a4 c :=
  ⟨hRef, hInc⟩

theorem coherent2000a5_intro {c : ComplaintText}
    (hRef : ReferencedSectionExists edge_2000a5_incorporates_subchapter c)
    (hInc : IncorporationHonored edge_2000a5_incorporates_subchapter c)
    : Coherent2000a5 c :=
  ⟨hRef, hInc⟩

end Proving.USC.T42.PublicAccommodations.Enforcement.Structure
