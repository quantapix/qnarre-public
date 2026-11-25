import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVII.Elements.Types











namespace Proving.USC.T42.TitleVII.Elements

open Proving.USC.Common






axiom IsCoveredRespondent (r : Respondent) (c : ComplaintText) : Prop



axiom AffectsCommerce (r : Respondent) (c : ComplaintText) : Prop




axiom IsCoveredEmployee (p : Person) (c : ComplaintText) : Prop




axiom NotStatutorilyExempt (r : Respondent) (c : ComplaintText) : Prop






axiom AdverseEmploymentAction (r : Respondent) (p : Person) (pr : Practice) (c : ComplaintText) : Prop




axiom BecauseOfProtectedGround (r : Respondent) (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop




axiom IsProtectedGround (g : ProtectedGround) (c : ComplaintText) : Prop




axiom NotBonaFideOccupationalQualification (r : Respondent) (pr : Practice) (c : ComplaintText) : Prop




axiom NotBonaFideSenioritySystem (r : Respondent) (pr : Practice) (c : ComplaintText) : Prop






axiom PracticeCausesDisparateImpact (r : Respondent) (pr : Practice) (g : ProtectedGround) (c : ComplaintText) : Prop




axiom NotJobRelatedBusinessNecessity (r : Respondent) (pr : Practice) (c : ComplaintText) : Prop





axiom WasMotivatingFactor (r : Respondent) (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop







axiom EngagedInProtectedActivity (p : Person) (c : ComplaintText) : Prop




axiom RetaliatoryCausation (r : Respondent) (p : Person) (c : ComplaintText) : Prop







axiom TimelyChargeFiled (p : Person) (ch : Charge) (c : ComplaintText) : Prop



axiom RightToSueAndTimelySuit (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVII.Elements
