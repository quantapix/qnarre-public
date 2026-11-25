import Proving.USC.Common.Types
set_option autoImplicit false











namespace Proving.USC.T18.Ch2Ch3.Deontic

open Proving.USC.Common




inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
deriving DecidableEq, Repr

end Proving.USC.T18.Ch2Ch3.Deontic
