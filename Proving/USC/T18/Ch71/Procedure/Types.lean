














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Procedure

open Proving.USC.Common






inductive State
  | Deposited
  | DeclaredNonmailable
  | WithdrawnFromMails
  | OffenseEstablished
  | FirstOffenseTier
  | SubsequentOffenseTier
  | PresumptionRaised
  | PresumptionRebutted
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch71.Procedure
