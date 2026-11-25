









import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Ontology

open Proving.USC.Common




axiom IsPlaceOfPublicAccommodation (e : PlaceOfPublicAccommodation) (c : ComplaintText) : Prop




axiom IsEstablishmentServingPublic (est : Establishment) (c : ComplaintText) : Prop




axiom OperationsAffectCommerce (est : Establishment) (c : ComplaintText) : Prop





axiom IsCommerce (x : Commerce) (c : ComplaintText) : Prop





axiom IsSupportedByStateAction (s : StateActionSupport) (c : ComplaintText) : Prop




axiom IsPrivateClubExempt (est : Establishment) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Entitlement.Ontology
