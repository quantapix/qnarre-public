













import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Procedure

open Proving.USC.Common



opaque Alien : Type


inductive ReentryState
  | Present
  | Departed
  | SeeksReadmission
  | Barred
  | Admissible
  deriving DecidableEq, Repr


inductive EnforcementState
  | NoticeIssued
  | HearingBeforeALJ
  | FinalOrder
  | JudicialReview
  | Closed
  deriving DecidableEq, Repr


def year : Nat := 365

end Proving.USC.T08.Inadmissibility.Procedure
