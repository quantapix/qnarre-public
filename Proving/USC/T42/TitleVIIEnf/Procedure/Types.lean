























import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Procedure

open Proving.USC.Common



opaque Charge : Type



opaque Respondent : Type



opaque DeferralAgency : Type




opaque CivilAction : Type





inductive State
  | PracticeOccurred
  | Deferred
  | ChargeFiled
  | ServiceComplete
  | Investigated
  | Conciliated
  | SuitFiled
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T42.TitleVIIEnf.Procedure
