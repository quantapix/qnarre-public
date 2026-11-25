import Proving.USC.Common.Types
















namespace Proving.USC.T05.ScopeOfReview.Procedure

open Proving.USC.Common



opaque AgencyAction : Type




opaque AdminRecord : Type





inductive State
  | ActionTaken
  | EffectivenessPostponed
  | StatusPreserved
  | RecordReviewed
  | Adjudicated
  deriving DecidableEq, Repr

end Proving.USC.T05.ScopeOfReview.Procedure
