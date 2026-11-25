


import Proving.USC.T18.Structure.Statute

namespace Proving.USC.T18.Structure
open Proving.USC.Common

theorem coherent1962c_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_1962c_incorporates_1961 c)
    (hRem : ReferencedSectionExists edge_1962c_subjectTo_1964 c)
    : Coherent1962c c :=
  ⟨hInc, hRem⟩

end Proving.USC.T18.Structure
