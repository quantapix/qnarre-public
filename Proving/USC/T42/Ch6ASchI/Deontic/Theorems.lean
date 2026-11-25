import Proving.USC.T42.Ch6ASchI.Deontic.Statute
import Proving.USC.T42.Ch6ASchI.Deontic.Predicates
import Proving.USC.T42.Ch6ASchI.Deontic.Types
import Proving.USC.Common.Types







open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Deontic


theorem prohibition201Violated_intro {p a c}
    (hAddr : AddresseeIsEligibilityDeterminer201 a c) (hCond : PaymentIsDescribed201 p c)
    (hAct : CountedAsIncomeOrResources201 p a c) : Prohibition201Violated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation202Breached_intro {a c}
    (hAddr : AddresseeIsAssistantSecretaryForHealth202 a c)
    (hNact : ¬ AdministeredPhsUnderSecretary202 a c) : Obligation202Breached a c :=
  ⟨hAddr, hNact⟩


theorem prohibition203DivisionViolated_intro {o c}
    (hAddr : AddresseeIsServiceActor203 o c) (hCond : WithoutSecretaryApproval203 c)
    (hAct : DivisionStructureChanged203 o c) : Prohibition203DivisionViolated o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem power203OrganizeExercised_intro {a c}
    (hAddr : AddresseeIsSecretary203 a c) (hAct : AssignedOrEstablishedUnits203 a c) :
    Power203OrganizeExercised a c :=
  ⟨hAddr, hAct⟩


theorem obligation204CitizenBreached_intro {o c}
    (hAddr : AddresseeIsCommissionedOfficer204 o c) (hNcit : ¬ IsUnitedStatesCitizen204 o c) :
    Obligation204CitizenBreached o c :=
  ⟨hAddr, hNcit⟩

theorem power204AppointExercised_intro {a o c}
    (hAddr : AddresseeIsPresident204 a c) (hAct : AppointedCommissionedOfficer204 a o c) :
    Power204AppointExercised a o c :=
  ⟨hAddr, hAct⟩

theorem obligation204RrcReadinessBreached_intro {o c}
    (hAddr : AddresseeIsReadyReserveCorps204 o c) (hNact : ¬ ParticipatedAndAvailable204 o c) :
    Obligation204RrcReadinessBreached o c :=
  ⟨hAddr, hNact⟩


theorem obligation204aEstablishReqBreached_intro {a c}
    (hAddr : AddresseeIsSecretary204a a c) (hNact : ¬ EstablishedReadinessRequirements204a a c) :
    Obligation204aEstablishReqBreached a c :=
  ⟨hAddr, hNact⟩

theorem obligation204aReadinessMemberBreached_intro {o c}
    (hAddr : AddresseeIsCorpsMember204a o c) (hNmeets : ¬ MeetsReadinessRequirements204a o c)
    (hNwaiver : ¬ ReadinessWaiverGranted204a o c) :
    Obligation204aReadinessMemberBreached o c :=
  ⟨hAddr, hNmeets, hNwaiver⟩


theorem power205AppointExercised_intro {a o c}
    (hAddr : AddresseeIsPresident205 a c) (hCond : SenateAdviceAndConsent205 c)
    (hAct : AppointedSurgeonGeneral205 a o c) : Power205AppointExercised a o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligation205QualificationBreached_intro {o c}
    (hAddr : AddresseeIsSurgeonGeneralAppointee205 o c)
    (hNqual : ¬ MeetsSurgeonGeneralQualifications205 o c) :
    Obligation205QualificationBreached o c :=
  ⟨hAddr, hNqual⟩


theorem obligation206AssignDeputyBreached_intro {a c}
    (hAddr : AddresseeIsSurgeonGeneral206 a c) (hNact : ¬ AssignedDeputySurgeonGeneral206 a c) :
    Obligation206AssignDeputyBreached a c :=
  ⟨hAddr, hNact⟩

theorem power206CreateTempExercised_intro {a c}
    (hAddr : AddresseeIsSurgeonGeneral206 a c) (hCond : SecretaryApprovalObtained206 c)
    (hAct : CreatedSpecialTemporaryPositions206 a c) : Power206CreateTempExercised a c :=
  ⟨hAddr, hCond, hAct⟩

theorem prohibition206TempCapViolated_intro {t : TempPositionCount206}
    (h : t.created * 100 > tempPositionCapPerCentum206 * t.corpsBasis) :
    Prohibition206TempCapViolated t := h


