import Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology.Statute

set_option autoImplicit false
open Proving.USC.Common










namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology


theorem weaponizedAgent_intro {s : Substance} {c : ComplaintText}
    (hAgent : IsBiologicalAgent s c) (hWeapon : IsForUseAsAWeapon s c) :
    WeaponizedAgent s c :=
  ⟨hAgent, hWeapon⟩


theorem selectAgentComposition_intro {s : Substance} {c : ComplaintText}
    (hAgent : IsBiologicalAgent s c) (hSelect : IsSelectAgent s c) :
    SelectAgentComposition s c :=
  ⟨hAgent, hSelect⟩


theorem vectorMembership_intro {v : Instrumentality} {s : Substance} {c : ComplaintText}
    (hAgent : IsBiologicalAgent s c) (hVector : IsVector v c) :
    VectorMembership v s c :=
  ⟨hAgent, hVector⟩


theorem deliveryViaVector_intro {x : Instrumentality} {c : ComplaintText}
    (hVector : IsVector x c) (hDelivery : IsDeliverySystem x c) :
    DeliveryViaVector x c :=
  ⟨hVector, hDelivery⟩



theorem preparerMembership_intro {p : Person} {d : Document} {c : ComplaintText}
    (hDoc : IsDocumentForFiling d c) (hPrep : IsBankruptcyPetitionPreparer p c) :
    PreparerMembership p d c :=
  ⟨hDoc, hPrep⟩


theorem filingByDebtor_intro {d : Document} {p : Person} {c : ComplaintText}
    (hDebtor : IsDebtor p c) (hDoc : IsDocumentForFiling d c) :
    FilingByDebtor d p c :=
  ⟨hDebtor, hDoc⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology
