








import Proving.USC.T29.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.Structure

open Proving.USC.Common (ComplaintText)





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ConstraintApplies (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsHonored (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T29.Structure
