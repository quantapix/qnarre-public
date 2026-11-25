

















import Proving.USC.Common.Types

namespace Proving.USC.T29.LMRA.Procedure

open Proving.USC.Common



opaque EmergencyProceeding : Type


opaque BoardOfInquiry : Type



opaque CourtProceeding : Type


opaque HealthCareImpasse : Type


inductive EmergencyState
  | Threatened
  | BoardAppointed
  | BoardReported
  | InjunctionEntered
  | BoardReconvened
  | BallotCertified
  | InjunctionDischarged
  deriving DecidableEq, Repr


inductive HealthCareState
  | NoticeGiven
  | BoardEstablished
  | BoardReported
  | StatusQuoLifted
  deriving DecidableEq, Repr

end Proving.USC.T29.LMRA.Procedure
