





import Proving.USC.T42.Ch6ASchI.Reearn.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Structure

open Proving.USC.Common


theorem section201IncorporationsResolve_intro {c : ComplaintText}
    (hState : ExceptionApplies edge_201f_exceptAsProvided_264d c)
    (hNarcotic : CrossTitleReferenceResolves edge_201j_incorporates_t26_4731g c)
    (hControlled : CrossTitleReferenceResolves edge_201q_incorporates_t21_802 c) :
    Section201IncorporationsResolve c :=
  ⟨hState, hNarcotic, hControlled⟩


theorem coherent203_intro {c : ComplaintText}
    (hDefs : IncorporationHonored edge_203_incorporates_201 c)
    (hDelegation : ReferencedSectionExists edge_203_incorporates_ch6A c) :
    Coherent203 c :=
  ⟨hDefs, hDelegation⟩


theorem coherent204_intro {c : ComplaintText}
    (hClassification : TargetRepealedAtOperativeTime edge_204a2_incorporates_classificationAct1923 c)
    (hWarrant : DeemedEquivalenceApplied edge_204a5_incorporates_t37 c)
    (hUnderserved : IncorporationHonored edge_204c2D_incorporates_295p c)
    (hRedesignation : DeemedEquivalenceApplied edge_204c3_deemed_reserveCorps c)
    (hCarveOut : ExceptionApplies edge_204c3_exceptAsProvided_204b c) :
    Coherent204 c :=
  ⟨hClassification, hWarrant, hUnderserved, hRedesignation, hCarveOut⟩


theorem coherent204a_intro {c : ComplaintText}
    (hWaiver : ExceptionApplies edge_204a_a3_exceptAsProvided_204a_a4 c)
    (hPhe : IncorporationHonored edge_204a_a5_incorporates_247d c)
    (hNea : CrossTitleReferenceResolves edge_204a_a5_incorporates_nea c)
    (hStafford : IncorporationHonored edge_204a_a5_incorporates_stafford c)
    (hDeployment : DeemedEquivalenceApplied edge_204a_c_deemed_detailingEntity c) :
    Coherent204a c :=
  ⟨hWaiver, hPhe, hNea, hStafford, hDeployment⟩


theorem coherent205_intro {c : ComplaintText}
    (hCorps : IncorporationHonored edge_205_incorporates_204 c) :
    Coherent205 c :=
  ⟨hCorps⟩


theorem coherent206_intro {c : ComplaintText}
    (hCorps : IncorporationHonored edge_206c1_incorporates_204 c)
    (hCap : ExceptionApplies edge_206c2_exceptAsProvided_206c c) :
    Coherent206 c :=
  ⟨hCorps, hCap⟩


theorem coherent207_intro {c : ComplaintText}
    (hAsgCap : IncorporationHonored edge_207a_incorporates_206b c)
    (hTemp : IncorporationHonored edge_207a_incorporates_206c c)
    (hArmy : CrossTitleReferenceResolves edge_207a_incorporates_armyGrades c) :
    Coherent207 c :=
  ⟨hAsgCap, hTemp, hArmy⟩


theorem coherent209_intro {c : ComplaintText}
    (hGradeLimit : ExceptionApplies edge_209a1_exceptAsProvided_209b c)
    (hActiveService : IncorporationHonored edge_209a3_incorporates_212d c)
    (hSurgeonGeneral : ExceptionApplies edge_209b1_exceptAsProvided_205 c)
    (hReappointment : OverrideTriggered edge_209e1_notwithstanding_209b c)
    (hAlien : OverrideTriggered edge_209h_notwithstanding_alienEmploymentBars c) :
    Coherent209 c :=
  ⟨hGradeLimit, hActiveService, hSurgeonGeneral, hReappointment, hAlien⟩


theorem coherent209d_intro {c : ComplaintText}
    (hOther : SubjectToConstraintSatisfied edge_209d_subjectTo_phsAct c) :
    Coherent209d c :=
  ⟨hOther⟩


theorem coherent210_intro {c : ComplaintText}
    (hSpecialPay : CrossTitleReferenceResolves edge_210a2_incorporates_t37_303a c)
    (hRetiredPay : IncorporationHonored edge_210b_incorporates_211g3 c)
    (hTravel : CrossTitleReferenceResolves edge_210c_incorporates_t5_5703 c)
    (hFellowship : IncorporationHonored edge_210f_incorporates_209g c) :
    Coherent210 c :=
  ⟨hSpecialPay, hRetiredPay, hTravel, hFellowship⟩


