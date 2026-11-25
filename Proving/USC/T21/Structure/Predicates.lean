import Proving.USC.T21.Structure.Types
import Proving.USC.Common.Types






namespace Proving.USC.T21.Structure

open Proving.USC.Common (ComplaintText)






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T21.Structure
