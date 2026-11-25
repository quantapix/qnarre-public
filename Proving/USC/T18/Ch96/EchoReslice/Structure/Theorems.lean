import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Structure.Types
import Proving.USC.T18.Ch96.EchoReslice.Structure.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Structure.Statute

set_option autoImplicit false







namespace Proving.USC.T18.Ch96.EchoReslice.Structure

open Proving.USC.Common


theorem sec1967Reach_ancillary_intro {p : Proceeding} {c : ComplaintText}
    (anc    : AncillaryToProceedingUnder edge_1967_ancillary_ch96 p c)
    (tether : ChapterScopeTetherHonored edge_1967_underThisChapter_ch96 p c)
    : Sec1967Reach p c :=
  .ancillary anc tether


theorem sec1967Reach_unitedStatesCivilAction_intro {p : Proceeding} {c : ComplaintText}
    (usAction : UnitedStatesInstitutedActionUnder edge_1967_usCivilAction_ch96 p c)
    (tether   : ChapterScopeTetherHonored edge_1967_underThisChapter_ch96 p c)
    : Sec1967Reach p c :=
  .unitedStatesCivilAction usAction tether


theorem coherent1967_intro {p : Proceeding} {c : ComplaintText}
    (chapterExists : ReferencedSectionExists edge_1967_underThisChapter_ch96 c)
    (honored       : IncorporationHonored edge_1967_underThisChapter_ch96 c)
    (reach         : Sec1967Reach p c)
    : Coherent1967 p c :=
  ⟨chapterExists, honored, reach⟩


theorem sec1967Displacement_intro {c : ComplaintText}
    (displaced : LexSpecialisDisplaces edge_1967_lexSpecialis_generalAccess c)
    : Sec1967Displacement c :=
  ⟨displaced⟩

end Proving.USC.T18.Ch96.EchoReslice.Structure
