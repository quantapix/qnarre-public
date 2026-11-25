import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Procedure





inductive Stage
  | Conduct
  | Prosecuted
  | Adjudicated
  | Sentenced
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch73.Procedure
