














import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Deontic

open Proving.USC.Common


inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  deriving DecidableEq, Repr



opaque Commission : Type



opaque FederalAgency : Type

end Proving.USC.T42.TitleVIIEnf.Deontic
