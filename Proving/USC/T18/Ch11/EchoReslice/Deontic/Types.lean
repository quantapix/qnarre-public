






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Deontic

open Proving.USC.Common (Person ComplaintText)




inductive Modality : Type where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr



opaque ThingOfValue : Type





opaque OfficialAct : Type





opaque Proceeding : Type



opaque Office : Type

end Proving.USC.T18.Ch11.EchoReslice.Deontic
