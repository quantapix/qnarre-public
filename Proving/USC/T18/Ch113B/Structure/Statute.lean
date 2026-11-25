















import Proving.USC.T18.Ch113B.Structure.Types
import Proving.USC.T18.Ch113B.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Structure

open Proving.USC.Common






structure S2331IncorporationsResolve (c : ComplaintText) : Prop where

  intlCriminalPredicate : IncorporationHonored edge_2331_1A_incorporates_criminalLaws c

  domesticCriminalPredicate : IncorporationHonored edge_2331_5A_incorporates_criminalLaws c

  nationalityTarget : ReferencedSectionExists edge_2331_2_incorporates_ina101a22 c
  nationalityHonored : IncorporationHonored edge_2331_2_incorporates_ina101a22 c

  ftoDesignation : IncorporationHonored edge_2331_6Ai_incorporates_ina219 c

  sdgtRegulationExists : ReferencedSectionExists edge_2331_6Aii_incorporates_cfr594310 c

  reachesChapter : ChapterDefinitionGoverns edge_ch113B_incorporates_2331 c





structure Coherent2332 (c : ComplaintText) : Prop where
  victimClass : IncorporationHonored edge_2332_a_incorporates_2331_2 c
  murderGrade : IncorporationHonored edge_2332_a1_incorporates_1111a c
  voluntaryManslaughterGrade : IncorporationHonored edge_2332_a2_incorporates_1112a c
  involuntaryManslaughterGrade : IncorporationHonored edge_2332_a3_incorporates_1112a c
  conspiracyMurderGrade : IncorporationHonored edge_2332_b2_incorporates_1111a c




  attemptMurderReferent : ReferencedSectionExists edge_2332_b1_incorporates_chapterMurder c



structure Coherent2332a (c : ComplaintText) : Prop where
  nationalityTarget : ReferencedSectionExists edge_2332a_c1_incorporates_ina101a22 c
  nationalityHonored : IncorporationHonored edge_2332a_c1_incorporates_ina101a22 c

  nationalityLexSpecialis : SectionLocalDefinitionControls edge_2332a_c1_lexSpecialis_2331_2 c
  destructiveDevice : IncorporationHonored edge_2332a_c2A_incorporates_921 c
  bioAgentTerms : IncorporationHonored edge_2332a_c2C_incorporates_178 c

  bioAgentTermsReach : BorrowedDefinitionScopeCompatible edge_2332a_c2C_incorporates_178 c





inductive FederalCrimeOfTerrorismPredicate (c : ComplaintText) : Prop where
  | viaTitle18
      (h : EnumeratedPredicateOffense edge_2332b_g5Bi_incorporates_title18Catalog c)
  | viaAtomicEnergyAct
      (h : EnumeratedPredicateOffense edge_2332b_g5Bii_incorporates_aea c)
  | viaTitle49
      (h : EnumeratedPredicateOffense edge_2332b_g5Biii_incorporates_title49Catalog c)
  | viaNarcoterrorism
      (h : EnumeratedPredicateOffense edge_2332b_g5Biv_incorporates_csiea1010a c)

structure Coherent2332b (c : ComplaintText) : Prop where

  assimilatedPredicate : IncorporationHonored edge_2332b_a1_incorporates_stateFedLaws c

  adoptionScope : AdoptionScopeRespected edge_2332b_d2_incorporates_stateLawElements c

  sentencingOverride : OverrideTriggered edge_2332b_c2_notwithstanding_otherLaw c
  accessoryReach : IncorporationHonored edge_2332b_e2_incorporates_s3 c
  investigativeCatalogResolves : ReferencedSectionExists edge_2332b_f_incorporates_investigativeCatalog c

  secretServiceSavings : SavingsClausePreserves edge_2332b_f_savings_3056 c
  commerceFacilityDef : IncorporationHonored edge_2332b_g2_incorporates_1958b2 c
  commerceFacilityDefReach : BorrowedDefinitionScopeCompatible edge_2332b_g2_incorporates_1958b2 c



  seriousBodilyInjurySubdivision : ReferencedSubsectionExists edge_2332b_g3_incorporates_1365g3 c
  seriousBodilyInjuryCurrent : ReferenceTargetIsCurrent edge_2332b_g3_incorporates_1365g3 c

  predicateCatalogResolves : ReferencedSectionExists edge_2332b_g5Bi_incorporates_title18Catalog c



