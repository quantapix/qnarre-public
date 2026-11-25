

















import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Procedure



inductive State
  | offenseCommitted
  | prosecuted
  | convicted
  | penaltyImposed
  | exempt
  deriving DecidableEq

end Proving.USC.T18.Ch77.Procedure
