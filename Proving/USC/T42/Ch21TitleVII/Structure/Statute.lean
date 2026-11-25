


















import Proving.USC.Common.Types
import Proving.USC.T42.Ch21TitleVII.Structure.Types
import Proving.USC.T42.Ch21TitleVII.Structure.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Structure

open Proving.USC.Common (ComplaintText)






structure S2000eIncorporationsResolve (c : ComplaintText) : Prop where
  competitiveService : ReferencedSectionExists e_s2000e_b_inc_t5s2102 c
  taxExemptClub      : ReferencedSectionExists e_s2000e_b_inc_t26s501c c
  bankruptcyTrustee  : CrossTitleReferenceResolves e_s2000e_a_inc_t11 c
  nlra               : CrossTitleReferenceResolves e_s2000e_e_inc_nlra c
  rla                : CrossTitleReferenceResolves e_s2000e_e_inc_rla c
  lmrda              : CrossTitleReferenceResolves e_s2000e_h_inc_lmrda c
  ocsla              : CrossTitleReferenceResolves e_s2000e_i_inc_ocsla c
  pregnancyOverride  : OverrideTriggered e_s2000e_k_notw_s2000e2h c
  federalRespondent  : ReferencedSectionExists e_s2000e_n_inc_s2000e16 c



structure S2000e9IncorporationsResolve (c : ComplaintText) : Prop where
  subpoenaPowerExists : CrossTitleReferenceResolves e_s2000e9_inc_t29s161 c
  subpoenaPowerHonored : IncorporationHonored e_s2000e9_inc_t29s161 c



structure S2000e16aIncorporationsResolve (c : ComplaintText) : Prop where
  violationTargetExists : ReferencedSectionExists e_s2000e16a_c_inc_s2000e16b c
  violationTermResolves : DefinedTermResolves "violation" e_s2000e16a_c_inc_s2000e16b c




structure Coherent2000e1 (c : ComplaintText) : Prop where
  reachesSection2 : ReferencedSectionExists e_s2000e1_b_inc_s2000e2 c
  reachesSection3 : ReferencedSectionExists e_s2000e1_b_inc_s2000e3 c
  controlPresumption : IncorporationHonored e_s2000e1_c1_inc_s2000e2 c



structure Coherent2000e2 (c : ComplaintText) : Prop where
  definitionsResolve   : IncorporationHonored e_s2000e2_inc_s2000e c
  demonstratesTerm     : DefinedTermResolves "demonstrates" e_s2000e2_k1_inc_s2000e_m c
  equalPayProviso      : ReferencedSectionExists e_s2000e2_h_inc_t29s206d c
  controlledSubstance  : CrossTitleReferenceResolves e_s2000e2_k3_inc_csa c
  priorLawStandard     : IncorporationHonored e_s2000e2_k1C_inc_priorlaw c
  exemptionChannel     : ReferencedSectionExists e_s2000e2_exc_s2000e1a c
  noPreferenceInferred : ConstructionLimitObserved e_s2000e2_j_constr_subch c
  interventionStandard : CrossTitleReferenceResolves e_s2000e2_n2_inc_frcp24 c
  transferProvision    : CrossTitleReferenceResolves e_s2000e2_n3_inc_t28s1404 c




structure Coherent2000e3 (c : ComplaintText) : Prop where
  definitionsResolve       : IncorporationHonored e_s2000e3_inc_s2000e c
  opposedPracticeResolves  : IncorporationHonored e_s2000e3_a_inc_s2000e2 c
  participationForumExists : ReferencedSectionExists e_s2000e3_a_inc_s2000e5 c
  advertisingBfoq          : IncorporationHonored e_s2000e3_b_inc_s2000e2e c
  exemptionChannel         : ReferencedSectionExists e_s2000e3_exc_s2000e1 c
  chainToDefinitions       : ReferenceChainClosed chain_s2000e3_to_s2000e c



structure Coherent2000e4 (c : ComplaintText) : Prop where
  civilServiceRefs   : CrossTitleReferenceResolves e_s2000e4_a_inc_t5civilservice c
  litigationUnder5   : ReferencedSectionExists e_s2000e4_b1_inc_s2000e5 c
  litigationUnder6   : ReferencedSectionExists e_s2000e4_b1_inc_s2000e6 c
  interventionPower  : IncorporationHonored e_s2000e4_g6_inc_s2000e5 c
  politicalActivity  : CrossTitleReferenceResolves e_s2000e4_i_inc_t5s7324 c
  exemptionOverride  : SpecificControls e_s2000e4_i_notw_t5s7324exempt c





