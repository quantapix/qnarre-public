









import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Structure.Types
import Proving.USC.T18.Ch25.Structure.Predicates
import Proving.USC.T18.Ch25.Structure.Statute

namespace Proving.USC.T18.Ch25.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent471_intro {c : ComplaintText}
    (hDefExists  : ReferencedSectionExists edge_471_incorporates_8 c)
    (hDefHonored : IncorporationHonored edge_471_incorporates_8 c)
    (hFineExists : ReferencedSectionExists edge_471_incorporates_3571 c)
    : Coherent471 c :=
  ⟨hDefExists, hDefHonored, hFineExists⟩

theorem coherent472_intro {c : ComplaintText}
    (hObjExists  : ReferencedSectionExists edge_472_incorporates_471 c)
    (hObjHonored : IncorporationHonored edge_472_incorporates_471 c)
    (hDefHonored : IncorporationHonored edge_472_incorporates_8 c)
    (hFineExists : ReferencedSectionExists edge_472_incorporates_3571 c)
    : Coherent472 c :=
  ⟨hObjExists, hObjHonored, hDefHonored, hFineExists⟩

theorem coherent473_intro {c : ComplaintText}
    (hObjHonored  : IncorporationHonored edge_473_incorporates_471 c)
    (hDefHonored  : IncorporationHonored edge_473_incorporates_8 c)
    (hUtterExists : ReferencedSectionExists edge_473_incorporates_472 c)
    (hFineExists  : ReferencedSectionExists edge_473_incorporates_3571 c)
    : Coherent473 c :=
  ⟨hObjHonored, hDefHonored, hUtterExists, hFineExists⟩

end Proving.USC.T18.Ch25.Structure
