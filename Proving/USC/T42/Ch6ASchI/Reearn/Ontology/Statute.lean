














import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Reearn.Ontology







structure DefEdge where
  defined        : String
  dependsOn      : String
  citeDefine     : String
  citeDependency : String
  deriving Repr




structure DanglingTerm where
  term       : String
  usedAt     : String
  expectedAt : String
  deriving Repr



def defEdges : List DefEdge :=
  [ { defined := "urgent or emergency public health care need"
    , dependsOn := "public health emergency"
    , citeDefine := "42 USC § 204a(a)(5)", citeDependency := "42 USC § 247d" }
  , { defined := "deployment under sole authority of the Secretary"
    , dependsOn := "urgent or emergency public health care need"
    , citeDefine := "42 USC § 215(e)", citeDependency := "42 USC § 204a(a)(5)" }
  , { defined := "readiness requirement"
    , dependsOn := "Corps component (Regular Corps / Ready Reserve Corps)"
    , citeDefine := "42 USC § 204a(a)(1)", citeDependency := "42 USC § 204(a)(1)" }
  , { defined := "professional category"
    , dependsOn := "subject of examination"
    , citeDefine := "42 USC § 210b(a)", citeDependency := "42 USC § 209(a)(1)" }
  , { defined := "restricted grade"
    , dependsOn := "professional category"
    , citeDefine := "42 USC § 211(b)", citeDependency := "42 USC § 210b(a)" }
  , { defined := "restricted grade"
    , dependsOn := "grade"
    , citeDefine := "42 USC § 211(b)", citeDependency := "42 USC § 207(a)" }
  , { defined := "vacancy (for purposes of promotion)"
    , dependsOn := "professional category"
    , citeDefine := "42 USC § 210b(d)", citeDependency := "42 USC § 210b(a)" }
  , { defined := "vacancy (for purposes of promotion)"
    , dependsOn := "grade"
    , citeDefine := "42 USC § 210b(d)", citeDependency := "42 USC § 207(a)" }
  , { defined := "accumulated annual leave"
    , dependsOn := "accrued annual leave"
    , citeDefine := "42 USC § 210-1(c)", citeDependency := "42 USC § 210-1(c)" }
  , { defined := "age-44 appointment exception"
    , dependsOn := "active service"
    , citeDefine := "42 USC § 209(a)(3)", citeDependency := "42 USC § 212(d)" }
  , { defined := "active service"
    , dependsOn := "Senior Biomedical Research Service"
    , citeDefine := "42 USC § 212(d)(4)", citeDependency := "42 USC § 237" }
  , { defined := "basic pay of the highest grade temporarily held"
    , dependsOn := "temporary promotion"
    , citeDefine := "42 USC § 212(b)", citeDependency := "42 USC § 211(k)" }
  , { defined := "retired pay entitlement (supply-purchase class)"
    , dependsOn := "retirement of commissioned officers"
    , citeDefine := "42 USC § 210(b)", citeDependency := "42 USC § 212" }
  , { defined := "commissioned officer within the Commissioned Corps"
    , dependsOn := "warrant officer appointed to the Service"
    , citeDefine := "42 USC § 204(a)(5)", citeDependency := "42 USC § 204(a)(5)" }
  , { defined := "Ready Reserve Corps"
    , dependsOn := "Reserve Corps (superseded designation)"
    , citeDefine := "42 USC § 204(c)(3)", citeDependency := "42 USC § 204(b)" }
  , { defined := "Surgeon General"
    , dependsOn := "Regular Corps"
    , citeDefine := "42 USC § 205", citeDependency := "42 USC § 204(a)(1)" }
  , { defined := "Deputy Surgeon General"
    , dependsOn := "Office of the Surgeon General"
    , citeDefine := "42 USC § 206(a)", citeDependency := "42 USC § 203" }
  , { defined := "Assistant Surgeon General"
    , dependsOn := "Regular Corps"
    , citeDefine := "42 USC § 206(b)", citeDependency := "42 USC § 204(a)(1)" }
  , { defined := "grade of Assistant Surgeon General"
    , dependsOn := "position created under § 206(b) or § 206(c)"
    , citeDefine := "42 USC § 207(a)", citeDependency := "42 USC § 206(b)" }
  , { defined := "military-benefit entitlement of commissioned officers"
    , dependsOn := "declaration of the corps as a military service"
    , citeDefine := "42 USC § 213(a)(3)", citeDependency := "42 USC § 217" }
  , { defined := "military claims incorporation"
    , dependsOn := "military benefits"
    , citeDefine := "42 USC § 213a(a)(8)", citeDependency := "42 USC § 213" }
  , { defined := "Inspector General (as incorporated)"
    , dependsOn := "protected communications provision"
    , citeDefine := "42 USC § 213a(b)(2)", citeDependency := "42 USC § 213a(a)(18)" }
  , { defined := "Military department / Secretary concerned / Armed forces (as incorporated)"
    , dependsOn := "retired pay for non-regular service"
    , citeDefine := "42 USC § 213a(b)(3)", citeDependency := "42 USC § 213a(a)(19)" }
  , { defined := "advisory council or committee compensation"
    , dependsOn := "national advisory council member"
    , citeDefine := "42 USC § 217a(b)", citeDependency := "42 USC § 210(c)" }
  , { defined := "detail service credit"
    , dependsOn := "military benefits"
    , citeDefine := "42 USC § 215(d)", citeDependency := "42 USC § 213" }
  , { defined := "appointment to the Regular Corps declared-military-service exception"
    , dependsOn := "declaration of the corps as a military service"
    , citeDefine := "42 USC § 209(a)(3)(C)", citeDependency := "42 USC § 217" }
  , { defined := "promotion credit for medical internship"
    , dependsOn := "assistant grade of the Regular Corps"
    , citeDefine := "42 USC § 211c", citeDependency := "42 USC § 207(a)(5)" }
  , { defined := "eligibility for appointment as commissioned medical officer"
    , dependsOn := "graduate of a college of osteopathy"
    , citeDefine := "42 USC § 209d", citeDependency := "42 USC § 209d" }
  , { defined := "excluded payment (Medicaid / SSI eligibility)"
    , dependsOn := "class settlement in Susan Walker v. Bayer Corp."
    , citeDefine := "42 USC § 201(a)(2)(A)", citeDependency := "42 USC § 201(a)(2)(A)" }
  , { defined := "excluded payment (SSI eligibility)"
    , dependsOn := "Fund established pursuant to section 101 of the Act"
    , citeDefine := "42 USC § 201(b)(2)", citeDependency := "" }
  ]






