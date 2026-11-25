












import Proving.USC.Common.Types

namespace Proving.USC.T18.Wave.Deontic

open Proving.USC.Common




opaque Enterprise : Type






inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T18.Wave.Deontic
