










import Proving.USC.T18.Enf.Ontology.Types

namespace Proving.USC.T18.Enf.Ontology

open Proving.USC.Common








axiom IsForfeitableInterest (i : Interest) (c : ComplaintText) : Prop







axiom IsForfeitableProperty (x : Property) (c : ComplaintText) : Prop





axiom IsRealProperty (x : Property) (c : ComplaintText) : Prop






axiom IsPersonalProperty (x : Property) (c : ComplaintText) : Prop







axiom IsBonaFidePurchaser (p : Person) (c : ComplaintText) : Prop






axiom IsInjuredPerson (p : Person) (c : ComplaintText) : Prop






axiom HasVenueNexus (p : Person) (c : ComplaintText) : Prop










axiom IsSection1962Violation (p : Person) (c : ComplaintText) : Prop





axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Enf.Ontology
