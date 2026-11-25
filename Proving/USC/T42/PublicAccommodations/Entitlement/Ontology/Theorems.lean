





import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Types
import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Predicates
import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Ontology

open Proving.USC.Common



theorem affectCommerce_intro {est x c}
    (hCommerce : IsCommerce x c) (hAffects : OperationsAffectCommerce est c)
    : AffectCommerceMembership est x c :=
  ⟨hCommerce, hAffects⟩



theorem placeOfPublicAccommodation_intro {e est s c}
    (hPpa : IsPlaceOfPublicAccommodation e c)
    (hServes : IsEstablishmentServingPublic est c)
    (hGate : OperationsAffectCommerce est c ∨ IsSupportedByStateAction s c)
    : PlaceOfPublicAccommodationMembership e est s c :=
  ⟨hPpa, hServes, hGate⟩

end Proving.USC.T42.PublicAccommodations.Entitlement.Ontology
