







import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Deontic

open Proving.USC.Common




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving Repr, DecidableEq

end Proving.USC.T18.Ch113.Reslice.Deontic
