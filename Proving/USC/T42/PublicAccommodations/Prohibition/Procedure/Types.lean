





















import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Procedure

open Proving.USC.Common








inductive State
  | RightSecured
  | InterferenceOccurred
  | EnforcementTriggered
  | TimeBarred
  deriving DecidableEq, Repr



opaque SecuredRight : Type

end Proving.USC.T42.PublicAccommodations.Prohibition.Procedure
