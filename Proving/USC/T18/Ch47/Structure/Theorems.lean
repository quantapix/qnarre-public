import Proving.USC.T18.Ch47.Structure.Types
import Proving.USC.T18.Ch47.Structure.Predicates
import Proving.USC.T18.Ch47.Structure.Statute

set_option autoImplicit false










namespace Proving.USC.T18.Ch47.Structure


theorem section1028dIncorporationsResolve_intro
    {c : Proving.USC.Common.ComplaintText}
    (hScope : DefinitionScopeHonored edge_1028_incorporates_1028d c)
    (hScopeA : DefinitionScopeHonored edge_1028A_incorporates_1028d c)
    (hAccessDevice : IncorporationResolved edge_1028d7D_incorporates_1029e c)
    : Section1028dIncorporationsResolve c :=
  ⟨hScope, hScopeA, hAccessDevice⟩


theorem section1029eIncorporationsResolve_intro
    {c : Proving.USC.Common.ComplaintText}
    (hScope : DefinitionScopeHonored edge_1029_incorporates_1029e c)
    (hWiretap : IncorporationResolved edge_1029e8_incorporates_ch119 c)
    (hTelecom : ActNamedIncorporationResolved edge_1029e9_incorporates_47usc153 c)
    (hCarrier : ActNamedIncorporationResolved edge_1029e10_incorporates_commActTitleIII c)
    : Section1029eIncorporationsResolve c :=
  ⟨hScope, hWiretap, hTelecom, hCarrier⟩


theorem coherent1028_intro
    {c : Proving.USC.Common.ComplaintText}
    (hCircumstanceInc : IncorporationResolved edge_1028a_incorporates_1028c c)
    (hCircumstanceSat : IncorporatedConditionSatisfied edge_1028a_incorporates_1028c c)
    (hPenaltyRegime : IncorporationResolved edge_1028a_incorporates_1028b c)
    (hAttemptPenalty : IncorporationResolved edge_1028f_incorporates_1028b c)
    (hForfeitureTrigger : IncorporationResolved edge_1028h_incorporates_1028a c)
    (hJurisdictional : IncorporationResolved edge_1028c2_incorporates_1028a4 c)
    (hCountingRule : IncorporationResolved edge_1028a7_incorporates_1028i c)
    (hDrugDefn : IncorporationResolved edge_1028b3A_incorporates_929a2 c)
    (hViolenceDefn : IncorporationResolved edge_1028b3B_incorporates_924c3 c)
    (hDomesticDefn : IncorporationResolved edge_1028b4_incorporates_2331_5 c)
    (hIntlDefn : IncorporationResolved edge_1028b4_incorporates_2331_1 c)
    (hPriorConviction : PriorConvictionReferenceResolves edge_1028b3C_incorporates_1028 c)
    (hDefinitions : Section1028dIncorporationsResolve c)
    (hForfeitureRegime : CarvedIncorporationResolved edge_1028g_subjectTo_853 c)
    (hSavingsCh224 : SavingsEdgeHonored edge_1028e_savings_ch224 c)
    (hSavingsLawEnf : SavingsEdgeHonored edge_1028e_savings_lawEnforcement c)
    (hPartition : PenaltyTierPartitionComplete "18 USC § 1028(b)" c)
    : Coherent1028 c :=
  ⟨hCircumstanceInc, hCircumstanceSat, hPenaltyRegime, hAttemptPenalty,
   hForfeitureTrigger, hJurisdictional, hCountingRule, hDrugDefn, hViolenceDefn,
   hDomesticDefn, hIntlDefn, hPriorConviction, hDefinitions, hForfeitureRegime,
   hSavingsCh224, hSavingsLawEnf, hPartition⟩


theorem coherent1029_intro
    {c : Proving.USC.Common.ComplaintText}
    (hPenaltyRegime : IncorporationResolved edge_1029a_incorporates_1029c c)
    (hAttemptPenalty : IncorporationResolved edge_1029b1_incorporates_1029a c)
    (hConspiracyPenalty : IncorporationResolved edge_1029b2_incorporates_1029c c)
    (hTierTen : IncorporationResolved edge_1029c1Ai_incorporates_1029a c)
    (hTierFifteen : IncorporationResolved edge_1029c1Aii_incorporates_1029a c)
    (hPriorConviction : PriorConvictionReferenceResolves edge_1029c1B_incorporates_1029 c)
    (hDefinitions : Section1029eIncorporationsResolve c)
    (hForfeitureRegime : CarvedIncorporationResolved edge_1029c2_subjectTo_853 c)
    (hSavingsCh224 : SavingsEdgeHonored edge_1029f_savings_ch224 c)
    (hSavingsLawEnf : SavingsEdgeHonored edge_1029f_savings_lawEnforcement c)
    (hSavingsAgencies : SavingsEdgeHonored edge_1029d_savings_otherAgencies c)
    (hExtraterritorialA : IncorporationResolved edge_1029h_incorporates_1029a c)
    (hExtraterritorialB : IncorporationResolved edge_1029h_incorporates_1029b c)
    (hPartition : PenaltyTierPartitionComplete "18 USC § 1029(c)(1)" c)
    : Coherent1029 c :=
  ⟨hPenaltyRegime, hAttemptPenalty, hConspiracyPenalty, hTierTen, hTierFifteen,
   hPriorConviction, hDefinitions, hForfeitureRegime, hSavingsCh224,
   hSavingsLawEnf, hSavingsAgencies, hExtraterritorialA, hExtraterritorialB,
   hPartition⟩




