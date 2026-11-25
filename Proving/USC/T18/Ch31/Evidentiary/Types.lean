import Proving.USC.Common.Types








namespace Proving.USC.T18.Ch31.Evidentiary




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

end Proving.USC.T18.Ch31.Evidentiary
