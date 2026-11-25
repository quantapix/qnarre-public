








import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Structure.Types
import Proving.USC.T29.MiscProvisions.Structure.Predicates
import Proving.USC.T29.MiscProvisions.Structure.Statute

namespace Proving.USC.T29.MiscProvisions.Structure

open Proving.USC.Common

theorem coherent163_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_163_savings_157 c)
    (hSavings : SavingsClauseRespected edge_163_savings_157 c)
    (hExcept : ExceptionApplies edge_163_exceptAsProvided_subchapter c)
    : Coherent163 c :=
  ⟨hExists, hSavings, hExcept⟩

theorem coherent164_intro {c : ComplaintText}
    (hDefs : ReferencedSectionExists edge_164a_savings_152 c)
    (hSup : SavingsClauseRespected edge_164a_savings_152 c)
    (hState : SavingsClauseRespected edge_164b_savings_stateLaw c)
    (hApa : IncorporationHonored edge_164c_incorporates_apa c)
    : Coherent164 c :=
  ⟨hDefs, hSup, hState, hApa⟩


theorem coherent165_prevails_intro {c : ComplaintText}
    (h : OverrideTriggered edge_165_notwithstanding_bankruptcy c)
    : Coherent165 c :=
  Coherent165.prevails h


theorem coherent165_fallback_intro {c : ComplaintText}
    (h : ExceptionApplies edge_165_exceptAsProvided_bankruptcy c)
    : Coherent165 c :=
  Coherent165.savingsFallback h

theorem coherent166_intro {c : ComplaintText}
    (h : SavingsClauseRespected edge_166_savings_subchapter c)
    : Coherent166 c :=
  ⟨h⟩

theorem coherent168_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_168_incorporates_159 c)
    (hHonored : IncorporationHonored edge_168_incorporates_159 c)
    (hCarve : ExceptionApplies edge_168_exceptAsProvided_160 c)
    : Coherent168 c :=
  ⟨hExists, hHonored, hCarve⟩

theorem coherent169_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_169_incorporates_501c3 c)
    (hHonored : IncorporationHonored edge_169_incorporates_501c3 c)
    : Coherent169 c :=
  ⟨hExists, hHonored⟩

end Proving.USC.T29.MiscProvisions.Structure
