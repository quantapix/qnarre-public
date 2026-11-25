













import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Procedure

open Proving.USC.Common





inductive State
  | Aggrieved
  | NoticeGiven
  | Referred
  | Filed
  | Stayed
  | Adjudicated
  deriving DecidableEq, Repr



opaque PublicAccommodation : Type


opaque StateLocalAuthority : Type

end Proving.USC.T42.PublicAccommodations.Entitlement.Procedure
