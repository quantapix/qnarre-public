








import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Statute

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Reearn.Ontology




theorem serviceOrganization_intro
    {officeSG nih bureauMedical bureauState ahrq : Entity} {c : ComplaintText}
    (h1 : IsServiceConstituentUnit officeSG c)
    (h2 : IsServiceConstituentUnit nih c)
    (h3 : IsServiceConstituentUnit bureauMedical c)
    (h4 : IsServiceConstituentUnit bureauState c)
    (h5 : IsServiceConstituentUnit ahrq c) :
    ServiceOrganization officeSG nih bureauMedical bureauState ahrq c :=
  ⟨h1, h2, h3, h4, h5⟩


theorem commissionedOfficerQualification_intro
    {p : Person} {c : ComplaintText}
    (hCorps : CorpsMembership p c) (hCitizen : IsUnitedStatesCitizen p c) :
    CommissionedOfficerQualification p c :=
  ⟨hCorps, hCitizen⟩



theorem unwaivedReadinessDeficiency_intro
    {p : Person} {c : ComplaintText}
    (hNotReady : ¬ MeetsCorpsReadinessRequirements p c)
    (hNoWaiver : ¬ IsReadinessWaiverGround p c) :
    UnwaivedReadinessDeficiency p c :=
  ⟨hNotReady, hNoWaiver⟩


theorem surgeonGeneralQualification_intro
    {p : Person} {c : ComplaintText}
    (hCorps : IsRegularCorpsOfficer p c)
    (hPublicHealth : HasPublicHealthTrainingOrExperience p c)
    (hOffice : IsSurgeonGeneral p c) :
    SurgeonGeneralQualification p c :=
  ⟨hCorps, hPublicHealth, hOffice⟩


theorem deputySurgeonGeneralAssignment_intro
    {p : Person} {c : ComplaintText}
    (hCorps : IsRegularCorpsOfficer p c) (hAssigned : IsDeputySurgeonGeneral p c) :
    DeputySurgeonGeneralAssignment p c :=
  ⟨hCorps, hAssigned⟩


theorem assistantSurgeonGeneralAssignment_intro
    {p : Person} {c : ComplaintText}
    (hCorps : CorpsMembership p c) (hAssigned : IsAssistantSurgeonGeneral p c) :
    AssistantSurgeonGeneralAssignment p c :=
  ⟨hCorps, hAssigned⟩


theorem gradeCorrespondence_intro
    {g : Grade} {c : ComplaintText}
    (hGrade : IsCommissionedCorpsGrade g c) (hArmy : CorrespondsToArmyGrade g c) :
    GradeCorrespondence g c :=
  ⟨hGrade, hArmy⟩


theorem medicalOfficerTitleDefinition_intro
    {g : Grade} {c : ComplaintText}
    (hGrade : IsCommissionedCorpsGrade g c) (hTitle : IsMedicalOfficerTitle g c) :
    MedicalOfficerTitleDefinition g c :=
  ⟨hGrade, hTitle⟩


theorem originalAppointment_intro
    {a : Appointment} {c : ComplaintText}
    (hRoute : OriginalAppointmentRoute a c)
    (hExam : PassedPrescribedAppointmentExamination a c) :
    OriginalAppointment a c :=
  ⟨hRoute, hExam⟩


theorem reappointmentEligibility_intro
    {p : Person} {c : ComplaintText}
    (hFormer : IsFormerOfficerEligibleForReappointment p c)
    (hCitizen : IsUnitedStatesCitizen p c) :
    ReappointmentEligibility p c :=
  ⟨hFormer, hCitizen⟩


theorem osteopathicAppointmentEligibility_intro
    {p : Person} {c : ComplaintText}
    (hGraduate : IsEligibleOsteopathicGraduate p c)
    (hCitizen : IsUnitedStatesCitizen p c) :
    OsteopathicAppointmentEligibility p c :=
  ⟨hGraduate, hCitizen⟩


