
















import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Deontic

open Proving.USC.Common




opaque BargainingUnit : Type



opaque LaborOrganization : Type



opaque Election : Type








inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T29.SelfOrgRep.Deontic
