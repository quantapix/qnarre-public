import Proving.USC.T42.Ch6ASchI.Procedure.Predicates











namespace Proving.USC.T42.Ch6ASchI.Procedure
open Proving.USC.Common





def ReleaseSignedTimely (p : Person) (c : ComplaintText) : Prop :=
  ReleaseSignedDay p c ≤ Nat.max Dec311997Day (ReleaseSentDay p c + 270)



def SurgeonGeneralTermExpired (o : Officer) (c : ComplaintText) : Prop :=
  CurrentDay c ≥ SurgeonGeneralTermStartDay o c + 4 * 365



def TempPositionsWithinOnePercent (c : ComplaintText) : Prop :=
  TemporaryAsstSurgeonGeneralCount c * 100 ≤ RegularAndReserveActiveCount c



def AsstSurgeonGeneralHighGradeWithinHalf (c : ComplaintText) : Prop :=
  AsstSurgeonGeneralAboveBrigadierCount c * 2 ≤ Section206bPositionCount c




def AgeEligibleForAppointment (o : Officer) (c : ComplaintText) : Prop :=
  OfficerAge o c ≤ 44
    ∨ YearsActiveService o c ≥ OfficerAge o c - 44
    ∨ SurgeonGeneralExceptionalQualificationsFinding o c



def ReappointmentWithinTwoYears (o : Officer) (c : ComplaintText) : Prop :=
  ReappointmentApplicationDay o c ≤ PriorCommissionTerminatedDay o c + 2 * 365


def LeaveAccumulationWithinCap (o : Officer) (c : ComplaintText) : Prop :=
  AccumulatedAnnualLeaveDays o c ≤ 120




structure TimelyReleaseExecution (p : Person) (c : ComplaintText) : Prop where
  timely : ReleaseSignedTimely p c


structure ValidDivisionReorganization (d : Division) (c : ComplaintText) : Prop where
  proposed : DivisionChangeProposed d c
  approved : SecretaryApprovedDivisionChange d c



structure ValidCommissionedAppointment (o : Officer) (c : ComplaintText) : Prop where
  appointed : AppointedByPresident o c
  citizen   : IsUnitedStatesCitizen o c



structure ReadinessDisciplineTrigger (o : Officer) (c : ComplaintText) : Prop where
  requirements : ReadinessRequirementsEstablished c
  determined   : AnnualReadinessDeterminationMade o c
  notCompliant : ¬ MeetsReadinessRequirements o c
  notWaived    : ¬ ReadinessWaiverGranted o c



structure ValidSurgeonGeneralAppointment (o : Officer) (c : ComplaintText) : Prop where
  appointed : AppointedSurgeonGeneral o c
  regular   : IsRegularCorpsMember o c
  qualified : HasSpecializedPublicHealthTraining o c



structure SurgeonGeneralReversionTrigger (o : Officer) (c : ComplaintText) : Prop where
  expired : SurgeonGeneralTermExpired o c


structure ValidDeputySurgeonGeneralAssignment (o : Officer) (c : ComplaintText) : Prop where
  assigned : DeputySurgeonGeneralAssigned o c


structure TemporaryStaffingWithinLimit (c : ComplaintText) : Prop where
  withinCap : TempPositionsWithinOnePercent c



structure ValidGradeStrengthRegulation (c : ComplaintText) : Prop where
  prescribed : MaxOfficersPerGradePrescribed c
  withinHalf : AsstSurgeonGeneralHighGradeWithinHalf c



structure ValidOriginalAppointment (o : Officer) (c : ComplaintText) : Prop where
  appointment : OriginalAppointmentMade o c
  examined    : ExaminationPassed o c
  ageEligible : AgeEligibleForAppointment o c



structure ValidReappointment (o : Officer) (c : ComplaintText) : Prop where
  withinWindow : ReappointmentWithinTwoYears o c
  standards    : MeetsAppointmentStandards o c



structure ValidOsteopathAppointmentEligibility (o : Officer) (c : ComplaintText) : Prop where
  eligible : IsEligibleOsteopathGraduate o c


structure ValidLeaveAccumulation (o : Officer) (c : ComplaintText) : Prop where
  granted   : LeaveGranted o c
  withinCap : LeaveAccumulationWithinCap o c



structure ValidCategoryReassignment (o : Officer) (c : ComplaintText) : Prop where
  assigned : AssignedToProfessionalCategory o c
  finding  : SurgeonGeneralReassignmentFinding o c



structure ValidVacancyPromotion (o : Officer) (c : ComplaintText) : Prop where
  vacancy   : VacancyExistsInGrade o c
  promotion : PermanentPromotionMade o c

end Proving.USC.T42.Ch6ASchI.Procedure