structure Coherent2000e5 (c : ComplaintText) : Prop where
  practiceRef2          : ReferencedSectionExists e_s2000e5_a_inc_s2000e2 c
  practiceRef3          : ReferencedSectionExists e_s2000e5_a_inc_s2000e3 c
  definitionsResolve    : IncorporationHonored e_s2000e5_inc_s2000e c
  deferralSubordination : SubordinationHonored e_s2000e5_b_sub_cd c
  defectiveChargeCite   : DefectiveReferenceReadAsCorrected e_s2000e5_c_inc_s2000e5b c
  damagesRef            : ReferencedSectionExists e_s2000e5_e3B_inc_s1981a c
  preliminaryReliefRule : CrossTitleReferenceResolves e_s2000e5_f2_inc_frcp65 c
  venueRefs             : CrossTitleReferenceResolves e_s2000e5_f3_inc_t28s1404_1406 c
  masterRule            : CrossTitleReferenceResolves e_s2000e5_f5_inc_frcp53 c
  retaliationReliefBar  : IncorporationHonored e_s2000e5_g2A_inc_s2000e3a c
  mixedMotiveCap        : IncorporationHonored e_s2000e5_g2B_inc_s2000e2m c
  norrisLaGuardiaOff    : SpecificControls e_s2000e5_h_notw_t29ch6 c
  appealRefs            : CrossTitleReferenceResolves e_s2000e5_j_inc_t28s1291_1292 c



structure Coherent2000e6 (c : ComplaintText) : Prop where
  subchapterRights      : IncorporationHonored e_s2000e6_a_inc_subch c
  reorganizationRef     : CrossTitleReferenceResolves e_s2000e6_c_inc_t5ch9 c
  transferContinuity    : IncorporationHonored e_s2000e6_d_inc_s2000e6c c
  proceduresSubordinate : SubordinationHonored e_s2000e6_e_sub_s2000e5 c



structure Coherent2000e7 (c : ComplaintText) : Prop where
  stateLawPreserved       : SavingsPreserved e_s2000e7_sav_statelaw c
  unlawfulPracticeCarveOut : ConstructionLimitObserved e_s2000e7_constr_s2000e2 c


structure Coherent2000e8 (c : ComplaintText) : Prop where
  chargePredicate    : ReferencedSectionExists e_s2000e8_a_inc_s2000e5 c
  paymentOverride    : SpecificControls e_s2000e8_b_notw_law c
  recordkeepingChain : IncorporationHonored e_s2000e8_d_inc_s2000e8c c



structure Coherent2000e10 (c : ComplaintText) : Prop where
  subchapterExcerpts : IncorporationHonored e_s2000e10_a_inc_subch c
  complaintFilingRef : ReferencedSectionExists e_s2000e10_a_inc_s2000e5 c


structure Coherent2000e11 (c : ComplaintText) : Prop where
  veteransPreferencePreserved : SavingsPreserved e_s2000e11_sav_veterans c



structure Coherent2000e12 (c : ComplaintText) : Prop where
  apaConformity          : SubordinationHonored e_s2000e12_a_sub_apa c
  relianceDefenseChannel : ReferencedSectionExists e_s2000e12_b_exc_subch c



structure Coherent2000e13 (c : ComplaintText) : Prop where
  assaultProvisionsApply  : CrossTitleReferenceResolves e_s2000e13_inc_t18s111_1114 c
  enhancedPenaltyControls : SpecificControls e_s2000e13_notw_t18s1114 c



structure Coherent2000e14 (c : ComplaintText) : Prop where
  coordinationScope : IncorporationHonored e_s2000e14_inc_eeolaws c



structure Coherent2000e15 (c : ComplaintText) : Prop where
  subchapterRightsBriefed : IncorporationHonored e_s2000e15_inc_subch c



structure Coherent2000e16 (c : ComplaintText) : Prop where
  militaryDeptRef        : CrossTitleReferenceResolves e_s2000e16_a_inc_t5s102 c
  execAgencyRef          : CrossTitleReferenceResolves e_s2000e16_a_inc_t5s105 c
  civilActionRoute       : IncorporationHonored e_s2000e16_c_inc_s2000e5 c
  executiveOrderRef      : ReferencedSectionExists e_s2000e16_c_inc_eo11478 c
  proceduralSubordination : SubordinationHonored e_s2000e16_d_sub_s2000e5fk c
  compensationTiming     : IncorporationHonored e_s2000e16_f_inc_s2000e5e3 c
  agencyDutiesPreserved  : SavingsPreserved e_s2000e16_e_sav_agencyduty c




