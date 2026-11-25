

















import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Structure

open Proving.USC.Common (ComplaintText)





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Prohibition.Structure
