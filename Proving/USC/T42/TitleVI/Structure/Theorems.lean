








import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Structure.Types
import Proving.USC.T42.TitleVI.Structure.Predicates
import Proving.USC.T42.TitleVI.Structure.Statute

namespace Proving.USC.T42.TitleVI.Structure

open Proving.USC.Common

theorem coherent2000d_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000d1_incorporates_2000d c)
    : Coherent2000d c :=
  ⟨hExists⟩

theorem coherent2000d1_intro {c : ComplaintText}
    (hProhib : ReferencedSectionExists edge_2000d1_incorporates_2000d c)
    (hInc    : IncorporationHonored edge_2000d1_incorporates_2000d c)
    (hSav    : SavingsConsistent edge_2000d1_savings_otherLaw c)
    : Coherent2000d1 c :=
  ⟨hProhib, hInc, hSav⟩

theorem coherent2000d7_intro {c : ComplaintText}
    (hTitleVI    : ReferencedSectionExists edge_2000d7_incorporates_titleVI c)
    (hIncTitleVI : IncorporationHonored edge_2000d7_incorporates_titleVI c)
    (hRehab      : ReferencedSectionExists edge_2000d7_incorporates_rehabAct504 c)
    (hTitleIX    : ReferencedSectionExists edge_2000d7_incorporates_titleIX c)
    (hAge        : ReferencedSectionExists edge_2000d7_incorporates_ageDiscrimAct c)
    (hAnyOther   : ReferencedSectionExists edge_2000d7_incorporates_anyOtherStatute c)
    : Coherent2000d7 c :=
  ⟨hTitleVI, hIncTitleVI, hRehab, hTitleIX, hAge, hAnyOther⟩

end Proving.USC.T42.TitleVI.Structure