theorem section1028bPenaltyPath_intro_baseFifteenYear
    {c : Proving.USC.Common.ComplaintText}
    (hTier : IncorporationResolved edge_1028b1C_incorporates_1028a5 c)
    (hAggravatedIncluded : IncorporationResolved edge_1028b1D_incorporates_1028a7 c)
    (hNoAggravated : ¬ OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c)
    (hNoTerrorism : ¬ OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c)
    : Section1028bPenaltyPath c :=
  .baseFifteenYear hTier hAggravatedIncluded hNoAggravated hNoTerrorism


theorem section1028bPenaltyPath_intro_baseFiveYear
    {c : Proving.USC.Common.ComplaintText}
    (hTierA : IncorporationResolved edge_1028b2B_incorporates_1028a3 c)
    (hTierB : IncorporationResolved edge_1028b2B_incorporates_1028a7 c)
    (hNoAggravated : ¬ OverrideTriggered edge_1028b2_exceptAsProvided_1028b3 c)
    (hNoTerrorism : ¬ OverrideTriggered edge_1028b2_exceptAsProvided_1028b4 c)
    : Section1028bPenaltyPath c :=
  .baseFiveYear hTierA hTierB hNoAggravated hNoTerrorism


theorem section1028bPenaltyPath_intro_aggravatedOverride
    {c : Proving.USC.Common.ComplaintText}
    (hFires : OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c)
    (hDrugDefn : IncorporationResolved edge_1028b3A_incorporates_929a2 c)
    (hViolenceDefn : IncorporationResolved edge_1028b3B_incorporates_924c3 c)
    : Section1028bPenaltyPath c :=
  .aggravatedOverride hFires hDrugDefn hViolenceDefn


theorem section1028bPenaltyPath_intro_terrorismOverride
    {c : Proving.USC.Common.ComplaintText}
    (hFires : OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c)
    (hDomesticDefn : IncorporationResolved edge_1028b4_incorporates_2331_5 c)
    (hIntlDefn : IncorporationResolved edge_1028b4_incorporates_2331_1 c)
    : Section1028bPenaltyPath c :=
  .terrorismOverride hFires hDomesticDefn hIntlDefn


theorem section1028bPenaltyPath_intro_residual
    {c : Proving.USC.Common.ComplaintText}
    (hNotTier1 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b1 c)
    (hNotTier2 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b2 c)
    (hNotTier3 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b3 c)
    (hNotTier4 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b4 c)
    : Section1028bPenaltyPath c :=
  .residual hNotTier1 hNotTier2 hNotTier3 hNotTier4




theorem section1029aNineExceptionPath_intro_carrierProtectionExemption
    {c : Proving.USC.Common.ComplaintText}
    (hApplies : ExceptionApplies edge_1029a9_exceptAsProvided_1029g1 c)
    : Section1029aNineExceptionPath c :=
  .carrierProtectionExemption hApplies


theorem section1029aNineExceptionPath_intro_researchDevelopmentDefense
    {c : Proving.USC.Common.ComplaintText}
    (hApplies : ExceptionApplies edge_1029a9_exceptAsProvided_1029g2 c)
    : Section1029aNineExceptionPath c :=
  .researchDevelopmentDefense hApplies


theorem section1029aNineExceptionPath_intro_noException
    {c : Proving.USC.Common.ComplaintText}
    (hNotCarrier : ¬ ExceptionApplies edge_1029a9_exceptAsProvided_1029g1 c)
    (hNotResearch : ¬ ExceptionApplies edge_1029a9_exceptAsProvided_1029g2 c)
    (hScope : DefinitionScopeHonored edge_1029_incorporates_1029e c)
    : Section1029aNineExceptionPath c :=
  .noException hNotCarrier hNotResearch hScope

end Proving.USC.T18.Ch47.Structure