def danglingTerms : List DanglingTerm :=
  [ { term := "Service (Public Health Service)", usedAt := "42 USC §§ 203–217a-1"
    , expectedAt := "chapter general definitions (absent from slice)" }
  , { term := "Surgeon General (as an office of the Service)"
    , usedAt := "42 USC §§ 203, 205, 206, 209, 210, 210b, 211, 212, 213, 215"
    , expectedAt := "chapter general definitions (absent from slice)" }
  , { term := "Secretary", usedAt := "42 USC §§ 203, 204a, 206, 207, 209, 210, 212, 213a, 215, 217a"
    , expectedAt := "chapter general definitions (absent from slice)" }
  , { term := "State", usedAt := "42 USC §§ 209d, 215(b)"
    , expectedAt := "chapter general definitions (absent from slice)" }
  , { term := "State health authority / State mental health authority"
    , usedAt := "42 USC § 215(b)"
    , expectedAt := "chapter general definitions (absent from slice)" }
  , { term := "uniformed services", usedAt := "42 USC §§ 209(a)(3), 211(g)(3), 212(a)(3), 212(d)(1), 212(d)(3)"
    , expectedAt := "10 USC § 101 (outside slice)" }
  , { term := "medically underserved community", usedAt := "42 USC § 204a(c)(2)(D)"
    , expectedAt := "42 USC § 295p (outside slice)" }
  , { term := "public health emergency", usedAt := "42 USC § 204a(a)(5)(C)"
    , expectedAt := "42 USC § 247d (outside slice)" }
  , { term := "Senior Biomedical Research Service", usedAt := "42 USC § 212(d)(4)"
    , expectedAt := "42 USC § 237 (outside slice)" }
  , { term := "Fund established pursuant to section 101 of this Act"
    , usedAt := "42 USC § 201(b)(2)", expectedAt := "unresolved — 'this Act' is not in slice" }
  , { term := "Classification Act of 1923", usedAt := "42 USC § 204(a)(2)"
    , expectedAt := "repealed; outside slice" }
  , { term := "Assistant Secretary for Health", usedAt := "42 USC § 207(a)"
    , expectedAt := "outside slice" }
  , { term := "director grade held under § 207(c)", usedAt := "42 USC § 210b(d)"
    , expectedAt := "42 USC § 207(c) — renders with no operative text at this release point" }
  , { term := "Bureau of Medical Services / Bureau of State Services"
    , usedAt := "42 USC §§ 203, 206(b), 207"
    , expectedAt := "named but not defined; superseded by reorganization" }
  , { term := "Agency for Healthcare Research and Quality", usedAt := "42 USC § 203"
    , expectedAt := "outside slice" }
  , { term := "escort/retired-grade/retired-pay title 10 provisions marked 'See References in Text'"
    , usedAt := "42 USC § 213a(a)(1), (3), (4), (10)"
    , expectedAt := "10 USC §§ 1036, 1370, 1374, 1376(a), 1401 formula No. 3, 2634 — flagged by the Code editors" }
  ]







