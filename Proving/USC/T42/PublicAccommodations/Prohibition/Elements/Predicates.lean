











import Proving.USC.T42.PublicAccommodations.Prohibition.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Elements

open Proving.USC.Common






axiom SufferedDiscriminationOrSegregation (p : Person) (est : Establishment) (c : ComplaintText) : Prop




axiom AtEstablishmentOrPlace (est : Establishment) (c : ComplaintText) : Prop






axiom RequiredByStateLaw (c : ComplaintText) : Prop










axiom RightSecuredBy2000a (r : SecuredRight) (c : ComplaintText) : Prop




axiom WithheldOrDeprivedRight (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop




axiom IntimidatedThreatenedCoerced (p : Person) (c : ComplaintText) : Prop





axiom PurposeOfInterfering (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop





axiom PunishedForExercising (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Prohibition.Elements
