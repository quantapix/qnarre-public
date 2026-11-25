





import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Deontic

open Proving.USC.Common




inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq




opaque Venture : Type






opaque SentencingAuthority : Type

end Proving.USC.T18.Ch77.Part5.Deontic
