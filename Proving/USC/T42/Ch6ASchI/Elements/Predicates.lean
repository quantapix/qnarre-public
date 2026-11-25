


















import Proving.USC.T42.Ch6ASchI.Elements.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Elements

open Proving.USC.Common





axiom IsWalkerBayerSettlementPayment (pay : Payment) (c : ComplaintText) : Prop




axiom IsReleaseInLieuOfClassSettlement (pay : Payment) (c : ComplaintText) : Prop



axiom ReleaseSignedByAllAffectedParties (pay : Payment) (c : ComplaintText) : Prop



axiom ReleaseSignedOnDay (pay : Payment) (c : ComplaintText) : Nat



axiom ReleaseFirstSentOnDay (pay : Payment) (c : ComplaintText) : Nat



axiom dec31_1997Day : Nat




axiom IsFundEstablishedSection101Payment (pay : Payment) (c : ComplaintText) : Prop






axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop




axiom AppointedByPresident (p : Person) (c : ComplaintText) : Prop






axiom SubjectToReadinessRequirements (p : Person) (c : ComplaintText) : Prop



axiom FailedReadinessRequirements (p : Person) (c : ComplaintText) : Prop




axiom FailedToComplyWithDeploymentOrders (p : Person) (c : ComplaintText) : Prop




axiom ReadinessWaiverGranted (p : Person) (c : ComplaintText) : Prop





axiom IsMemberOfRegularCorps (p : Person) (c : ComplaintText) : Prop




axiom HasPublicHealthTrainingOrExperience (p : Person) (c : ComplaintText) : Prop



axiom AppointedByPresidentWithSenateConsent (p : Person) (c : ComplaintText) : Prop






axiom IsOriginalAppointmentToPermittedGrade (p : Person) (c : ComplaintText) : Prop




axiom PassedAppointmentExamination (p : Person) (c : ComplaintText) : Prop



axiom AppointeeAge (p : Person) (c : ComplaintText) : Nat




axiom HasCompensatingActiveService (p : Person) (c : ComplaintText) : Prop




axiom SurgeonGeneralFoundExceptionalQualifications (p : Person) (c : ComplaintText) : Prop




axiom ReadyReserveDeclaredMilitaryService (p : Person) (c : ComplaintText) : Prop




axiom MeetsPresidentialAppointmentStandards (p : Person) (c : ComplaintText) : Prop





axiom IsOsteopathyCollegeGraduate (p : Person) (c : ComplaintText) : Prop




axiom CollegeGraduatesEligibleForLicensureMajorityStates (p : Person) (c : ComplaintText) : Prop




axiom CollegeApprovedByAcceptableBody (p : Person) (c : ComplaintText) : Prop






axiom OfficerEntitledToPayAndAllowances (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Elements
