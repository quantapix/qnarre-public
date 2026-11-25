








import Proving.USC.T09.Structure.Statute

namespace Proving.USC.T09.Structure

open Proving.USC.Common

theorem coherent2_intro {c}
    (hDefsExist : ReferencedSectionExists edge_s2_incorporates_s1 c)
    (hDefsHon   : IncorporationHonored edge_s2_incorporates_s1 c)
    (hSavings   : ReferencedSectionExists edge_s2_savings_contractLaw c)
    (hCh4       : ReferencedSectionExists edge_s2_exceptAsProvided_ch4 c)
    : Coherent2 c :=
  ⟨hDefsExist, hDefsHon, hSavings, hCh4⟩

theorem coherent16_intro {c}
    (hS3   : ReferencedSectionExists edge_s16_incorporates_s3 c)
    (hS4   : ReferencedSectionExists edge_s16_incorporates_s4 c)
    (hS206 : ReferencedSectionExists edge_s16_incorporates_s206 c)
    (hT28  : ReferencedSectionExists edge_s16_exceptAsProvided_t28_1292b c)
    : Coherent16 c :=
  ⟨hS3, hS4, hS206, hT28⟩

theorem coherent202_intro {c}
    (hExists : ReferencedSectionExists edge_s202_incorporates_s2 c)
    (hHon    : IncorporationHonored edge_s202_incorporates_s2 c)
    : Coherent202 c :=
  ⟨hExists, hHon⟩

theorem coherent208_intro {c}
    (hCh1Exists : ReferencedSectionExists edge_s208_incorporates_ch1 c)
    (hCh1Hon    : IncorporationHonored edge_s208_incorporates_ch1 c)
    (hCh4       : ReferencedSectionExists edge_s208_subjectTo_ch4 c)
    : Coherent208 c :=
  ⟨hCh1Exists, hCh1Hon, hCh4⟩

theorem coherent302_intro {c}
    (h202 : IncorporationHonored edge_s302_incorporates_s202 c)
    (h203 : IncorporationHonored edge_s302_incorporates_s203 c)
    (h204 : IncorporationHonored edge_s302_incorporates_s204 c)
    (h205 : IncorporationHonored edge_s302_incorporates_s205 c)
    (h207 : IncorporationHonored edge_s302_incorporates_s207 c)
    : Coherent302 c :=
  ⟨h202, h203, h204, h205, h207⟩

theorem coherent307_intro {c}
    (hCh1Exists : ReferencedSectionExists edge_s307_incorporates_ch1 c)
    (hCh1Hon    : IncorporationHonored edge_s307_incorporates_ch1 c)
    (hCh4       : ReferencedSectionExists edge_s307_subjectTo_ch4 c)
    : Coherent307 c :=
  ⟨hCh1Exists, hCh1Hon, hCh4⟩

theorem coherent401_intro {c}
    (hExists : ReferencedSectionExists edge_s401_incorporates_t18_2246 c)
    (hHon    : IncorporationHonored edge_s401_incorporates_t18_2246 c)
    : Coherent401 c :=
  ⟨hExists, hHon⟩


theorem overridePath_ch4_intro {c}
    (h : OverrideTriggered edge_s402_notwithstanding_title c)
    : OverridePath c :=
  .ch4SexualMisconduct h


theorem overridePath_panama_intro {c}
    (h : OverrideTriggered edge_s305_lexSpecialis_panamaOverNY c)
    : OverridePath c :=
  .panamaOverNY h

end Proving.USC.T09.Structure
