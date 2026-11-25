












import Proving.USC.T29.SelfOrgRep.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Ontology

open Proving.USC.Common




axiom IsLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop





axiom IsEmployee (p : Person) (c : ComplaintText) : Prop





axiom IsConcertedActivity (p : Person) (c : ComplaintText) : Prop





axiom IsRepresentative (r : Representative) (c : ComplaintText) : Prop






axiom IsExclusiveRepresentative (r : Representative) (u : BargainingUnit) (c : ComplaintText) : Prop





axiom IsAppropriateBargainingUnit (u : BargainingUnit) (c : ComplaintText) : Prop





axiom IsRepresentationQuestion (q : RepresentationQuestion) (c : ComplaintText) : Prop





axiom IsRepresentationPetition (pt : RepresentationPetition) (c : ComplaintText) : Prop





axiom AffectsCommerce (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T29.SelfOrgRep.Ontology
