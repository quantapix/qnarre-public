






























import Proving.USC.T18.Trafficking.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Trafficking.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Trafficking








axiom mapAct       : Elements.TraffickingAct → Proving.Rico.Act
axiom mapComplaint : ComplaintText          → Proving.Rico.ComplaintText











axiom corr_1581_is_racketeering {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1581 p v c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)


axiom corr_1589_is_racketeering {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1589 p v e c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)


axiom corr_1590_is_racketeering {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1590 p v a c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)


axiom corr_1591_is_racketeering {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1591 p v e a c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)





theorem s1581_elements_implies_rico
    {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1581 p v c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1581_is_racketeering h


theorem s1589_elements_implies_rico
    {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1589 p v e c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1589_is_racketeering h


theorem s1590_elements_implies_rico
    {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1590 p v a c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1590_is_racketeering h


theorem s1591_elements_implies_rico
    {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1591 p v e a c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1591_is_racketeering h







theorem trafficking_elements_implies_rico_all :
    (∀ {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText},
        Elements.Section1581 p v c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c))
  ∧ (∀ {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText},
        Elements.Section1589 p v e c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c))
  ∧ (∀ {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText},
        Elements.Section1590 p v a c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c))
  ∧ (∀ {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText},
        Elements.Section1591 p v e a c → Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)) :=
  ⟨fun h => s1581_elements_implies_rico h,
   fun h => s1589_elements_implies_rico h,
   fun h => s1590_elements_implies_rico h,
   fun h => s1591_elements_implies_rico h⟩

end Proving.USC.T18.Trafficking.GoldenBridge
