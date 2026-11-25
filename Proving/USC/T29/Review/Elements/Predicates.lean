















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.Review.Elements.Types

namespace Proving.USC.T29.Review.Elements

open Proving.USC.Common







axiom IsUnfairLaborPracticeAffectingCommerce (u : UnfairLaborPractice) (c : ComplaintText) : Prop






axiom ChargeFiledWithinSixMonths (u : UnfairLaborPractice) (c : ComplaintText) : Prop





axiom ComplaintAndHearingAfforded (u : UnfairLaborPractice) (c : ComplaintText) : Prop





axiom BoardOrderOnPreponderance (o : BoardOrder) (u : UnfairLaborPractice) (c : ComplaintText) : Prop











axiom OrderIsFinalGrantingOrDenying (o : BoardOrder) (c : ComplaintText) : Prop








axiom IsProperReviewingCourt (court : ReviewingCourt) (p : Person) (u : UnfairLaborPractice) (c : ComplaintText) : Prop





axiom FiledWrittenReviewPetition (o : BoardOrder) (p : Person) (court : ReviewingCourt) (c : ComplaintText) : Prop








axiom BoardPetitionedProperEnforcementCourt (o : BoardOrder) (court : ReviewingCourt) (c : ComplaintText) : Prop





axiom FindingsSupportedBySubstantialEvidence (o : BoardOrder) (c : ComplaintText) : Prop






axiom ObjectionUrgedBeforeBoard (o : BoardOrder) (c : ComplaintText) : Prop

end Proving.USC.T29.Review.Elements
