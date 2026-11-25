





import Proving.USC.Common.Types
import Proving.USC.T42.Ch21TitleVII.Structure.Types
import Proving.USC.T42.Ch21TitleVII.Structure.Predicates
import Proving.USC.T42.Ch21TitleVII.Structure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Structure

open Proving.USC.Common (ComplaintText)



theorem s2000eIncorporationsResolve_intro {c : ComplaintText}
    (hCompetitiveService : ReferencedSectionExists e_s2000e_b_inc_t5s2102 c)
    (hTaxExemptClub : ReferencedSectionExists e_s2000e_b_inc_t26s501c c)
    (hBankruptcyTrustee : CrossTitleReferenceResolves e_s2000e_a_inc_t11 c)
    (hNlra : CrossTitleReferenceResolves e_s2000e_e_inc_nlra c)
    (hRla : CrossTitleReferenceResolves e_s2000e_e_inc_rla c)
    (hLmrda : CrossTitleReferenceResolves e_s2000e_h_inc_lmrda c)
    (hOcsla : CrossTitleReferenceResolves e_s2000e_i_inc_ocsla c)
    (hPregnancyOverride : OverrideTriggered e_s2000e_k_notw_s2000e2h c)
    (hFederalRespondent : ReferencedSectionExists e_s2000e_n_inc_s2000e16 c)
    : S2000eIncorporationsResolve c :=
  ⟨hCompetitiveService, hTaxExemptClub, hBankruptcyTrustee, hNlra, hRla, hLmrda,
   hOcsla, hPregnancyOverride, hFederalRespondent⟩

theorem s2000e9IncorporationsResolve_intro {c : ComplaintText}
    (hExists : CrossTitleReferenceResolves e_s2000e9_inc_t29s161 c)
    (hHonored : IncorporationHonored e_s2000e9_inc_t29s161 c)
    : S2000e9IncorporationsResolve c :=
  ⟨hExists, hHonored⟩

theorem s2000e16aIncorporationsResolve_intro {c : ComplaintText}
    (hTargetExists : ReferencedSectionExists e_s2000e16a_c_inc_s2000e16b c)
    (hTermResolves : DefinedTermResolves "violation" e_s2000e16a_c_inc_s2000e16b c)
    : S2000e16aIncorporationsResolve c :=
  ⟨hTargetExists, hTermResolves⟩



theorem coherent2000e1_intro {c : ComplaintText}
    (hReaches2 : ReferencedSectionExists e_s2000e1_b_inc_s2000e2 c)
    (hReaches3 : ReferencedSectionExists e_s2000e1_b_inc_s2000e3 c)
    (hControl : IncorporationHonored e_s2000e1_c1_inc_s2000e2 c)
    : Coherent2000e1 c :=
  ⟨hReaches2, hReaches3, hControl⟩

theorem coherent2000e2_intro {c : ComplaintText}
    (hDefinitions : IncorporationHonored e_s2000e2_inc_s2000e c)
    (hDemonstrates : DefinedTermResolves "demonstrates" e_s2000e2_k1_inc_s2000e_m c)
    (hEqualPay : ReferencedSectionExists e_s2000e2_h_inc_t29s206d c)
    (hControlledSubstance : CrossTitleReferenceResolves e_s2000e2_k3_inc_csa c)
    (hPriorLaw : IncorporationHonored e_s2000e2_k1C_inc_priorlaw c)
    (hExemptionChannel : ReferencedSectionExists e_s2000e2_exc_s2000e1a c)
    (hNoPreference : ConstructionLimitObserved e_s2000e2_j_constr_subch c)
    (hIntervention : CrossTitleReferenceResolves e_s2000e2_n2_inc_frcp24 c)
    (hTransfer : CrossTitleReferenceResolves e_s2000e2_n3_inc_t28s1404 c)
    : Coherent2000e2 c :=
  ⟨hDefinitions, hDemonstrates, hEqualPay, hControlledSubstance, hPriorLaw,
   hExemptionChannel, hNoPreference, hIntervention, hTransfer⟩

theorem coherent2000e3_intro {c : ComplaintText}
    (hDefinitions : IncorporationHonored e_s2000e3_inc_s2000e c)
    (hOpposed : IncorporationHonored e_s2000e3_a_inc_s2000e2 c)
    (hForum : ReferencedSectionExists e_s2000e3_a_inc_s2000e5 c)
    (hAdvertisingBfoq : IncorporationHonored e_s2000e3_b_inc_s2000e2e c)
    (hExemptionChannel : ReferencedSectionExists e_s2000e3_exc_s2000e1 c)
    (hChain : ReferenceChainClosed chain_s2000e3_to_s2000e c)
    : Coherent2000e3 c :=
  ⟨hDefinitions, hOpposed, hForum, hAdvertisingBfoq, hExemptionChannel, hChain⟩

