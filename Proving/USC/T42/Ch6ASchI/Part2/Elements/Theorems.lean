import Proving.USC.T42.Ch6ASchI.Part2.Elements.Statute

set_option autoImplicit false






namespace Proving.USC.T42.Ch6ASchI.Part2.Elements
open Proving.USC.Common


theorem section211d2_intro {o c}
    (hOff : IsRegularCorpsCommissionedOfficer o c)
    (hGrade : HoldsPermanentRankInPromotableGrade o c)
    (hQual : FoundQualifiedForPromotion o c)
    (hSvc : MeetsLengthOfServiceRequirement o c) :
    Section211d2Promotion o c :=
  ⟨hOff, hGrade, hQual, hSvc⟩


theorem section211c_intro {o c}
    (hMed : IsMedicalOfficerRegularCorps o c)
    (hApp : AppointedToAssistantGradeContinuousService o c)
    (hInt : CompletedMedicalInternshipAtAppointment o c)
    (hNo : ¬ ReceivedSimilarInternshipCreditUnderOtherLaw o c) :
    Section211cInternshipCredit o c :=
  ⟨hMed, hApp, hInt, hNo⟩


theorem retirementOnApplication_byAge_intro {o c}
    (hApplied : AppliedForRetirement o c)
    (hOff : IsRegularCorpsCommissionedOfficer o c)
    (hAge : AttainedRetirementAge o c) :
    RetirementOnApplication o c :=
  .byAge hApplied hOff hAge

theorem retirementOnApplication_byService_intro {o c}
    (hApplied : AppliedForRetirement o c)
    (hOff : IsRegularCorpsCommissionedOfficer o c)
    (hSvc : CompletedThirtyYearsActiveService o c) :
    RetirementOnApplication o c :=
  .byService hApplied hOff hSvc


theorem section213_intro {o c}
    (hOff : IsCommissionedOfficerOrSurvivingBeneficiary o c)
    (hCirc : QualifyingMilitaryServiceCircumstance o c) :
    Section213MilitaryBenefit o c :=
  ⟨hOff, hCirc⟩


theorem section213a_intro {o b c}
    (hOff : IsCommissionedOfficerOrSurvivingBeneficiary o c)
    (hEnum : BenefitWithinEnumeratedTitle10Provisions b c) :
    Section213aRightsEntitlement o b c :=
  ⟨hOff, hEnum⟩


theorem section214_intro {o c}
    (hRel : ReleasedFromActiveServiceForRetirement o c)
    (hNo : ¬ PreviouslyPresentedUnitedStatesFlag o c) :
    Section214FlagPresentation o c :=
  ⟨hRel, hNo⟩


theorem section215a_intro {d c}
    (hReq : RequestByExecutiveDepartmentHead d c)
    (hAgr : DetailAgreementBetweenSecretaryAndDeptHead d c) :
    Section215aDetailAuthority d c :=
  ⟨hReq, hAgr⟩


theorem section216c_intro {r c}
    (hRel : RegulationRelatesToMedicalAppointmentQualifications r c)
    (hNo : ¬ RegulationGivesPreferenceToSchoolOfMedicine r c) :
    Section216cCompliantRegulation r c :=
  ⟨hRel, hNo⟩


theorem section217_intro {c}
    (hTrig : WarOrNationalDefenseEmergency c)
    (hEO : ExecutiveOrderDeclaringCorpsMilitaryService c) :
    Section217MilitaryServiceDeclaration c :=
  ⟨hTrig, hEO⟩


theorem section217a_intro {m c}
    (hMem : IsAppointedAdvisoryCouncilMember m c)
    (hFT : IsNotRegularFullTimeFederalEmployee m c)
    (hEng : EngagedOnAdvisoryCouncilBusiness m c) :
    Section217aMemberCompensation m c :=
  ⟨hMem, hFT, hEng⟩


theorem section217a1_intro {a c}
    (hCov : IsAppointmentToCoveredAdvisoryCommittee a c)
    (hApol : ¬ ConsideredPoliticalAffiliationInAppointment a c) :
    Section217a1CompliantAppointment a c :=
  ⟨hCov, hApol⟩




example {o c} (hDone : YearsOfServiceAboveJuniorAssistant o c = 17)
    (hReq : RequiredYearsForNextGrade o c = 17) : MeetsLengthOfServiceRequirement o c := by
  unfold MeetsLengthOfServiceRequirement; omega


example {o c} (hAge : AgeInYears o c = 64) : AttainedRetirementAge o c := by
  unfold AttainedRetirementAge; omega


example {o c} (hSvc : YearsOfActiveService o c = 31) : CompletedThirtyYearsActiveService o c := by
  unfold CompletedThirtyYearsActiveService; omega

end Proving.USC.T42.Ch6ASchI.Part2.Elements
