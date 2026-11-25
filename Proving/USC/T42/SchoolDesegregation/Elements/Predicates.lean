









import Proving.USC.T42.SchoolDesegregation.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Elements
open Proving.USC.Common
















axiom ReceivedSchoolBoardEqualProtectionComplaint (wc : WrittenComplaint) (s : PublicSchool) (c : ComplaintText) : Prop






axiom ReceivedPublicCollegeDenialComplaint (wc : WrittenComplaint) (s : PublicSchool) (c : ComplaintText) : Prop





axiom ComplaintIsWritingUnder1001 (wc : WrittenComplaint) (c : ComplaintText) : Prop







axiom SignersUnableToMaintainProceedings (wc : WrittenComplaint) (c : ComplaintText) : Prop






axiom SeeksDesegregationRelief (s : PublicSchool) (c : ComplaintText) : Prop











axiom HasRightToSueForPublicEducationDiscrimination (p : Person) (c : ComplaintText) : Prop





axiom PrivateRightNotDisplaced (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregation.Elements
