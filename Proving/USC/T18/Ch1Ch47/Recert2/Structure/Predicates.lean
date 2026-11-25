






import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Structure

open Proving.USC.Common









axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop






axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop







axiom ScopeClauseReaches (s : Scope) (target : String) (c : ComplaintText) : Prop







axiom PopularNameReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom ConditionalIncorporationTriggered (r : Ref) (c : ComplaintText) : Prop







axiom EditorialDefectDoesNotDefeatReference (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Structure
