







import Proving.USC.T42.TitleVII.Structure.Statute

namespace Proving.USC.T42.TitleVII.Structure

open Proving.USC.Common

theorem coherent2000e2_intro {c}
    (hDefs : IncorporationHonored edge_2000e2_incorporates_2000e c)
    (hEnf  : ReferencedSectionExists edge_2000e2_subjectTo_2000e5 c)
    (hBfoq : ReferencedSectionExists edge_2000e2_exceptAsProvided_bfoq c)
    (hSen  : ReferencedSectionExists edge_2000e2h_notwithstanding_2000e2a c)
    : Coherent2000e2 c :=
  ⟨hDefs, hEnf, hBfoq, hSen⟩

theorem coherent2000e3_intro {c}
    (hDefs      : IncorporationHonored edge_2000e3_incorporates_2000e c)
    (hPractices : IncorporationHonored edge_2000e3_incorporates_2000e2 c)
    : Coherent2000e3 c :=
  ⟨hDefs, hPractices⟩

theorem coherent2000e5_intro {c}
    (hDefs : IncorporationHonored edge_2000e5_incorporates_2000e c)
    (hComm : IncorporationHonored edge_2000e5_incorporates_2000e4 c)
    : Coherent2000e5 c :=
  ⟨hDefs, hComm⟩

theorem coherent2000e16_intro {c}
    (hRem  : IncorporationHonored edge_2000e16_incorporates_2000e5 c)
    (hPrac : IncorporationHonored edge_2000e16_incorporates_2000e2 c)
    (hExst : ReferencedSectionExists edge_2000e16_incorporates_2000e5 c)
    : Coherent2000e16 c :=
  ⟨hRem, hPrac, hExst⟩

theorem coherentTitleVII_intro {c}
    (hProh  : Coherent2000e2 c)
    (hRetal : Coherent2000e3 c)
    (hEnf   : Coherent2000e5 c)
    (hFed   : Coherent2000e16 c)
    (hCtr   : ReferencedSectionExists edge_2000e17_subjectTo_2000e5 c)
    : CoherentTitleVII c :=
  ⟨hProh, hRetal, hEnf, hFed, hCtr⟩

end Proving.USC.T42.TitleVII.Structure
