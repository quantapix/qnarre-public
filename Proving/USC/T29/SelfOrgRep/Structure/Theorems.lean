






import Proving.USC.T29.SelfOrgRep.Structure.Statute

namespace Proving.USC.T29.SelfOrgRep.Structure

open Proving.USC.Common


theorem coherent157_intro {c}
    (hExists : ReferencedSectionExists edge_157_exceptAsProvided_158a3 c)
    (hHonored : ExceptionApplies edge_157_exceptAsProvided_158a3 c)
    : Coherent157 c :=
  ⟨hExists, hHonored⟩


theorem coherent159_intro {c}
    (hRepExists : ReferencedSectionExists edge_159c_incorporates_159a c)
    (hRepHonored : IncorporationHonored edge_159c_incorporates_159a c)
    (hOrder : IncorporationHonored edge_159c2_incorporates_160c c)
    (hUnit : IncorporationHonored edge_159c5_incorporates_159b c)
    (hPursuant : IncorporationHonored edge_159d_incorporates_160c c)
    (hTranscript : IncorporationHonored edge_159d_incorporates_160ef c)
    (hRescission : IncorporationHonored edge_159e1_incorporates_158a3 c)
    : Coherent159 c :=
  ⟨hRepExists, hRepHonored, hOrder, hUnit, hPursuant, hTranscript, hRescission⟩

end Proving.USC.T29.SelfOrgRep.Structure
