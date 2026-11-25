






import Proving.USC.T18.Ch77TailCompletion.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Structure

open Proving.USC.Common

theorem coherent1593_intro {c : ComplaintText}
    (hMech : ReferencedSectionExists edge_1593_incorporates_3664 c)
    (hLoss : IncorporationHonored edge_1593_incorporates_2259 c)
    (hOver : OverrideTriggered edge_1593_notwithstanding_3663 c)
    : Coherent1593 c := ⟨hMech, hLoss, hOver⟩

theorem coherent1593A_intro {c : ComplaintText}
    (hCh : IncorporationHonored edge_1593A_incorporates_chapter c)
    : Coherent1593A c := ⟨hCh⟩

theorem coherent1594_intro {c : ComplaintText}
    (hPen : IncorporationHonored edge_1594_incorporates_1591 c)
    (hForf : ReferencedSectionExists edge_1594_incorporates_ch46 c)
    (hWit : ReferencedSectionExists edge_1594_incorporates_ch224 c)
    : Coherent1594 c := ⟨hPen, hForf, hWit⟩

theorem coherent1595_intro {c : ComplaintText}
    (hCh : IncorporationHonored edge_1595_incorporates_chapter c)
    (hHook : ReferencedSectionExists edge_1595_incorporates_1591 c)
    : Coherent1595 c := ⟨hCh, hHook⟩

theorem coherent1595A_intro {c : ComplaintText}
    (hScope : ReferencedSectionExists edge_1595A_incorporates_ch110 c)
    (hExc : ExceptionApplies edge_1595A_except_frcrp c)
    (hSav : SavingsClausePreserved edge_1595A_savings_firstAmendment c)
    : Coherent1595A c := ⟨hScope, hExc, hSav⟩

theorem coherent1596_intro {c : ComplaintText}
    (hOff : ReferencedSectionExists edge_1596_incorporates_1591 c)
    (hIna : IncorporationHonored edge_1596_incorporates_ina101 c)
    (hExc : ExceptionApplies edge_1596_except_agapproval c)
    : Coherent1596 c := ⟨hOff, hIna, hExc⟩

theorem coherent1597_intro {c : ComplaintText}
    (hFraud : ReferencedSectionExists edge_1597_incorporates_1351 c)
    (hSmug : IncorporationHonored edge_1597_incorporates_ina274 c)
    : Coherent1597 c := ⟨hFraud, hSmug⟩

end Proving.USC.T18.Ch77TailCompletion.Structure
