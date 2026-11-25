






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Deontic

open Proving.USC.Common




inductive Modality : Type where

  | Obligation : Modality

  | Prohibition : Modality

  | Permission : Modality

  | Power : Modality

  | Definition : Modality




opaque Venture : Type




opaque Means : Type



opaque Harm : Type



opaque SentencingCourt : Type



opaque Government : Type

end Proving.USC.T18.Ch77.Part4.Deontic
