


























import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Procedure

open Proving.USC.Common




opaque Grievance : Type




inductive EnforcementRoute
  | titleI
  | titleII
  | titleIII
  deriving DecidableEq, Repr






inductive State
  | GrievanceArisen
  | RemediesInvoked
  | Adjudicated
  | TimeBarred
  deriving DecidableEq, Repr



opaque MedicalExam : Type



opaque Solicitation : Type

end Proving.USC.T42.ADA.Procedure
