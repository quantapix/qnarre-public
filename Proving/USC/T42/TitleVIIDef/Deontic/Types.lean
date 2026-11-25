














import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Deontic

open Proving.USC.Common


inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr





opaque ProtectedGround : Type

end Proving.USC.T42.TitleVIIDef.Deontic
