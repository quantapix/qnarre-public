







import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Structure.Types
import Proving.USC.T18.Ch113.Structure.Predicates

namespace Proving.USC.T18.Ch113.Structure

open Proving.USC.Common




structure Coherent2312 (c : ComplaintText) : Prop where
  termsDefined       : IncorporationHonored edge_2312_incorporates_2311 c
  fineScheduleExists : ReferencedSectionExists edge_2312_incorporates_3571 c




structure Coherent2313 (c : ComplaintText) : Prop where
  termsDefined       : IncorporationHonored edge_2313_incorporates_2311 c
  stateDefined       : IncorporationHonored edge_2313a_incorporates_2313b c
  fineScheduleExists : ReferencedSectionExists edge_2313_incorporates_3571 c

end Proving.USC.T18.Ch113.Structure
