





import Proving.USC.T18.Enf.Structure.Statute

namespace Proving.USC.T18.Enf.Structure

open Proving.USC.Common

theorem coherent1963_intro {c}
    (hPunish : IncorporationHonored edge_1963_incorporates_1962 c)
    (hExcept : ExceptionApplies edge_1963i_exceptAsProvided_1963l c)
    (hOverride : OverrideTriggered edge_1963f_notwithstanding_31_3302b c)
    (hOvrExists : ReferencedSectionExists edge_1963f_notwithstanding_31_3302b c)
    : Coherent1963 c :=
  ⟨hPunish, hExcept, hOverride, hOvrExists⟩

theorem coherent1964_intro {c}
    (hRem : IncorporationHonored edge_1964_incorporates_1962 c)
    (hExists : ReferencedSectionExists edge_1964_incorporates_1962 c)
    : Coherent1964 c :=
  ⟨hRem, hExists⟩

theorem coherent1965_intro {c}
    (hServe : IncorporationHonored edge_1965b_incorporates_1964 c)
    (h1964 : ReferencedSectionExists edge_1965b_incorporates_1964 c)
    (hChapter : ReferencedSectionExists edge_1965_subjectTo_ch96 c)
    : Coherent1965 c :=
  ⟨hServe, h1964, hChapter⟩


theorem coherentEnforcement_civil_intro {c}
    (h : Coherent1964 c) : CoherentEnforcement c :=
  .civil h

end Proving.USC.T18.Enf.Structure
