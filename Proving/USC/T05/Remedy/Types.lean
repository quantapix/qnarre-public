



















import Proving.USC.Common.Types

namespace Proving.USC.T05.Remedy

open Proving.USC.Common






inductive Enforcer
  | privateReview
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr



inductive Disposition
  | stayEffectiveDate
  | preserveStatusQuo
  | compelAgencyAction
  | holdUnlawful
  | setAside
  | remand
  deriving DecidableEq, Repr




inductive SetAsideGround
  | arbitraryCapricious
  | contraryToConstitution
  | inExcessOfAuthority
  | withoutProcedure
  | unsupportedBySubstantialEvidence
  | unwarrantedByFacts
  deriving DecidableEq, Repr

end Proving.USC.T05.Remedy
