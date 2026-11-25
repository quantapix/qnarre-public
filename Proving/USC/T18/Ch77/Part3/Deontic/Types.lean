








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr





opaque Court : Type



opaque RestitutionOrder : Type




opaque ChapterOffense : Type



opaque ForfeitableProperty : Type

end Proving.USC.T18.Ch77.Part3.Deontic
