







import Proving.USC.T22.Ontology.Types

namespace Proving.USC.T22.Ontology
open Proving.USC.Common




axiom IsAbuseOfLegalProcess (lp : LegalProcess) (c : ComplaintText) : Prop




axiom IsAppropriateCongressionalCommittee (b : GovBody) (c : ComplaintText) : Prop




axiom IsCoercion (cond : Condition) (c : ComplaintText) : Prop




axiom IsCommercialSexAct (a : SexAct) (c : ComplaintText) : Prop




axiom IsConcreteActions (ga : GovAction) (c : ComplaintText) : Prop




axiom IsCredibleInformation (i : Information) (c : ComplaintText) : Prop




axiom IsDebtBondage (cond : Condition) (c : ComplaintText) : Prop



axiom IsInvoluntaryServitude (cond : Condition) (c : ComplaintText) : Prop




axiom IsMinimumStandardsForElimination (c : ComplaintText) : Prop




axiom IsNonhumanitarianNontradeForeignAssistance (fa : ForeignAssistance) (c : ComplaintText) : Prop





axiom IsSevereFormsOfTrafficking (pr : Practice) (c : ComplaintText) : Prop




axiom IsSexTrafficking (pr : Practice) (c : ComplaintText) : Prop




axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsTaskForce (b : GovBody) (c : ComplaintText) : Prop




axiom IsUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsVictimOfSevereFormOfTrafficking (p : Person) (c : ComplaintText) : Prop




axiom IsVictimOfTrafficking (p : Person) (c : ComplaintText) : Prop




axiom IsGroundsRelatedToHumanTrafficking (c : ComplaintText) : Prop

end Proving.USC.T22.Ontology
