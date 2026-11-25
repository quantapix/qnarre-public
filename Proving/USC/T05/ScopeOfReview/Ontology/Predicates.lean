













import Proving.USC.T05.ScopeOfReview.Ontology.Types

namespace Proving.USC.T05.ScopeOfReview.Ontology

open Proving.USC.Common





axiom IsReviewingCourt (court : ReviewingCourt) (c : ComplaintText) : Prop




axiom IsAgencyAction (a : AgencyAction) (c : ComplaintText) : Prop





axiom PresentsQuestionOfLaw (a : AgencyAction) (c : ComplaintText) : Prop




axiom IsWholeRecord (r : Record) (c : ComplaintText) : Prop




axiom SatisfiesRuleOfPrejudicialError (a : AgencyAction) (r : Record) (c : ComplaintText) : Prop




axiom IsSetAsideGround (g : SetAsideGround) (a : AgencyAction) (c : ComplaintText) : Prop




axiom IsUnlawfullyWithheldOrDelayed (a : AgencyAction) (c : ComplaintText) : Prop




axiom WarrantsReliefPendingReview (a : AgencyAction) (c : ComplaintText) : Prop





axiom IsAggrievedByAgencyAction (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T05.ScopeOfReview.Ontology
