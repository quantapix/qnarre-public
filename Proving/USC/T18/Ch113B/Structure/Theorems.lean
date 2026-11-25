





import Proving.USC.T18.Ch113B.Structure.Types
import Proving.USC.T18.Ch113B.Structure.Predicates
import Proving.USC.T18.Ch113B.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Structure

open Proving.USC.Common


theorem s2331IncorporationsResolve_intro {c : ComplaintText}
    (hIntlPred : IncorporationHonored edge_2331_1A_incorporates_criminalLaws c)
    (hDomPred : IncorporationHonored edge_2331_5A_incorporates_criminalLaws c)
    (hNatExists : ReferencedSectionExists edge_2331_2_incorporates_ina101a22 c)
    (hNatHonored : IncorporationHonored edge_2331_2_incorporates_ina101a22 c)
    (hFto : IncorporationHonored edge_2331_6Ai_incorporates_ina219 c)
    (hSdgt : ReferencedSectionExists edge_2331_6Aii_incorporates_cfr594310 c)
    (hReach : ChapterDefinitionGoverns edge_ch113B_incorporates_2331 c)
    : S2331IncorporationsResolve c :=
  ⟨hIntlPred, hDomPred, hNatExists, hNatHonored, hFto, hSdgt, hReach⟩


theorem coherent2332_intro {c : ComplaintText}
    (hVictim : IncorporationHonored edge_2332_a_incorporates_2331_2 c)
    (hMurder : IncorporationHonored edge_2332_a1_incorporates_1111a c)
    (hVolMans : IncorporationHonored edge_2332_a2_incorporates_1112a c)
    (hInvMans : IncorporationHonored edge_2332_a3_incorporates_1112a c)
    (hConspMurder : IncorporationHonored edge_2332_b2_incorporates_1111a c)
    (hAttemptRef : ReferencedSectionExists edge_2332_b1_incorporates_chapterMurder c)
    : Coherent2332 c :=
  ⟨hVictim, hMurder, hVolMans, hInvMans, hConspMurder, hAttemptRef⟩


theorem coherent2332a_intro {c : ComplaintText}
    (hNatExists : ReferencedSectionExists edge_2332a_c1_incorporates_ina101a22 c)
    (hNatHonored : IncorporationHonored edge_2332a_c1_incorporates_ina101a22 c)
    (hNatLex : SectionLocalDefinitionControls edge_2332a_c1_lexSpecialis_2331_2 c)
    (hDevice : IncorporationHonored edge_2332a_c2A_incorporates_921 c)
    (hBio : IncorporationHonored edge_2332a_c2C_incorporates_178 c)
    (hBioReach : BorrowedDefinitionScopeCompatible edge_2332a_c2C_incorporates_178 c)
    : Coherent2332a c :=
  ⟨hNatExists, hNatHonored, hNatLex, hDevice, hBio, hBioReach⟩


theorem coherent2332b_intro {c : ComplaintText}
    (hAssim : IncorporationHonored edge_2332b_a1_incorporates_stateFedLaws c)
    (hAdoptScope : AdoptionScopeRespected edge_2332b_d2_incorporates_stateLawElements c)
    (hOverride : OverrideTriggered edge_2332b_c2_notwithstanding_otherLaw c)
    (hAccessory : IncorporationHonored edge_2332b_e2_incorporates_s3 c)
    (hInvestigative : ReferencedSectionExists edge_2332b_f_incorporates_investigativeCatalog c)
    (hSavings : SavingsClausePreserves edge_2332b_f_savings_3056 c)
    (hFacility : IncorporationHonored edge_2332b_g2_incorporates_1958b2 c)
    (hFacilityReach : BorrowedDefinitionScopeCompatible edge_2332b_g2_incorporates_1958b2 c)
    (hSbiSub : ReferencedSubsectionExists edge_2332b_g3_incorporates_1365g3 c)
    (hSbiCurrent : ReferenceTargetIsCurrent edge_2332b_g3_incorporates_1365g3 c)
    (hCatalog : ReferencedSectionExists edge_2332b_g5Bi_incorporates_title18Catalog c)
    : Coherent2332b c :=
  ⟨hAssim, hAdoptScope, hOverride, hAccessory, hInvestigative, hSavings,
   hFacility, hFacilityReach, hSbiSub, hSbiCurrent, hCatalog⟩


theorem federalCrimeOfTerrorismPredicate_intro_title18 {c : ComplaintText}
    (h : EnumeratedPredicateOffense edge_2332b_g5Bi_incorporates_title18Catalog c)
    : FederalCrimeOfTerrorismPredicate c :=
  .viaTitle18 h


theorem federalCrimeOfTerrorismPredicate_intro_atomicEnergyAct {c : ComplaintText}
    (h : EnumeratedPredicateOffense edge_2332b_g5Bii_incorporates_aea c)
    : FederalCrimeOfTerrorismPredicate c :=
  .viaAtomicEnergyAct h


