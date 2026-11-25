






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Evidentiary

open Proving.USC.Common



inductive Bearer
  | Plaintiff
  | Defendant
  | Government
  deriving DecidableEq, Repr



inductive Standard
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  deriving DecidableEq, Repr



inductive Presumption
  | None
  | Rebuttable
  | Conclusive
  deriving DecidableEq, Repr



abbrev Allocation : Type := Bearer × Standard × Presumption




inductive AccessRuling
  | Open
  | Closed
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch96.EchoReslice.Evidentiary
