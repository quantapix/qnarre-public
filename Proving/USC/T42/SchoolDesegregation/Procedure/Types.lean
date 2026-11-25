





















import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregation.Procedure

open Proving.USC.Common




opaque WrittenComplaint : Type









inductive State
  | ComplaintReceived
  | InabilityFound
  | ActionInstituted
  | PrivateRightAvailable
  | PrivateSuitFiled
  deriving DecidableEq, Repr

end Proving.USC.T42.SchoolDesegregation.Procedure
