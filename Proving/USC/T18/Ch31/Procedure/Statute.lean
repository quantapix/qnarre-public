










import Proving.USC.T18.Ch31.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch31.Procedure

open Proving.USC.Common




structure ProsecutableTaking659 (p : Person) (c : ComplaintText) : Prop where
  commenced : ProsecutionCommenced p c
  venue     : VenueProperTaking p c
  notBarred : ¬ PriorStateJudgmentOnMerits p c





structure ProsecutableTransport659 (p : Person) (c : ComplaintText) : Prop where
  commenced : ProsecutionCommenced p c
  venue     : VenueProperTransport p c
  notBarred : ¬ PriorStateJudgmentOnMerits p c




structure StateProsecutionBar659 (p : Person) (c : ComplaintText) : Prop where
  priorJudgment : PriorStateJudgmentOnMerits p c




structure PenaltyEligible664 (p : Person) (c : ComplaintText) : Prop where
  conviction : ConvictionEntered664 p c

end Proving.USC.T18.Ch31.Procedure
