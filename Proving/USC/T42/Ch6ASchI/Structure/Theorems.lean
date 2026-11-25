







import Proving.USC.T42.Ch6ASchI.Structure.Statute

namespace Proving.USC.T42.Ch6ASchI.Structure

open Proving.USC.Common

theorem coherent201_intro {c : ComplaintText}
    (hOv : OverrideTriggered edge_201_notwithstanding_anyLaw c)
    (hMe : IncorporationHonored edge_201_incorporates_1396 c)
    (hSi : IncorporationHonored edge_201_incorporates_1381 c)
    (hFu : ReferencedSectionExists edge_201_incorporates_ricky101 c)
    : Coherent201 c :=
  ⟨hOv, hMe, hSi, hFu⟩

theorem coherent204_intro {c : ComplaintText}
    (hUn : IncorporationHonored edge_204_incorporates_295p c)
    (hT37 : ReferencedSectionExists edge_204_incorporates_t37 c)
    (hDe : OverrideTriggered edge_204_notwithstanding_reserveRefs c)
    (hEx : ExceptionApplies edge_204_exceptAsProvided_subsecB c)
    : Coherent204 c :=
  ⟨hUn, hT37, hDe, hEx⟩

theorem coherent204a_intro {c : ComplaintText}
    (hDf : IncorporationHonored edge_204a_incorporates_215 c)
    (hPh : IncorporationHonored edge_204a_incorporates_247d c)
    (hNe : ReferencedSectionExists edge_204a_incorporates_nea1601 c)
    (hSt : IncorporationHonored edge_204a_incorporates_stafford5121 c)
    (hWa : ExceptionApplies edge_204a_exceptAsProvided_par4 c)
    : Coherent204a c :=
  ⟨hDf, hPh, hNe, hSt, hWa⟩

theorem coherent207_intro {c : ComplaintText}
    (hB : IncorporationHonored edge_207_incorporates_206b c)
    (hC : IncorporationHonored edge_207_incorporates_206c c)
    : Coherent207 c :=
  ⟨hB, hC⟩

theorem coherent209_intro {c : ComplaintText}
    (hAs : IncorporationHonored edge_209_incorporates_212d c)
    (h205 : ExceptionApplies edge_209_exceptAsProvided_205 c)
    (hInt : ExceptionApplies edge_209_exceptAsProvided_subsecBE c)
    : Coherent209 c :=
  ⟨hAs, h205, hInt⟩

theorem coherent209d_intro {c : ComplaintText}
    (hAct : SubjectToConstraintHonored edge_209d_subjectTo_act c)
    : Coherent209d c :=
  ⟨hAct⟩

theorem coherent210_intro {c : ComplaintText}
    (h211 : IncorporationHonored edge_210_incorporates_211g3 c)
    (h212 : IncorporationHonored edge_210_incorporates_212 c)
    (h213a : IncorporationHonored edge_210_incorporates_213a c)
    (h209g : IncorporationHonored edge_210_incorporates_209g c)
    (hT37 : ReferencedSectionExists edge_210_incorporates_t37_303a c)
    (hT5tr : ReferencedSectionExists edge_210_incorporates_t5_5703 c)
    (hT5es : ReferencedSectionExists edge_210_incorporates_t5_5313 c)
    : Coherent210 c :=
  ⟨h211, h212, h213a, h209g, hT37, hT5tr, hT5es⟩

theorem coherent210b_intro {c : ComplaintText}
    (hEx : IncorporationHonored edge_210b_incorporates_209a1 c)
    (hLim : SubjectToConstraintHonored edge_210b_subjectTo_207d c)
    (h207c : IncorporationHonored edge_210b_incorporates_207c c)
    (h209 : IncorporationHonored edge_210b_incorporates_209 c)
    (h206c : IncorporationHonored edge_210b_incorporates_206c c)
    : Coherent210b c :=
  ⟨hEx, hLim, h207c, h209, h206c⟩

end Proving.USC.T42.Ch6ASchI.Structure
