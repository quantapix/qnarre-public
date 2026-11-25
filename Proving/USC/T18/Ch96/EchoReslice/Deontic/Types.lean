






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Deontic

open Proving.USC.Common




inductive Modality where

  | Obligation : Modality

  | Prohibition : Modality

  | Permission : Modality


  | Power : Modality

  | Definition : Modality



opaque Court : Type




opaque Proceeding : Type

end Proving.USC.T18.Ch96.EchoReslice.Deontic
