





import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Structure.Types
import Proving.USC.T18.Ch113.Structure.Predicates
import Proving.USC.T18.Ch113.Structure.Statute

namespace Proving.USC.T18.Ch113.Structure

open Proving.USC.Common


theorem coherent2312_intro {c : ComplaintText}
    (hTerms : IncorporationHonored edge_2312_incorporates_2311 c)
    (hFine  : ReferencedSectionExists edge_2312_incorporates_3571 c)
    : Coherent2312 c :=
  ⟨hTerms, hFine⟩


theorem coherent2313_intro {c : ComplaintText}
    (hTerms : IncorporationHonored edge_2313_incorporates_2311 c)
    (hState : IncorporationHonored edge_2313a_incorporates_2313b c)
    (hFine  : ReferencedSectionExists edge_2313_incorporates_3571 c)
    : Coherent2313 c :=
  ⟨hTerms, hState, hFine⟩

end Proving.USC.T18.Ch113.Structure
