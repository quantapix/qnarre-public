






import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Predicates
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Statute

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Structure

open Proving.USC.Common (ComplaintText)


theorem coherent2000a2_intro {c : ComplaintText}
    (hCoreEx  : ReferencedSectionExists edge_2000a2_incorporates_2000a c)
    (hCoreHon : IncorporationHonored edge_2000a2_incorporates_2000a c)
    (hA1Ex    : ReferencedSectionExists edge_2000a2_incorporates_2000a1 c)
    (hA1Hon   : IncorporationHonored edge_2000a2_incorporates_2000a1 c)
    : Coherent2000a2 c :=
  { coreExists := hCoreEx, coreHonored := hCoreHon, a1Exists := hA1Ex, a1Honored := hA1Hon }



theorem coherent2000a1_intro {c : ComplaintText}
    (hProtEx  : ReferencedSectionExists edge_2000a1_incorporates_2000a2 c)
    (hProtHon : IncorporationHonored edge_2000a1_incorporates_2000a2 c)
    : Coherent2000a1 c :=
  { protectorExists := hProtEx, protectorHonored := hProtHon }

end Proving.USC.T42.PublicAccommodations.Prohibition.Structure
