

































































































import Proving.USC.T18.Ch47.Elements.Statute
import Proving.USC.T18.Ch47.Deontic.Statute
import Proving.USC.T18.Ch47.Ontology.Statute
import Proving.USC.T18.Ch47.Procedure.Statute
import Proving.USC.T18.Ch47.Bridge
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T18.Ch47












abbrev ViolationOfSection1028
    (p : Person) (i : Elements.Item) (items : List Elements.Item)
    (c : ComplaintText) : Prop :=
  Elements.ViolationOfSection1028 p i items c



abbrev InchoateSection1028
    (p : Person) (o : Elements.Offense) (ag : Agreement) (c : ComplaintText) : Prop :=
  Elements.InchoateSection1028 p o ag c

















abbrev ViolationOfSection1029
    (p : Person) (d : Elements.Device) (devices : List Elements.Device)
    (aggregateValueUSD : Nat) (spanDays : Nat) (c : ComplaintText) : Prop :=
  Elements.ViolationOfSection1029 p d devices aggregateValueUSD spanDays c





abbrev InchoateSection1029
    (p : Person) (o : Elements.Offense) (ag : Agreement) (c : ComplaintText) : Prop :=
  Elements.InchoateSection1029 p o ag c






example (p : Person) (i : Elements.Item) (items : List Elements.Item)
    (c : ComplaintText) :
    ViolationOfSection1028 p i items c = Elements.ViolationOfSection1028 p i items c :=
  rfl

example (p : Person) (d : Elements.Device) (devices : List Elements.Device)
    (v s : Nat) (c : ComplaintText) :
    ViolationOfSection1029 p d devices v s c
      = Elements.ViolationOfSection1029 p d devices v s c :=
  rfl

end Proving.USC.Reconciled