theorem accumulatedAnnualLeaveDefinition_intro
    {l : LeaveAmount} {c : ComplaintText}
    (hAccrued : IsAccruedAnnualLeave l c) (hCarried : IsAccumulatedAnnualLeave l c) :
    AccumulatedAnnualLeaveDefinition l c :=
  ⟨hAccrued, hCarried⟩


theorem professionalCategoryDefinition_intro
    {cat : ProfessionalCategory} {c : ComplaintText}
    (hSubject : IsPublicHealthExaminationSubject cat c)
    (hEstablished : IsProfessionalCategory cat c) :
    ProfessionalCategoryDefinition cat c :=
  ⟨hSubject, hEstablished⟩


theorem promotionVacancyDefinition_intro
    {g : Grade} {cat : ProfessionalCategory} {c : ComplaintText}
    (hGrade : IsCommissionedCorpsGrade g c)
    (hCategory : IsProfessionalCategory cat c)
    (hVacancy : IsPromotionVacancy g cat c) :
    PromotionVacancyDefinition g cat c :=
  ⟨hGrade, hCategory, hVacancy⟩


theorem restrictedGradeDefinition_intro
    {g : Grade} {cat : ProfessionalCategory} {c : ComplaintText}
    (hGrade : IsCommissionedCorpsGrade g c)
    (hCategory : IsProfessionalCategory cat c)
    (hRestricted : IsRestrictedGrade g cat c) :
    RestrictedGradeDefinition g cat c :=
  ⟨hGrade, hCategory, hRestricted⟩


theorem medicalInternshipCredit_intro
    {p : Person} {c : ComplaintText}
    (hCorps : IsRegularCorpsOfficer p c) (hInternship : HasCompletedMedicalInternship p c) :
    MedicalInternshipCredit p c :=
  ⟨hCorps, hInternship⟩


theorem basicPayOfHighestTemporaryGradeDefinition_intro
    {g : Grade} {pr : Promotion} {c : ComplaintText}
    (hTemp : IsTemporaryPromotion pr c)
    (hHighest : IsBasicPayOfHighestTemporaryGrade g c) :
    BasicPayOfHighestTemporaryGradeDefinition g pr c :=
  ⟨hTemp, hHighest⟩


theorem section209a3ServiceCredit_intro
    {a : Appointment} {sp : ServicePeriod} {c : ComplaintText}
    (hOriginal : IsOriginalAppointmentToRegularCorps a c)
    (hService : ActiveServiceClass sp c) :
    Section209a3ServiceCredit a sp c :=
  ⟨hOriginal, hService⟩


theorem deemedMilitaryService_intro
    {sp : ServicePeriod} {c : ComplaintText}
    (hQualifying : MilitaryBenefitQualifyingService sp c)
    (hDeemed : DeemedActiveMilitaryServiceInArmedForces sp c) :
    DeemedMilitaryService sp c :=
  ⟨hQualifying, hDeemed⟩


theorem title10RightsIncorporation_intro
    {t : Title10Provision} {p : Person} {c : ComplaintText}
    (hIncorporated : IsIncorporatedTitle10Provision t c)
    (hOfficer : CorpsMembership p c) :
    Title10RightsIncorporation t p c :=
  ⟨hIncorporated, hOfficer⟩


theorem protectedCommunicationsIncorporation_intro
    {t : Title10Provision} {p : Person} {c : ComplaintText}
    (hIncorporated : IsIncorporatedTitle10Provision t c)
    (hIg : IsDeemedHhsInspectorGeneral p c) :
    ProtectedCommunicationsIncorporation t p c :=
  ⟨hIncorporated, hIg⟩


theorem retiredPayIncorporation_intro
    {t : Title10Provision} {c : ComplaintText}
    (hIncorporated : IsIncorporatedTitle10Provision t c)
    (hSubstitution : IsDeemedMilitaryDepartmentTerm t c) :
    RetiredPayIncorporation t c :=
  ⟨hIncorporated, hSubstitution⟩