theorem coherent2000e4_intro {c : ComplaintText}
    (hCivilService : CrossTitleReferenceResolves e_s2000e4_a_inc_t5civilservice c)
    (hLitigation5 : ReferencedSectionExists e_s2000e4_b1_inc_s2000e5 c)
    (hLitigation6 : ReferencedSectionExists e_s2000e4_b1_inc_s2000e6 c)
    (hIntervention : IncorporationHonored e_s2000e4_g6_inc_s2000e5 c)
    (hPoliticalActivity : CrossTitleReferenceResolves e_s2000e4_i_inc_t5s7324 c)
    (hExemptionOverride : SpecificControls e_s2000e4_i_notw_t5s7324exempt c)
    : Coherent2000e4 c :=
  ⟨hCivilService, hLitigation5, hLitigation6, hIntervention, hPoliticalActivity,
   hExemptionOverride⟩

theorem coherent2000e5_intro {c : ComplaintText}
    (hPractice2 : ReferencedSectionExists e_s2000e5_a_inc_s2000e2 c)
    (hPractice3 : ReferencedSectionExists e_s2000e5_a_inc_s2000e3 c)
    (hDefinitions : IncorporationHonored e_s2000e5_inc_s2000e c)
    (hDeferral : SubordinationHonored e_s2000e5_b_sub_cd c)
    (hDefectiveCite : DefectiveReferenceReadAsCorrected e_s2000e5_c_inc_s2000e5b c)
    (hDamages : ReferencedSectionExists e_s2000e5_e3B_inc_s1981a c)
    (hPreliminaryRule : CrossTitleReferenceResolves e_s2000e5_f2_inc_frcp65 c)
    (hVenue : CrossTitleReferenceResolves e_s2000e5_f3_inc_t28s1404_1406 c)
    (hMaster : CrossTitleReferenceResolves e_s2000e5_f5_inc_frcp53 c)
    (hReliefBar : IncorporationHonored e_s2000e5_g2A_inc_s2000e3a c)
    (hMixedMotive : IncorporationHonored e_s2000e5_g2B_inc_s2000e2m c)
    (hNorrisLaGuardia : SpecificControls e_s2000e5_h_notw_t29ch6 c)
    (hAppeal : CrossTitleReferenceResolves e_s2000e5_j_inc_t28s1291_1292 c)
    : Coherent2000e5 c :=
  ⟨hPractice2, hPractice3, hDefinitions, hDeferral, hDefectiveCite, hDamages,
   hPreliminaryRule, hVenue, hMaster, hReliefBar, hMixedMotive, hNorrisLaGuardia,
   hAppeal⟩

theorem coherent2000e6_intro {c : ComplaintText}
    (hRights : IncorporationHonored e_s2000e6_a_inc_subch c)
    (hReorg : CrossTitleReferenceResolves e_s2000e6_c_inc_t5ch9 c)
    (hTransfer : IncorporationHonored e_s2000e6_d_inc_s2000e6c c)
    (hProcedures : SubordinationHonored e_s2000e6_e_sub_s2000e5 c)
    : Coherent2000e6 c :=
  ⟨hRights, hReorg, hTransfer, hProcedures⟩

theorem coherent2000e7_intro {c : ComplaintText}
    (hStateLaw : SavingsPreserved e_s2000e7_sav_statelaw c)
    (hCarveOut : ConstructionLimitObserved e_s2000e7_constr_s2000e2 c)
    : Coherent2000e7 c :=
  ⟨hStateLaw, hCarveOut⟩

theorem coherent2000e8_intro {c : ComplaintText}
    (hCharge : ReferencedSectionExists e_s2000e8_a_inc_s2000e5 c)
    (hPayment : SpecificControls e_s2000e8_b_notw_law c)
    (hRecordkeeping : IncorporationHonored e_s2000e8_d_inc_s2000e8c c)
    : Coherent2000e8 c :=
  ⟨hCharge, hPayment, hRecordkeeping⟩

theorem coherent2000e10_intro {c : ComplaintText}
    (hExcerpts : IncorporationHonored e_s2000e10_a_inc_subch c)
    (hComplaintRef : ReferencedSectionExists e_s2000e10_a_inc_s2000e5 c)
    : Coherent2000e10 c :=
  ⟨hExcerpts, hComplaintRef⟩

theorem coherent2000e11_intro {c : ComplaintText}
    (hVeterans : SavingsPreserved e_s2000e11_sav_veterans c)
    : Coherent2000e11 c :=
  ⟨hVeterans⟩

