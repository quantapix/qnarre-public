














import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Intertemporal

open Proving.USC.Common




structure EffectiveWindow where
  fromDay  : Nat
  untilDay : Option Nat



opaque actDate : ComplaintText → Nat

end Proving.USC.T42.EqualRights.Intertemporal
