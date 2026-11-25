



import Proving.USC.T22.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T22.Structure

open Proving.USC.Common


theorem coherent7102_intro {c : ComplaintText}
    (hTaskForce      : ReferencedSectionExists edge_7102_incorporates_7103 c)
    (hMinStandards   : ReferencedSectionExists edge_7102_incorporates_7106 c)
    (hInadmissibility : ReferencedSectionExists edge_7102_incorporates_8_1182 c)
    (hMinHonored     : IncorporationHonored edge_7102_incorporates_7106 c)
    (hFaa            : IncorporationHonored edge_7102_incorporates_faa1961 c)
    (hAeca           : IncorporationHonored edge_7102_incorporates_aeca c)
    : Coherent7102 c :=
  { taskForceExists := hTaskForce
    minStandardsExists := hMinStandards
    inadmissibilityExists := hInadmissibility
    minStandardsHonored := hMinHonored
    faaHonored := hFaa
    aecaHonored := hAeca }

end Proving.USC.T22.Structure
