







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Procedure

open Proving.USC.Common



opaque CorpsOfficer : Type



opaque Nominee : Type



opaque OrganizationalChange : Type



opaque ReadinessCycle : Type



opaque PositionRoster : Type



opaque AppointmentCycle : Type



opaque ExaminationRecord : Type


opaque PromotionAction : Type



opaque SeparationAction : Type


opaque RetirementAction : Type



opaque DetailAssignment : Type



opaque AdvisoryBody : Type



opaque SettlementRelease : Type




opaque EmergencyDeclaration : Type


opaque LeaveAccount : Type



opaque FlagPresentation : Type



opaque AppropriationAct : Type



inductive CommissionStage where
  | Nominated
  | Examined
  | Commissioned
  | OnActiveDuty
  | PromotionEligible
  | Promoted
  | Separated
  | Retired
  | Recalled
  | MilitaryService
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch6ASchI.Reearn.Procedure
