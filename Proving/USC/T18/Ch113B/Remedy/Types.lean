








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Remedy

open Proving.USC.Common








inductive Enforcer
  | privateRight
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr





inductive Relief

  | trebleDamages

  | costs

  | attorneysFees

  | fine

  | imprisonment

  | deathPenalty


  | mandatoryMinimum

  | noProbation

  | consecutiveSentence


  | estoppel


  | assetExecution

  | injunction

  | declaratory
  deriving DecidableEq, Repr



opaque CriminalJudgment : Type




opaque ForeignTerroristOrganization : Type



opaque BlockedAsset : Type

end Proving.USC.T18.Ch113B.Remedy
