









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Procedure

open Proving.USC.Common




opaque Prosecution : Type




opaque IdentityDocument : Type



opaque SentenceRecord : Type






inductive Stage where
  | ConductCompleted
  | FederalJurisdictionEstablished
  | ProsecutionCommenced
  | ElementsProven
  | PenaltyTierDetermined
  | SentenceImposed
  | ExemptFromProsecution
  deriving DecidableEq, Repr




inductive Ch77ObstructionSection where
  | S1590
  | S1591
  | S1592
  deriving DecidableEq, Repr








inductive Ch77PredicateSection where
  | S1581
  | S1583
  | S1584
  | S1589
  | S1590
  | S1591
  | S1594a
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Reslice.Procedure
