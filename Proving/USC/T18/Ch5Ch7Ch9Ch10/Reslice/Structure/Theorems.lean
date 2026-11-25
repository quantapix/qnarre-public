





import Proving.USC.Common.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure

open Proving.USC.Common



theorem coherent111_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_111_incorporates_1114 c)
    (hInc : IncorporationHonored edge_111_incorporates_1114 c)
    : Coherent111 c := ⟨hExists, hInc⟩

theorem coherent112_intro {c : ComplaintText}
    (hDefExists : ReferencedSectionExists edge_112_incorporates_1116b c)
    (hDef : DefinitionSuppliedByReferencedSection edge_112_incorporates_1116b c)
    (hAmend1 : SavingsClauseRespected edge_112_savings_amend1 c)
    (hUS : IncorporationHonored edge_112_incorporates_5 c)
    (hMaritime : IncorporationHonored edge_112_incorporates_7 c)
    (hAircraft : CrossTitleReferenceResolves edge_112_incorporates_t49s46501 c)
    (hOverride : OverrideTriggered edge_112_notwithstanding_contraryLaw c)
    : Coherent112 c := ⟨hDefExists, hDef, hAmend1, hUS, hMaritime, hAircraft, hOverride⟩

theorem coherent113_intro {c : ComplaintText}
    (h2241 : IncorporationHonored edge_113_incorporates_2241 c)
    (h2242 : IncorporationHonored edge_113_incorporates_2242 c)
    (hCarve2241 : ExceptionApplies edge_113_exceptAsProvided_2241 c)
    (hCarve2242 : ExceptionApplies edge_113_exceptAsProvided_2242 c)
    (hSbi : DefinitionSuppliedByReferencedSection edge_113_incorporates_1365 c)
    (hPartner : DefinitionSuppliedByReferencedSection edge_113_incorporates_2266 c)
    : Coherent113 c := ⟨h2241, h2242, hCarve2241, hCarve2242, hSbi, hPartner⟩

theorem coherent114_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_114_incorporates_2340 c)
    (hDef : DefinitionSuppliedByReferencedSection edge_114_incorporates_2340 c)
    : Coherent114 c := ⟨hExists, hDef⟩

theorem coherent115_intro {c : ComplaintText}
    (hClass : IncorporationHonored edge_115_incorporates_1114 c)
    (hRoute : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c)
    (hSbi : DefinitionSuppliedByReferencedSection edge_115_incorporates_1365 c)
    (h2241 : IncorporationHonored edge_115_incorporates_2241 c)
    (h2242 : IncorporationHonored edge_115_incorporates_2242 c)
    (h1201 : IncorporationHonored edge_115_incorporates_1201 c)
    (h1201a5 : IncorporationHonored edge_115_incorporates_1201a5 c)
    (h1111 : IncorporationHonored edge_115_incorporates_1111 c)
    (h1113 : IncorporationHonored edge_115_incorporates_1113 c)
    (h1117 : IncorporationHonored edge_115_incorporates_1117 c)
    (hHeads : CrossTitleReferenceResolves edge_115_incorporates_t5s101 c)
    (h3056 : SavingsClauseRespected edge_115_savings_3056 c)
    (h871 : SavingsClauseRespected edge_115_savings_871 c)
    (h879 : SavingsClauseRespected edge_115_savings_879 c)
    : Coherent115 c :=
  ⟨hClass, hRoute, hSbi, h2241, h2242, h1201, h1201a5, h1111, h1113, h1117,
   hHeads, h3056, h871, h879⟩

theorem coherent116_intro {c : ComplaintText}
    (hMedical : ExceptionApplies edge_116_exceptAsProvided_116b c)
    (hCircumstance : InternalSubsectionReferenceResolves edge_116_incorporates_116d c)
    (hDefinition : InternalSubsectionReferenceResolves edge_116_incorporates_116e c)
    (hCustom : SpecificProvisionControls edge_116_lexSpecialis_religiousCustom c)
    : Coherent116 c := ⟨hMedical, hCircumstance, hDefinition, hCustom⟩

theorem coherent117_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_117_incorporates_ch110A c)
    (hInc : IncorporationHonored edge_117_incorporates_ch110A c)
    (hGap : DefinitionalGapUnfilled edge_117_incorporates_113b1 c)
    : Coherent117 c := ⟨hExists, hInc, hGap⟩

theorem coherent118_intro {c : ComplaintText}
    (h2709 : CrossTitleReferenceResolves edge_118_incorporates_t22s2709 c)
    (h4802 : CrossTitleReferenceResolves edge_118_incorporates_t22s4802 c)
    : Coherent118 c := ⟨h2709, h4802⟩

