








import Proving.USC.T18.RacketeeringActs.Ontology.Types

namespace Proving.USC.T18.RacketeeringActs.Ontology

open Proving.USC.Common






axiom IsRacketeeringActivity (o : Offence) (c : ComplaintText) : Prop





axiom IsTitle18PredicateOffence (o : Offence) (c : ComplaintText) : Prop







axiom IsRobbery (o : Offence) (c : ComplaintText) : Prop





axiom IsExtortion (o : Offence) (c : ComplaintText) : Prop







axiom AffectsCommerce (o : Offence) (c : ComplaintText) : Prop








axiom IsUnlawfulActivity (o : Offence) (c : ComplaintText) : Prop







axiom IsSpecifiedUnlawfulActivity (o : Offence) (c : ComplaintText) : Prop






axiom IsFinancialTransaction (t : Transaction) (c : ComplaintText) : Prop





axiom IsMonetaryInstrument (p : Property) (c : ComplaintText) : Prop




axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop





axiom IsProceeds (p : Property) (c : ComplaintText) : Prop








axiom IsMonetaryTransaction (t : Transaction) (c : ComplaintText) : Prop




axiom IsCriminallyDerivedProperty (p : Property) (c : ComplaintText) : Prop

end Proving.USC.T18.RacketeeringActs.Ontology
