
















import Proving.USC.Common.Types

namespace Proving.USC.T05.Procedure

open Proving.USC.Common



opaque AgencyProceeding : Type



opaque AgencyAction : Type




inductive State

  | AdjudicationRequired

  | NoticeGiven

  | HearingHeld

  | RecordClosed

  | InitialDecision

  | FinalAgencyAction

  | Reviewable

  | ReviewObtained
  deriving DecidableEq, Repr

end Proving.USC.T05.Procedure
