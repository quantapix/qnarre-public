













import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Remedy

open Proving.USC.Common












inductive Enforcer
  | privateRight
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr







inductive Relief
  | injunction
  | reinstatement
  | hiring
  | backPay
  | equitableRelief
  | declaratory
  | attorneysFees
  | expertFees
  | preliminaryInjunction
  | complianceOrder
  | criminalFine
  | imprisonment
  deriving DecidableEq, Repr

end Proving.USC.T42.TitleVIIEnf.Remedy
