










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop










axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop








axiom ConstrainingSectionSatisfied (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop







axiom OpenClassReferenceIdentified (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21CivilRights.Recert.Structure
