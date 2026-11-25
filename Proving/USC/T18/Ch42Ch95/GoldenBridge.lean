










































import Proving.Rico.Predicates
import Proving.USC.T18.Ch42Ch95.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch42Ch95








opaque Act : Type
axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText






axiom corr_892_B {p x ag c} (act : Act) :
  Elements.Section892a p x ag c →
  Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s892_elements_implies_rico_1961B
    {p : Person} {x : Elements.ExtensionOfCredit} {ag : Agreement}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section892a p x ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_892_B act h





axiom corr_894_B {p k x ag c} (act : Act) :
  Elements.Section894a p k x ag c →
  Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s894_elements_implies_rico_1961B
    {p : Person} {k : Elements.CollectionConduct} {x : Elements.ExtensionOfCredit}
    {ag : Agreement} {c : ComplaintText} (act : Act)
    (h : Elements.Section894a p k x ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_894_B act h





axiom corr_1952_B {p a u c} (act : Act) :
  Elements.Section1952a p a u c →
  Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s1952_elements_implies_rico_1961B
    {p : Person} {a : Elements.InterstateAct} {u : Elements.UnlawfulActivity}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section1952a p a u c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1952_B act h










axiom corr_1956_B {p pr t m s ag c} (act : Act) :
  Elements.Section1956Offense p pr t m s ag c →
  Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s1956_elements_implies_rico_1961B
    {p : Person} {pr : Elements.LaunderedProperty}
    {t : Elements.FinancialTransaction} {m : Elements.MonetaryTransfer}
    {s : Elements.SpecifiedUnlawfulActivity} {ag : Agreement}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section1956Offense p pr t m s ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1956_B act h

end Proving.USC.T18.Ch42Ch95.GoldenBridge