theorem federalCrimeOfTerrorismPredicate_intro_title49 {c : ComplaintText}
    (h : EnumeratedPredicateOffense edge_2332b_g5Biii_incorporates_title49Catalog c)
    : FederalCrimeOfTerrorismPredicate c :=
  .viaTitle49 h


theorem federalCrimeOfTerrorismPredicate_intro_narcoterrorism {c : ComplaintText}
    (h : EnumeratedPredicateOffense edge_2332b_g5Biv_incorporates_csiea1010a c)
    : FederalCrimeOfTerrorismPredicate c :=
  .viaNarcoterrorism h


theorem coherent2332d_intro {c : ComplaintText}
    (hRegs : ReferencedSectionExists edge_2332d_a_exceptAsProvided_treasuryRegs c)
    (hEaaExists : ReferencedSectionExists edge_2332d_a_incorporates_eaa6j c)
    (hEaaCurrent : ReferenceTargetIsCurrent edge_2332d_a_incorporates_eaa6j c)
    (hFinTxn : IncorporationHonored edge_2332d_b1_incorporates_1956c4 c)
    (hFinTxnReach : BorrowedDefinitionScopeCompatible edge_2332d_b1_incorporates_1956c4 c)
    : Coherent2332d c :=
  ⟨hRegs, hEaaExists, hEaaCurrent, hFinTxn, hFinTxnReach⟩


theorem s2332eIncorporationsResolve_intro {c : ComplaintText}
    (hAuthExists : ReferencedSectionExists edge_2332e_incorporates_t10s382 c)
    (hAuthCurrent : ReferenceTargetIsCurrent edge_2332e_incorporates_t10s382 c)
    (hDelegSub : ReferencedSubsectionExists edge_2332e_incorporates_t10s382f2 c)
    (hDelegCurrent : ReferenceTargetIsCurrent edge_2332e_incorporates_t10s382f2 c)
    (hEnforcement : IncorporationHonored edge_2332e_incorporates_2332a c)
    : S2332eIncorporationsResolve c :=
  ⟨hAuthExists, hAuthCurrent, hDelegSub, hDelegCurrent, hEnforcement⟩


theorem coherent2332f_intro {c : ComplaintText}
    (hPenalty : PenaltyIncorporationResolves edge_2332f_c_incorporates_2332a_a c)
    (hLawOfWar : SavingsClausePreserves edge_2332f_d1_savings_lawOfWar c)
    (hSbiSub : ReferencedSubsectionExists edge_2332f_e1_incorporates_1365g3 c)
    (hSbiCurrent : ReferenceTargetIsCurrent edge_2332f_e1_incorporates_1365g3 c)
    (hNat : IncorporationHonored edge_2332f_e2_incorporates_ina101a22 c)
    (hNatLex : SectionLocalDefinitionControls edge_2332f_e2_lexSpecialis_2331_2 c)
    (hIntlOrg : IncorporationHonored edge_2332f_e4_incorporates_1116b5 c)
    (hExplosive : IncorporationHonored edge_2332f_e8_incorporates_844j c)
    (hExplosiveReach : BorrowedDefinitionScopeCompatible edge_2332f_e8_incorporates_844j c)
    (hLethalDevice : IncorporationHonored edge_2332f_e9_incorporates_178 c)
    : Coherent2332f c :=
  ⟨hPenalty, hLawOfWar, hSbiSub, hSbiCurrent, hNat, hNatLex, hIntlOrg,
   hExplosive, hExplosiveReach, hLethalDevice⟩


theorem section2332fExclusionPath_intro_armedForces {c : ComplaintText}
    (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d1 c)
    : Section2332fExclusionPath c :=
  .armedForcesInArmedConflict h


theorem section2332fExclusionPath_intro_officialDuties {c : ComplaintText}
    (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d2 c)
    : Section2332fExclusionPath c :=
  .militaryForcesOfficialDuties h


theorem section2332fExclusionPath_intro_whollyDomestic {c : ComplaintText}
    (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d3 c)
    : Section2332fExclusionPath c :=
  .whollyDomesticNoCommerceNexus h


theorem coherent2332g_intro {c : ComplaintText}
    (hSovereign : ReferencedSectionExists edge_2332g_a1_exceptAsProvided_a3 c)
    (hNonWeapon : ReferencedSectionExists edge_2332g_a1A_exceptAsProvided_a2 c)
    (hNat : IncorporationHonored edge_2332g_b_incorporates_2331_2 c)
    (hNatChapter : ChapterDefinitionGoverns edge_2332g_b_incorporates_2331_2 c)
    (hAircraft : IncorporationHonored edge_2332g_d_incorporates_t49_40102a6 c)
    : Coherent2332g c :=
  ⟨hSovereign, hNonWeapon, hNat, hNatChapter, hAircraft⟩


theorem coherent2332h_intro {c : ComplaintText}
    (hSovereign : ReferencedSectionExists edge_2332h_a1_exceptAsProvided_a2 c)
    (hNat : IncorporationHonored edge_2332h_b_incorporates_2331_2 c)
    (hNatChapter : ChapterDefinitionGoverns edge_2332h_b_incorporates_2331_2 c)
    : Coherent2332h c :=
  ⟨hSovereign, hNat, hNatChapter⟩


