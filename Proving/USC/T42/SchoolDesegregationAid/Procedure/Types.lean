

























import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Procedure

open Proving.USC.Common




opaque Applicant : Type




opaque AssistanceProceeding : Type




opaque CourtProceeding : Type








inductive State
  | Applied
  | ConsiderationMade
  | Awarded
  | Paid
  deriving DecidableEq, Repr

end Proving.USC.T42.SchoolDesegregationAid.Procedure
