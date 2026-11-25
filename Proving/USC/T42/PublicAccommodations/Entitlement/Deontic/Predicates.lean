












import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Deontic

open Proving.USC.Common









axiom AddresseeOperatesEstablishment (p : Person) (est : Establishment) (c : ComplaintText) : Prop





axiom DiscriminationActOccurred (p : Person) (est : Establishment) (c : ComplaintText) : Prop






axiom EstablishmentIsCovered (est : Establishment) (c : ComplaintText) : Prop





axiom IsPrivateClubExempt (est : Establishment) (c : ComplaintText) : Prop









axiom IsPersonAggrieved (p : Person) (c : ComplaintText) : Prop





axiom PreventiveReliefActionInstituted (p : Person) (c : ComplaintText) : Prop





axiom ProhibitedActEngagedOrImminent (c : ComplaintText) : Prop










axiom ProceedingInstitutedUnderSubchapter (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Entitlement.Deontic
