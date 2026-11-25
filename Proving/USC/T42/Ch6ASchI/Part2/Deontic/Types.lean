import Proving.USC.Common.Types












namespace Proving.USC.T42.Ch6ASchI.Part2.Deontic

open Proving.USC.Common



opaque Officer : Type



opaque Grade : Type


opaque Regulation : Type



opaque AdvisoryCommittee : Type



inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving Repr, DecidableEq

end Proving.USC.T42.Ch6ASchI.Part2.Deontic
