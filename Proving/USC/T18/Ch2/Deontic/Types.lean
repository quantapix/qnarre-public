










import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch2.Deontic

open Proving.USC.Common



inductive Modality where
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr


















inductive Norm where
  | s32 | s32c | s33 | s35 | s36 | s37 | s38
  | s39a1 | s39a2 | s39A | s39B
  | s40stop | s40leave | s40A
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch2.Deontic
