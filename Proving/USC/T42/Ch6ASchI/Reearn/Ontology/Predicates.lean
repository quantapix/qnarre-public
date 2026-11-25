









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Reearn.Ontology






axiom IsClassSettlementFundPayment (pmt : Payment) (c : ComplaintText) : Prop





axiom IsReleaseInLieuOfClassSettlementPayment (pmt : Payment) (c : ComplaintText) : Prop




axiom IsSection101FundPayment (pmt : Payment) (c : ComplaintText) : Prop








axiom IsServiceConstituentUnit (u : Entity) (c : ComplaintText) : Prop






axiom IsRegularCorpsOfficer (p : Person) (c : ComplaintText) : Prop




axiom IsReadyReserveCorpsOfficer (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop





axiom IsWarrantOfficerOfService (p : Person) (c : ComplaintText) : Prop





axiom IsDeemedRegularCorpsOfficerByTransition (p : Person) (c : ComplaintText) : Prop






axiom IsNationalEmergencyDeclaration (n : PublicHealthNeed) (c : ComplaintText) : Prop




axiom IsStaffordActDeclaration (n : PublicHealthNeed) (c : ComplaintText) : Prop




axiom IsSecretarialPublicHealthEmergency (n : PublicHealthNeed) (c : ComplaintText) : Prop





axiom IsSecretarialJudgmentDeploymentEmergency (n : PublicHealthNeed) (c : ComplaintText) : Prop





axiom MeetsCorpsReadinessRequirements (p : Person) (c : ComplaintText) : Prop





axiom IsReadinessWaiverGround (p : Person) (c : ComplaintText) : Prop







axiom IsSurgeonGeneral (p : Person) (c : ComplaintText) : Prop




axiom HasPublicHealthTrainingOrExperience (p : Person) (c : ComplaintText) : Prop







axiom IsDeputySurgeonGeneral (p : Person) (c : ComplaintText) : Prop





axiom IsAssistantSurgeonGeneral (p : Person) (c : ComplaintText) : Prop






axiom IsCommissionedCorpsGrade (g : Grade) (c : ComplaintText) : Prop





axiom CorrespondsToArmyGrade (g : Grade) (c : ComplaintText) : Prop





axiom IsMedicalOfficerTitle (g : Grade) (c : ComplaintText) : Prop






axiom IsOriginalAppointmentToRegularCorps (a : Appointment) (c : ComplaintText) : Prop




axiom IsOriginalAppointmentToReadyReserveCorps (a : Appointment) (c : ComplaintText) : Prop




axiom PassedPrescribedAppointmentExamination (a : Appointment) (c : ComplaintText) : Prop






axiom IsPublicHealthExaminationSubject (cat : ProfessionalCategory) (c : ComplaintText) : Prop





axiom IsFormerOfficerEligibleForReappointment (p : Person) (c : ComplaintText) : Prop




axiom IsSpecialConsultant (p : Person) (c : ComplaintText) : Prop





axiom IsServiceFellowshipRecipient (p : Person) (c : ComplaintText) : Prop







axiom IsEligibleOsteopathicGraduate (p : Person) (c : ComplaintText) : Prop








axiom IsAdvisoryCouncilMemberEntitledToCompensation (p : Person) (c : ComplaintText) : Prop






axiom IsAccruedAnnualLeave (l : LeaveAmount) (c : ComplaintText) : Prop




axiom IsAccumulatedAnnualLeave (l : LeaveAmount) (c : ComplaintText) : Prop






axiom IsProfessionalCategory (cat : ProfessionalCategory) (c : ComplaintText) : Prop





axiom IsPromotionVacancy (g : Grade) (cat : ProfessionalCategory) (c : ComplaintText) : Prop







axiom IsRestrictedGrade (g : Grade) (cat : ProfessionalCategory) (c : ComplaintText) : Prop




axiom IsLengthOfServicePermanentPromotion (pr : Promotion) (c : ComplaintText) : Prop




axiom IsVacancyFillingPermanentPromotion (pr : Promotion) (c : ComplaintText) : Prop





axiom IsTemporaryPromotion (pr : Promotion) (c : ComplaintText) : Prop






axiom HasCompletedMedicalInternship (p : Person) (c : ComplaintText) : Prop






axiom IsUniformedServiceActiveService (sp : ServicePeriod) (c : ComplaintText) : Prop






axiom IsComparableNonCommissionedPhsService (sp : ServicePeriod) (c : ComplaintText) : Prop





axiom IsOtherRetirementCreditableService (sp : ServicePeriod) (c : ComplaintText) : Prop





axiom IsSeniorBiomedicalResearchServiceService (sp : ServicePeriod) (c : ComplaintText) : Prop





axiom IsBasicPayOfHighestTemporaryGrade (g : Grade) (c : ComplaintText) : Prop





axiom IsWartimeActiveService (sp : ServicePeriod) (c : ComplaintText) : Prop




axiom IsDetailToArmedForce (sp : ServicePeriod) (c : ComplaintText) : Prop





axiom IsServiceMilitarizedByExecutiveOrder (sp : ServicePeriod) (c : ComplaintText) : Prop





axiom DeemedActiveMilitaryServiceInArmedForces (sp : ServicePeriod) (c : ComplaintText) : Prop







axiom IsIncorporatedTitle10Provision (t : Title10Provision) (c : ComplaintText) : Prop





axiom IsDeemedHhsInspectorGeneral (p : Person) (c : ComplaintText) : Prop





axiom IsDeemedMilitaryDepartmentTerm (t : Title10Provision) (c : ComplaintText) : Prop







axiom IsFlagEligibleRetiringOfficer (p : Person) (c : ComplaintText) : Prop






axiom IsExecutiveDepartmentDetail (d : Detail) (c : ComplaintText) : Prop





axiom IsStateHealthAuthorityDetail (d : Detail) (c : ComplaintText) : Prop





axiom IsCongressionalOrInstitutionalDetail (d : Detail) (c : ComplaintText) : Prop







axiom IsPresidentialMilitaryServiceDeclaration (t : Time) (c : ComplaintText) : Prop




axiom IsSubjectToUniformCodeOfMilitaryJustice (p : Person) (c : ComplaintText) : Prop







axiom IsSecretarialAdvisoryBody (b : Entity) (c : ComplaintText) : Prop




axiom IsNonFullTimeAdvisoryMember (p : Person) (c : ComplaintText) : Prop





axiom IsPhsActImplementingAdvisoryCommittee (b : Entity) (c : ComplaintText) : Prop




axiom ConsideredPoliticalAffiliationInAppointment
    (p : Person) (b : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reearn.Ontology
