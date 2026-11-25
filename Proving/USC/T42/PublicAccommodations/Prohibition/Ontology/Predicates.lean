










import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Ontology

open Proving.USC.Common





axiom IsEstablishment (x : Establishment) (c : ComplaintText) : Prop






axiom IsStateLawInstrument (x : StateLawInstrument) (c : ComplaintText) : Prop




axiom IsDiscriminatoryTreatment (x : DiscriminatoryTreatment) (c : ComplaintText) : Prop




axiom IsOnProtectedGround (x : DiscriminatoryTreatment) (g : ProtectedGround) (c : ComplaintText) : Prop





axiom IsSecuredRight (x : SecuredRight) (c : ComplaintText) : Prop






axiom IsInterferingAct (x : InterferingAct) (r : SecuredRight) (c : ComplaintText) : Prop





axiom IsAffectedPerson (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Prohibition.Ontology