structure ServiceOrganization
    (officeSG nih bureauMedical bureauState ahrq : Entity) (c : ComplaintText) : Prop where
  officeOfSurgeonGeneral : IsServiceConstituentUnit officeSG c
  nationalInstitutes     : IsServiceConstituentUnit nih c
  bureauOfMedicalService : IsServiceConstituentUnit bureauMedical c
  bureauOfStateServices  : IsServiceConstituentUnit bureauState c
  agencyForHealthcare    : IsServiceConstituentUnit ahrq c



inductive ExcludedPaymentClass (pmt : Payment) (c : ComplaintText) : Prop
  | classSettlementFund (h : IsClassSettlementFundPayment pmt c) :
      ExcludedPaymentClass pmt c
  | releaseInLieu (h : IsReleaseInLieuOfClassSettlementPayment pmt c) :
      ExcludedPaymentClass pmt c
  | section101Fund (h : IsSection101FundPayment pmt c) :
      ExcludedPaymentClass pmt c





inductive CorpsMembership (p : Person) (c : ComplaintText) : Prop
  | regular (h : IsRegularCorpsOfficer p c) : CorpsMembership p c
  | readyReserve (h : IsReadyReserveCorpsOfficer p c) : CorpsMembership p c
  | warrantOfficerDeemed (h : IsWarrantOfficerOfService p c) : CorpsMembership p c
  | transitionDeemed (h : IsDeemedRegularCorpsOfficerByTransition p c) : CorpsMembership p c



structure CommissionedOfficerQualification (p : Person) (c : ComplaintText) : Prop where
  corps   : CorpsMembership p c
  citizen : IsUnitedStatesCitizen p c



inductive UrgentOrEmergencyPublicHealthCareNeed
    (n : PublicHealthNeed) (c : ComplaintText) : Prop
  | nationalEmergency (h : IsNationalEmergencyDeclaration n c) :
      UrgentOrEmergencyPublicHealthCareNeed n c
  | staffordDeclaration (h : IsStaffordActDeclaration n c) :
      UrgentOrEmergencyPublicHealthCareNeed n c
  | publicHealthEmergency (h : IsSecretarialPublicHealthEmergency n c) :
      UrgentOrEmergencyPublicHealthCareNeed n c
  | secretarialJudgment (h : IsSecretarialJudgmentDeploymentEmergency n c) :
      UrgentOrEmergencyPublicHealthCareNeed n c






structure UnwaivedReadinessDeficiency (p : Person) (c : ComplaintText) : Prop where
  notReady : ¬ MeetsCorpsReadinessRequirements p c
  noWaiver : ¬ IsReadinessWaiverGround p c




structure SurgeonGeneralQualification (p : Person) (c : ComplaintText) : Prop where
  regularCorps : IsRegularCorpsOfficer p c
  publicHealth : HasPublicHealthTrainingOrExperience p c
  holdsOffice  : IsSurgeonGeneral p c



