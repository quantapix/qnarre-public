















import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Elements

open Proving.USC.Common






axiom DeniedFullAndEqualEnjoyment (p : Person) (e : Establishment) (c : ComplaintText) : Prop





axiom DiscriminatedOnProhibitedGround (p : Person) (e : Establishment) (c : ComplaintText) : Prop




axiom IsEnumeratedEstablishment (e : Establishment) (c : ComplaintText) : Prop









axiom OperationsAffectCommerce (e : Establishment) (c : ComplaintText) : Prop






axiom DiscriminationSupportedByStateAction (e : Establishment) (c : ComplaintText) : Prop






axiom NotExemptPrivateClub (e : Establishment) (c : ComplaintText) : Prop






axiom IsPersonAggrieved (p : Person) (c : ComplaintText) : Prop




axiom SeeksPreventiveRelief (p : Person) (c : ComplaintText) : Prop






axiom GaveStatePresuitNotice (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Entitlement.Elements
