















import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Procedure.Types

namespace Proving.USC.T42.SchoolDesegregation.Procedure

open Proving.USC.Common











axiom WrittenComplaintReceived (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Prop





axiom ComplaintIsSection1001Writing (w : WrittenComplaint) (c : ComplaintText) : Prop









axiom SignatoryUnableToMaintain (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Prop






axiom AGInstitutedAction (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Prop








axiom PrivateRightOfSuitPreserved (p : Person) (c : ComplaintText) : Prop





axiom PrivateSuitFiled (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregation.Procedure
