
















import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Evidentiary

open Proving.USC.Common (ComplaintText Person)




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






inductive Trier
  | Court
  | Jury
  | EitherOnDemand
  deriving DecidableEq

end Proving.USC.T42.EqualRights.Evidentiary
