import Proving.USC.T42.Ch6ASchI.Procedure.Statute







namespace Proving.USC.T42.Ch6ASchI.Procedure
open Proving.USC.Common


theorem timelyReleaseExecution_intro {p : Person} {c : ComplaintText}
    (hTimely : ReleaseSignedTimely p c) : TimelyReleaseExecution p c :=
  ⟨hTimely⟩


theorem validDivisionReorganization_intro {d : Division} {c : ComplaintText}
    (hProposed : DivisionChangeProposed d c)
    (hApproved : SecretaryApprovedDivisionChange d c) :
    ValidDivisionReorganization d c :=
  ⟨hProposed, hApproved⟩


theorem validCommissionedAppointment_intro {o : Officer} {c : ComplaintText}
    (hAppointed : AppointedByPresident o c)
    (hCitizen : IsUnitedStatesCitizen o c) :
    ValidCommissionedAppointment o c :=
  ⟨hAppointed, hCitizen⟩


theorem readinessDisciplineTrigger_intro {o : Officer} {c : ComplaintText}
    (hReq : ReadinessRequirementsEstablished c)
    (hDet : AnnualReadinessDeterminationMade o c)
    (hNotCompliant : ¬ MeetsReadinessRequirements o c)
    (hNotWaived : ¬ ReadinessWaiverGranted o c) :
    ReadinessDisciplineTrigger o c :=
  ⟨hReq, hDet, hNotCompliant, hNotWaived⟩


theorem validSurgeonGeneralAppointment_intro {o : Officer} {c : ComplaintText}
    (hAppointed : AppointedSurgeonGeneral o c)
    (hRegular : IsRegularCorpsMember o c)
    (hQualified : HasSpecializedPublicHealthTraining o c) :
    ValidSurgeonGeneralAppointment o c :=
  ⟨hAppointed, hRegular, hQualified⟩


theorem surgeonGeneralReversionTrigger_intro {o : Officer} {c : ComplaintText}
    (hExpired : SurgeonGeneralTermExpired o c) :
    SurgeonGeneralReversionTrigger o c :=
  ⟨hExpired⟩


theorem validDeputySurgeonGeneralAssignment_intro {o : Officer} {c : ComplaintText}
    (hAssigned : DeputySurgeonGeneralAssigned o c) :
    ValidDeputySurgeonGeneralAssignment o c :=
  ⟨hAssigned⟩


theorem temporaryStaffingWithinLimit_intro {c : ComplaintText}
    (hCap : TempPositionsWithinOnePercent c) :
    TemporaryStaffingWithinLimit c :=
  ⟨hCap⟩


theorem validGradeStrengthRegulation_intro {c : ComplaintText}
    (hPrescribed : MaxOfficersPerGradePrescribed c)
    (hHalf : AsstSurgeonGeneralHighGradeWithinHalf c) :
    ValidGradeStrengthRegulation c :=
  ⟨hPrescribed, hHalf⟩


theorem validOriginalAppointment_intro {o : Officer} {c : ComplaintText}
    (hAppointment : OriginalAppointmentMade o c)
    (hExamined : ExaminationPassed o c)
    (hAge : AgeEligibleForAppointment o c) :
    ValidOriginalAppointment o c :=
  ⟨hAppointment, hExamined, hAge⟩


theorem validReappointment_intro {o : Officer} {c : ComplaintText}
    (hWindow : ReappointmentWithinTwoYears o c)
    (hStandards : MeetsAppointmentStandards o c) :
    ValidReappointment o c :=
  ⟨hWindow, hStandards⟩


theorem validOsteopathAppointmentEligibility_intro {o : Officer} {c : ComplaintText}
    (hEligible : IsEligibleOsteopathGraduate o c) :
    ValidOsteopathAppointmentEligibility o c :=
  ⟨hEligible⟩


theorem validLeaveAccumulation_intro {o : Officer} {c : ComplaintText}
    (hGranted : LeaveGranted o c)
    (hCap : LeaveAccumulationWithinCap o c) :
    ValidLeaveAccumulation o c :=
  ⟨hGranted, hCap⟩


theorem validCategoryReassignment_intro {o : Officer} {c : ComplaintText}
    (hAssigned : AssignedToProfessionalCategory o c)
    (hFinding : SurgeonGeneralReassignmentFinding o c) :
    ValidCategoryReassignment o c :=
  ⟨hAssigned, hFinding⟩


theorem validVacancyPromotion_intro {o : Officer} {c : ComplaintText}
    (hVacancy : VacancyExistsInGrade o c)
    (hPromotion : PermanentPromotionMade o c) :
    ValidVacancyPromotion o c :=
  ⟨hVacancy, hPromotion⟩

end Proving.USC.T42.Ch6ASchI.Procedure
