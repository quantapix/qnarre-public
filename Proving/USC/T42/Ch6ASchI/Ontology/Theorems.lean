import Proving.USC.T42.Ch6ASchI.Ontology.Statute









namespace Proving.USC.T42.Ch6ASchI.Ontology

open Proving.USC.Common


theorem isDescribedPayment_intro {pmt c}
    (h : IsClassSettlementPayment pmt c) : IsDescribedPayment pmt c :=
  .classSettlement h


theorem isServiceComponent_intro {u c}
    (h : IsOfficeOfSurgeonGeneralUnit u c) : IsServiceComponent u c :=
  .officeOfSurgeonGeneral h


theorem isUrgentOrEmergencyNeed_intro {n c}
    (h : ArisesFromNationalEmergency n c) : IsUrgentOrEmergencyNeed n c :=
  .nationalEmergency h


theorem commissionedOfficerQualification_intro {p c}
    (hOff : IsCommissionedOfficer p c) (hCit : IsCitizenOfUS p c)
    : CommissionedOfficerQualification p c :=
  ⟨hOff, hCit⟩


theorem surgeonGeneralEligibility_intro {p c}
    (hRC : IsMemberOfRegularCorps p c) (hT : HasPublicHealthTrainingOrExperience p c)
    : SurgeonGeneralEligibility p c :=
  ⟨hRC, hT⟩


theorem osteopathAppointmentEligibility_intro {p c}
    (hGrad : IsGraduateOfOsteopathyCollege p c)
    (hLic : EligibleForLicensureInMajorityOfStates p c)
    : OsteopathAppointmentEligibility p c :=
  .viaMajorityStates hGrad hLic

end Proving.USC.T42.Ch6ASchI.Ontology
