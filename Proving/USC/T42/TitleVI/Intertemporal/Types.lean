










import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Intertemporal

open Proving.USC.Common




structure EffectiveWindow where
  fromDay  : Nat
  untilDay : Option Nat
  deriving Repr

end Proving.USC.T42.TitleVI.Intertemporal
