



















































import Proving.USC.T42.ReligiousFreedom.Elements.Statute
import Proving.USC.T42.ReligiousFreedom.Bridge
import Proving.USC.Common.Types

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T42.ReligiousFreedom




abbrev s1996a_ReligiousFreedom (p : Person) (a : Elements.PeyoteAct) (c : ComplaintText) : Prop :=
  Elements.Section1996a p a c





abbrev s1996b_ReligiousFreedom (p : Person) (d : Elements.PlacementDecision) (c : ComplaintText) : Prop :=
  Elements.Section1996b p d c








abbrev s1996_ReligiousFreedom (p : Person) (c : ComplaintText) : Prop :=
  Elements.Section1996 p c

end Proving.USC.Reconciled
