






import Proving.USC.T18.Enf.Ontology.Statute

namespace Proving.USC.T18.Enf.Ontology

open Proving.USC.Common


theorem forfeitablePropertyMembership_introReal {x c}
    (h : IsRealProperty x c) : ForfeitablePropertyMembership x c :=
  .real h


theorem forfeitablePropertyMembership_introPersonal {x c}
    (h : IsPersonalProperty x c) : ForfeitablePropertyMembership x c :=
  .personal h



theorem forfeitableInterestMembership_intro {i p c}
    (hI : IsForfeitableInterest i c) (hV : IsSection1962Violation p c)
    : ForfeitableInterestMembership i p c :=
  ⟨hI, hV⟩



theorem injuredPersonMembership_intro {p c}
    (hInj : IsInjuredPerson p c) (hV : IsSection1962Violation p c)
    : InjuredPersonMembership p c :=
  ⟨hInj, hV⟩


theorem venueMembership_intro {p c}
    (hN : HasVenueNexus p c) : VenueMembership p c :=
  ⟨hN⟩

end Proving.USC.T18.Enf.Ontology