structure DeputySurgeonGeneralAssignment (p : Person) (c : ComplaintText) : Prop where
  regularCorps : IsRegularCorpsOfficer p c
  assigned     : IsDeputySurgeonGeneral p c




structure AssistantSurgeonGeneralAssignment (p : Person) (c : ComplaintText) : Prop where
  corps    : CorpsMembership p c
  assigned : IsAssistantSurgeonGeneral p c



structure GradeCorrespondence (g : Grade) (c : ComplaintText) : Prop where
  corpsGrade : IsCommissionedCorpsGrade g c
  armyGrade  : CorrespondsToArmyGrade g c



structure MedicalOfficerTitleDefinition (g : Grade) (c : ComplaintText) : Prop where
  corpsGrade : IsCommissionedCorpsGrade g c
  title      : IsMedicalOfficerTitle g c



inductive OriginalAppointmentRoute (a : Appointment) (c : ComplaintText) : Prop
  | regularCorps (h : IsOriginalAppointmentToRegularCorps a c) :
      OriginalAppointmentRoute a c
  | readyReserveCorps (h : IsOriginalAppointmentToReadyReserveCorps a c) :
      OriginalAppointmentRoute a c



structure OriginalAppointment (a : Appointment) (c : ComplaintText) : Prop where
  route    : OriginalAppointmentRoute a c
  examined : PassedPrescribedAppointmentExamination a c




inductive NonCommissionedAppointeeClass (p : Person) (c : ComplaintText) : Prop
  | specialConsultant (h : IsSpecialConsultant p c) : NonCommissionedAppointeeClass p c
  | fellowshipRecipient (h : IsServiceFellowshipRecipient p c) :
      NonCommissionedAppointeeClass p c



structure ReappointmentEligibility (p : Person) (c : ComplaintText) : Prop where
  formerOfficer : IsFormerOfficerEligibleForReappointment p c
  citizen       : IsUnitedStatesCitizen p c



structure OsteopathicAppointmentEligibility (p : Person) (c : ComplaintText) : Prop where
  osteopathicGraduate : IsEligibleOsteopathicGraduate p c
  citizen             : IsUnitedStatesCitizen p c



structure AccumulatedAnnualLeaveDefinition (l : LeaveAmount) (c : ComplaintText) : Prop where
  accrued     : IsAccruedAnnualLeave l c
  carriedOver : IsAccumulatedAnnualLeave l c




structure ProfessionalCategoryDefinition
    (cat : ProfessionalCategory) (c : ComplaintText) : Prop where
  examinationSubject : IsPublicHealthExaminationSubject cat c
  established        : IsProfessionalCategory cat c


structure PromotionVacancyDefinition
    (g : Grade) (cat : ProfessionalCategory) (c : ComplaintText) : Prop where
  corpsGrade : IsCommissionedCorpsGrade g c
  category   : IsProfessionalCategory cat c
  vacancy    : IsPromotionVacancy g cat c



structure RestrictedGradeDefinition
    (g : Grade) (cat : ProfessionalCategory) (c : ComplaintText) : Prop where
  corpsGrade : IsCommissionedCorpsGrade g c
  category   : IsProfessionalCategory cat c
  restricted : IsRestrictedGrade g cat c


inductive PromotionClass (pr : Promotion) (c : ComplaintText) : Prop
  | lengthOfService (h : IsLengthOfServicePermanentPromotion pr c) : PromotionClass pr c
  | vacancyFilling (h : IsVacancyFillingPermanentPromotion pr c) : PromotionClass pr c
  | temporary (h : IsTemporaryPromotion pr c) : PromotionClass pr c



structure MedicalInternshipCredit (p : Person) (c : ComplaintText) : Prop where
  regularCorps : IsRegularCorpsOfficer p c
  internship   : HasCompletedMedicalInternship p c




