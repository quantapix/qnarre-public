



import Proving.USC.T18.Ch1.Reslice.Structure.Types
import Proving.USC.T18.Ch1.Reslice.Structure.Predicates
import Proving.USC.T18.Ch1.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Structure

open Proving.USC.Common



theorem section7IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeHonored edge_title18_incorporates_7 c)
    (hInaExists : ReferencedSectionExists edge_7_9_incorporates_ina101 c)
    (hInaHonored : IncorporationHonored edge_7_9_incorporates_ina101 c)
    (hSpace : AllIncorporationsHonored refs_7_6_spaceTreaties c)
    (hGuano : IncorporationHonored edge_7_4_incorporates_guanoAct c)
    (hIntlLaw : DefinitionScopeHonored edge_7_8_subjectTo_internationalLaw c)
    (hSavings : SavingsClausePreserves edge_7_9_savings_treaties c)
    (hMeja : ReferencedSectionExists edge_7_9_exceptAsProvided_3261a c)
    : Section7IncorporationsResolve c :=
  ⟨hScope, hInaExists, hInaHonored, hSpace, hGuano, hIntlLaw, hSavings, hMeja⟩

theorem paragraph7_9Displaced_byMejaException {c : ComplaintText}
    (h : ExceptionApplies edge_7_9_exceptAsProvided_3261a c)
    : Paragraph7_9Displaced c :=
  .byMejaException h

theorem paragraph7_9Displaced_byConflictingTreaty {c : ComplaintText}
    (h : OverrideTriggered edge_7_9_savings_treaties c)
    : Paragraph7_9Displaced c :=
  .byConflictingTreaty h



theorem paragraph20_8Resolution_asEnacted {c : ComplaintText}
    (h : ReferencedSectionExists edge_20_8_incorporates_fra25a c)
    : Paragraph20_8Resolution c :=
  .asEnacted h

theorem paragraph20_8Resolution_viaRenumbering {c : ComplaintText}
    (hDangling : ReferenceDangling edge_20_8_incorporates_fra25a c)
    (hNote : EditorialCorrectionApplied note_20_8 c)
    (hRenumbered : ReferencedSectionExists edge_20_8_incorporates_fra25A_renumbered c)
    : Paragraph20_8Resolution c :=
  .viaRenumbering hDangling hNote hRenumbered

theorem section20IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeHonored edge_title18_incorporates_20 c)
    (hExist : AllReferencedSectionsExist refs_20_resolvable c)
    (hHonored : AllIncorporationsHonored refs_20_resolvable c)
    (hEdgeAct : Paragraph20_8Resolution c)
    : Section20IncorporationsResolve c :=
  ⟨hScope, hExist, hHonored, hEdgeAct⟩



theorem section21IncorporationsResolve_intro {c : ComplaintText}
    (hAvail : DefinitionScopeHonored edge_title18_incorporates_21 c)
    (hProofRule : LexSpecialisControls edge_21_a_lexSpecialis_elementProof c)
    (hS115Exists : ReferencedSectionExists edge_21_b_incorporates_115 c)
    (hS115Honored : IncorporationHonored edge_21_b_incorporates_115 c)
    (hSectionScope : DefinitionScopeHonored edge_21_b_subjectTo_sectionScope c)
    : Section21IncorporationsResolve c :=
  ⟨hAvail, hProofRule, hS115Exists, hS115Honored, hSectionScope⟩



theorem section23ScopeStatus_titleWide {c : ComplaintText}
    (h : DefinitionScopeHonored edge_title18_incorporates_23 c)
    : Section23ScopeStatus c :=
  .titleWide h

theorem section23ScopeStatus_displacedByExpressProvision {c : ComplaintText}
    (h : ExceptionApplies edge_23_exceptAsProvided_open c)
    : Section23ScopeStatus c :=
  .displacedByExpressProvision h

theorem section23IncorporationsResolve_intro {c : ComplaintText}
    (hScope : Section23ScopeStatus c)
    (hComma : EditorialCorrectionApplied note_23 c)
    (hCourtsExist : AllReferencedSectionsExist refs_23_courts c)
    (hCourtsHonored : AllIncorporationsHonored refs_23_courts c)
    (hLexSpecialis : LexSpecialisControls edge_23_lexSpecialis_28_451 c)
    : Section23IncorporationsResolve c :=
  ⟨hScope, hComma, hCourtsExist, hCourtsHonored, hLexSpecialis⟩



theorem section24IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionScopeHonored edge_title18_incorporates_24 c)
    (hA1Exist : AllReferencedSectionsExist refs_24_a1 c)
    (hA1Honored : AllIncorporationsHonored refs_24_a1 c)
    (hA2Exist : AllReferencedSectionsExist refs_24_a2 c)
    (hA2Honored : AllIncorporationsHonored refs_24_a2 c)
    (hComma : EditorialCorrectionApplied note_24_a2 c)
    (hNexus : IncorporationHonored edge_24_a2_subjectTo_24b c)
    : Section24IncorporationsResolve c :=
  ⟨hScope, hA1Exist, hA1Honored, hA2Exist, hA2Honored, hComma, hNexus⟩



theorem chapter1DefinitionsCohere_intro {c : ComplaintText}
    (h7 : Section7IncorporationsResolve c)
    (h20 : Section20IncorporationsResolve c)
    (h21 : Section21IncorporationsResolve c)
    (h23 : Section23IncorporationsResolve c)
    (h24 : Section24IncorporationsResolve c)
    : Chapter1DefinitionsCohere c :=
  ⟨h7, h20, h21, h23, h24⟩

end Proving.USC.T18.Ch1.Reslice.Structure
