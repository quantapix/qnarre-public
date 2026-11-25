








import Proving.USC.T42.Ch6ASchI.Elements.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Elements

open Proving.USC.Common





def SignedWithinDeadline (pay : Payment) (c : ComplaintText) : Prop :=
  ReleaseSignedOnDay pay c ≤ Nat.max dec31_1997Day (ReleaseFirstSentOnDay pay c + 270)


structure QualifyingReleasePayment (pay : Payment) (c : ComplaintText) : Prop where
  inLieu    : IsReleaseInLieuOfClassSettlement pay c
  allSigned : ReleaseSignedByAllAffectedParties pay c
  timely    : SignedWithinDeadline pay c


inductive DescribedHemophiliaPayment (pay : Payment) (c : ComplaintText) : Prop
  | walkerBayer       (h : IsWalkerBayerSettlementPayment pay c)
  | qualifyingRelease (h : QualifyingReleasePayment pay c)
  | fund101           (h : IsFundEstablishedSection101Payment pay c)




structure Section201Exclusion (pay : Payment) (c : ComplaintText) : Prop where
  described : DescribedHemophiliaPayment pay c





structure Section204CommissionedOfficer (p : Person) (c : ComplaintText) : Prop where
  citizen   : IsUnitedStatesCitizen p c
  appointed : AppointedByPresident p c





inductive ReadinessDefault (p : Person) (c : ComplaintText) : Prop
  | failedReadiness (h : FailedReadinessRequirements p c)
  | failedOrders    (h : FailedToComplyWithDeploymentOrders p c)




structure Section204aDisciplinaryAction (p : Person) (c : ComplaintText) : Prop where
  subject  : SubjectToReadinessRequirements p c
  ground   : ReadinessDefault p c
  noWaiver : ¬ ReadinessWaiverGranted p c





structure Section205SurgeonGeneralEligibility (p : Person) (c : ComplaintText) : Prop where
  regularCorps : IsMemberOfRegularCorps p c
  training     : HasPublicHealthTrainingOrExperience p c
  appointed    : AppointedByPresidentWithSenateConsent p c





def AgeAppointmentBarSatisfied (p : Person) (c : ComplaintText) : Prop :=
  AppointeeAge p c < 44
    ∨ HasCompensatingActiveService p c
    ∨ SurgeonGeneralFoundExceptionalQualifications p c
    ∨ ReadyReserveDeclaredMilitaryService p c



structure Section209OriginalAppointment (p : Person) (c : ComplaintText) : Prop where
  permittedGrade : IsOriginalAppointmentToPermittedGrade p c
  passedExam     : PassedAppointmentExamination p c
  ageBar         : AgeAppointmentBarSatisfied p c
  standards      : MeetsPresidentialAppointmentStandards p c





inductive OsteopathyLicensureQualification (p : Person) (c : ComplaintText) : Prop
  | majorityStates (h : CollegeGraduatesEligibleForLicensureMajorityStates p c)
  | approvedBody   (h : CollegeApprovedByAcceptableBody p c)



structure Section209dOsteopathEligibility (p : Person) (c : ComplaintText) : Prop where
  graduate      : IsOsteopathyCollegeGraduate p c
  qualification : OsteopathyLicensureQualification p c





structure Section210PayEntitlement (p : Person) (c : ComplaintText) : Prop where
  entitled : OfficerEntitledToPayAndAllowances p c

end Proving.USC.T42.Ch6ASchI.Elements
