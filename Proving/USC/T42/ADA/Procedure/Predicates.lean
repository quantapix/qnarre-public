
















import Proving.USC.T42.ADA.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Procedure

open Proving.USC.Common









axiom GrievanceArisen (g : Grievance) (c : ComplaintText) : Prop






axiom RoutedToCorrectRemedy (g : Grievance) (r : EnforcementRoute) (c : ComplaintText) : Prop








axiom AdministrativeChargeFiled (g : Grievance) (c : ComplaintText) : Prop
















axiom AccrualDay (g : Grievance) (d : Nat) (c : ComplaintText) : Prop





axiom ChargeFilingDay (g : Grievance) (d : Nat) (c : ComplaintText) : Prop








axiom ConditionalOfferMade (x : MedicalExam) (c : ComplaintText) : Prop








axiom ExamWithinPostOfferWindow (x : MedicalExam) (c : ComplaintText) : Prop









axiom SolicitationDayOffset (s : Solicitation) (d : Nat) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Procedure
