














import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Deontic

open Proving.USC.Common



inductive Modality

  | Obligation

  | Prohibition

  | Permission

  | Power

  | Definition
  deriving DecidableEq, Repr




opaque JudicialOfficer : Type

end Proving.USC.T42.PublicAccommodations.Enforcement.Deontic
