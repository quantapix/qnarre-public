














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Counterfeiting.Procedure

open Proving.USC.Common




inductive CivilActionState
  | Accrued
  | Commenced
  | TimeBarred
  deriving DecidableEq, Repr




inductive SentencingState
  | Convicted
  | PresentenceReport
  | Sentenced
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch113.Counterfeiting.Procedure