structure Coherent2332d (c : ComplaintText) : Prop where


  treasuryRegulationExists : ReferencedSectionExists edge_2332d_a_exceptAsProvided_treasuryRegs c


  designationTargetExists : ReferencedSectionExists edge_2332d_a_incorporates_eaa6j c
  designationTargetCurrent : ReferenceTargetIsCurrent edge_2332d_a_incorporates_eaa6j c
  financialTransactionDef : IncorporationHonored edge_2332d_b1_incorporates_1956c4 c

  financialTransactionDefReach : BorrowedDefinitionScopeCompatible edge_2332d_b1_incorporates_1956c4 c






structure S2332eIncorporationsResolve (c : ComplaintText) : Prop where
  assistanceAuthorityExists : ReferencedSectionExists edge_2332e_incorporates_t10s382 c



  assistanceAuthorityCurrent : ReferenceTargetIsCurrent edge_2332e_incorporates_t10s382 c
  delegationSubdivisionExists : ReferencedSubsectionExists edge_2332e_incorporates_t10s382f2 c
  delegationCurrent : ReferenceTargetIsCurrent edge_2332e_incorporates_t10s382f2 c
  enforcementTarget : IncorporationHonored edge_2332e_incorporates_2332a c




inductive Section2332fExclusionPath (c : ComplaintText) : Prop where
  | armedForcesInArmedConflict (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d1 c)
  | militaryForcesOfficialDuties (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d2 c)
  | whollyDomesticNoCommerceNexus (h : ExceptionApplies edge_2332f_a_exceptAsProvided_d3 c)

structure Coherent2332f (c : ComplaintText) : Prop where

  penaltyImport : PenaltyIncorporationResolves edge_2332f_c_incorporates_2332a_a c

  lawOfWarSavings : SavingsClausePreserves edge_2332f_d1_savings_lawOfWar c

  seriousBodilyInjurySubdivision : ReferencedSubsectionExists edge_2332f_e1_incorporates_1365g3 c
  seriousBodilyInjuryCurrent : ReferenceTargetIsCurrent edge_2332f_e1_incorporates_1365g3 c
  nationalityHonored : IncorporationHonored edge_2332f_e2_incorporates_ina101a22 c
  nationalityLexSpecialis : SectionLocalDefinitionControls edge_2332f_e2_lexSpecialis_2331_2 c
  intlOrganizationDef : IncorporationHonored edge_2332f_e4_incorporates_1116b5 c
  explosiveDef : IncorporationHonored edge_2332f_e8_incorporates_844j c



  explosiveDefReach : BorrowedDefinitionScopeCompatible edge_2332f_e8_incorporates_844j c
  lethalDeviceTerms : IncorporationHonored edge_2332f_e9_incorporates_178 c



structure Coherent2332g (c : ComplaintText) : Prop where
  sovereignCarveOut : ReferencedSectionExists edge_2332g_a1_exceptAsProvided_a3 c
  nonWeaponCarveOut : ReferencedSectionExists edge_2332g_a1A_exceptAsProvided_a2 c

  nationalityFromChapter : IncorporationHonored edge_2332g_b_incorporates_2331_2 c
  nationalityChapterGoverns : ChapterDefinitionGoverns edge_2332g_b_incorporates_2331_2 c
  aircraftDef : IncorporationHonored edge_2332g_d_incorporates_t49_40102a6 c



