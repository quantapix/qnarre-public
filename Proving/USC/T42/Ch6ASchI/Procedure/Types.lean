import Proving.USC.Common.Types






















namespace Proving.USC.T42.Ch6ASchI.Procedure




opaque Officer : Type




opaque Division : Type




inductive AppointmentState
  | Eligible
  | Examined
  | Appointed
  | Reverted
  deriving DecidableEq, Repr




inductive ReadinessState
  | RequirementsEstablished
  | Determined
  | Compliant
  | SubjectToDiscipline
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch6ASchI.Procedure
