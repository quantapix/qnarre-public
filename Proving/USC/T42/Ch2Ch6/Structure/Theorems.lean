



import Proving.USC.T42.Ch2Ch6.Structure.Statute

namespace Proving.USC.T42.Ch2Ch6.Structure
open Proving.USC.Common

theorem coherent90_intro {c : ComplaintText}
    (h88 : IncorporationHonored edge_90_incorporates_88 c)
    (h89 : IncorporationHonored edge_90_incorporates_89 c)
    : Coherent90 c :=
  ⟨h88, h89⟩

theorem coherent91_intro {c : ComplaintText}
    (h88 : IncorporationHonored edge_91_incorporates_88 c)
    (h90 : IncorporationHonored edge_91_incorporates_90 c)
    : Coherent91 c :=
  ⟨h88, h90⟩

theorem coherent97_intro {c : ComplaintText}
    (hSav : SavingsClausePreserved edge_97_savings_rs58 c)
    : Coherent97 c :=
  ⟨hSav⟩

theorem coherent192_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_192_incorporates_191 c)
    (hInc : IncorporationHonored edge_192_incorporates_191 c)
    : Coherent192 c :=
  ⟨hExists, hInc⟩

theorem coherent193_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_193_incorporates_191 c)
    : Coherent193 c :=
  ⟨hInc⟩

theorem coherent194_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_194_incorporates_191 c)
    : Coherent194 c :=
  ⟨hInc⟩

end Proving.USC.T42.Ch2Ch6.Structure
