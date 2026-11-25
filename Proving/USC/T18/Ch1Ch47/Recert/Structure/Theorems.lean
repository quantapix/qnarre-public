



import Proving.USC.T18.Ch1Ch47.Recert.Structure.Types
import Proving.USC.T18.Ch1Ch47.Recert.Structure.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Structure

open Proving.USC.Common

theorem section7IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeSatisfied edge_7_definesForTitle18 c)
    (hIna : CrossTitleReferenceResolves edge_7_9_incorporates_ina101 c)
    (hTreaty : CrossTitleReferenceResolves edge_7_6_incorporates_outerSpaceTreaty c)
    (hReg : CrossTitleReferenceResolves edge_7_6_incorporates_registrationConvention c)
    (hSav : SavingsClausePreserves edge_7_9_savings_treaties c)
    (hMejaKnown : ReferencedSectionExists edge_7_9_exceptAsProvided_3261a c)
    (hMejaClear : ¬ ExceptionApplies edge_7_9_exceptAsProvided_3261a c)
    : Section7IncorporationsResolve c :=
  ⟨hScope, hIna, hTreaty, hReg, hSav, hMejaKnown, hMejaClear⟩

theorem section20IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeSatisfied edge_20_definesForTitle18 c)
    (h1 : CrossTitleReferenceResolves edge_20_1_incorporates_fdia3c2 c)
    (h3 : CrossTitleReferenceResolves edge_20_3_incorporates_fhlba2 c)
    (h4 : CrossTitleReferenceResolves edge_20_4_incorporates_farmCredit535 c)
    (h5 : CrossTitleReferenceResolves edge_20_5_incorporates_sbia103 c)
    (h6 : CrossTitleReferenceResolves edge_20_6_incorporates_fdia3w1 c)
    (h8 : CrossTitleReferenceResolves edge_20_8_incorporates_fra25 c)
    (h9 : CrossTitleReferenceResolves edge_20_9_incorporates_iba1b c)
    (h10a : IncorporationHonored edge_20_10_incorporates_s27 c)
    (h10b : CrossTitleReferenceResolves edge_20_10_incorporates_respa3 c)
    : Section20IncorporationsResolve c :=
  ⟨hScope, h1, h3, h4, h5, h6, h8, h9, h10a, h10b⟩

theorem coherent21_intro {c : ComplaintText}
    (hSupply : DefinitionScopeSatisfied edge_21_a_suppliesTitle18StolenElement c)
    (hOfficerDef : ReferencedSectionExists edge_21_b_incorporates_s115 c)
    (hOfficerUse : IncorporationHonored edge_21_b_incorporates_s115 c)
    : Coherent21 c :=
  ⟨hSupply, hOfficerDef, hOfficerUse⟩

theorem section23DefinitionControls_intro_general {c : ComplaintText}
    (hNoOverride : ¬ OverrideTriggered edge_23_exceptAsProvided_openTitle18 c)
    : Section23DefinitionControls c :=
  .general hNoOverride

theorem section23DefinitionControls_intro_expressOverride {c : ComplaintText}
    (hOverride : OverrideTriggered edge_23_exceptAsProvided_openTitle18 c)
    (hDisplacer : ReferencedSectionExists edge_23_exceptAsProvided_openTitle18 c)
    : Section23DefinitionControls c :=
  .expressOverride hOverride hDisplacer

theorem section23IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeSatisfied edge_23_definesForTitle18 c)
    (hControls : Section23DefinitionControls c)
    : Section23IncorporationsResolve c :=
  ⟨hScope, hControls⟩

theorem section24IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeSatisfied edge_24_definesForTitle18 c)
    (hA1 : AllReferencedSectionsExist refs_24_a1_inTitle c)
    (hAks : CrossTitleReferenceResolves edge_24_a1_incorporates_ssa1128B c)
    (hA2 : AllReferencedSectionsExist refs_24_a2_inTitle c)
    (hFdca : CrossTitleReferenceResolves edge_24_a2_incorporates_fdca301 c)
    (hErisa501 : CrossTitleReferenceResolves edge_24_a2_incorporates_erisa501 c)
    (hErisaOther : CrossTitleReferenceResolves edge_24_a2_incorporates_erisa411_518_511 c)
    (hNexus : DefinitionScopeSatisfied edge_24_a2_subjectTo_healthCareNexus c)
    (hProgram : DefinitionScopeSatisfied edge_24_b_definesForTitle18 c)
    : Section24IncorporationsResolve c :=
  ⟨hScope, hA1, hAks, hA2, hFdca, hErisa501, hErisaOther, hNexus, hProgram⟩

