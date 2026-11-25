












import Proving.USC.Common.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure

open Proving.USC.Common




structure Coherent111 (c : ComplaintText) : Prop where
  officerClassSectionExists : ReferencedSectionExists edge_111_incorporates_1114 c
  officerClassIncorporated  : IncorporationHonored edge_111_incorporates_1114 c




structure Coherent112 (c : ComplaintText) : Prop where
  definitionsSectionExists : ReferencedSectionExists edge_112_incorporates_1116b c
  definitionsIncorporated  : DefinitionSuppliedByReferencedSection edge_112_incorporates_1116b c
  firstAmendmentSaved      : SavingsClauseRespected edge_112_savings_amend1 c
  unitedStatesScope        : IncorporationHonored edge_112_incorporates_5 c
  maritimeScope            : IncorporationHonored edge_112_incorporates_7 c
  aircraftScope            : CrossTitleReferenceResolves edge_112_incorporates_t49s46501 c
  assistanceOverride       : OverrideTriggered edge_112_notwithstanding_contraryLaw c



structure Coherent113 (c : ComplaintText) : Prop where
  intentTarget2241          : IncorporationHonored edge_113_incorporates_2241 c
  intentTarget2242          : IncorporationHonored edge_113_incorporates_2242 c
  residualCarveOut2241      : ExceptionApplies edge_113_exceptAsProvided_2241 c
  residualCarveOut2242      : ExceptionApplies edge_113_exceptAsProvided_2242 c
  seriousBodilyInjuryDefined : DefinitionSuppliedByReferencedSection edge_113_incorporates_1365 c
  partnerTermsDefined       : DefinitionSuppliedByReferencedSection edge_113_incorporates_2266 c


structure Coherent114 (c : ComplaintText) : Prop where
  tortureSectionExists : ReferencedSectionExists edge_114_incorporates_2340 c
  tortureDefined       : DefinitionSuppliedByReferencedSection edge_114_incorporates_2340 c




structure Coherent115 (c : ComplaintText) : Prop where
  officialClassIncorporated  : IncorporationHonored edge_115_incorporates_1114 c
  punishmentRouted           : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c
  seriousBodilyInjuryDefined : DefinitionSuppliedByReferencedSection edge_115_incorporates_1365 c
  sexualAbuseEquivalence2241 : IncorporationHonored edge_115_incorporates_2241 c
  sexualAbuseEquivalence2242 : IncorporationHonored edge_115_incorporates_2242 c
  kidnappingPenaltyRouted    : IncorporationHonored edge_115_incorporates_1201 c
  kidnappingVictimClass      : IncorporationHonored edge_115_incorporates_1201a5 c
  murderPenalty1111          : IncorporationHonored edge_115_incorporates_1111 c
  murderPenalty1113          : IncorporationHonored edge_115_incorporates_1113 c
  murderPenalty1117          : IncorporationHonored edge_115_incorporates_1117 c
  executiveHeadsDefined      : CrossTitleReferenceResolves edge_115_incorporates_t5s101 c
  secretServiceSaved3056     : SavingsClauseRespected edge_115_savings_3056 c
  secretServiceSaved871      : SavingsClauseRespected edge_115_savings_871 c
  secretServiceSaved879      : SavingsClauseRespected edge_115_savings_879 c



structure Coherent116 (c : ComplaintText) : Prop where
  medicalExceptionHonored  : ExceptionApplies edge_116_exceptAsProvided_116b c
  jurisdictionalCircumstance : InternalSubsectionReferenceResolves edge_116_incorporates_116d c
  fgmDefinitionInScope     : InternalSubsectionReferenceResolves edge_116_incorporates_116e c
  customDefenseForeclosed  : SpecificProvisionControls edge_116_lexSpecialis_religiousCustom c




structure Coherent117 (c : ComplaintText) : Prop where
  ch110AExists                     : ReferencedSectionExists edge_117_incorporates_ch110A c
  predicateOffenseIncorporated     : IncorporationHonored edge_117_incorporates_ch110A c
  substantialBodilyInjuryUnfilled  : DefinitionalGapUnfilled edge_117_incorporates_113b1 c


