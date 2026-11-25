






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Deontic

open Proving.USC.Common




inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr





opaque Conduct : Type



opaque Target : Type





opaque Office : Type




opaque Proceeding : Type

end Proving.USC.T18.Ch113B.Wmd.Deontic
