







import Proving.USC.T18.Ch42.Structure.Types
import Proving.USC.T18.Ch42.Structure.Predicates
import Proving.USC.T18.Ch42.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch42.Structure

open Proving.USC.Common


theorem coherent892_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_892_incorporates_891 c)
    (hHonored : IncorporationHonored edge_892_incorporates_891 c)
    : Coherent892 c :=
  ⟨hExists, hHonored⟩


theorem coherent893_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_893_incorporates_891 c)
    (hHonored : IncorporationHonored edge_893_incorporates_891 c)
    : Coherent893 c :=
  ⟨hExists, hHonored⟩


theorem coherent894_intro {c : ComplaintText}
    (h891Exists : ReferencedSectionExists edge_894_incorporates_891 c)
    (h891Honored : IncorporationHonored edge_894_incorporates_891 c)
    (h892Exists : ReferencedSectionExists edge_894_incorporates_892 c)
    (h892Honored : IncorporationHonored edge_894_incorporates_892 c)
    : Coherent894 c :=
  ⟨h891Exists, h891Honored, h892Exists, h892Honored⟩


theorem ch42LoansharkingCoherent_intro {c : ComplaintText}
    (h : Coherent892 c) : Ch42LoansharkingCoherent c :=
  .making h

end Proving.USC.T18.Ch42.Structure
