











import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Evidentiary.Types
import Proving.USC.T18.Spec.Evidentiary.Predicates

namespace Proving.USC.T18.Spec.Evidentiary

open Proving.USC.Common (ComplaintText)



structure Proof1964c (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation1964c.1 Allocation1964c.2.1 c





structure Proof1964d (c : ComplaintText) : Prop where
  presumed : PresumptionApplies Allocation1964d.2.2 c
  carried  : BurdenCarried Allocation1964d.1 Allocation1964d.2.1 c




structure Proof1968e (c : ComplaintText) : Prop where
  presumed     : PresumptionApplies Allocation1968e.2.2 c
  notRebutted  : ¬ PresumptionRebutted Allocation1968e.2.2 c



structure Proof1963 (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation1963.1 Allocation1963.2.1 c






def Section1964cEstablished (c : ComplaintText) : Prop :=
  Proof1964c c



def Section1964dEstablished (c : ComplaintText) : Prop :=
  Proof1964d c



def Section1968eEstablished (c : ComplaintText) : Prop :=
  Proof1968e c



def Section1963Established (c : ComplaintText) : Prop :=
  Proof1963 c

end Proving.USC.T18.Spec.Evidentiary
