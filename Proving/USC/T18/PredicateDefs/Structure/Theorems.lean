



import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Structure.Statute

namespace Proving.USC.T18.PredicateDefs.Structure
open Proving.USC.Common

theorem coherent20_intro {c : ComplaintText}
    (hFdi : IncorporationHonored edge_20_incorporates_fdiAct c)
    (hFhlb : IncorporationHonored edge_20_incorporates_12usc1422 c)
    (hSbic : IncorporationHonored edge_20_incorporates_15usc662 c)
    (hMort : ReferencedSectionExists edge_20_incorporates_27 c)
    : Coherent20 c :=
  ⟨hFdi, hFhlb, hSbic, hMort⟩

theorem coherent1346_intro {c : ComplaintText}
    (hMailEx : ReferencedSectionExists edge_1346_incorporates_1341 c)
    (hWireEx : ReferencedSectionExists edge_1346_incorporates_1343 c)
    (hMailH : IncorporationHonored edge_1346_incorporates_1341 c)
    (hWireH : IncorporationHonored edge_1346_incorporates_1343 c)
    : Coherent1346 c :=
  ⟨hMailEx, hWireEx, hMailH, hWireH⟩

theorem coherent1515_intro {c : ComplaintText}
    (h12Ex : ReferencedSectionExists edge_1515_incorporates_1512 c)
    (h13Ex : ReferencedSectionExists edge_1515_incorporates_1513 c)
    (h05Ex : ReferencedSectionExists edge_1515_incorporates_1505 c)
    (h12H : IncorporationHonored edge_1515_incorporates_1512 c)
    : Coherent1515 c :=
  ⟨h12Ex, h13Ex, h05Ex, h12H⟩


theorem coherent1515Path_byIncorporation_intro {c : ComplaintText}
    (h : Coherent1515 c) : Coherent1515Path c :=
  .byIncorporation h

end Proving.USC.T18.PredicateDefs.Structure