theorem flagPresentationEligibility_intro
    {p : Person} {c : ComplaintText}
    (hCorps : CorpsMembership p c) (hEligible : IsFlagEligibleRetiringOfficer p c) :
    FlagPresentationEligibility p c :=
  ⟨hCorps, hEligible⟩


theorem section215eDeployment_intro
    {d : Detail} {n : PublicHealthNeed} {p : Person} {c : ComplaintText}
    (hDetail : DetailClass d c)
    (hOfficer : CorpsMembership p c)
    (hNeed : UrgentOrEmergencyPublicHealthCareNeed n c) :
    Section215eDeployment d n p c :=
  ⟨hDetail, hOfficer, hNeed⟩


theorem militaryServiceDeclaration_intro
    {t : Time} {p : Person} {c : ComplaintText}
    (hDeclared : IsPresidentialMilitaryServiceDeclaration t c)
    (hOfficer : CorpsMembership p c)
    (hUcmj : IsSubjectToUniformCodeOfMilitaryJustice p c) :
    MilitaryServiceDeclaration t p c :=
  ⟨hDeclared, hOfficer, hUcmj⟩


theorem advisoryBodyMembership_intro
    {b : Entity} {p : Person} {c : ComplaintText}
    (hBody : IsSecretarialAdvisoryBody b c)
    (hNonFullTime : IsNonFullTimeAdvisoryMember p c)
    (hCompensation : IsAdvisoryCouncilMemberEntitledToCompensation p c) :
    AdvisoryBodyMembership b p c :=
  ⟨hBody, hNonFullTime, hCompensation⟩


theorem apoliticalAdvisoryAppointment_intro
    {p : Person} {b : Entity} {c : ComplaintText}
    (hCommittee : IsPhsActImplementingAdvisoryCommittee b c)
    (hWithout : ¬ ConsideredPoliticalAffiliationInAppointment p b c) :
    ApoliticalAdvisoryAppointment p b c :=
  ⟨hCommittee, hWithout⟩




theorem excludedPaymentClass_intro
    {pmt : Payment} {c : ComplaintText}
    (h : IsClassSettlementFundPayment pmt c ∨
         IsReleaseInLieuOfClassSettlementPayment pmt c ∨
         IsSection101FundPayment pmt c) :
    ExcludedPaymentClass pmt c :=
  match h with
  | Or.inl h => ExcludedPaymentClass.classSettlementFund h
  | Or.inr (Or.inl h) => ExcludedPaymentClass.releaseInLieu h
  | Or.inr (Or.inr h) => ExcludedPaymentClass.section101Fund h


theorem corpsMembership_intro
    {p : Person} {c : ComplaintText}
    (h : IsRegularCorpsOfficer p c ∨
         IsReadyReserveCorpsOfficer p c ∨
         IsWarrantOfficerOfService p c ∨
         IsDeemedRegularCorpsOfficerByTransition p c) :
    CorpsMembership p c :=
  match h with
  | Or.inl h => CorpsMembership.regular h
  | Or.inr (Or.inl h) => CorpsMembership.readyReserve h
  | Or.inr (Or.inr (Or.inl h)) => CorpsMembership.warrantOfficerDeemed h
  | Or.inr (Or.inr (Or.inr h)) => CorpsMembership.transitionDeemed h


theorem urgentOrEmergencyPublicHealthCareNeed_intro
    {n : PublicHealthNeed} {c : ComplaintText}
    (h : IsNationalEmergencyDeclaration n c ∨
         IsStaffordActDeclaration n c ∨
         IsSecretarialPublicHealthEmergency n c ∨
         IsSecretarialJudgmentDeploymentEmergency n c) :
    UrgentOrEmergencyPublicHealthCareNeed n c :=
  match h with
  | Or.inl h => UrgentOrEmergencyPublicHealthCareNeed.nationalEmergency h
  | Or.inr (Or.inl h) => UrgentOrEmergencyPublicHealthCareNeed.staffordDeclaration h
  | Or.inr (Or.inr (Or.inl h)) => UrgentOrEmergencyPublicHealthCareNeed.publicHealthEmergency h
  | Or.inr (Or.inr (Or.inr h)) => UrgentOrEmergencyPublicHealthCareNeed.secretarialJudgment h


