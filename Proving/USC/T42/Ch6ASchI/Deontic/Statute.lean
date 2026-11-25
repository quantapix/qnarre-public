import Proving.USC.T42.Ch6ASchI.Deontic.Predicates
import Proving.USC.T42.Ch6ASchI.Deontic.Types
import Proving.USC.Common.Types
















open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Deontic



structure Prohibition201 (p : Payment) (a : Agency) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEligibilityDeterminer201 a c
  condition : PaymentIsDescribed201 p c



def Prohibition201Violated (p : Payment) (a : Agency) (c : ComplaintText) : Prop :=
  Prohibition201 p a c ∧ CountedAsIncomeOrResources201 p a c





def Obligation202Breached (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsAssistantSecretaryForHealth202 a c ∧ ¬ AdministeredPhsUnderSecretary202 a c



structure Prohibition203Division (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsServiceActor203 o c
  condition : WithoutSecretaryApproval203 c



def Prohibition203DivisionViolated (o : Officer) (c : ComplaintText) : Prop :=
  Prohibition203Division o c ∧ DivisionStructureChanged203 o c



def Power203OrganizeExercised (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSecretary203 a c ∧ AssignedOrEstablishedUnits203 a c




def Obligation204CitizenBreached (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsCommissionedOfficer204 o c ∧ ¬ IsUnitedStatesCitizen204 o c


def Power204AppointExercised (a : Agency) (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsPresident204 a c ∧ AppointedCommissionedOfficer204 a o c



def Obligation204RrcReadinessBreached (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsReadyReserveCorps204 o c ∧ ¬ ParticipatedAndAvailable204 o c


def recruitmentAppropriation204Usd : Nat := 5000000
def readyReserveAppropriation204Usd : Nat := 12500000
def appropriationFiscalYearFirst204 : Nat := 2010
def appropriationFiscalYearLast204 : Nat := 2014




def Obligation204aEstablishReqBreached (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSecretary204a a c ∧ ¬ EstablishedReadinessRequirements204a a c



def Obligation204aReadinessMemberBreached (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsCorpsMember204a o c ∧ ¬ MeetsReadinessRequirements204a o c
    ∧ ¬ ReadinessWaiverGranted204a o c



structure Power205Appoint (a : Agency) (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPresident205 a c
  condition : SenateAdviceAndConsent205 c



def Power205AppointExercised (a : Agency) (o : Officer) (c : ComplaintText) : Prop :=
  Power205Appoint a o c ∧ AppointedSurgeonGeneral205 a o c



def Obligation205QualificationBreached (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsSurgeonGeneralAppointee205 o c ∧ ¬ MeetsSurgeonGeneralQualifications205 o c


def surgeonGeneralTermYears205 : Nat := 4




def Obligation206AssignDeputyBreached (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSurgeonGeneral206 a c ∧ ¬ AssignedDeputySurgeonGeneral206 a c



def Power206CreateTempExercised (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSurgeonGeneral206 a c ∧ SecretaryApprovalObtained206 c
    ∧ CreatedSpecialTemporaryPositions206 a c


def deputyAssignmentCount206 : Nat := 1
def assistantSurgeonGeneralAssignmentCount206 : Nat := 8


def tempPositionCapPerCentum206 : Nat := 1

structure TempPositionCount206 where
  created : Nat
  corpsBasis : Nat
  deriving Repr



def Prohibition206TempCapViolated (t : TempPositionCount206) : Prop :=
  t.created * 100 > tempPositionCapPerCentum206 * t.corpsBasis




def Obligation207ReserveSuffixBreached (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsReadyReserveOfficerTitle207 o c ∧ ¬ TitleHasReserveSuffix207 o c


def Power207PrescribeTitlesExercised (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsPresident207 a c ∧ PrescribedOfficerTitles207 a c

structure AssistantSurgeonGeneralGradeCount207 where
  higherGrade : Nat
  positions : Nat
  deriving Repr



def Prohibition207AsgCapViolated (a : AssistantSurgeonGeneralGradeCount207) : Prop :=
  2 * a.higherGrade > a.positions



structure OriginalAppointment209 (a : Agency) (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAppointingAuthority209 a c
  act : OriginalAppointmentMade209 a o c



def Prohibition209OriginalGradeViolated (a : Agency) (o : Officer) (c : ComplaintText) : Prop :=
  OriginalAppointment209 a o c ∧ ¬ ExaminationPassedOrGradeAllowed209 o c


def regularCorpsMaxAppointmentAge209 : Nat := 44



def Prohibition209AgeLimitViolated (o : Officer) (c : ComplaintText) (age : Nat) : Prop :=
  age > regularCorpsMaxAppointmentAge209 ∧ ¬ AgeAppointmentExceptionApplies209 o c


def aboveSeniorAssistantCapPerCentum209 : Nat := 10

structure OriginalAppointmentCount209 where
  aboveSeniorAssistant : Nat
  totalOriginal : Nat
  deriving Repr



def Prohibition209TenPercentCapViolated (t : OriginalAppointmentCount209) : Prop :=
  t.aboveSeniorAssistant * 100 > aboveSeniorAssistantCapPerCentum209 * t.totalOriginal


def Power209DesignateFellowsExercised (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSurgeonGeneral209 a c ∧ DesignatedScientistFellows209 a c





def Permission209dOsteopathPermitted (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsOsteopathyGraduate209d o c ∧ IsOsteopathyGraduateEligible209d o c




def Permission210PayPermitted (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsCommissionedOfficer210 o c ∧ EntitledToPayAndAllowances210 o c


def Power210EstablishPositionsExercised (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSecretary210 a c ∧ EstablishedSpecialPositions210 a c


def specialPositionsMax210 : Nat := 179
def nihMinPositions210 : Nat := 115

structure FieldEmployeeCompensation210 where
  totalPaid : Nat
  minAnnualSalary : Nat
  deriving Repr



def Prohibition210FieldCapViolated (f : FieldEmployeeCompensation210) : Prop :=
  f.totalPaid > f.minAnnualSalary




def Permission210_1LeavePermitted (o : Officer) (c : ComplaintText) : Prop :=
  AddresseeIsActiveDutyOfficer210_1 o c ∧ GrantedAnnualAndSickLeave210_1 o c


def accumulatedAnnualLeaveMaxDays210_1 : Nat := 120



def AccumulatedLeaveCapExceeded210_1 (days : Nat) : Prop :=
  days > accumulatedAnnualLeaveMaxDays210_1




def Obligation210bDivideCategoriesBreached (a : Agency) (c : ComplaintText) : Prop :=
  AddresseeIsSurgeonGeneral210b a c ∧ ¬ DividedCorpsIntoCategories210b a c



def Prohibition210bChangeAssignmentViolated (o : Officer) (c : ComplaintText) : Prop :=
  CategoryAssignmentChanged210b o c ∧ ¬ SurgeonGeneralFindingMade210b o c

end Proving.USC.T42.Ch6ASchI.Deontic