theorem obligation207ReserveSuffixBreached_intro {o c}
    (hAddr : AddresseeIsReadyReserveOfficerTitle207 o c) (hNsuffix : ¬ TitleHasReserveSuffix207 o c) :
    Obligation207ReserveSuffixBreached o c :=
  ⟨hAddr, hNsuffix⟩

theorem power207PrescribeTitlesExercised_intro {a c}
    (hAddr : AddresseeIsPresident207 a c) (hAct : PrescribedOfficerTitles207 a c) :
    Power207PrescribeTitlesExercised a c :=
  ⟨hAddr, hAct⟩

theorem prohibition207AsgCapViolated_intro {a : AssistantSurgeonGeneralGradeCount207}
    (h : 2 * a.higherGrade > a.positions) : Prohibition207AsgCapViolated a := h


theorem prohibition209OriginalGradeViolated_intro {a o c}
    (hAddr : AddresseeIsAppointingAuthority209 a c) (hAct : OriginalAppointmentMade209 a o c)
    (hNexam : ¬ ExaminationPassedOrGradeAllowed209 o c) :
    Prohibition209OriginalGradeViolated a o c :=
  ⟨⟨hAddr, hAct⟩, hNexam⟩

theorem prohibition209AgeLimitViolated_intro {o c age}
    (hAge : age > regularCorpsMaxAppointmentAge209)
    (hNexc : ¬ AgeAppointmentExceptionApplies209 o c) :
    Prohibition209AgeLimitViolated o c age :=
  ⟨hAge, hNexc⟩

theorem prohibition209TenPercentCapViolated_intro {t : OriginalAppointmentCount209}
    (h : t.aboveSeniorAssistant * 100 > aboveSeniorAssistantCapPerCentum209 * t.totalOriginal) :
    Prohibition209TenPercentCapViolated t := h

theorem power209DesignateFellowsExercised_intro {a c}
    (hAddr : AddresseeIsSurgeonGeneral209 a c) (hAct : DesignatedScientistFellows209 a c) :
    Power209DesignateFellowsExercised a c :=
  ⟨hAddr, hAct⟩


theorem permission209dOsteopathPermitted_intro {o c}
    (hAddr : AddresseeIsOsteopathyGraduate209d o c) (hElig : IsOsteopathyGraduateEligible209d o c) :
    Permission209dOsteopathPermitted o c :=
  ⟨hAddr, hElig⟩


theorem permission210PayPermitted_intro {o c}
    (hAddr : AddresseeIsCommissionedOfficer210 o c) (hEnt : EntitledToPayAndAllowances210 o c) :
    Permission210PayPermitted o c :=
  ⟨hAddr, hEnt⟩

theorem power210EstablishPositionsExercised_intro {a c}
    (hAddr : AddresseeIsSecretary210 a c) (hAct : EstablishedSpecialPositions210 a c) :
    Power210EstablishPositionsExercised a c :=
  ⟨hAddr, hAct⟩

theorem prohibition210FieldCapViolated_intro {f : FieldEmployeeCompensation210}
    (h : f.totalPaid > f.minAnnualSalary) : Prohibition210FieldCapViolated f := h


theorem permission210_1LeavePermitted_intro {o c}
    (hAddr : AddresseeIsActiveDutyOfficer210_1 o c) (hGr : GrantedAnnualAndSickLeave210_1 o c) :
    Permission210_1LeavePermitted o c :=
  ⟨hAddr, hGr⟩

theorem accumulatedLeaveCapExceeded210_1_intro {days : Nat}
    (h : days > accumulatedAnnualLeaveMaxDays210_1) : AccumulatedLeaveCapExceeded210_1 days := h


theorem obligation210bDivideCategoriesBreached_intro {a c}
    (hAddr : AddresseeIsSurgeonGeneral210b a c) (hNact : ¬ DividedCorpsIntoCategories210b a c) :
    Obligation210bDivideCategoriesBreached a c :=
  ⟨hAddr, hNact⟩

theorem prohibition210bChangeAssignmentViolated_intro {o c}
    (hAct : CategoryAssignmentChanged210b o c) (hNfind : ¬ SurgeonGeneralFindingMade210b o c) :
    Prohibition210bChangeAssignmentViolated o c :=
  ⟨hAct, hNfind⟩

end Proving.USC.T42.Ch6ASchI.Deontic