theorem coherent1028_intro {c : ComplaintText}
    (hCirc : ReferencedSectionExists edge_1028_a_subjectTo_c c)
    (hPen : ReferencedSectionExists edge_1028_a_subjectTo_b c)
    (hExc1 : ExceptionHonored edge_1028_b1_exceptAsProvided_b3b4 c)
    (hExc2 : ExceptionHonored edge_1028_b2_exceptAsProvided_b3b4 c)
    (hDrug : ReferencedSectionExists edge_1028_b3A_incorporates_s929a2 c)
    (hCov : ReferencedSectionExists edge_1028_b3B_incorporates_s924c3 c)
    (hTerror : AllReferencedSectionsExist refs_1028_b4_terrorism c)
    (hAccess : IncorporationHonored edge_1028_d7D_incorporates_1029e c)
    (h1028A : DefinitionScopeSatisfied edge_1028A_incorporates_1028d c)
    (hStolen2 : IncorporationHonored edge_1028_a2_incorporates_s21a c)
    (hStolen6 : IncorporationHonored edge_1028_a6_incorporates_s21a c)
    (hAttempt : ReferencedSectionExists edge_1028_f_subjectTo_a c)
    (hForfeit : CrossTitleReferenceResolves edge_1028_g_incorporates_cdapca413 c)
    (hForfeitCarve : ExceptionHonored edge_1028_g_exceptAsProvided_853d c)
    (hCount : DefinitionScopeSatisfied edge_1028_i_incorporates_a7 c)
    (hSavings : SavingsClausePreserves edge_1028_e_savings_lawEnforcement c)
    (hNoCarveOut : ¬ ExceptionApplies edge_1028_e_exceptAsProvided_ch224 c)
    : Coherent1028 c :=
  ⟨hCirc, hPen, hExc1, hExc2, hDrug, hCov, hTerror, hAccess, h1028A,
   hStolen2, hStolen6, hAttempt, hForfeit, hForfeitCarve, hCount, hSavings, hNoCarveOut⟩

theorem section1029a9DefenseRoute_intro_carrierProtection {c : ComplaintText}
    (h : ExceptionApplies edge_1029_g1_exceptAsProvided_a9 c)
    : Section1029a9DefenseRoute c :=
  .carrierProtection h

theorem section1029a9DefenseRoute_intro_researchDevelopment {c : ComplaintText}
    (h : ExceptionApplies edge_1029_g2_exceptAsProvided_a9 c)
    : Section1029a9DefenseRoute c :=
  .researchDevelopment h

theorem coherent1029_intro {c : ComplaintText}
    (hPen : ReferencedSectionExists edge_1029_a_subjectTo_c c)
    (hAttempt : ReferencedSectionExists edge_1029_b1_subjectTo_a c)
    (hConspiracy : ReferencedSectionExists edge_1029_b2_subjectTo_c c)
    (hForfeit : CrossTitleReferenceResolves edge_1029_c2_incorporates_csa413 c)
    (hForfeitCarve : ExceptionHonored edge_1029_c2_exceptAsProvided_853d c)
    (hSecretService : SavingsClausePreserves edge_1029_d_savings_otherAgencies c)
    (hCcMember : IncorporationHonored edge_1029_e7_incorporates_s20 c)
    (hExtraterritorial : IncorporationHonored edge_1029_h_incorporates_s20 c)
    (hWiretap : ReferencedSectionExists edge_1029_e8_incorporates_ch119 c)
    (hComms : AllReferencedSectionsExist refs_1029_e_communicationsAct c)
    (hSavings : SavingsClausePreserves edge_1029_f_savings_lawEnforcement c)
    (hNoCarveOut : ¬ ExceptionApplies edge_1029_f_exceptAsProvided_ch224 c)
    : Coherent1029 c :=
  ⟨hPen, hAttempt, hConspiracy, hForfeit, hForfeitCarve, hSecretService,
   hCcMember, hExtraterritorial, hWiretap, hComms, hSavings, hNoCarveOut⟩

theorem sliceEditorialDefects_intro
    (hFra : SourceTextEditoriallyDefective edge_20_8_incorporates_fra25)
    (hS23 : SourceTextEditoriallyDefective edge_23_exceptAsProvided_openTitle18)
    (hS24 : SourceTextEditoriallyDefective edge_24_a2_incorporates_erisa411_518_511)
    : SliceEditorialDefects :=
  ⟨hFra, hS23, hS24⟩

theorem sliceDefinitionalCoherence_intro {c : ComplaintText}
    (hTitleWide : AllReferencedSectionsExist refs_ch1_titleWideDefinitions c)
    (hProduce : DefinitionScopeSatisfied edge_lexspec_1029e4_produce_over_1028d9 c)
    (hTraffic : DefinitionScopeSatisfied edge_lexspec_1029e5_traffic_over_1028d12 c)
    (hState : DefinitionScopeSatisfied edge_lexspec_1029f_state_over_1028d11 c)
    : SliceDefinitionalCoherence c :=
  ⟨hTitleWide, hProduce, hTraffic, hState⟩

end Proving.USC.T18.Ch1Ch47.Recert.Structure