inductive ActiveServiceClass (sp : ServicePeriod) (c : ComplaintText) : Prop
  | uniformedServices (h : IsUniformedServiceActiveService sp c) : ActiveServiceClass sp c
  | comparablePhsService (h : IsComparableNonCommissionedPhsService sp c) :
      ActiveServiceClass sp c
  | otherRetirementCreditable (h : IsOtherRetirementCreditableService sp c) :
      ActiveServiceClass sp c
  | seniorBiomedicalResearch (h : IsSeniorBiomedicalResearchServiceService sp c) :
      ActiveServiceClass sp c



structure BasicPayOfHighestTemporaryGradeDefinition
    (g : Grade) (pr : Promotion) (c : ComplaintText) : Prop where
  temporaryPromotion : IsTemporaryPromotion pr c
  highestGrade       : IsBasicPayOfHighestTemporaryGrade g c




structure Section209a3ServiceCredit
    (a : Appointment) (sp : ServicePeriod) (c : ComplaintText) : Prop where
  original        : IsOriginalAppointmentToRegularCorps a c
  creditedService : ActiveServiceClass sp c



inductive MilitaryBenefitQualifyingService (sp : ServicePeriod) (c : ComplaintText) : Prop
  | wartime (h : IsWartimeActiveService sp c) : MilitaryBenefitQualifyingService sp c
  | detailToArmedForce (h : IsDetailToArmedForce sp c) :
      MilitaryBenefitQualifyingService sp c
  | militarizedByExecutiveOrder (h : IsServiceMilitarizedByExecutiveOrder sp c) :
      MilitaryBenefitQualifyingService sp c




structure DeemedMilitaryService (sp : ServicePeriod) (c : ComplaintText) : Prop where
  qualifying : MilitaryBenefitQualifyingService sp c
  deemed     : DeemedActiveMilitaryServiceInArmedForces sp c



structure Title10RightsIncorporation
    (t : Title10Provision) (p : Person) (c : ComplaintText) : Prop where
  incorporated : IsIncorporatedTitle10Provision t c
  officer      : CorpsMembership p c



structure ProtectedCommunicationsIncorporation
    (t : Title10Provision) (p : Person) (c : ComplaintText) : Prop where
  incorporated    : IsIncorporatedTitle10Provision t c
  inspectorGeneral : IsDeemedHhsInspectorGeneral p c




structure RetiredPayIncorporation (t : Title10Provision) (c : ComplaintText) : Prop where
  incorporated  : IsIncorporatedTitle10Provision t c
  termSubstitution : IsDeemedMilitaryDepartmentTerm t c



structure FlagPresentationEligibility (p : Person) (c : ComplaintText) : Prop where
  corps    : CorpsMembership p c
  eligible : IsFlagEligibleRetiringOfficer p c


inductive DetailClass (d : Detail) (c : ComplaintText) : Prop
  | executiveDepartment (h : IsExecutiveDepartmentDetail d c) : DetailClass d c
  | stateHealthAuthority (h : IsStateHealthAuthorityDetail d c) : DetailClass d c
  | congressionalOrInstitutional (h : IsCongressionalOrInstitutionalDetail d c) :
      DetailClass d c





structure Section215eDeployment
    (d : Detail) (n : PublicHealthNeed) (p : Person) (c : ComplaintText) : Prop where
  detail  : DetailClass d c
  officer : CorpsMembership p c
  need    : UrgentOrEmergencyPublicHealthCareNeed n c




structure MilitaryServiceDeclaration
    (t : Time) (p : Person) (c : ComplaintText) : Prop where
  declared : IsPresidentialMilitaryServiceDeclaration t c
  officer  : CorpsMembership p c
  ucmj     : IsSubjectToUniformCodeOfMilitaryJustice p c



structure AdvisoryBodyMembership (b : Entity) (p : Person) (c : ComplaintText) : Prop where
  body         : IsSecretarialAdvisoryBody b c
  nonFullTime  : IsNonFullTimeAdvisoryMember p c
  compensation : IsAdvisoryCouncilMemberEntitledToCompensation p c





structure ApoliticalAdvisoryAppointment
    (p : Person) (b : Entity) (c : ComplaintText) : Prop where
  committee          : IsPhsActImplementingAdvisoryCommittee b c
  withoutAffiliation : ¬ ConsideredPoliticalAffiliationInAppointment p b c

end Proving.USC.T42.Ch6ASchI.Reearn.Ontology