theorem coherent2000e12_intro {c : ComplaintText}
    (hApa : SubordinationHonored e_s2000e12_a_sub_apa c)
    (hReliance : ReferencedSectionExists e_s2000e12_b_exc_subch c)
    : Coherent2000e12 c :=
  ⟨hApa, hReliance⟩

theorem coherent2000e13_intro {c : ComplaintText}
    (hAssault : CrossTitleReferenceResolves e_s2000e13_inc_t18s111_1114 c)
    (hPenalty : SpecificControls e_s2000e13_notw_t18s1114 c)
    : Coherent2000e13 c :=
  ⟨hAssault, hPenalty⟩

theorem coherent2000e14_intro {c : ComplaintText}
    (hScope : IncorporationHonored e_s2000e14_inc_eeolaws c)
    : Coherent2000e14 c :=
  ⟨hScope⟩

theorem coherent2000e15_intro {c : ComplaintText}
    (hRights : IncorporationHonored e_s2000e15_inc_subch c)
    : Coherent2000e15 c :=
  ⟨hRights⟩

theorem coherent2000e16_intro {c : ComplaintText}
    (hMilitary : CrossTitleReferenceResolves e_s2000e16_a_inc_t5s102 c)
    (hExecAgency : CrossTitleReferenceResolves e_s2000e16_a_inc_t5s105 c)
    (hCivilAction : IncorporationHonored e_s2000e16_c_inc_s2000e5 c)
    (hExecOrder : ReferencedSectionExists e_s2000e16_c_inc_eo11478 c)
    (hProcedural : SubordinationHonored e_s2000e16_d_sub_s2000e5fk c)
    (hCompensation : IncorporationHonored e_s2000e16_f_inc_s2000e5e3 c)
    (hAgencyDuties : SavingsPreserved e_s2000e16_e_sav_agencyduty c)
    : Coherent2000e16 c :=
  ⟨hMilitary, hExecAgency, hCivilAction, hExecOrder, hProcedural, hCompensation,
   hAgencyDuties⟩

theorem coherent2000e16b_intro {c : ComplaintText}
    (hAppointee : CrossTitleReferenceResolves e_s2000e16b_a_inc_t2s1219 c)
    (hStateEmployee : ReferencedSectionExists e_s2000e16b_a_inc_s2000e16c c)
    (hTitleVII : IncorporationHonored e_s2000e16b_a1_inc_s2000e16 c)
    (hAge : CrossTitleReferenceResolves e_s2000e16b_a2_inc_t29s633a c)
    (hRehab : CrossTitleReferenceResolves e_s2000e16b_a3_inc_t29s791 c)
    (hAda : ReferencedSectionExists e_s2000e16b_a3_inc_ada c)
    (hRemedy : RemedyReferenceResolves e_s2000e16b_b1_inc_remedies c)
    (hDamages : RemedyReferenceResolves e_s2000e16b_b1_inc_s1981 c)
    (hAgeRemedy : RemedyReferenceResolves e_s2000e16b_b2_inc_t29s633ac c)
    : Coherent2000e16b c :=
  ⟨hAppointee, hStateEmployee, hTitleVII, hAge, hRehab, hAda, hRemedy, hDamages,
   hAgeRemedy⟩

theorem coherent2000e16c_intro {c : ComplaintText}
    (hChain : ReferenceChainClosed chain_s2000e16c_to_s2000e5 c)
    (hSource : ReferencedSectionExists e_s2000e16c_a_inc_s2000e16b c)
    (hApa : SubordinationHonored e_s2000e16c_b1_sub_t5s554_557 c)
    (hFiction : SubordinationHonored e_s2000e16c_b2_sub_s2000e5d c)
    (hReview : CrossTitleReferenceResolves e_s2000e16c_c_inc_t28ch158 c)
    (hFees : RemedyReferenceResolves e_s2000e16c_e_inc_s2000e5k c)
    : Coherent2000e16c c :=
  ⟨hChain, hSource, hApa, hFiction, hReview, hFees⟩

theorem coherent2000e17_intro {c : ComplaintText}
    (hHearing : CrossTitleReferenceResolves e_s2000e17_inc_t5s554 c)
    (hControls : SpecificControls e_s2000e17_lexspec_eeolaw c)
    (hDeviation : ConstructionLimitObserved e_s2000e17_constr_deviation c)
    : Coherent2000e17 c :=
  ⟨hHearing, hControls, hDeviation⟩



theorem exemptionPath2000e2_religiousOrAlienAbroad_intro {c : ComplaintText}
    (h : ExceptionApplies e_s2000e2_exc_s2000e1a c) : ExemptionPath2000e2 c :=
  .religiousOrAlienAbroad h

theorem exemptionPath2000e2_foreignLawConflict_intro {c : ComplaintText}
    (h : ExceptionApplies e_s2000e2_exc_s2000e1b c) : ExemptionPath2000e2 c :=
  .foreignLawConflict h