structure Coherent118 (c : ComplaintText) : Prop where
  protectiveFunction2709 : CrossTitleReferenceResolves edge_118_incorporates_t22s2709 c
  protectiveFunction4802 : CrossTitleReferenceResolves edge_118_incorporates_t22s4802 c



structure Coherent119 (c : ComplaintText) : Prop where
  coveredPersonClass     : IncorporationHonored edge_119_incorporates_1114 c
  crimeOfViolenceDefined : DefinitionSuppliedByReferencedSection edge_119_incorporates_16 c
  immediateFamilyDefined : DefinitionSuppliedByReferencedSection edge_119_incorporates_115c2 c






structure S151IncorporationsResolve (c : ComplaintText) : Prop where
  title11ReferenceResolves : CrossTitleReferenceResolves edge_151_incorporates_t11 c
  chapterScopeHonored      : ChapterDefinitionInScope edge_ch9_incorporates_151 c



structure Coherent152 (c : ComplaintText) : Prop where
  debtorDefined        : DefinitionSuppliedByReferencedSection edge_152_incorporates_151 c
  title11CaseResolves  : CrossTitleReferenceResolves edge_152_incorporates_t11 c
  perjuryFormResolves  : CrossTitleReferenceResolves edge_152_incorporates_t28s1746 c


structure Coherent153 (c : ComplaintText) : Prop where
  debtorDefined           : DefinitionSuppliedByReferencedSection edge_153_incorporates_151 c
  estateReferenceResolves : CrossTitleReferenceResolves edge_153_incorporates_t11 c



structure Coherent154 (c : ComplaintText) : Prop where
  title11CaseResolves : CrossTitleReferenceResolves edge_154_incorporates_t11 c
  chapterScopeHonored : ChapterDefinitionInScope edge_ch9_incorporates_151 c


structure Coherent155 (c : ComplaintText) : Prop where
  title11OrReceivershipResolves : CrossTitleReferenceResolves edge_155_incorporates_t11 c



structure Coherent156 (c : ComplaintText) : Prop where
  title11DocumentResolves : CrossTitleReferenceResolves edge_156_incorporates_t11 c
  bankruptcyRulesResolve  : RegulatoryReferenceResolves edge_156_incorporates_frbp c


structure Coherent157 (c : ComplaintText) : Prop where
  involuntaryPetitionResolves : CrossTitleReferenceResolves edge_157_incorporates_t11s303 c
  title11ProceedingResolves   : CrossTitleReferenceResolves edge_157_incorporates_t11 c




structure S158IncorporationsResolve (c : ComplaintText) : Prop where
  enforcementTarget152 : ReferencedSectionExists edge_158_incorporates_152 c
  enforcementTarget157 : ReferencedSectionExists edge_158_incorporates_157 c
  usAttorneyDutyRouted : IncorporationHonored edge_158_incorporates_3057 c




structure Coherent175 (c : ComplaintText) : Prop where
  chapterDefinitionsInScope : ChapterDefinitionInScope edge_ch10_incorporates_178 c
  agentTermsDefined         : DefinitionSuppliedByReferencedSection edge_175_incorporates_178 c



structure S175aIncorporationsResolve (c : ComplaintText) : Prop where
  enforcementTargetExists      : ReferencedSectionExists edge_175a_incorporates_175 c
  militaryAssistanceReference  : IncorporationHonored edge_175a_incorporates_t10s382 c
  militaryAssistanceDelegation : IncorporationHonored edge_175a_incorporates_t10s382f2 c
  assistanceReferenceFlagged   : ReferenceTargetIsDangling edge_175a_incorporates_t10s382 c




