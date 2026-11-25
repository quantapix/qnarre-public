

























import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)



opaque Proceeding : Type



opaque CourtRecord : Type







inductive State
  | Charged
  | InsanityDefenseRaised
  | InsanityDefenseEstablished
  | ConvictionEntered
  | FirstConvictionEntered
  | SubsequentConvictionEntered
  | DuressDefenseRaised
  | RecordSealed
  deriving DecidableEq, Repr







structure SealDates where

  sealGrantedDay   : Nat

  convictionDay    : Nat
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch1.Part2.Procedure
