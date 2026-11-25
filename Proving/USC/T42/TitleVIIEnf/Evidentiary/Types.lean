
















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Evidentiary

open Proving.USC.Common (ComplaintText)



inductive Bearer
  | Plaintiff
  | Defendant
  | Government
  deriving DecidableEq, Repr







inductive Standard
  | ReasonableCause
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  deriving DecidableEq, Repr



inductive Presumption
  | None
  | Rebuttable
  | Conclusive
  deriving DecidableEq, Repr


structure Allocation where
  bearer       : Bearer
  standard     : Standard
  presumption  : Presumption
  deriving Repr

end Proving.USC.T42.TitleVIIEnf.Evidentiary
