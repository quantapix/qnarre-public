








import Proving.USC.T42.ADA.Procedure.Types
import Proving.USC.T42.ADA.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Procedure

open Proving.USC.Common





structure Transition where
  fromState : State
  toState   : State
  guard     : Prop










def chargeFilingWindowDays : Nat := 300




def filingTimely (accrualDay filingDay : Nat) : Prop :=
  filingDay - accrualDay ≤ chargeFilingWindowDays

instance (a f : Nat) : Decidable (filingTimely a f) := by
  unfold filingTimely; infer_instance





def solicitationAfter30 (dayOffset : Nat) : Prop := 30 < dayOffset

instance (d : Nat) : Decidable (solicitationAfter30 d) := by
  unfold solicitationAfter30; infer_instance








structure TimelyEnforcement
    (g : Grievance) (r : EnforcementRoute)
    (accrualDay filingDay : Nat) (c : ComplaintText) : Prop where
  arose      : GrievanceArisen g c
  routed     : RoutedToCorrectRemedy g r c
  accrualSet : AccrualDay g accrualDay c
  filingSet  : ChargeFilingDay g filingDay c
  charged    : AdministrativeChargeFiled g c

  inWindow   : filingTimely accrualDay filingDay






structure MedicalExamTimely (x : MedicalExam) (c : ComplaintText) : Prop where
  offerMade : ConditionalOfferMade x c
  inWindow  : ExamWithinPostOfferWindow x c





structure SolicitationInWindow (s : Solicitation) (dayOffset : Nat) (c : ComplaintText) : Prop where
  offsetSet : SolicitationDayOffset s dayOffset c

  after30   : solicitationAfter30 dayOffset

end Proving.USC.T42.ADA.Procedure
