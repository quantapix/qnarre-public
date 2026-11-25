







import Proving.USC.T18.Ch77.Elements.Statute
set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Elements
open Proving.USC.Common

theorem section1581a_intro {d : Person} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hConduct : Section1581aConduct d c)
    : Section1581a d c :=
  ⟨hCulp, hConduct⟩

theorem section1583a_intro {d : Person} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hConduct : Section1583aConduct d c)
    : Section1583a d c :=
  ⟨hCulp, hConduct⟩

theorem section1589a_intro {d : Person} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hScien   : ActedWithScienter d c)
    (hObtains : ProvidesOrObtainsLabor d c)
    (hMeans   : ForcedLaborMeans d c)
    : Section1589a d c :=
  ⟨hCulp, hScien, hObtains, hMeans⟩

theorem section1589b_intro {d : Person} {ven : Venture} {c : ComplaintText}
    (hCulp     : CulpablePersonCapableOfIntent d c)
    (hBenefits : KnowinglyBenefitsFromVenture d ven c)
    (hVenture  : VentureEngagedInForcedLabor ven c)
    (hScien    : KnewOrRecklesslyDisregardedVentureMeans d c)
    : Section1589b d ven c :=
  ⟨hCulp, hBenefits, hVenture, hScien⟩

theorem section1590a_intro {d : Person} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hScien   : ActedWithScienter d c)
    (hAct     : TraffickingActForLabor d c)
    (hPurpose : ForLaborInViolationOfChapter d c)
    : Section1590a d c :=
  ⟨hCulp, hScien, hAct, hPurpose⟩

theorem section1591a_intro {d : Person} {ven : Venture} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hScien   : ActedWithScienter d c)
    (hJuris   : InCommerceOrSpecialJurisdiction c)
    (hConduct : Section1591Conduct d ven c)
    (hPred    : Section1591Predicate d c)
    : Section1591a d ven c :=
  ⟨hCulp, hScien, hJuris, hConduct, hPred⟩

theorem section1592a_intro {d : Person} {doc : Document} {c : ComplaintText}
    (hCulp    : CulpablePersonCapableOfIntent d c)
    (hScien   : ActedWithScienter d c)
    (hTampers : TampersWithDocument d doc c)
    (hIdDoc   : DocumentIsIdentityDocumentOfAnother doc c)
    (hPurpose : Section1592Purpose d c)
    (hNotExc  : ¬ VictimExceptionApplies d c)
    : Section1592a d doc c :=
  ⟨hCulp, hScien, hTampers, hIdDoc, hPurpose, hNotExc⟩

theorem obstructionOffense_intro {d : Person} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c)
    (hObst : ObstructsChapterEnforcement d c)
    : ObstructionOffense d c :=
  ⟨hCulp, hObst⟩

end Proving.USC.T18.Ch77.Elements