theorem coherent119_intro {c : ComplaintText}
    (hClass : IncorporationHonored edge_119_incorporates_1114 c)
    (hCov : DefinitionSuppliedByReferencedSection edge_119_incorporates_16 c)
    (hFamily : DefinitionSuppliedByReferencedSection edge_119_incorporates_115c2 c)
    : Coherent119 c := ⟨hClass, hCov, hFamily⟩



theorem s151IncorporationsResolve_intro {c : ComplaintText}
    (hT11 : CrossTitleReferenceResolves edge_151_incorporates_t11 c)
    (hScope : ChapterDefinitionInScope edge_ch9_incorporates_151 c)
    : S151IncorporationsResolve c := ⟨hT11, hScope⟩

theorem coherent152_intro {c : ComplaintText}
    (hDebtor : DefinitionSuppliedByReferencedSection edge_152_incorporates_151 c)
    (hT11 : CrossTitleReferenceResolves edge_152_incorporates_t11 c)
    (h1746 : CrossTitleReferenceResolves edge_152_incorporates_t28s1746 c)
    : Coherent152 c := ⟨hDebtor, hT11, h1746⟩

theorem coherent153_intro {c : ComplaintText}
    (hDebtor : DefinitionSuppliedByReferencedSection edge_153_incorporates_151 c)
    (hT11 : CrossTitleReferenceResolves edge_153_incorporates_t11 c)
    : Coherent153 c := ⟨hDebtor, hT11⟩

theorem coherent154_intro {c : ComplaintText}
    (hT11 : CrossTitleReferenceResolves edge_154_incorporates_t11 c)
    (hScope : ChapterDefinitionInScope edge_ch9_incorporates_151 c)
    : Coherent154 c := ⟨hT11, hScope⟩

theorem coherent155_intro {c : ComplaintText}
    (hT11 : CrossTitleReferenceResolves edge_155_incorporates_t11 c)
    : Coherent155 c := ⟨hT11⟩

theorem coherent156_intro {c : ComplaintText}
    (hT11 : CrossTitleReferenceResolves edge_156_incorporates_t11 c)
    (hRules : RegulatoryReferenceResolves edge_156_incorporates_frbp c)
    : Coherent156 c := ⟨hT11, hRules⟩

theorem coherent157_intro {c : ComplaintText}
    (h303 : CrossTitleReferenceResolves edge_157_incorporates_t11s303 c)
    (hT11 : CrossTitleReferenceResolves edge_157_incorporates_t11 c)
    : Coherent157 c := ⟨h303, hT11⟩

theorem s158IncorporationsResolve_intro {c : ComplaintText}
    (h152 : ReferencedSectionExists edge_158_incorporates_152 c)
    (h157 : ReferencedSectionExists edge_158_incorporates_157 c)
    (h3057 : IncorporationHonored edge_158_incorporates_3057 c)
    : S158IncorporationsResolve c := ⟨h152, h157, h3057⟩



theorem coherent175_intro {c : ComplaintText}
    (hScope : ChapterDefinitionInScope edge_ch10_incorporates_178 c)
    (hTerms : DefinitionSuppliedByReferencedSection edge_175_incorporates_178 c)
    : Coherent175 c := ⟨hScope, hTerms⟩

theorem s175aIncorporationsResolve_intro {c : ComplaintText}
    (h175 : ReferencedSectionExists edge_175a_incorporates_175 c)
    (h382 : IncorporationHonored edge_175a_incorporates_t10s382 c)
    (h382f2 : IncorporationHonored edge_175a_incorporates_t10s382f2 c)
    (hFlag : ReferenceTargetIsDangling edge_175a_incorporates_t10s382 c)
    : S175aIncorporationsResolve c := ⟨h175, h382, h382f2, hFlag⟩

theorem coherent175b_intro {c : ComplaintText}
    (h262a : CrossTitleReferenceResolves edge_175b_incorporates_t42s262a c)
    (hCfr : RegulatoryReferenceResolves edge_175b_incorporates_cfr73 c)
    (hExcl : ExceptionApplies edge_175b_exceptAsProvided_cfr73 c)
    (hGov : ExceptionApplies edge_175b_exceptAsProvided_govActivity c)
    (h8401 : CrossTitleReferenceResolves edge_175b_incorporates_t7s8401 c)
    (h802 : CrossTitleReferenceResolves edge_175b_incorporates_t21s802 c)
    (hEaa : ReferenceTargetIsDangling edge_175b_incorporates_t50appS2405j c)
    (h2371 : CrossTitleReferenceResolves edge_175b_incorporates_t22s2371 c)
    (h2780d : CrossTitleReferenceResolves edge_175b_incorporates_t22s2780d c)
    (h1182 : CrossTitleReferenceResolves edge_175b_incorporates_t8s1182 c)
    (h1101a3 : CrossTitleReferenceResolves edge_175b_incorporates_t8s1101a3 c)
    (h1101a20 : CrossTitleReferenceResolves edge_175b_incorporates_t8s1101a20 c)
    (hScope : ChapterDefinitionInScope edge_175b_incorporates_178 c)
    : Coherent175b c :=
  ⟨h262a, hCfr, hExcl, hGov, h8401, h802, hEaa, h2371, h2780d, h1182,
   h1101a3, h1101a20, hScope⟩

