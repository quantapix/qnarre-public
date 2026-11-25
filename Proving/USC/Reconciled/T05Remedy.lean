




































































import Proving.USC.T05.Remedy.Theorems
import Proving.USC.T05.Remedy.Bridge
import Proving.USC.T05.Elements.Theorems
import Proving.USC.Common.Predicates

namespace Proving.USC.Reconciled.T05Remedy

open Proving.USC.T05
open Proving.USC.Common








theorem s706_tierA_corroborated
    {p : Person} {c : ComplaintText}
    (h : Remedy.AgencyActionSetAsideGround .arbitraryCapricious p c) :
    T05.Elements.ArbitraryOrCapricious (Remedy.Bridge.corr_challengedAction p c) c :=
  Remedy.Bridge.s706_2A_remedy_implies_elements h






end Proving.USC.Reconciled.T05Remedy
