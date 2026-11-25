import Proving.USC.T18.Ch117.Structure.Types
import Proving.USC.T18.Ch117.Structure.Predicates
import Proving.USC.T18.Ch117.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Structure

set_option autoImplicit false
open Proving.USC.Common


theorem coherent2427_intro {c : ComplaintText}
    (hChildPorn : IncorporationHonored edge_2427_incorporates_2256 c)
    : Coherent2427 c := ⟨hChildPorn⟩


theorem coherent2421A_intro {c : ComplaintText}
    (hIcs : IncorporationHonored edge_2421A_incorporates_230 c)
    (hSexTraffic : ReferencedSectionExists edge_2421A_incorporates_1591 c)
    (hRestScope : IncorporationHonored edge_2421A_incorporates_2327 c)
    (hOverride3663 : OverrideTriggered edge_2421A_notwithstanding_3663 c)
    (hOverride3663A : OverrideTriggered edge_2421A_notwithstanding_3663A c)
    : Coherent2421A c :=
  ⟨hIcs, hSexTraffic, hRestScope, hOverride3663, hOverride3663A⟩


theorem coherent2423_intro {c : ComplaintText}
    (hTerm : IncorporationHonored edge_2423_incorporates_2427 c)
    (hSexAct : IncorporationHonored edge_2423_incorporates_2246 c)
    (hCh109A : ReferencedSectionExists edge_2423_incorporates_ch109A c)
    (hCommSex : IncorporationHonored edge_2423_incorporates_1591 c)
    (hChildPorn : IncorporationHonored edge_2423_incorporates_2256 c)
    : Coherent2423 c :=
  ⟨hTerm, hSexAct, hCh109A, hCommSex, hChildPorn⟩


theorem coherent2426_intro {c : ComplaintText}
    (hCh109A : ReferencedSectionExists edge_2426_incorporates_ch109A c)
    (hCh110 : ReferencedSectionExists edge_2426_incorporates_ch110 c)
    (hS1591 : ReferencedSectionExists edge_2426_incorporates_1591 c)
    (hException : ExceptionApplies edge_2426_exceptAsProvided_3559 c)
    : Coherent2426 c :=
  ⟨hCh109A, hCh110, hS1591, hException⟩


theorem coherent2428_intro {c : ComplaintText}
    (hCivilForfeit : ReferencedSectionExists edge_2428_incorporates_ch46 c)
    : Coherent2428 c := ⟨hCivilForfeit⟩


theorem coherent2429_intro {c : ComplaintText}
    (hOverride3663 : OverrideTriggered edge_2429_notwithstanding_3663 c)
    (hOverride3663A : OverrideTriggered edge_2429_notwithstanding_3663A c)
    (hCommSex : IncorporationHonored edge_2429_incorporates_1591 c)
    (hEnforce : IncorporationHonored edge_2429_incorporates_3664 c)
    (hSameManner : IncorporationHonored edge_2429_incorporates_3663A c)
    (hLosses : IncorporationHonored edge_2429_incorporates_2259 c)
    (hCsaForfeit : IncorporationHonored edge_2429_incorporates_853 c)
    : Coherent2429 c :=
  ⟨hOverride3663, hOverride3663A, hCommSex, hEnforce, hSameManner, hLosses, hCsaForfeit⟩



theorem enhancement2426_intro {c : ComplaintText}
    (h : OverrideTriggered edge_2426_lexSpecialis_ch117 c)
    : Enhancement2426 c := .chapterTriple h

end Proving.USC.T18.Ch117.Structure
