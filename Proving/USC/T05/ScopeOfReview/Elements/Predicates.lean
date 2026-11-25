












import Proving.USC.T05.ScopeOfReview.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.ScopeOfReview.Elements

open Proving.USC.Common







axiom IsReviewingCourt (court : ReviewingCourt) (a : AgencyAction) (c : ComplaintText) : Prop





axiom NecessaryToPreventIrreparableInjury (a : AgencyAction) (c : ComplaintText) : Prop





axiom ReliefPostponesOrPreservesPendingReview (a : AgencyAction) (c : ComplaintText) : Prop









axiom RelevantQuestionOfLawPresented (a : AgencyAction) (c : ComplaintText) : Prop






axiom ActionUnlawfullyWithheldOrDelayed (a : AgencyAction) (c : ComplaintText) : Prop






axiom ArbitraryCapricious (a : AgencyAction) (c : ComplaintText) : Prop




axiom ContraryToConstitutionalRight (a : AgencyAction) (c : ComplaintText) : Prop




axiom InExcessOfStatutoryAuthority (a : AgencyAction) (c : ComplaintText) : Prop




axiom WithoutObservanceOfProcedure (a : AgencyAction) (c : ComplaintText) : Prop





axiom UnsupportedBySubstantialEvidence (a : AgencyAction) (c : ComplaintText) : Prop




axiom UnwarrantedByFactsDeNovo (a : AgencyAction) (c : ComplaintText) : Prop







axiom WholeRecordReviewed (a : AgencyAction) (c : ComplaintText) : Prop






axiom HarmlessError (a : AgencyAction) (c : ComplaintText) : Prop

end Proving.USC.T05.ScopeOfReview.Elements
