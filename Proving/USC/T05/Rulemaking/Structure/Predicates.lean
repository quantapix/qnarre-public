








import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Structure.Types

namespace Proving.USC.T05.Rulemaking.Structure

open Proving.USC.Common (ComplaintText)





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T05.Rulemaking.Structure
