import Proving.USC.T18.Ch47.Structure.Types
import Proving.USC.T18.Ch47.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

















namespace Proving.USC.T18.Ch47.Structure





def IncorporationResolved (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop :=
  ReferencedSectionExists r c ∧ IncorporationHonored r c



def SavingsEdgeHonored (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop :=
  ReferencedSectionExists r c ∧ SavingsClausePreserves r c



def ActNamedIncorporationResolved (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop :=
  IncorporationResolved r c ∧ ActReferenceTranslatesToCode r c



def CarvedIncorporationResolved (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop :=
  ActNamedIncorporationResolved r c ∧ PartialIncorporationCarveHonored r c






structure Section1028dIncorporationsResolve (c : Proving.USC.Common.ComplaintText) : Prop where
  scopeWithinSection  : DefinitionScopeHonored edge_1028_incorporates_1028d c
  scopeToSection1028A : DefinitionScopeHonored edge_1028A_incorporates_1028d c
  accessDeviceDefn    : IncorporationResolved edge_1028d7D_incorporates_1029e c



structure Section1029eIncorporationsResolve (c : Proving.USC.Common.ComplaintText) : Prop where
  scopeWithinSection    : DefinitionScopeHonored edge_1029_incorporates_1029e c
  wiretapChapter        : IncorporationResolved edge_1029e8_incorporates_ch119 c
  telecomServiceDefn    : ActNamedIncorporationResolved edge_1029e9_incorporates_47usc153 c
  facilitiesCarrierDefn : ActNamedIncorporationResolved edge_1029e10_incorporates_commActTitleIII c





structure Coherent1028 (c : Proving.USC.Common.ComplaintText) : Prop where
  circumstanceIncorporated : IncorporationResolved edge_1028a_incorporates_1028c c
  circumstanceSatisfied    : IncorporatedConditionSatisfied edge_1028a_incorporates_1028c c
  penaltyRegimeIncorporated : IncorporationResolved edge_1028a_incorporates_1028b c
  attemptPenalty           : IncorporationResolved edge_1028f_incorporates_1028b c
  forfeitureTrigger        : IncorporationResolved edge_1028h_incorporates_1028a c
  jurisdictionalParagraph  : IncorporationResolved edge_1028c2_incorporates_1028a4 c
  countingRule             : IncorporationResolved edge_1028a7_incorporates_1028i c
  drugTraffickingDefn      : IncorporationResolved edge_1028b3A_incorporates_929a2 c
  crimeOfViolenceDefn      : IncorporationResolved edge_1028b3B_incorporates_924c3 c
  domesticTerrorismDefn    : IncorporationResolved edge_1028b4_incorporates_2331_5 c
  intlTerrorismDefn        : IncorporationResolved edge_1028b4_incorporates_2331_1 c
  priorConviction          : PriorConvictionReferenceResolves edge_1028b3C_incorporates_1028 c
  definitions              : Section1028dIncorporationsResolve c
  forfeitureRegime         : CarvedIncorporationResolved edge_1028g_subjectTo_853 c
  savingsChapter224        : SavingsEdgeHonored edge_1028e_savings_ch224 c
  savingsLawEnforcement    : SavingsEdgeHonored edge_1028e_savings_lawEnforcement c
  penaltyTiersPartition    : PenaltyTierPartitionComplete "18 USC § 1028(b)" c



structure Coherent1029 (c : Proving.USC.Common.ComplaintText) : Prop where
  penaltyRegimeIncorporated : IncorporationResolved edge_1029a_incorporates_1029c c
  attemptPenalty            : IncorporationResolved edge_1029b1_incorporates_1029a c
  conspiracyPenalty         : IncorporationResolved edge_1029b2_incorporates_1029c c
  tierTenYear               : IncorporationResolved edge_1029c1Ai_incorporates_1029a c
  tierFifteenYear           : IncorporationResolved edge_1029c1Aii_incorporates_1029a c
  priorConviction           : PriorConvictionReferenceResolves edge_1029c1B_incorporates_1029 c
  definitions               : Section1029eIncorporationsResolve c
  forfeitureRegime          : CarvedIncorporationResolved edge_1029c2_subjectTo_853 c
  savingsChapter224         : SavingsEdgeHonored edge_1029f_savings_ch224 c
  savingsLawEnforcement     : SavingsEdgeHonored edge_1029f_savings_lawEnforcement c
  savingsOtherAgencies      : SavingsEdgeHonored edge_1029d_savings_otherAgencies c
  extraterritorialOffense   : IncorporationResolved edge_1029h_incorporates_1029a c
  extraterritorialInchoate  : IncorporationResolved edge_1029h_incorporates_1029b c
  penaltyTiersPartition     : PenaltyTierPartitionComplete "18 USC § 1029(c)(1)" c








inductive Section1028bPenaltyPath (c : Proving.USC.Common.ComplaintText) : Prop where
  | baseFifteenYear
      (hTier : IncorporationResolved edge_1028b1C_incorporates_1028a5 c)
      (hAggravatedIncluded : IncorporationResolved edge_1028b1D_incorporates_1028a7 c)
      (hNoAggravatedOverride : ¬ OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c)
      (hNoTerrorismOverride : ¬ OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c)
    : Section1028bPenaltyPath c
  | baseFiveYear
      (hTierA : IncorporationResolved edge_1028b2B_incorporates_1028a3 c)
      (hTierB : IncorporationResolved edge_1028b2B_incorporates_1028a7 c)
      (hNoAggravatedOverride : ¬ OverrideTriggered edge_1028b2_exceptAsProvided_1028b3 c)
      (hNoTerrorismOverride : ¬ OverrideTriggered edge_1028b2_exceptAsProvided_1028b4 c)
    : Section1028bPenaltyPath c
  | aggravatedOverride
      (hFires : OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c)
      (hDrugDefn : IncorporationResolved edge_1028b3A_incorporates_929a2 c)
      (hViolenceDefn : IncorporationResolved edge_1028b3B_incorporates_924c3 c)
    : Section1028bPenaltyPath c
  | terrorismOverride
      (hFires : OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c)
      (hDomesticDefn : IncorporationResolved edge_1028b4_incorporates_2331_5 c)
      (hIntlDefn : IncorporationResolved edge_1028b4_incorporates_2331_1 c)
    : Section1028bPenaltyPath c
  | residual
      (hNotTier1 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b1 c)
      (hNotTier2 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b2 c)
      (hNotTier3 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b3 c)
      (hNotTier4 : ¬ SpecificControlsGeneral edge_1028b6_lexSpecialis_1028b4 c)
    : Section1028bPenaltyPath c





inductive Section1029aNineExceptionPath (c : Proving.USC.Common.ComplaintText) : Prop where
  | carrierProtectionExemption
      (hApplies : ExceptionApplies edge_1029a9_exceptAsProvided_1029g1 c)
    : Section1029aNineExceptionPath c
  | researchDevelopmentDefense
      (hApplies : ExceptionApplies edge_1029a9_exceptAsProvided_1029g2 c)
    : Section1029aNineExceptionPath c
  | noException
      (hNotCarrierExemption : ¬ ExceptionApplies edge_1029a9_exceptAsProvided_1029g1 c)
      (hNotResearchDefense : ¬ ExceptionApplies edge_1029a9_exceptAsProvided_1029g2 c)
      (hDefinitionScope : DefinitionScopeHonored edge_1029_incorporates_1029e c)
    : Section1029aNineExceptionPath c

end Proving.USC.T18.Ch47.Structure
