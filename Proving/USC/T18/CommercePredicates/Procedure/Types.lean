
















import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Procedure

open Proving.USC.Common



opaque MoneyTransmittingBusiness : Type






inductive ComplianceState
  | Unlicensed
  | Unregistered
  | RegistrationPending
  | Compliant
  deriving DecidableEq, Repr





inductive FacilityUseStage
  | NotUsed
  | FacilityUsed
  | ConsiderationExchanged
  deriving DecidableEq, Repr

end Proving.USC.T18.CommercePredicates.Procedure
