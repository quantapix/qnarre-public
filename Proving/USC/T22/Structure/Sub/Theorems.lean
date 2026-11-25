




import Proving.USC.T22.Structure.Sub.Statute

namespace Proving.USC.T22.Structure.Sub

open Proving.USC.Common



theorem coherent7103_intro {c : ComplaintText}
    (hRep   : ReferencedSectionExists edge_7103_incorporates_7107 c)
    (hSvc   : IncorporationHonored   edge_7103_incorporates_7105 c)
    (hGrant : IncorporationHonored   edge_7103_incorporates_7104 c)
    (hCh    : IncorporationHonored   edge_7103_incorporates_ch78 c)
    (hVisa  : ReferencedSectionExists edge_7103_incorporates_8usc1101 c)
    (hCrime : ReferencedSectionExists edge_7103_incorporates_18usc_ch77 c)
    : Coherent7103 c :=
  ⟨hRep, hSvc, hGrant, hCh, hVisa, hCrime⟩



theorem coherent7106_intro {c : ComplaintText}
    (hCh  : IncorporationHonored   edge_7106_incorporates_ch78 c)
    (hDef : IncorporationHonored   edge_7106_incorporates_7102 c)
    (hInt : ReferencedSectionExists edge_7106b_subjectTo_7106a c)
    : Coherent7106 c :=
  ⟨hCh, hDef, hInt⟩

end Proving.USC.T22.Structure.Sub
