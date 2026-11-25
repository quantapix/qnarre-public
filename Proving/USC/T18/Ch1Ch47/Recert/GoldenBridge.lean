





































import Proving.Rico.Predicates
import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch1Ch47.Recert









opaque Act : Type

axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText






axiom corr_1028_B
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText} (a : Act) :
    Elements.Section1028Offense p d af impl m act c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



theorem s1028_elements_implies_rico_1961B
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText} (a : Act)
    (h : Elements.Section1028Offense p d af impl m act c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1028_B a h





axiom corr_1029_B
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText} (a : Act) :
    Elements.Section1029Offense p dme ti sr hw act c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



theorem s1029_elements_implies_rico_1961B
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText} (a : Act)
    (h : Elements.Section1029Offense p dme ti sr hw act c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1029_B a h

end Proving.USC.T18.Ch1Ch47.Recert.GoldenBridge
