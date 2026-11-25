






import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Structure.Types
import Proving.USC.T18.Ch77Tail.Structure.Predicates
import Proving.USC.T18.Ch77Tail.Structure.Statute

namespace Proving.USC.T18.Ch77Tail.Structure

open Proving.USC.Common

theorem coherent1582_intro {c}
    (hFine : ReferencedSectionExists edge_1582_incorporates_3571 c)
    : Coherent1582 c := ⟨hFine⟩

theorem coherent1585_intro {c}
    (hFine : ReferencedSectionExists edge_1585_incorporates_3571 c)
    : Coherent1585 c := ⟨hFine⟩

theorem coherent1586_intro {c}
    (hFine : ReferencedSectionExists edge_1586_incorporates_3571 c)
    : Coherent1586 c := ⟨hFine⟩

theorem coherent1587_intro {c}
    (hFine : ReferencedSectionExists edge_1587_incorporates_3571 c)
    : Coherent1587 c := ⟨hFine⟩

theorem coherent1588_intro {c}
    (hFine : ReferencedSectionExists edge_1588_incorporates_3571 c)
    : Coherent1588 c := ⟨hFine⟩

theorem coherent1592_intro {c}
    (hInCourse  : ReferencedSectionExists edge_1592a1_incorporates_1581 c)
    (hIntent    : ReferencedSectionExists edge_1592a2_incorporates_1581 c)
    (hAncillary : ReferencedSectionExists edge_1592a1_incorporates_1594a c)
    (hTvpa      : IncorporationHonored     edge_1592a3_incorporates_tvpa103 c)
    (hException : ExceptionApplies         edge_1592b_exceptAsProvided_1592a c)
    (hPenalty   : IncorporationHonored     edge_1592c_incorporates_1592a c)
    : Coherent1592 c :=
  ⟨hInCourse, hIntent, hAncillary, hTvpa, hException, hPenalty⟩

end Proving.USC.T18.Ch77Tail.Structure
