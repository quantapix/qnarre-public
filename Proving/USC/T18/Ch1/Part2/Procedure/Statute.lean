









import Proving.USC.T18.Ch1.Part2.Procedure.Types
import Proving.USC.T18.Ch1.Part2.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)




structure Transition where
  src   : State
  dst   : State
  guard : Prop









structure EstablishInsanityDefense (p : Person) (c : ComplaintText) : Prop where
  raised        : RaisedInsanityDefense p c
  burdenMet     : ProvedInsanityByClearAndConvincing p c








structure FirstConvictionPenaltyTrigger (p : Person) (c : ComplaintText) : Prop where
  prosecutable  : ProsecutableInUSCourt p c
  firstConv     : FirstConvictionUnderMinorUse p c




structure SubsequentConvictionPenaltyTrigger (p : Person) (c : ComplaintText) : Prop where
  prosecutable  : ProsecutableInUSCourt p c
  priorConv     : HasPriorConvictionUnderMinorUse p c












def WithinSealWindow (d : SealDates) (queryDay : Nat) : Prop :=
  d.sealGrantedDay ≤ queryDay ∧ queryDay < d.convictionDay



instance (d : SealDates) (q : Nat) : Decidable (WithinSealWindow d q) := by
  unfold WithinSealWindow; exact inferInstance



def WellFormedSealWindow (d : SealDates) : Prop :=
  d.sealGrantedDay ≤ d.convictionDay

instance (d : SealDates) : Decidable (WellFormedSealWindow d) := by
  unfold WellFormedSealWindow; exact inferInstance





structure ProperSeal (p : Person) (c : ComplaintText) (d : SealDates) : Prop where
  duressRaised  : RaisedDuressDefense p c
  motionMade    : SealMotionMade p c
  datesExtracted : SealDatesExtracted c d
  windowOk      : WellFormedSealWindow d

end Proving.USC.T18.Ch1.Part2.Procedure
