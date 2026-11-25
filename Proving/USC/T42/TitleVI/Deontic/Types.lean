




















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Deontic

open Proving.USC.Common




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr




opaque Agency : Type




opaque State : Type

end Proving.USC.T42.TitleVI.Deontic
