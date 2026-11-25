














import Proving.USC.T18.Ch42.Structure.Types
import Proving.USC.T18.Ch42.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch42.Structure

open Proving.USC.Common



structure Coherent892 (c : ComplaintText) : Prop where
  def891Exists  : ReferencedSectionExists edge_892_incorporates_891 c
  inc891Honored : IncorporationHonored edge_892_incorporates_891 c



structure Coherent893 (c : ComplaintText) : Prop where
  def891Exists  : ReferencedSectionExists edge_893_incorporates_891 c
  inc891Honored : IncorporationHonored edge_893_incorporates_891 c





structure Coherent894 (c : ComplaintText) : Prop where
  def891Exists  : ReferencedSectionExists edge_894_incorporates_891 c
  inc891Honored : IncorporationHonored edge_894_incorporates_891 c
  ref892Exists  : ReferencedSectionExists edge_894_incorporates_892 c
  inc892Honored : IncorporationHonored edge_894_incorporates_892 c





inductive Ch42LoansharkingCoherent (c : ComplaintText) : Prop
  | making     : Coherent892 c → Ch42LoansharkingCoherent c
  | financing  : Coherent893 c → Ch42LoansharkingCoherent c
  | collecting : Coherent894 c → Ch42LoansharkingCoherent c

end Proving.USC.T18.Ch42.Structure
