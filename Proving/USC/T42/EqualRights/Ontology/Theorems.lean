







import Proving.USC.T42.EqualRights.Ontology.Statute

namespace Proving.USC.T42.EqualRights.Ontology

open Proving.USC.Common


theorem equalContractRightMembership_intro {p r c}
    (hPerson : IsProtectedPerson p c) (hInUS : IsPersonInUS p c)
    (hRel : IsContractRelationship r c)
    : EqualContractRightMembership p r c :=
  ⟨hPerson, hInUS, hRel⟩


theorem equalPropertyRightMembership_intro {p x c}
    (hCitizen : IsCitizen p c) (hProp : IsProperty x c)
    : EqualPropertyRightMembership p x c :=
  ⟨hCitizen, hProp⟩


theorem damagesClaimMembership_intro {p d c}
    (hParty : IsComplainingParty p c) (hPractice : IsDiscriminatoryPractice d c)
    (hIntent : IntentToDiscriminate p c)
    : DamagesClaimMembership p d c :=
  ⟨hParty, hPractice, hIntent⟩


theorem complainingPartyCase_intro {p c}
    (hParty : IsComplainingParty p c)
    : ComplainingPartyCase p c :=
  .byEnumeration hParty

end Proving.USC.T42.EqualRights.Ontology
