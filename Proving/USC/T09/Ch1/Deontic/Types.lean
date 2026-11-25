import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T09.Ch1.Deontic




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq



opaque Contract : Type



opaque ArbitrationAgreement : Type



opaque Court : Type


opaque Arbitrator : Type


opaque Award : Type



opaque Proceeding : Type


opaque Order : Type

end Proving.USC.T09.Ch1.Deontic
