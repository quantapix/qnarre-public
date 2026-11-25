






import Proving.USC.T05.ScopeOfReview.Structure.Statute

namespace Proving.USC.T05.ScopeOfReview.Structure

open Proving.USC.Common



theorem coherent706E_intro {c : ComplaintText}
    (hRef556 : ReferencedSectionExists edge_706E_incorporates_556 c)
    (hRef557 : ReferencedSectionExists edge_706E_incorporates_557 c)
    (hInc556 : IncorporationHonored edge_706E_incorporates_556 c)
    (hInc557 : IncorporationHonored edge_706E_incorporates_557 c)
    : Coherent706E c :=
  ⟨hRef556, hRef557, hInc556, hInc557⟩



theorem coherent705_intro {c : ComplaintText}
    (hReview : ReferencedSectionExists edge_705_relatesTo_706 c)
    (hRelief : InterimReliefCoheresWithReview edge_705_relatesTo_706 c)
    : Coherent705 c :=
  ⟨hReview, hRelief⟩


theorem coherentScopeOfReview_intro {c : ComplaintText}
    (h706 : Coherent706E c) (h705 : Coherent705 c)
    : CoherentScopeOfReview c :=
  ⟨h706, h705⟩

end Proving.USC.T05.ScopeOfReview.Structure
