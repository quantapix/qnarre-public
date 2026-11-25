









import Proving.USC.T42.ReligiousFreedom.Ontology.Statute

namespace Proving.USC.T42.ReligiousFreedom.Ontology

open Proving.USC.Common



theorem indianMembership_intro {x t c}
    (hMember : IsIndian x c) (hTribe : IsIndianTribe t c)
    : IndianMembership x t c := ⟨hMember, hTribe⟩


theorem indianReligionMembership_intro {r cul c}
    (hA : IsPracticedByIndians r c) (hB : HasTraditionalIndianOrigin r cul c)
    : IndianReligionMembership r cul c := ⟨hA, hB⟩


theorem indianTribeMembership_intro {t c}
    (hRec : IsIndianTribe t c) : IndianTribeMembership t c := ⟨hRec⟩

end Proving.USC.T42.ReligiousFreedom.Ontology
