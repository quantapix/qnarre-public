import Proving.USC.T42.Ch6ASchI.Procedure.Types
















namespace Proving.USC.T42.Ch6ASchI.Procedure
open Proving.USC.Common





axiom ReleaseSentDay (p : Person) (c : ComplaintText) : Nat



axiom ReleaseSignedDay (p : Person) (c : ComplaintText) : Nat



axiom Dec311997Day : Nat





axiom DivisionChangeProposed (d : Division) (c : ComplaintText) : Prop




axiom SecretaryApprovedDivisionChange (d : Division) (c : ComplaintText) : Prop





axiom AppointedByPresident (o : Officer) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizen (o : Officer) (c : ComplaintText) : Prop





axiom ReadinessRequirementsEstablished (c : ComplaintText) : Prop




axiom AnnualReadinessDeterminationMade (o : Officer) (c : ComplaintText) : Prop



axiom MeetsReadinessRequirements (o : Officer) (c : ComplaintText) : Prop




axiom ReadinessWaiverGranted (o : Officer) (c : ComplaintText) : Prop






axiom AppointedSurgeonGeneral (o : Officer) (c : ComplaintText) : Prop



axiom IsRegularCorpsMember (o : Officer) (c : ComplaintText) : Prop




axiom HasSpecializedPublicHealthTraining (o : Officer) (c : ComplaintText) : Prop



axiom SurgeonGeneralTermStartDay (o : Officer) (c : ComplaintText) : Nat



axiom CurrentDay (c : ComplaintText) : Nat






axiom DeputySurgeonGeneralAssigned (o : Officer) (c : ComplaintText) : Prop




axiom TemporaryAsstSurgeonGeneralCount (c : ComplaintText) : Nat





axiom RegularAndReserveActiveCount (c : ComplaintText) : Nat






axiom MaxOfficersPerGradePrescribed (c : ComplaintText) : Prop




axiom AsstSurgeonGeneralAboveBrigadierCount (c : ComplaintText) : Nat




axiom Section206bPositionCount (c : ComplaintText) : Nat






axiom ExaminationPassed (o : Officer) (c : ComplaintText) : Prop



axiom OriginalAppointmentMade (o : Officer) (c : ComplaintText) : Prop




axiom SurgeonGeneralExceptionalQualificationsFinding (o : Officer) (c : ComplaintText) : Prop




axiom MeetsAppointmentStandards (o : Officer) (c : ComplaintText) : Prop



axiom OfficerAge (o : Officer) (c : ComplaintText) : Nat



axiom YearsActiveService (o : Officer) (c : ComplaintText) : Nat




axiom PriorCommissionTerminatedDay (o : Officer) (c : ComplaintText) : Nat



axiom ReappointmentApplicationDay (o : Officer) (c : ComplaintText) : Nat






axiom IsEligibleOsteopathGraduate (o : Officer) (c : ComplaintText) : Prop





axiom LeaveGranted (o : Officer) (c : ComplaintText) : Prop



axiom AccumulatedAnnualLeaveDays (o : Officer) (c : ComplaintText) : Nat





axiom AssignedToProfessionalCategory (o : Officer) (c : ComplaintText) : Prop





axiom SurgeonGeneralReassignmentFinding (o : Officer) (c : ComplaintText) : Prop



axiom VacancyExistsInGrade (o : Officer) (c : ComplaintText) : Prop



axiom PermanentPromotionMade (o : Officer) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Procedure
