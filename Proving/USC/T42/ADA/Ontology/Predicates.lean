








import Proving.USC.T42.ADA.Ontology.Types

namespace Proving.USC.T42.ADA.Ontology

open Proving.USC.Common




axiom IsDisability (d : Disability) (c : ComplaintText) : Prop



axiom IsImpairment (i : Impairment) (c : ComplaintText) : Prop



axiom IsMajorLifeActivity (a : MajorLifeActivity) (c : ComplaintText) : Prop




axiom SubstantiallyLimits (i : Impairment) (a : MajorLifeActivity) (c : ComplaintText) : Prop




axiom IsCoveredEntity (ce : CoveredEntity) (c : ComplaintText) : Prop




axiom IsEmployer (p : Person) (c : ComplaintText) : Prop




axiom IsQualifiedIndividual (p : Person) (c : ComplaintText) : Prop





axiom IsQualifiedIndividualWithDisability (p : Person) (c : ComplaintText) : Prop




axiom IsDirectThreat (dt : DirectThreat) (c : ComplaintText) : Prop



axiom IsReasonableAccommodation (ra : ReasonableAccommodation) (c : ComplaintText) : Prop




axiom IsUndueHardship (uh : UndueHardship) (c : ComplaintText) : Prop




axiom IsIllegalDrugUse (idu : IllegalDrugUse) (c : ComplaintText) : Prop




axiom IsPublicEntity (pe : PublicEntity) (c : ComplaintText) : Prop



axiom IsPrivateEntity (prv : PrivateEntity) (c : ComplaintText) : Prop




axiom IsPublicAccommodation (pa : PublicAccommodation) (c : ComplaintText) : Prop




axiom IsCommercialFacility (cf : CommercialFacility) (c : ComplaintText) : Prop




axiom IsReadilyAchievable (rachv : ReadilyAchievable) (c : ComplaintText) : Prop




axiom IsSpecifiedPublicTransportation (spt : SpecifiedPublicTransportation) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Ontology