theorem exemptionPath2000e2_bfoq_intro {c : ComplaintText}
    (h : OverrideTriggered e_s2000e2_e_notw_subch c) : ExemptionPath2000e2 c :=
  .bfoq h

theorem exemptionPath2000e2_nationalSecurity_intro {c : ComplaintText}
    (h : OverrideTriggered e_s2000e2_g_notw_subch c) : ExemptionPath2000e2 c :=
  .nationalSecurity h

theorem exemptionPath2000e2_senioritySystem_intro {c : ComplaintText}
    (h : OverrideTriggered e_s2000e2_h_notw_subch c) : ExemptionPath2000e2 c :=
  .senioritySystem h

theorem exemptionPath2000e2_communistOrganization_intro {c : ComplaintText}
    (h : ExceptionApplies e_s2000e2_exc_s2000e2f c) : ExemptionPath2000e2 c :=
  .communistOrganization h

theorem exemptionPath2000e2_indianPreference_intro {c : ComplaintText}
    (h : ExceptionApplies e_s2000e2_exc_s2000e2i c) : ExemptionPath2000e2 c :=
  .indianPreference h

theorem exemptionPath2000e2_controlledSubstanceRule_intro {c : ComplaintText}
    (h : OverrideTriggered e_s2000e2_k3_notw_subch c) : ExemptionPath2000e2 c :=
  .controlledSubstanceRule h

theorem exemptionPath2000e2_goodFaithReliance_intro {c : ComplaintText}
    (h : ExceptionApplies e_s2000e12_b_exc_subch c) : ExemptionPath2000e2 c :=
  .goodFaithReliance h

theorem enforcementRoute2000e5_aggrievedPersonCharge_intro {c : ComplaintText}
    (h : IncorporationHonored e_s2000e5_a_inc_s2000e2 c) : EnforcementRoute2000e5 c :=
  .aggrievedPersonCharge h

theorem enforcementRoute2000e5_commissionerCharge_intro {c : ComplaintText}
    (h : SubordinationHonored e_s2000e5_b_sub_cd c) : EnforcementRoute2000e5 c :=
  .commissionerCharge h

theorem enforcementRoute2000e5_patternOrPractice_intro {c : ComplaintText}
    (h : SubordinationHonored e_s2000e6_e_sub_s2000e5 c) : EnforcementRoute2000e5 c :=
  .patternOrPractice h

theorem enforcementRoute2000e5_federalEmployeeAppeal_intro {c : ComplaintText}
    (h : IncorporationHonored e_s2000e16_c_inc_s2000e5 c) : EnforcementRoute2000e5 c :=
  .federalEmployeeAppeal h

theorem enforcementRoute2000e5_governmentEmployeeRightsAct_intro {c : ComplaintText}
    (h : SubordinationHonored e_s2000e16c_b2_sub_s2000e5d c) : EnforcementRoute2000e5 c :=
  .governmentEmployeeRightsAct h



theorem titleVIIReferenceGraphCoherent_intro {c : ComplaintText}
    (h2000e : S2000eIncorporationsResolve c)
    (h2000e1 : Coherent2000e1 c)
    (h2000e2 : Coherent2000e2 c)
    (h2000e3 : Coherent2000e3 c)
    (h2000e4 : Coherent2000e4 c)
    (h2000e5 : Coherent2000e5 c)
    (h2000e6 : Coherent2000e6 c)
    (h2000e7 : Coherent2000e7 c)
    (h2000e8 : Coherent2000e8 c)
    (h2000e9 : S2000e9IncorporationsResolve c)
    (h2000e10 : Coherent2000e10 c)
    (h2000e11 : Coherent2000e11 c)
    (h2000e12 : Coherent2000e12 c)
    (h2000e13 : Coherent2000e13 c)
    (h2000e14 : Coherent2000e14 c)
    (h2000e15 : Coherent2000e15 c)
    (h2000e16 : Coherent2000e16 c)
    (h2000e16a : S2000e16aIncorporationsResolve c)
    (h2000e16b : Coherent2000e16b c)
    (h2000e16c : Coherent2000e16c c)
    (h2000e17 : Coherent2000e17 c)
    : TitleVIIReferenceGraphCoherent c :=
  ⟨h2000e, h2000e1, h2000e2, h2000e3, h2000e4, h2000e5, h2000e6, h2000e7, h2000e8,
   h2000e9, h2000e10, h2000e11, h2000e12, h2000e13, h2000e14, h2000e15, h2000e16,
   h2000e16a, h2000e16b, h2000e16c, h2000e17⟩

end Proving.USC.T42.Ch21TitleVII.Structure
