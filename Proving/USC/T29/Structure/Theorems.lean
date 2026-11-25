






import Proving.USC.T29.Structure.Statute
import Proving.USC.T29.Structure.Predicates
import Proving.USC.T29.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent152_intro {c : ComplaintText}
    (hUlpE : ReferencedSectionExists edge_152_incorporates_158 c)
    (hUlpH : IncorporationHonored    edge_152_incorporates_158 c)
    (hBoardE : ReferencedSectionExists edge_152_incorporates_153 c)
    (hBoardH : IncorporationHonored    edge_152_incorporates_153 c)
    : Coherent152 c :=
  ⟨hUlpE, hUlpH, hBoardE, hBoardH⟩

theorem coherent153_intro {c : ComplaintText}
    (hRepE : ReferencedSectionExists edge_153_incorporates_159 c)
    (hRepH : IncorporationHonored    edge_153_incorporates_159 c)
    (hProsE : ReferencedSectionExists edge_153_incorporates_160 c)
    (hProsH : IncorporationHonored    edge_153_incorporates_160 c)
    : Coherent153 c :=
  ⟨hRepE, hRepH, hProsE, hProsH⟩

theorem coherent158_intro {c : ComplaintText}
    (hRightsE : ReferencedSectionExists edge_158_incorporates_157 c)
    (hRightsH : IncorporationHonored    edge_158_incorporates_157 c)
    (hRep : ConstraintApplies edge_158_subjectTo_159 c)
    (hSec : ExceptionApplies  edge_158_exceptAsProvided_159a c)
    : Coherent158 c :=
  ⟨hRightsE, hRightsH, hRep, hSec⟩

theorem coherent160_intro {c : ComplaintText}
    (hUlpE : ReferencedSectionExists edge_160_incorporates_158 c)
    (hUlpH : IncorporationHonored    edge_160_incorporates_158 c)
    (hLim : ConstraintApplies edge_160_subjectTo_limitations c)
    (hSav : SavingsHonored    edge_160_savings_otherLaw c)
    : Coherent160 c :=
  ⟨hUlpE, hUlpH, hLim, hSav⟩

theorem coherent161_intro {c : ComplaintText}
    (hInE : ReferencedSectionExists edge_2000e9_incorporates_161 c)
    (hInH : IncorporationHonored    edge_2000e9_incorporates_161 c)
    : Coherent161 c :=
  ⟨hInE, hInH⟩

theorem coherent162_intro {c : ComplaintText}
    (hSubE : ReferencedSectionExists edge_162_incorporates_subchapter c)
    (hSubH : IncorporationHonored    edge_162_incorporates_subchapter c)
    : Coherent162 c :=
  ⟨hSubE, hSubH⟩


theorem section160Override_injunctive_intro {c : ComplaintText}
    (h : OverrideTriggered edge_160l_notwithstanding_otherLaw c)
    : Section160Override c :=
  .injunctiveOverride h


theorem section160Override_equityLimit_intro {c : ComplaintText}
    (h : OverrideTriggered edge_160h_notwithstanding_ch6 c)
    : Section160Override c :=
  .equityLimitOverride h


theorem section160Override_stateCession_intro {c : ComplaintText}
    (h : ExceptionApplies edge_160_exceptAsProvided_stateCession c)
    : Section160Override c :=
  .stateCessionException h

end Proving.USC.T29.Structure
