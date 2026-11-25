











import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Structure

open Proving.USC.Common







structure Section7IncorporationsResolve (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs7, ReferencedSectionExists r c
  inaNationalHonored : IncorporationHonored edge_7_9_incorporates_ina101 c
  treatySavings : SavingsClausePreserves edge_7_9_savings_treaties c
  mejaCarveOut : ExceptionApplies edge_7_9_exceptAsProvided_3261a c
  titleScope : ScopeClauseReaches scope_7_title
    "18 USC — any section using \"special maritime and territorial jurisdiction of the United States\"" c





structure Section20IncorporationsResolve (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs20, ReferencedSectionExists r c
  popularNamesResolve : ∀ r ∈ refs20PopularName, PopularNameReferenceResolves r c
  mortgageBusinessHonored : IncorporationHonored edge_20_10_incorporates_18usc27 c
  fra25aDefectHarmless : EditorialDefectDoesNotDefeatReference edge_20_8_incorporates_fra25a c
  titleScope : ScopeClauseReaches scope_20_title
    "18 USC — any section using \"financial institution\"" c








structure Coherent21 (c : ComplaintText) : Prop where
  leoDefinitionExists : ReferencedSectionExists edge_21_b_incorporates_115 c
  leoDefinitionHonored : IncorporationHonored edge_21_b_incorporates_115 c
  reachesTransferOffense : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(2)" c
  reachesPossessionOffense : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(6)" c







structure Section23IncorporationsResolve (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs23, ReferencedSectionExists r c
  titleScope : ScopeClauseReaches scope_23_title
    "18 USC — any section using \"court of the United States\"" c
  openExceptionHonored : ExceptionApplies edge_23_exceptAsProvided_openEnded c
  commaDefectHarmless : EditorialDefectDoesNotDefeatReference edge_23_exceptAsProvided_openEnded c







structure Section24IncorporationsResolve (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs24, ReferencedSectionExists r c
  intraTitleHonored : ∀ r ∈ refs24IntraTitle, IncorporationHonored r c
  popularNamesResolve : ∀ r ∈ refs24PopularName, PopularNameReferenceResolves r c
  hcbpConditionTriggered : ConditionalIncorporationTriggered edge_24_a2_incorporates_24b c
  commaDefectHarmless : EditorialDefectDoesNotDefeatReference edge_24_a2_incorporates_ffdca301 c
  titleScope : ScopeClauseReaches scope_24_title
    "18 USC — any section using \"Federal health care offense\"" c





structure Coherent1028 (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs1028, ReferencedSectionExists r c
  circumstanceIncorporated : IncorporationHonored edge_1028a_incorporates_1028c c
  penaltyRegimeExists : ReferencedSectionExists edge_1028a_subjectTo_1028b c
  tier3CarveOut : ExceptionApplies edge_1028b1_exceptAsProvided_1028b3 c
  tier4CarveOut : ExceptionApplies edge_1028b1_exceptAsProvided_1028b4 c
  a7SpecificControls : LexSpecialisControls edge_1028b1D_lexSpecialis_1028b2B c
  residualDisplaced : LexSpecialisControls edge_1028b1_lexSpecialis_1028b6 c
  accessDeviceImported : IncorporationHonored edge_1028d7D_incorporates_1029e c
  stolenProofRuleImported : IncorporationHonored edge_1028a2_incorporates_21a c
  lawEnforcementSavings : SavingsClausePreserves edge_1028e_savings_ch224 c
  forfeitureRegimeExists : ReferencedSectionExists edge_1028g_subjectTo_21usc853 c
  forfeitureRegimeResolves : PopularNameReferenceResolves edge_1028g_subjectTo_21usc853 c
  forfeitureCarveOut : ExceptionApplies edge_1028g_exceptAsProvided_21usc853d c
  doubledCommaHarmless : EditorialDefectDoesNotDefeatReference edge_1028b2A_incorporates_1028a c
  definitionsReach1028A : ScopeClauseReaches scope_1028_d "18 USC § 1028A" c




inductive Section1028PenaltyPath (c : ComplaintText) : Prop where


  | tier3 : OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c → Section1028PenaltyPath c

  | tier4 : OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c → Section1028PenaltyPath c


  | graded : ReferencedSectionExists edge_1028a_subjectTo_1028b c → Section1028PenaltyPath c


  | residual : LexSpecialisControls edge_1028b1_lexSpecialis_1028b6 c → Section1028PenaltyPath c







structure Coherent1029 (c : ComplaintText) : Prop where
  targetsExist : ∀ r ∈ refs1029, ReferencedSectionExists r c
  penaltyRegimeExists : ReferencedSectionExists edge_1029a_subjectTo_1029c c
  attemptIncorporated : IncorporationHonored edge_1029b1_incorporates_1029a c
  conspiracyPenaltyExists : ReferencedSectionExists edge_1029b2_subjectTo_1029c c
  forfeitureRegimeExists : ReferencedSectionExists edge_1029c2_subjectTo_21usc853 c
  forfeitureCarveOut : ExceptionApplies edge_1029c2_exceptAsProvided_21usc853d c
  ccsmFinancialInstitutionImported : IncorporationHonored edge_1029e7_incorporates_18usc20 c
  extraterritorialFinancialInstitutionImported : IncorporationHonored edge_1029h_incorporates_18usc20 c
  wiretapChapterExists : ReferencedSectionExists edge_1029e8_incorporates_ch119 c
  carrierDefinitionHonored : IncorporationHonored edge_1029g1_incorporates_1029e10 c
  popularNamesResolve : ∀ r ∈ refs1029PopularName, PopularNameReferenceResolves r c
  lawEnforcementSavings : SavingsClausePreserves edge_1029f_savings_ch224 c
  definitionsSectionLocal : ScopeClauseReaches scope_1029_e "18 USC § 1029" c



inductive Section1029a9ExemptionPath (c : ComplaintText) : Prop where

  | carrierProtection :
      ExceptionApplies edge_1029g1_exceptAsProvided_1029a9 c → Section1029a9ExemptionPath c

  | researchDefense :
      ExceptionApplies edge_1029g2_exceptAsProvided_1029a9 c → Section1029a9ExemptionPath c


  | lawEnforcement :
      SavingsClausePreserves edge_1029f_savings_ch224 c → Section1029a9ExemptionPath c








structure Ch1DefinitionsReachCh47 (c : ComplaintText) : Prop where
  financialInstitutionReaches1029e7 : ScopeClauseReaches scope_20_title "18 USC § 1029(e)(7)" c
  financialInstitutionReaches1029h : ScopeClauseReaches scope_20_title "18 USC § 1029(h)" c
  proofRuleReaches1028a2 : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(2)" c
  ch47Honors1029e7 : IncorporationHonored edge_1029e7_incorporates_18usc20 c
  ch47Honors1029h : IncorporationHonored edge_1029h_incorporates_18usc20 c

end Proving.USC.T18.Ch1Ch47.Recert2.Structure
