import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch13.Reslice.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr



opaque ProtectedActivity : Type


opaque ReligiousProperty : Type



opaque Facility : Type


opaque WorshipPlace : Type



opaque Entity : Type



opaque Prosecution : Type


opaque Offense : Type




opaque Court : Type


opaque CivilAction : Type

end Proving.USC.T18.Ch13.Reslice.Deontic
