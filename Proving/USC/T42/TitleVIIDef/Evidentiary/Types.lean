



















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Evidentiary

open Proving.USC.Common (ComplaintText)




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

end Proving.USC.T42.TitleVIIDef.Evidentiary