theorem coherent2332i_intro {c : ComplaintText}
    (hVesselJur : IncorporationHonored edge_2332i_b2B_incorporates_t46_70502 c)
    (hLawOfWar : SavingsClausePreserves edge_2332i_d1_savings_lawOfWar c)
    (hArmedConflict : IncorporationHonored edge_2332i_e1_incorporates_2332f_e11 c)
    (hStateFacility : IncorporationHonored edge_2332i_e11_incorporates_2332f_e3 c)
    (hIntlOrgSub : ReferencedSubsectionExists edge_2332i_e3_incorporates_831f3 c)
    (hIntlOrgCurrent : ReferenceTargetIsCurrent edge_2332i_e3_incorporates_831f3 c)
    (hNuclearSub : ReferencedSubsectionExists edge_2332i_e7_incorporates_831f1 c)
    (hNuclearCurrent : ReferenceTargetIsCurrent edge_2332i_e7_incorporates_831f1 c)
    (hSbiSub : ReferencedSubsectionExists edge_2332i_e9_incorporates_831f4 c)
    (hSbiCurrent : ReferenceTargetIsCurrent edge_2332i_e9_incorporates_831f4 c)
    (hNat : IncorporationHonored edge_2332i_e5_incorporates_ina101a22 c)
    (hNatLex : SectionLocalDefinitionControls edge_2332i_e5_lexSpecialis_2331_2 c)
    (hVessel : IncorporationHonored edge_2332i_e13_incorporates_t33_1502_19 c)
    (hVesselUS : IncorporationHonored edge_2332i_e14_incorporates_t46_70502 c)
    : Coherent2332i c :=
  ⟨hVesselJur, hLawOfWar, hArmedConflict, hStateFacility, hIntlOrgSub, hIntlOrgCurrent,
   hNuclearSub, hNuclearCurrent, hSbiSub, hSbiCurrent, hNat, hNatLex, hVessel, hVesselUS⟩


theorem section2332iExclusionPath_intro_armedForces {c : ComplaintText}
    (h : ExceptionApplies edge_2332i_a_exceptAsProvided_d1 c)
    : Section2332iExclusionPath c :=
  .armedForcesInArmedConflict h


theorem section2332iExclusionPath_intro_officialDuties {c : ComplaintText}
    (h : ExceptionApplies edge_2332i_a_exceptAsProvided_d2 c)
    : Section2332iExclusionPath c :=
  .militaryForcesOfficialDuties h


theorem coherent2333_intro {c : ComplaintText}
    (hIntlTerrorism : IncorporationHonored edge_2333_a_incorporates_2331_1 c)
    (hStanding : IncorporationHonored edge_2333_a_incorporates_2331_2 c)
    (hStandingChapter : ChapterDefinitionGoverns edge_2333_a_incorporates_2331_2 c)
    (hEstoppel18 : ReferencedSectionExists edge_2333_b_incorporates_title18Catalog c)
    (hEstoppel49 : ReferencedSectionExists edge_2333_b_incorporates_title49Catalog c)
    (hPersonDef : IncorporationHonored edge_2333_d1_incorporates_1usc1 c)
    (hPersonLex : SectionLocalDefinitionControls edge_2333_d1_lexSpecialis_2331_3 c)
    (hFto : IncorporationHonored edge_2333_d2_incorporates_ina219 c)
    (hTria : IncorporationHonored edge_2333_e_incorporates_tria201 c)
    (hKingpin : IncorporationHonored edge_2333_e_incorporates_kingpin805b c)
    : Coherent2333 c :=
  ⟨hIntlTerrorism, hStanding, hStandingChapter, hEstoppel18, hEstoppel49,
   hPersonDef, hPersonLex, hFto, hTria, hKingpin⟩


theorem nationalOfUSDefinitionPath_intro_chapter {c : ComplaintText}
    (h : ChapterDefinitionGoverns edge_ch113B_incorporates_2331_2 c)
    : NationalOfUSDefinitionPath c :=
  .viaChapterDefinition h


theorem nationalOfUSDefinitionPath_intro_s2332a {c : ComplaintText}
    (h : SectionLocalDefinitionControls edge_2332a_c1_lexSpecialis_2331_2 c)
    : NationalOfUSDefinitionPath c :=
  .viaSection2332a h


theorem nationalOfUSDefinitionPath_intro_s2332f {c : ComplaintText}
    (h : SectionLocalDefinitionControls edge_2332f_e2_lexSpecialis_2331_2 c)
    : NationalOfUSDefinitionPath c :=
  .viaSection2332f h


theorem nationalOfUSDefinitionPath_intro_s2332i {c : ComplaintText}
    (h : SectionLocalDefinitionControls edge_2332i_e5_lexSpecialis_2331_2 c)
    : NationalOfUSDefinitionPath c :=
  .viaSection2332i h

end Proving.USC.T18.Ch113B.Structure
