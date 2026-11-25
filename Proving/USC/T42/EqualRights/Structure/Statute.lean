









import Proving.USC.T42.EqualRights.Structure.Predicates
import Proving.USC.T42.EqualRights.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Structure

open Proving.USC.Common



structure Coherent1981 (c : ComplaintText) : Prop where
  defnIncorporated : IncorporationHonored edge_1981a_incorporates_1981b c
  defnExists       : ReferencedSectionExists edge_1981a_incorporates_1981b c




structure Coherent1982 : Prop where
  standalone : True






structure Coherent1981a (c : ComplaintText) : Prop where
  procIncorporated  : IncorporationHonored edge_1981a_incorporates_2000e5 c
  procExists        : ReferencedSectionExists edge_1981a_incorporates_2000e5 c
  prohibIncorporated : IncorporationHonored edge_1981a_incorporates_2000e2 c
  s1981Priority     : ExceptionApplies edge_1981a_subjectTo_1981 c
  damagesCarve      : OverrideTriggered edge_1981a_subjectTo_2000e5g c
  s1981Saved        : SavingsRespected edge_1981a_savings_1981 c

end Proving.USC.T42.EqualRights.Structure
