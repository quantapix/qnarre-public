


























import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Deontic

open Proving.USC.Common



inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr







opaque CoveredAddressee : Type





opaque RegulatedAct : Type






opaque ProtectedIndividual : Type

end Proving.USC.T42.ADA.Deontic