structure Coherent2332h (c : ComplaintText) : Prop where
  sovereignCarveOut : ReferencedSectionExists edge_2332h_a1_exceptAsProvided_a2 c


  nationalityFromChapter : IncorporationHonored edge_2332h_b_incorporates_2331_2 c
  nationalityChapterGoverns : ChapterDefinitionGoverns edge_2332h_b_incorporates_2331_2 c




inductive Section2332iExclusionPath (c : ComplaintText) : Prop where
  | armedForcesInArmedConflict (h : ExceptionApplies edge_2332i_a_exceptAsProvided_d1 c)
  | militaryForcesOfficialDuties (h : ExceptionApplies edge_2332i_a_exceptAsProvided_d2 c)

structure Coherent2332i (c : ComplaintText) : Prop where
  vesselJurisdiction : IncorporationHonored edge_2332i_b2B_incorporates_t46_70502 c
  lawOfWarSavings : SavingsClausePreserves edge_2332i_d1_savings_lawOfWar c


  armedConflictDef : IncorporationHonored edge_2332i_e1_incorporates_2332f_e11 c
  stateFacilityDef : IncorporationHonored edge_2332i_e11_incorporates_2332f_e3 c


  intlOrganizationSubdivision : ReferencedSubsectionExists edge_2332i_e3_incorporates_831f3 c
  intlOrganizationCurrent : ReferenceTargetIsCurrent edge_2332i_e3_incorporates_831f3 c
  nuclearMaterialSubdivision : ReferencedSubsectionExists edge_2332i_e7_incorporates_831f1 c
  nuclearMaterialCurrent : ReferenceTargetIsCurrent edge_2332i_e7_incorporates_831f1 c
  seriousBodilyInjurySubdivision : ReferencedSubsectionExists edge_2332i_e9_incorporates_831f4 c
  seriousBodilyInjuryCurrent : ReferenceTargetIsCurrent edge_2332i_e9_incorporates_831f4 c
  nationalityHonored : IncorporationHonored edge_2332i_e5_incorporates_ina101a22 c
  nationalityLexSpecialis : SectionLocalDefinitionControls edge_2332i_e5_lexSpecialis_2331_2 c
  vesselDef : IncorporationHonored edge_2332i_e13_incorporates_t33_1502_19 c
  vesselOfUSDef : IncorporationHonored edge_2332i_e14_incorporates_t46_70502 c



structure Coherent2333 (c : ComplaintText) : Prop where

  intlTerrorismDef : IncorporationHonored edge_2333_a_incorporates_2331_1 c
  standingClass : IncorporationHonored edge_2333_a_incorporates_2331_2 c
  standingClassFromChapter : ChapterDefinitionGoverns edge_2333_a_incorporates_2331_2 c
  estoppelTitle18Catalog : ReferencedSectionExists edge_2333_b_incorporates_title18Catalog c
  estoppelTitle49Catalog : ReferencedSectionExists edge_2333_b_incorporates_title49Catalog c


  secondaryLiabilityPersonDef : IncorporationHonored edge_2333_d1_incorporates_1usc1 c
  secondaryLiabilityPersonLexSpecialis : SectionLocalDefinitionControls edge_2333_d1_lexSpecialis_2331_3 c
  ftoDesignation : IncorporationHonored edge_2333_d2_incorporates_ina219 c
  triaBlockedAsset : IncorporationHonored edge_2333_e_incorporates_tria201 c
  kingpinBlocking : IncorporationHonored edge_2333_e_incorporates_kingpin805b c








inductive NationalOfUSDefinitionPath (c : ComplaintText) : Prop where
  | viaChapterDefinition (h : ChapterDefinitionGoverns edge_ch113B_incorporates_2331_2 c)
  | viaSection2332a (h : SectionLocalDefinitionControls edge_2332a_c1_lexSpecialis_2331_2 c)
  | viaSection2332f (h : SectionLocalDefinitionControls edge_2332f_e2_lexSpecialis_2331_2 c)
  | viaSection2332i (h : SectionLocalDefinitionControls edge_2332i_e5_lexSpecialis_2331_2 c)

end Proving.USC.T18.Ch113B.Structure
