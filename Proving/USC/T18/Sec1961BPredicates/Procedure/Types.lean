



























import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Procedure

open Proving.USC.Common




inductive State
  | ConductOccurred
  | FederalCircumstanceAttached
  | ProbableCausePresumed
  | CarrierNotified
  | FacilityDiscontinued
  | PropertySeized
  | PropertyForfeited
  | ProsecutionEnhanced
  deriving DecidableEq, Repr



opaque Facility : Type



opaque Notice : Type



opaque Property : Type

end Proving.USC.T18.Sec1961BPredicates.Procedure
