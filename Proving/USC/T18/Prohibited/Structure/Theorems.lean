





import Proving.USC.T18.Prohibited.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Structure

open Proving.USC.Common



theorem coherent1962_intro {c : ComplaintText}
    (hDefs : ReferencedSectionExists edge_1962_incorporates_1961 c)
    (hInc  : IncorporationHonored edge_1962_incorporates_1961 c)
    (hInt  : ReferencedSectionExists edge_1962d_incorporates_subsections c)
    (hCrim : ReferencedSectionExists edge_1962_subjectTo_1963 c)
    (hCiv  : ReferencedSectionExists edge_1962_subjectTo_1964 c)
    : Coherent1962 c :=
  { defsExist := hDefs, incorporates := hInc, internalRef := hInt,
    criminalRemedy := hCrim, civilRemedy := hCiv }


theorem enforcementPathLive_criminal_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1962_subjectTo_1963 c)
    : EnforcementPathLive c :=
  .criminal h


theorem enforcementPathLive_civil_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1962_subjectTo_1964 c)
    : EnforcementPathLive c :=
  .civil h

end Proving.USC.T18.Prohibited.Structure