theorem coherent210_1_intro {c : ComplaintText}
    (hCorps : IncorporationHonored edge_210_1a_incorporates_204 c) :
    Coherent210_1 c :=
  ⟨hCorps⟩



theorem coherent210b_intro {c : ComplaintText}
    (hSubjects : IncorporationHonored edge_210b_a_incorporates_209a1 c)
    (hCeiling : SubjectToConstraintSatisfied edge_210b_c_subjectTo_207d c)
    (hRepealed : TargetRepealedAtOperativeTime edge_210b_d_incorporates_207c c)
    (hTempAssign : IncorporationHonored edge_210b_d_incorporates_206c c)
    (hBorrowing : OverrideTriggered edge_210b_f_notwithstanding_207d c) :
    Coherent210b c :=
  ⟨hSubjects, hCeiling, hRepealed, hTempAssign, hBorrowing⟩


theorem coherent211_intro {c : ComplaintText}
    (hBase : CrossTitleReferenceResolves edge_211g3A_incorporates_t10_1406h c)
    (hModern : CrossTitleReferenceResolves edge_211g3B_incorporates_t10_1407 c)
    (hCategory : IncorporationHonored edge_211l_incorporates_210b_c c)
    (hAffidavit : OverrideTriggered edge_211m_notwithstanding_t5_3332 c) :
    Coherent211 c :=
  ⟨hBase, hModern, hCategory, hAffidavit⟩


theorem coherent211c_intro {c : ComplaintText}
    (hDuplicate : SavingsClausePreserves edge_211c_savings_otherInternshipCredit c) :
    Coherent211c c :=
  ⟨hDuplicate⟩


theorem coherent212_intro {c : ComplaintText}
    (hModernCarve : ExceptionApplies edge_212a4_exceptAsProvided_212a6 c)
    (hBase : CrossTitleReferenceResolves edge_212a4_incorporates_t10_1406 c)
    (hBasicPay : CrossTitleReferenceResolves edge_212a4iii_incorporates_t37_205a c)
    (hPromotionFailure : IncorporationHonored edge_212a7_incorporates_211g3 c)
    (hNonRegular : IncorporationHonored edge_212c_incorporates_213a_a19 c)
    (hSbrs : IncorporationHonored edge_212d4_incorporates_237 c)
    (hDisability : CrossTitleReferenceResolves edge_212f_incorporates_t10_1208a2 c) :
    Coherent212 c :=
  ⟨hModernCarve, hBase, hBasicPay, hPromotionFailure, hNonRegular, hSbrs, hDisability⟩


theorem section213IncorporationsResolve_intro {c : ComplaintText}
    (hArmy : IncorporationHonored edge_213a_incorporates_armyOfficerBenefits c)
    (hCarveOut : ExceptionApplies edge_213a_exceptAsProvided_213b c)
    (hVeterans : DeemedEquivalenceApplied edge_213d_deemed_veteransLaws c)
    (hSocialSecurity : IncorporationHonored edge_213d_incorporates_417 c)
    (hScra : DeemedEquivalenceApplied edge_213e_deemed_scra c)
    (hAntidiscrimination : DeemedEquivalenceApplied edge_213f_deemed_antidiscriminationLaws c) :
    Section213IncorporationsResolve c :=
  ⟨hArmy, hCarveOut, hVeterans, hSocialSecurity, hScra, hAntidiscrimination⟩


theorem section213aIncorporationsResolve_intro {c : ComplaintText}
    (hEscort : ReferencedSectionExists edge_213a_a1_incorporates_t10_1036 c)
    (hDisability : CrossTitleReferenceResolves edge_213a_a2_incorporates_t10_ch61 c)
    (hTraining : ExceptionApplies edge_213a_a2_exceptAsProvided_t10_1201 c)
    (hProtected : CrossTitleReferenceResolves edge_213a_a18_incorporates_t10_1034 c)
    (hNonRegular : CrossTitleReferenceResolves edge_213a_a19_incorporates_t10_ch1223 c)
    (hClaims : SubjectToConstraintSatisfied edge_213a_a8_subjectTo_213 c)
    (hAuthority : DeemedEquivalenceApplied edge_213a_b1_deemed_secretaryHHS c)
    (hTerms : DeemedEquivalenceApplied edge_213a_b3_deemed_armedForces c) :
    Section213aIncorporationsResolve c :=
  ⟨hEscort, hDisability, hTraining, hProtected, hNonRegular, hClaims, hAuthority, hTerms⟩