structure Coherent2000e16b (c : ComplaintText) : Prop where
  presidentialAppointeeRef : CrossTitleReferenceResolves e_s2000e16b_a_inc_t2s1219 c
  stateEmployeeRef         : ReferencedSectionExists e_s2000e16b_a_inc_s2000e16c c
  titleVIIStandard         : IncorporationHonored e_s2000e16b_a1_inc_s2000e16 c
  ageStandard              : CrossTitleReferenceResolves e_s2000e16b_a2_inc_t29s633a c
  rehabStandard            : CrossTitleReferenceResolves e_s2000e16b_a3_inc_t29s791 c
  adaStandard              : ReferencedSectionExists e_s2000e16b_a3_inc_ada c
  remedyByReference        : RemedyReferenceResolves e_s2000e16b_b1_inc_remedies c
  damagesByReference       : RemedyReferenceResolves e_s2000e16b_b1_inc_s1981 c
  ageRemedyByReference     : RemedyReferenceResolves e_s2000e16b_b2_inc_t29s633ac c



structure Coherent2000e16c (c : ComplaintText) : Prop where
  rightsChainClosed    : ReferenceChainClosed chain_s2000e16c_to_s2000e5 c
  rightsSourceExists   : ReferencedSectionExists e_s2000e16c_a_inc_s2000e16b c
  apaAdjudication      : SubordinationHonored e_s2000e16c_b1_sub_t5s554_557 c
  commissionerFiction  : SubordinationHonored e_s2000e16c_b2_sub_s2000e5d c
  reviewChapterRef     : CrossTitleReferenceResolves e_s2000e16c_c_inc_t28ch158 c
  feeStandardReference : RemedyReferenceResolves e_s2000e16c_e_inc_s2000e5k c



structure Coherent2000e17 (c : ComplaintText) : Prop where
  hearingRef            : CrossTitleReferenceResolves e_s2000e17_inc_t5s554 c
  controlsEeoEnforcement : SpecificControls e_s2000e17_lexspec_eeolaw c
  deviationProviso      : ConstructionLimitObserved e_s2000e17_constr_deviation c







inductive ExemptionPath2000e2 (c : ComplaintText) : Prop where

  | religiousOrAlienAbroad (h : ExceptionApplies e_s2000e2_exc_s2000e1a c)

  | foreignLawConflict (h : ExceptionApplies e_s2000e2_exc_s2000e1b c)

  | bfoq (h : OverrideTriggered e_s2000e2_e_notw_subch c)

  | nationalSecurity (h : OverrideTriggered e_s2000e2_g_notw_subch c)

  | senioritySystem (h : OverrideTriggered e_s2000e2_h_notw_subch c)

  | communistOrganization (h : ExceptionApplies e_s2000e2_exc_s2000e2f c)

  | indianPreference (h : ExceptionApplies e_s2000e2_exc_s2000e2i c)

  | controlledSubstanceRule (h : OverrideTriggered e_s2000e2_k3_notw_subch c)

  | goodFaithReliance (h : ExceptionApplies e_s2000e12_b_exc_subch c)




inductive EnforcementRoute2000e5 (c : ComplaintText) : Prop where

  | aggrievedPersonCharge (h : IncorporationHonored e_s2000e5_a_inc_s2000e2 c)

  | commissionerCharge (h : SubordinationHonored e_s2000e5_b_sub_cd c)

  | patternOrPractice (h : SubordinationHonored e_s2000e6_e_sub_s2000e5 c)

  | federalEmployeeAppeal (h : IncorporationHonored e_s2000e16_c_inc_s2000e5 c)

  | governmentEmployeeRightsAct (h : SubordinationHonored e_s2000e16c_b2_sub_s2000e5d c)






structure TitleVIIReferenceGraphCoherent (c : ComplaintText) : Prop where
  s2000e    : S2000eIncorporationsResolve c
  s2000e1   : Coherent2000e1 c
  s2000e2   : Coherent2000e2 c
  s2000e3   : Coherent2000e3 c
  s2000e4   : Coherent2000e4 c
  s2000e5   : Coherent2000e5 c
  s2000e6   : Coherent2000e6 c
  s2000e7   : Coherent2000e7 c
  s2000e8   : Coherent2000e8 c
  s2000e9   : S2000e9IncorporationsResolve c
  s2000e10  : Coherent2000e10 c
  s2000e11  : Coherent2000e11 c
  s2000e12  : Coherent2000e12 c
  s2000e13  : Coherent2000e13 c
  s2000e14  : Coherent2000e14 c
  s2000e15  : Coherent2000e15 c
  s2000e16  : Coherent2000e16 c
  s2000e16a : S2000e16aIncorporationsResolve c
  s2000e16b : Coherent2000e16b c
  s2000e16c : Coherent2000e16c c
  s2000e17  : Coherent2000e17 c

end Proving.USC.T42.Ch21TitleVII.Structure
