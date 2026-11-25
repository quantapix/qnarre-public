







import Proving.USC.T18.Ch1.Part2.Structure.Statute

namespace Proving.USC.T18.Ch1.Part2.Structure

open Proving.USC.Common

theorem coherent19_intro {c : ComplaintText}
    (refExists : ReferencedSectionExists edge_19_incorporates_3571 c)
    (honored : IncorporationHonored edge_19_incorporates_3571 c)
    : Coherent19 c := ⟨refExists, honored⟩

theorem coherent20_intro {c : ComplaintText}
    (refExists27 : ReferencedSectionExists edge_20_incorporates_27 c)
    (honored27 : IncorporationHonored edge_20_incorporates_27 c)
    (refExists1422 : ReferencedSectionExists edge_20_incorporates_12_1422 c)
    : Coherent20 c := ⟨refExists27, honored27, refExists1422⟩

theorem coherent21_intro {c : ComplaintText}
    (refExists : ReferencedSectionExists edge_21_incorporates_115 c)
    (honored : IncorporationHonored edge_21_incorporates_115 c)
    : Coherent21 c := ⟨refExists, honored⟩

theorem coherent24_intro {c : ComplaintText}
    (refExists1347 : ReferencedSectionExists edge_24_incorporates_1347 c)
    (honored1347 : IncorporationHonored edge_24_incorporates_1347 c)
    (refExistsExternal : ReferencedSectionExists edge_24_incorporates_42_1320a7b c)
    : Coherent24 c := ⟨refExists1347, honored1347, refExistsExternal⟩

theorem coherent25_intro {c : ComplaintText}
    (refExists16 : ReferencedSectionExists edge_25_incorporates_16 c)
    (honored16 : IncorporationHonored edge_25_incorporates_16 c)
    (refExists23 : ReferencedSectionExists edge_25_incorporates_23 c)
    (honored23 : IncorporationHonored edge_25_incorporates_23 c)
    : Coherent25 c := ⟨refExists16, honored16, refExists23, honored23⟩

theorem coherent27_intro {c : ComplaintText}
    (refExists : ReferencedSectionExists edge_27_incorporates_18 c)
    (honored : IncorporationHonored edge_27_incorporates_18 c)
    : Coherent27 c := ⟨refExists, honored⟩

theorem coherent28_intro {c : ComplaintText}
    (refExists3771A : ReferencedSectionExists edge_28_incorporates_3771A c)
    (honored3771A : IncorporationHonored edge_28_incorporates_3771A c)
    (refExists7102 : ReferencedSectionExists edge_28_incorporates_22_7102 c)
    : Coherent28 c := ⟨refExists3771A, honored3771A, refExists7102⟩


theorem section23Resolution_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_23_exceptAsProvided c)
    : Section23Resolution c := .defaultDefinition h

end Proving.USC.T18.Ch1.Part2.Structure
