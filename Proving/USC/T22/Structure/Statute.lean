






import Proving.USC.T22.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T22.Structure

open Proving.USC.Common



structure Coherent7102 (c : ComplaintText) : Prop where

  taskForceExists       : ReferencedSectionExists edge_7102_incorporates_7103 c

  minStandardsExists    : ReferencedSectionExists edge_7102_incorporates_7106 c

  inadmissibilityExists : ReferencedSectionExists edge_7102_incorporates_8_1182 c

  minStandardsHonored   : IncorporationHonored edge_7102_incorporates_7106 c

  faaHonored            : IncorporationHonored edge_7102_incorporates_faa1961 c

  aecaHonored           : IncorporationHonored edge_7102_incorporates_aeca c

end Proving.USC.T22.Structure
