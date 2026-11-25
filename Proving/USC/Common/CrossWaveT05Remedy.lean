








































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T05.Remedy.Predicates

namespace Proving.USC.Common.CrossWaveT05Remedy

open Proving.USC.Common









axiom bridge_privateRight_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c

theorem collapse_privateRight_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c :=
  bridge_privateRight_iff






axiom bridge_redressable_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Remedy.ReliefRedressable p c ↔ ReliefRedressable p c

theorem collapse_redressable_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Remedy.ReliefRedressable p c ↔ ReliefRedressable p c :=
  bridge_redressable_iff
















axiom bridge_aggrieved_joint {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Remedy.InjuryCognizable p c → Proving.USC.T05.Remedy.CausedByViolation p c →
    AggrievedByAgencyAction p c

theorem collapse_aggrieved_joint {p : Person} {c : ComplaintText}
    (hInj : Proving.USC.T05.Remedy.InjuryCognizable p c)
    (hCaus : Proving.USC.T05.Remedy.CausedByViolation p c) :
    AggrievedByAgencyAction p c :=
  bridge_aggrieved_joint hInj hCaus

end Proving.USC.Common.CrossWaveT05Remedy
