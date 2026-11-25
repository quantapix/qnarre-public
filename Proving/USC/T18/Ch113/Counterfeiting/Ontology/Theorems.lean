








import Proving.USC.T18.Ch113.Counterfeiting.Ontology.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Ontology

open Proving.USC.Common



theorem counterfeitLabel_intro {l c}
    (h : LabelAppearsGenuineButIsNot l c) : CounterfeitLabel l c :=
  ⟨h⟩



theorem illicitLabel_intro {l c}
    (hA : UsedByCopyrightOwnerToVerify l c)
    (hB : WithoutCopyrightOwnerAuthorization l c) : IllicitLabel l c :=
  ⟨hA, hB⟩



theorem counterfeitDocumentationOrPackaging_intro {d c}
    (hDoc : IsDocumentationOrPackaging d c)
    (hApp : PackagingAppearsGenuineButIsNot d c)
    : CounterfeitDocumentationOrPackaging d c :=
  ⟨hDoc, hApp⟩


theorem counterfeitMark_intro_spuriousMark {m c}
    (h : IsSpuriousMarkAllConditions m c) : CounterfeitMark m c :=
  .spuriousMark h



theorem counterfeitMark_intro_spuriousDesignation {m c}
    (h : IsSpuriousLanhamDesignation m c) : CounterfeitMark m c :=
  .spuriousDesignation h



theorem counterfeitMilitaryGoodOrService_intro {g c}
    (hMark : GoodBearsCounterfeitMark g c)
    (hMil : GoodMeetsMilitaryNexus g c)
    : CounterfeitMilitaryGoodOrService g c :=
  ⟨hMark, hMil⟩

end Proving.USC.T18.Ch113.Counterfeiting.Ontology
