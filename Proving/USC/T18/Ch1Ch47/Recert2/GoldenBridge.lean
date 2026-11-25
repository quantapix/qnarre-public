













































import Proving.Rico.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.GoldenBridge

open Proving.USC.Common








opaque Act : Type
axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText







axiom corr_1028_B {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText}
    (act : Act) :
    Elements.ViolatesSection1028a p d m o c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)




theorem s1028_elements_implies_rico_1961B
    {p : Person} {d : Elements.Document} {m : Elements.MeansOfIdentification}
    {o : Elements.Offense} {c : ComplaintText} (act : Act)
    (hViol : Elements.ViolatesSection1028a p d m o c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1028_B act hViol





axiom corr_1029_B {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} (act : Act) :
    Elements.ViolatesSection1029a p ad eq o c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s1029_elements_implies_rico_1961B
    {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} (act : Act)
    (hViol : Elements.ViolatesSection1029a p ad eq o c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1029_B act hViol

end Proving.USC.T18.Ch1Ch47.Recert2.GoldenBridge