structure Coherent175b (c : ComplaintText) : Prop where
  selectAgentListResolves        : CrossTitleReferenceResolves edge_175b_incorporates_t42s262a c
  selectAgentRegulationResolves  : RegulatoryReferenceResolves edge_175b_incorporates_cfr73 c
  exclusionExceptionHonored      : ExceptionApplies edge_175b_exceptAsProvided_cfr73 c
  governmentActivityCarveOut     : ExceptionApplies edge_175b_exceptAsProvided_govActivity c
  agriculturalListResolves       : CrossTitleReferenceResolves edge_175b_incorporates_t7s8401 c
  controlledSubstanceDefined     : CrossTitleReferenceResolves edge_175b_incorporates_t21s802 c
  terroristStateReferenceFlagged : ReferenceTargetIsDangling edge_175b_incorporates_t50appS2405j c
  foreignAssistanceResolves      : CrossTitleReferenceResolves edge_175b_incorporates_t22s2371 c
  armsExportResolves             : CrossTitleReferenceResolves edge_175b_incorporates_t22s2780d c
  terroristOrganizationDefined   : CrossTitleReferenceResolves edge_175b_incorporates_t8s1182 c
  alienDefined                   : CrossTitleReferenceResolves edge_175b_incorporates_t8s1101a3 c
  lprDefined                     : CrossTitleReferenceResolves edge_175b_incorporates_t8s1101a20 c
  chapterDefinitionsInScope      : ChapterDefinitionInScope edge_175b_incorporates_178 c



structure Coherent175c (c : ComplaintText) : Prop where
  hhsCarveOutHonored        : ExceptionApplies edge_175c_exceptAsProvided_175c_a2 c
  internalReferenceResolves : InternalSubsectionReferenceResolves edge_175c_exceptAsProvided_175c_a2 c




structure Coherent176 (c : ComplaintText) : Prop where
  prohibitedConductTargetExists : ReferencedSectionExists edge_176_incorporates_175 c
  exigentCarveOut               : ExceptionApplies edge_176_exceptAsProvided_176a2 c
  affirmativeDefenseHonored     : ExceptionApplies edge_176_exceptAsProvided_176c c
  warrantProcedureResolves      : RegulatoryReferenceResolves edge_176_incorporates_frcrp41 c
  customsProceduresIncorporated : IncorporationHonored edge_176_incorporates_customsLaws c
  customsProceduresYield        : SpecificProvisionControls edge_176_lexSpecialis_customsLaws c
  chapterDefinitionsInScope     : ChapterDefinitionInScope edge_176_incorporates_178 c


structure Coherent177 (c : ComplaintText) : Prop where
  prohibitedConductTargetExists : ReferencedSectionExists edge_177_incorporates_175 c
  affirmativeDefenseHonored     : ExceptionApplies edge_177_exceptAsProvided_177b c
  chapterDefinitionsInScope     : ChapterDefinitionInScope edge_177_incorporates_178 c




structure S178IncorporationsResolve (c : ComplaintText) : Prop where
  nationalDefinitionResolves : CrossTitleReferenceResolves edge_178_incorporates_t8s1101a22 c
  chapterScopeHonored        : ChapterDefinitionInScope edge_ch10_incorporates_178 c





structure ChapterPenaltyIncorporationsResolve (c : ComplaintText) : Prop where
  fineScheduleResolves : PenaltyIncorporationResolves edge_penalty_incorporates_3571 c





inductive Section115PenaltyRoute (c : ComplaintText) : Prop where
  | assault    (h : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c)
  | kidnapping (h : IncorporationHonored edge_115_incorporates_1201 c)
  | murder     (h : IncorporationHonored edge_115_incorporates_1111 c)
  | threat     (h : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c)



inductive Section175bProhibitionRegime (c : ComplaintText) : Prop where
  | restrictedPersonPossession (h : CrossTitleReferenceResolves edge_175b_incorporates_t42s262a c)
  | unregisteredTransfer       (h : CrossTitleReferenceResolves edge_175b_incorporates_t7s8401 c)
  | unregisteredPossession     (h : RegulatoryReferenceResolves edge_175b_incorporates_cfr73 c)



inductive Section176SeizureAuthority (c : ComplaintText) : Prop where
  | warrant (h : ReferencedSectionExists edge_176_incorporates_175 c)
  | exigent (h : ExceptionApplies edge_176_exceptAsProvided_176a2 c)

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure
