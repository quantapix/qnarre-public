













import Proving.USC.T18.Ch25.Procedure.Types
import Proving.USC.T18.Ch25.Procedure.Predicates

namespace Proving.USC.T18.Ch25.Procedure

open Proving.USC.Common



structure Transition where
  src   : State
  dst   : State
  guard : Prop



structure TimelyProsecution471 (p : Person) (c : ComplaintText) : Prop where
  offense   : OffenseCommitted471 p c
  commenced : ProsecutionCommenced p c
  inWindow  : WithinLimitationsPeriod p c


structure TimelyProsecution472 (p : Person) (c : ComplaintText) : Prop where
  offense   : OffenseCommitted472 p c
  commenced : ProsecutionCommenced p c
  inWindow  : WithinLimitationsPeriod p c


structure TimelyProsecution473 (p : Person) (c : ComplaintText) : Prop where
  offense   : OffenseCommitted473 p c
  commenced : ProsecutionCommenced p c
  inWindow  : WithinLimitationsPeriod p c


def commitToProsecuted471 (p : Person) (c : ComplaintText) : Transition :=
  { src := State.Committed, dst := State.Prosecuted,
    guard := TimelyProsecution471 p c }



inductive TimelyCounterfeitProsecution (p : Person) (c : ComplaintText) : Prop
  | making   : TimelyProsecution471 p c → TimelyCounterfeitProsecution p c
  | uttering : TimelyProsecution472 p c → TimelyCounterfeitProsecution p c
  | dealing  : TimelyProsecution473 p c → TimelyCounterfeitProsecution p c

end Proving.USC.T18.Ch25.Procedure
