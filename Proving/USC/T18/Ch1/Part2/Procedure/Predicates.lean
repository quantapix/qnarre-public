














import Proving.USC.T18.Ch1.Part2.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)






axiom RaisedInsanityDefense (p : Person) (c : ComplaintText) : Prop





axiom ProvedInsanityByClearAndConvincing (p : Person) (c : ComplaintText) : Prop








axiom ProsecutableInUSCourt (p : Person) (c : ComplaintText) : Prop





axiom FirstConvictionUnderMinorUse (p : Person) (c : ComplaintText) : Prop




axiom HasPriorConvictionUnderMinorUse (p : Person) (c : ComplaintText) : Prop







axiom RaisedDuressDefense (p : Person) (c : ComplaintText) : Prop





axiom SealMotionMade (p : Person) (c : ComplaintText) : Prop








axiom SealDatesExtracted (c : ComplaintText) (d : SealDates) : Prop





axiom ConvictionEnteredForOffense (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Part2.Procedure
