






















import Proving.USC.Common.Types

namespace Proving.USC.T18.Spec.Evidentiary



abbrev ComplaintText := Proving.USC.Common.ComplaintText


inductive Bearer
  | Plaintiff
  | Defendant
  | Government
  deriving DecidableEq


inductive Standard
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  deriving DecidableEq


inductive Presumption
  | None
  | Rebuttable
  | Conclusive
  deriving DecidableEq




abbrev Allocation := Bearer × Standard × Presumption

end Proving.USC.T18.Spec.Evidentiary
