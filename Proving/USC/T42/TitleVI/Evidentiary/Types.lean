



















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Evidentiary

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


  | RecordFinding
  deriving DecidableEq


inductive Presumption
  | None
  | Rebuttable
  | Conclusive
  deriving DecidableEq



inductive Locus


  | discrimination2000d

  | nonCompliance2000d1

  | stateImmunity2000d7
  deriving DecidableEq

end Proving.USC.T42.TitleVI.Evidentiary