theorem originalAppointmentRoute_intro
    {a : Appointment} {c : ComplaintText}
    (h : IsOriginalAppointmentToRegularCorps a c ∨
         IsOriginalAppointmentToReadyReserveCorps a c) :
    OriginalAppointmentRoute a c :=
  match h with
  | Or.inl h => OriginalAppointmentRoute.regularCorps h
  | Or.inr h => OriginalAppointmentRoute.readyReserveCorps h


theorem nonCommissionedAppointeeClass_intro
    {p : Person} {c : ComplaintText}
    (h : IsSpecialConsultant p c ∨ IsServiceFellowshipRecipient p c) :
    NonCommissionedAppointeeClass p c :=
  match h with
  | Or.inl h => NonCommissionedAppointeeClass.specialConsultant h
  | Or.inr h => NonCommissionedAppointeeClass.fellowshipRecipient h


theorem promotionClass_intro
    {pr : Promotion} {c : ComplaintText}
    (h : IsLengthOfServicePermanentPromotion pr c ∨
         IsVacancyFillingPermanentPromotion pr c ∨
         IsTemporaryPromotion pr c) :
    PromotionClass pr c :=
  match h with
  | Or.inl h => PromotionClass.lengthOfService h
  | Or.inr (Or.inl h) => PromotionClass.vacancyFilling h
  | Or.inr (Or.inr h) => PromotionClass.temporary h


theorem activeServiceClass_intro
    {sp : ServicePeriod} {c : ComplaintText}
    (h : IsUniformedServiceActiveService sp c ∨
         IsComparableNonCommissionedPhsService sp c ∨
         IsOtherRetirementCreditableService sp c ∨
         IsSeniorBiomedicalResearchServiceService sp c) :
    ActiveServiceClass sp c :=
  match h with
  | Or.inl h => ActiveServiceClass.uniformedServices h
  | Or.inr (Or.inl h) => ActiveServiceClass.comparablePhsService h
  | Or.inr (Or.inr (Or.inl h)) => ActiveServiceClass.otherRetirementCreditable h
  | Or.inr (Or.inr (Or.inr h)) => ActiveServiceClass.seniorBiomedicalResearch h


theorem militaryBenefitQualifyingService_intro
    {sp : ServicePeriod} {c : ComplaintText}
    (h : IsWartimeActiveService sp c ∨
         IsDetailToArmedForce sp c ∨
         IsServiceMilitarizedByExecutiveOrder sp c) :
    MilitaryBenefitQualifyingService sp c :=
  match h with
  | Or.inl h => MilitaryBenefitQualifyingService.wartime h
  | Or.inr (Or.inl h) => MilitaryBenefitQualifyingService.detailToArmedForce h
  | Or.inr (Or.inr h) => MilitaryBenefitQualifyingService.militarizedByExecutiveOrder h


theorem detailClass_intro
    {d : Detail} {c : ComplaintText}
    (h : IsExecutiveDepartmentDetail d c ∨
         IsStateHealthAuthorityDetail d c ∨
         IsCongressionalOrInstitutionalDetail d c) :
    DetailClass d c :=
  match h with
  | Or.inl h => DetailClass.executiveDepartment h
  | Or.inr (Or.inl h) => DetailClass.stateHealthAuthority h
  | Or.inr (Or.inr h) => DetailClass.congressionalOrInstitutional h

end Proving.USC.T42.Ch6ASchI.Reearn.Ontology