theorem coherent175c_intro {c : ComplaintText}
    (hHhs : ExceptionApplies edge_175c_exceptAsProvided_175c_a2 c)
    (hInternal : InternalSubsectionReferenceResolves edge_175c_exceptAsProvided_175c_a2 c)
    : Coherent175c c := ⟨hHhs, hInternal⟩

theorem coherent176_intro {c : ComplaintText}
    (h175 : ReferencedSectionExists edge_176_incorporates_175 c)
    (hExigent : ExceptionApplies edge_176_exceptAsProvided_176a2 c)
    (hDefense : ExceptionApplies edge_176_exceptAsProvided_176c c)
    (hWarrant : RegulatoryReferenceResolves edge_176_incorporates_frcrp41 c)
    (hCustoms : IncorporationHonored edge_176_incorporates_customsLaws c)
    (hYield : SpecificProvisionControls edge_176_lexSpecialis_customsLaws c)
    (hScope : ChapterDefinitionInScope edge_176_incorporates_178 c)
    : Coherent176 c := ⟨h175, hExigent, hDefense, hWarrant, hCustoms, hYield, hScope⟩

theorem coherent177_intro {c : ComplaintText}
    (h175 : ReferencedSectionExists edge_177_incorporates_175 c)
    (hDefense : ExceptionApplies edge_177_exceptAsProvided_177b c)
    (hScope : ChapterDefinitionInScope edge_177_incorporates_178 c)
    : Coherent177 c := ⟨h175, hDefense, hScope⟩

theorem s178IncorporationsResolve_intro {c : ComplaintText}
    (hNational : CrossTitleReferenceResolves edge_178_incorporates_t8s1101a22 c)
    (hScope : ChapterDefinitionInScope edge_ch10_incorporates_178 c)
    : S178IncorporationsResolve c := ⟨hNational, hScope⟩



theorem chapterPenaltyIncorporationsResolve_intro {c : ComplaintText}
    (hFine : PenaltyIncorporationResolves edge_penalty_incorporates_3571 c)
    : ChapterPenaltyIncorporationsResolve c := ⟨hFine⟩



theorem section115PenaltyRoute_assault_intro {c : ComplaintText}
    (h : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c)
    : Section115PenaltyRoute c := .assault h

theorem section115PenaltyRoute_kidnapping_intro {c : ComplaintText}
    (h : IncorporationHonored edge_115_incorporates_1201 c)
    : Section115PenaltyRoute c := .kidnapping h

theorem section115PenaltyRoute_murder_intro {c : ComplaintText}
    (h : IncorporationHonored edge_115_incorporates_1111 c)
    : Section115PenaltyRoute c := .murder h

theorem section115PenaltyRoute_threat_intro {c : ComplaintText}
    (h : InternalSubsectionReferenceResolves edge_115_subjectTo_115b c)
    : Section115PenaltyRoute c := .threat h

theorem section175bProhibitionRegime_restrictedPerson_intro {c : ComplaintText}
    (h : CrossTitleReferenceResolves edge_175b_incorporates_t42s262a c)
    : Section175bProhibitionRegime c := .restrictedPersonPossession h

theorem section175bProhibitionRegime_transfer_intro {c : ComplaintText}
    (h : CrossTitleReferenceResolves edge_175b_incorporates_t7s8401 c)
    : Section175bProhibitionRegime c := .unregisteredTransfer h

theorem section175bProhibitionRegime_possession_intro {c : ComplaintText}
    (h : RegulatoryReferenceResolves edge_175b_incorporates_cfr73 c)
    : Section175bProhibitionRegime c := .unregisteredPossession h

theorem section176SeizureAuthority_warrant_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_176_incorporates_175 c)
    : Section176SeizureAuthority c := .warrant h

theorem section176SeizureAuthority_exigent_intro {c : ComplaintText}
    (h : ExceptionApplies edge_176_exceptAsProvided_176a2 c)
    : Section176SeizureAuthority c := .exigent h

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure
