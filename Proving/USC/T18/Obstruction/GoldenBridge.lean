







































import Proving.Rico.Statute
import Proving.USC.T18.Obstruction.Elements.Statute

namespace Proving.USC.T18.Obstruction.GoldenBridge

open Proving.USC.Common








axiom mapAct : Prop → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText










axiom corr_1503_is_racketeering
    {p : Person} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1503Omnibus p op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1503Omnibus p op c)) (mapComplaint c)

axiom corr_1512_is_racketeering
    {p : Person} {w : Elements.ProtectedWitness} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1512Intimidation p w op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1512Intimidation p w op c)) (mapComplaint c)

axiom corr_1513_is_racketeering
    {p : Person} {w : Elements.ProtectedWitness} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1513Injury p w op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1513Injury p w op c)) (mapComplaint c)





theorem s1503_implies_racketeering
    {p : Person} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1503Omnibus p op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1503Omnibus p op c)) (mapComplaint c) :=
  corr_1503_is_racketeering h



theorem s1512_implies_racketeering
    {p : Person} {w : Elements.ProtectedWitness} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1512Intimidation p w op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1512Intimidation p w op c)) (mapComplaint c) :=
  corr_1512_is_racketeering h



theorem s1513_implies_racketeering
    {p : Person} {w : Elements.ProtectedWitness} {op : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1513Injury p w op c) :
    Proving.Rico.IsRacketeeringActivity (mapAct (Elements.Section1513Injury p w op c)) (mapComplaint c) :=
  corr_1513_is_racketeering h

end Proving.USC.T18.Obstruction.GoldenBridge
