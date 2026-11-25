






import Proving.USC.T42.Ch6ASchI.Elements.Statute

namespace Proving.USC.T42.Ch6ASchI.Elements

open Proving.USC.Common


theorem section201Exclusion_intro {pay c}
    (h : DescribedHemophiliaPayment pay c) : Section201Exclusion pay c :=
  ⟨h⟩


theorem section204CommissionedOfficer_intro {p c}
    (hCit : IsUnitedStatesCitizen p c) (hApp : AppointedByPresident p c) :
    Section204CommissionedOfficer p c :=
  ⟨hCit, hApp⟩


theorem section204aDisciplinaryAction_intro {p c}
    (hSub : SubjectToReadinessRequirements p c) (hGround : ReadinessDefault p c)
    (hNoWaiver : ¬ ReadinessWaiverGranted p c) :
    Section204aDisciplinaryAction p c :=
  ⟨hSub, hGround, hNoWaiver⟩


theorem section205SurgeonGeneralEligibility_intro {p c}
    (hReg : IsMemberOfRegularCorps p c) (hTr : HasPublicHealthTrainingOrExperience p c)
    (hApp : AppointedByPresidentWithSenateConsent p c) :
    Section205SurgeonGeneralEligibility p c :=
  ⟨hReg, hTr, hApp⟩


theorem section209OriginalAppointment_intro {p c}
    (hGr : IsOriginalAppointmentToPermittedGrade p c) (hEx : PassedAppointmentExamination p c)
    (hAge : AgeAppointmentBarSatisfied p c) (hStd : MeetsPresidentialAppointmentStandards p c) :
    Section209OriginalAppointment p c :=
  ⟨hGr, hEx, hAge, hStd⟩


theorem section209dOsteopathEligibility_intro {p c}
    (hGrad : IsOsteopathyCollegeGraduate p c) (hQual : OsteopathyLicensureQualification p c) :
    Section209dOsteopathEligibility p c :=
  ⟨hGrad, hQual⟩


theorem section210PayEntitlement_intro {p c}
    (h : OfficerEntitledToPayAndAllowances p c) : Section210PayEntitlement p c :=
  ⟨h⟩

end Proving.USC.T42.Ch6ASchI.Elements
