

















import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregation.Deontic

open Proving.USC.Common



inductive Modality

  | Obligation

  | Prohibition

  | Permission

  | Power

  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T42.SchoolDesegregation.Deontic
