




import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Deontic

open Proving.USC.Common



inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq





opaque OfficialProceeding : Type


opaque District : Type



opaque CriminalCase : Type

end Proving.USC.T18.Ch73.Reslice.Deontic