theorem coherent214_intro {c : ComplaintText}
    (hPrior : ExceptionApplies edge_214b_exceptAsProvided_otherFlagLaw c)
    (hSpecific : LexSpecialisControls edge_214b_exceptAsProvided_otherFlagLaw c) :
    Coherent214 c :=
  ⟨hPrior, hSpecific⟩


theorem coherent215_intro {c : ComplaintText}
    (hHostLaw : SubjectToConstraintSatisfied edge_215a_subjectTo_lawsOfDetailService c)
    (hBenefits : IncorporationHonored edge_215d_incorporates_213 c)
    (hUrgentNeed : IncorporationHonored edge_215e_incorporates_204a_a5 c)
    (hDeployment : ExceptionApplies edge_215e_exceptAsProvided_coastGuardDod c) :
    Coherent215 c :=
  ⟨hHostLaw, hBenefits, hUrgentNeed, hDeployment⟩


theorem coherent217_intro {c : ComplaintText}
    (hUcmj : CrossTitleReferenceResolves edge_217_incorporates_ucmj c)
    (hCinC : ExceptionApplies edge_217_exceptAsProvided_presidentialDirection c) :
    Coherent217 c :=
  ⟨hUcmj, hCinC⟩


theorem coherent217a_intro {c : ComplaintText}
    (hCompetitive : OverrideTriggered edge_217a_a_notwithstanding_t5_competitiveService c)
    (hClassification : OverrideTriggered edge_217a_a_notwithstanding_t5_ch51 c)
    (hSavings : SavingsClausePreserves edge_217a_a_savings_otherCouncilAuthorities c)
    (hCompensation : IncorporationHonored edge_217a_b_incorporates_210c c) :
    Coherent217a c :=
  ⟨hCompetitive, hClassification, hSavings, hCompensation⟩


theorem coherent217a1_intro {c : ComplaintText}
    (hPhs : IncorporationHonored edge_217a1_incorporates_phsAct c)
    (hAlcohol : IncorporationHonored edge_217a1_incorporates_alcoholAct1970 c) :
    Coherent217a1 c :=
  ⟨hPhs, hAlcohol⟩




theorem militaryCharacterPath_executiveOrder_intro {c : ComplaintText}
    (h : CrossTitleReferenceResolves edge_217_incorporates_ucmj c) :
    MilitaryCharacterPath c :=
  .executiveOrderDeclaration h


theorem militaryCharacterPath_detail_intro {c : ComplaintText}
    (h : SubjectToConstraintSatisfied edge_215a_subjectTo_lawsOfDetailService c) :
    MilitaryCharacterPath c :=
  .detailToArmedService h


theorem militaryCharacterPath_benefitIncorporation_intro {c : ComplaintText}
    (h : IncorporationHonored edge_213a_incorporates_armyOfficerBenefits c) :
    MilitaryCharacterPath c :=
  .benefitIncorporation h


theorem retiredPayBaseIncorporation_preSept1980_intro {c : ComplaintText}
    (h : CrossTitleReferenceResolves edge_211g3A_incorporates_t10_1406h c) :
    RetiredPayBaseIncorporation c :=
  .preSept1980 h


theorem retiredPayBaseIncorporation_postSept1980_intro {c : ComplaintText}
    (h : CrossTitleReferenceResolves edge_211g3B_incorporates_t10_1407 c) :
    RetiredPayBaseIncorporation c :=
  .postSept1980 h


theorem retiredPayBaseIncorporation_modernized_intro {c : ComplaintText}
    (h : ExceptionApplies edge_212a4_exceptAsProvided_212a6 c) :
    RetiredPayBaseIncorporation c :=
  .modernizedSystem h


theorem subchapterIReferentialIntegrity_intro {c : ComplaintText}
    (hHub : Section201IncorporationsResolve c)
    (hArmy : Section213IncorporationsResolve c)
    (hTitle10 : Section213aIncorporationsResolve c)
    (hDangling : TargetRepealedAtOperativeTime edge_210b_d_incorporates_207c c) :
    SubchapterIReferentialIntegrity c :=
  ⟨hHub, hArmy, hTitle10, hDangling⟩

end Proving.USC.T42.Ch6ASchI.Reearn.Structure
