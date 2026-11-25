












import Proving.USC.T42.GoldenAdjacent.Ontology.Types

namespace Proving.USC.T42.GoldenAdjacent.Ontology

open Proving.USC.Common






axiom IsCitizen (x : Citizen) (c : ComplaintText) : Prop




axiom IsWhiteCitizenComparator (w : WhiteCitizenComparator) (c : ComplaintText) : Prop




axiom IsProperty (p : Property) (c : ComplaintText) : Prop




axiom IsPropertyRightExercise (e : PropertyRightExercise) (c : ComplaintText) : Prop






axiom IsPrevailingParty (x : PrevailingParty) (c : ComplaintText) : Prop





axiom IsCivilRightsEnforcementAction (a : CivilRightsEnforcementAction) (c : ComplaintText) : Prop




axiom IsReasonableAttorneysFee (f : ReasonableAttorneysFee) (c : ComplaintText) : Prop




axiom IsExpertFee (f : ExpertFee) (c : ComplaintText) : Prop





axiom IsJudicialOfficer (j : JudicialOfficer) (c : ComplaintText) : Prop




axiom IsActInExcessOfJurisdiction (j : JudicialOfficer) (c : ComplaintText) : Prop





axiom IsCivilRightsJurisdiction (j : CivilRightsJurisdiction) (c : ComplaintText) : Prop

end Proving.USC.T42.GoldenAdjacent.Ontology
