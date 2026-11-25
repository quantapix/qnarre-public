import Proving.USC.T42.Ch6ASchI.Ontology.Types
import Proving.USC.Common.Types








namespace Proving.USC.T42.Ch6ASchI.Ontology

open Proving.USC.Common






axiom IsClassSettlementPayment (pmt : Payment) (c : ComplaintText) : Prop



axiom IsReleaseInLieuPayment (pmt : Payment) (c : ComplaintText) : Prop


axiom IsFundPayment (pmt : Payment) (c : ComplaintText) : Prop





axiom IsOfficeOfSurgeonGeneralUnit (u : ServiceUnit) (c : ComplaintText) : Prop


axiom IsNIHUnit (u : ServiceUnit) (c : ComplaintText) : Prop


axiom IsBureauOfMedicalServicesUnit (u : ServiceUnit) (c : ComplaintText) : Prop


axiom IsBureauOfStateServicesUnit (u : ServiceUnit) (c : ComplaintText) : Prop


axiom IsAHRQUnit (u : ServiceUnit) (c : ComplaintText) : Prop





axiom IsCommissionedOfficer (p : Person) (c : ComplaintText) : Prop


axiom IsWarrantOfficer (p : Person) (c : ComplaintText) : Prop



axiom IsCitizenOfUS (p : Person) (c : ComplaintText) : Prop


axiom IsRegularCorps (k : Corps) (c : ComplaintText) : Prop


axiom IsReadyReserveCorps (k : Corps) (c : ComplaintText) : Prop





axiom ArisesFromNationalEmergency (n : PublicHealthCareNeed) (c : ComplaintText) : Prop


axiom ArisesFromMajorDisaster (n : PublicHealthCareNeed) (c : ComplaintText) : Prop


axiom ArisesFromPublicHealthEmergency (n : PublicHealthCareNeed) (c : ComplaintText) : Prop


axiom ArisesFromOtherDeployableEmergency (n : PublicHealthCareNeed) (c : ComplaintText) : Prop




axiom IsMemberOfRegularCorps (p : Person) (c : ComplaintText) : Prop



axiom HasPublicHealthTrainingOrExperience (p : Person) (c : ComplaintText) : Prop





axiom IsDeputySurgeonGeneral (p : Person) (c : ComplaintText) : Prop


axiom IsAssistantSurgeonGeneral (p : Person) (c : ComplaintText) : Prop




axiom IsCommissionedGrade (g : Grade) (c : ComplaintText) : Prop




axiom IsEligibleForOriginalAppointment (p : Person) (c : ComplaintText) : Prop


axiom IsSpecialConsultant (p : Person) (c : ComplaintText) : Prop




axiom IsGraduateOfOsteopathyCollege (p : Person) (c : ComplaintText) : Prop



axiom EligibleForLicensureInMajorityOfStates (p : Person) (c : ComplaintText) : Prop


axiom ApprovedByAcceptableBody (p : Person) (c : ComplaintText) : Prop




axiom IsFieldEmployeeOfService (p : Person) (c : ComplaintText) : Prop




axiom IsAccruedAnnualLeave (l : LeaveBalance) (c : ComplaintText) : Prop



axiom IsAccumulatedAnnualLeave (l : LeaveBalance) (c : ComplaintText) : Prop





axiom IsProfessionalCategory (cat : ProfessionalCategory) (c : ComplaintText) : Prop



axiom IsGradeVacancy (v : GradeVacancy) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Ontology
