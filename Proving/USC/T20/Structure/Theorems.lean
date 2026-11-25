import Proving.USC.T20.Structure.Types
import Proving.USC.T20.Structure.Predicates
import Proving.USC.T20.Structure.Statute
import Proving.USC.Common.Types






namespace Proving.USC.T20.Structure
open Proving.USC.Common


theorem coherent1681_intro {c : ComplaintText}
    (hDefn : IncorporationHonored edge_1681a_incorporates_1681c c)
    (hProg : ReferencedSectionExists edge_1681a_incorporates_1687 c)
    (hTax  : ReferencedSectionExists edge_1681a6A_incorporates_26s501a c)
    (hExc  : ∀ r ∈ exceptions_1681a, ReferencedSectionExists r c)
    (hSav  : SavingsPreserved edge_1681b_savings_1681a c)
    : Coherent1681 c :=
  ⟨hDefn, hProg, hTax, hExc, hSav⟩


theorem coherent1682_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1682_incorporates_1681 c)
    (hInc    : IncorporationHonored edge_1682_incorporates_1681 c)
    (hSav    : SavingsPreserved edge_1682_savings_otherLaw c)
    : Coherent1682 c :=
  ⟨hExists, hInc, hSav⟩


theorem coherent1683_intro {c : ComplaintText}
    (hAct : IncorporationHonored edge_1683_incorporates_1682 c)
    (hCh7 : ReferencedSectionExists edge_1683_incorporates_5ch7 c)
    (hOvr : OverrideTriggered edge_1683_notwithstanding_5s701 c)
    (hSav : SavingsPreserved edge_1683_savings_otherReview c)
    : Coherent1683 c :=
  ⟨hAct, hCh7, hOvr, hSav⟩


theorem reviewPath1683_otherwiseProvided_intro {c : ComplaintText}
    (hSav : SavingsPreserved edge_1683_savings_otherReview c)
    : ReviewPath1683 c :=
  .otherwiseProvided hSav


theorem reviewPath1683_apaDefault_intro {c : ComplaintText}
    (hCh7 : ReferencedSectionExists edge_1683_incorporates_5ch7 c)
    (hOvr : OverrideTriggered edge_1683_notwithstanding_5s701 c)
    : ReviewPath1683 c :=
  .apaDefault hCh7 hOvr


theorem applicability1681a_governed_intro {c : ComplaintText}
    (hNone : ∀ r ∈ exceptions_1681a, ¬ ExceptionApplies r c)
    : Applicability1681a c :=
  .governed hNone


theorem applicability1681a_exempted_intro {c : ComplaintText}
    (r : Ref) (hMem : r ∈ exceptions_1681a)
    (hApp : ExceptionApplies r c)
    : Applicability1681a c :=
  .exempted r hMem hApp

end Proving.USC.T20.Structure
