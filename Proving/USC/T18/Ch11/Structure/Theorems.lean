import Proving.USC.T18.Ch11.Structure.Types
import Proving.USC.T18.Ch11.Structure.Predicates
import Proving.USC.T18.Ch11.Structure.Statute
import Proving.USC.Common.Types






namespace Proving.USC.T18.Ch11.Structure
open Proving.USC.Common

theorem coherent201_intro {c}
    (hExists : ReferencedSectionExists edge_201_savings_1503 c)
    (hSave   : SavingsClausePreserved edge_201_savings_1503 c)
    : Coherent201 c := ⟨hExists, hSave⟩

theorem coherent202_intro {c}
    (hExists   : ReferencedSectionExists edge_202_notwithstanding_5t5 c)
    (hOverride : OverrideTriggered edge_202_notwithstanding_5t5 c)
    : Coherent202 c := ⟨hExists, hOverride⟩

theorem coherent203_intro {c}
    (hDef : DefinitionImported edge_203_incorporates_202 c)
    (hPen : PenaltyRegimeApplies edge_203_penalty_216 c)
    : Coherent203 c := ⟨hDef, hPen⟩

theorem coherent204_intro {c}
    (hPen : PenaltyRegimeApplies edge_204_penalty_216 c)
    : Coherent204 c := ⟨hPen⟩

theorem coherent205_intro {c}
    (hDef : DefinitionImported edge_205_incorporates_202 c)
    (hPen : PenaltyRegimeApplies edge_205_penalty_216 c)
    : Coherent205 c := ⟨hDef, hPen⟩

theorem coherent206_intro {c}
    (hE203 : ExceptionApplies edge_206_except_203 c)
    (hE205 : ExceptionApplies edge_206_except_205 c)
    : Coherent206 c := ⟨hE203, hE205⟩

theorem coherent207_intro {c}
    (hDef  : DefinitionImported edge_207_incorporates_202 c)
    (hPen  : PenaltyRegimeApplies edge_207_penalty_216 c)
    (hFoia : IncorporationHonored edge_207_incorporates_552t5 c)
    : Coherent207 c := ⟨hDef, hPen, hFoia⟩

theorem coherent208_intro {c}
    (hDef : DefinitionImported edge_208_incorporates_202 c)
    (hPen : PenaltyRegimeApplies edge_208_penalty_216 c)
    : Coherent208 c := ⟨hDef, hPen⟩

theorem coherent209_intro {c}
    (hDef    : DefinitionImported edge_209_incorporates_202 c)
    (hPen    : PenaltyRegimeApplies edge_209_penalty_216 c)
    (hAgency : IncorporationHonored edge_209_incorporates_3701t5 c)
    : Coherent209 c := ⟨hDef, hPen, hAgency⟩

theorem coherent213_intro {c}
    (hDef : DefinitionImported edge_213_incorporates_212 c)
    : Coherent213 c := ⟨hDef⟩

theorem coherent216_intro {c}
    (hExists : ReferencedSectionExists edge_216_references_203 c)
    (hSave   : SavingsClausePreserved edge_216_savings_other c)
    : Coherent216 c := ⟨hExists, hSave⟩

theorem coherent217_intro {c}
    (hInc : IncorporationHonored edge_217_incorporates_1150t12 c)
    : Coherent217 c := ⟨hInc⟩

theorem coherent218_intro {c}
    (hChap : PredicateOffenseResolvable edge_218_incorporates_ch11 c)
    (hSave : SavingsClausePreserved edge_218_savings_other c)
    : Coherent218 c := ⟨hChap, hSave⟩

theorem coherent219_intro {c}
    (hInc : IncorporationHonored edge_219_incorporates_fara3 c)
    : Coherent219 c := ⟨hInc⟩

theorem coherent220_intro {c}
    (hHealth : DefinitionImported edge_220_incorporates_24b c)
    (hLab    : IncorporationHonored edge_220_incorporates_353phsa c)
    (hExc    : ExceptionApplies edge_220_except_220b c)
    : Coherent220 c := ⟨hHealth, hLab, hExc⟩

theorem coherent225_intro {c}
    (hIn    : PredicateOffenseResolvable edge_225_incorporates_215 c)
    (hCross : PredicateOffenseResolvable edge_225_incorporates_1344 c)
    : Coherent225 c := ⟨hIn, hCross⟩

theorem coherent226_intro {c}
    (hTerror : IncorporationHonored edge_226_incorporates_2331 c)
    (hSecure : IncorporationHonored edge_226_incorporates_70103t46 c)
    : Coherent226 c := ⟨hTerror, hSecure⟩

theorem coherent227_intro {c}
    (hDef : DefinitionImported edge_227_incorporates_2105t5 c)
    : Coherent227 c := ⟨hDef⟩

end Proving.USC.T18.Ch11.Structure
