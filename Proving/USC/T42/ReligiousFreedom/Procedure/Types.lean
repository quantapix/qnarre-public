





























import Proving.USC.Common.Types

namespace Proving.USC.T42.ReligiousFreedom.Procedure

open Proving.USC.Common




opaque Regulation : Type


inductive RegState
  | Proposed
  | Consulted
  | Adopted
  deriving DecidableEq, Repr

end Proving.USC.T42.ReligiousFreedom.Procedure
