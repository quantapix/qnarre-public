














import Proving.USC.T18.Ch113.Ontology.Types
import Proving.USC.T18.Ch113.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
deriving Repr


def edge_livestock_dependsOn_cattle : DefEdge :=
  { defined := "livestock", dependsOn := "cattle", citeDefine := "18 USC § 2311" }


def edge_value_dependsOn_securities : DefEdge :=
  { defined := "value", dependsOn := "securities", citeDefine := "18 USC § 2311" }


def edge_value_dependsOn_money : DefEdge :=
  { defined := "value", dependsOn := "money", citeDefine := "18 USC § 2311" }


def edge_securities_dependsOn_motorVehicle : DefEdge :=
  { defined := "securities", dependsOn := "motor vehicle", citeDefine := "18 USC § 2311" }


def edge_taxStamp_dependsOn_state : DefEdge :=
  { defined := "tax stamp", dependsOn := "state", citeDefine := "18 USC § 2311" }



def edge_s2312_uses_motorVehicle : DefEdge :=
  { defined := "18 USC § 2312", dependsOn := "motor vehicle", citeDefine := "18 USC § 2311" }
def edge_s2312_uses_vessel : DefEdge :=
  { defined := "18 USC § 2312", dependsOn := "vessel", citeDefine := "18 USC § 2311" }
def edge_s2312_uses_aircraft : DefEdge :=
  { defined := "18 USC § 2312", dependsOn := "aircraft", citeDefine := "18 USC § 2311" }



def edge_s2313_uses_motorVehicle : DefEdge :=
  { defined := "18 USC § 2313", dependsOn := "motor vehicle", citeDefine := "18 USC § 2311" }
def edge_s2313_uses_vessel : DefEdge :=
  { defined := "18 USC § 2313", dependsOn := "vessel", citeDefine := "18 USC § 2311" }
def edge_s2313_uses_aircraft : DefEdge :=
  { defined := "18 USC § 2313", dependsOn := "aircraft", citeDefine := "18 USC § 2311" }
def edge_s2313_uses_state : DefEdge :=
  { defined := "18 USC § 2313", dependsOn := "state", citeDefine := "18 USC § 2313(b)" }


def defEdges : List DefEdge :=
  [ edge_livestock_dependsOn_cattle,
    edge_value_dependsOn_securities,
    edge_value_dependsOn_money,
    edge_securities_dependsOn_motorVehicle,
    edge_taxStamp_dependsOn_state,
    edge_s2312_uses_motorVehicle, edge_s2312_uses_vessel, edge_s2312_uses_aircraft,
    edge_s2313_uses_motorVehicle, edge_s2313_uses_vessel, edge_s2313_uses_aircraft,
    edge_s2313_uses_state ]






structure LivestockMembership (l : Livestock) (ct : Cattle) (c : ComplaintText) : Prop where
  cattleIncluded : IsCattle ct c
  livestock      : IsLivestock l c


structure ValueMembership (v : Value) (s : Security) (m : Money) (c : ComplaintText) : Prop where
  security : IsSecurity s c
  money    : IsMoney m c
  value    : IsValue v c



inductive ProtectedConveyance (c : ComplaintText) : Prop where
  | motorVehicle {mv : MotorVehicle} (h : IsMotorVehicle mv c) : ProtectedConveyance c
  | vessel       {v : Vessel}        (h : IsVessel v c)        : ProtectedConveyance c
  | aircraft     {a : Aircraft}      (h : IsAircraft a c)      : ProtectedConveyance c

end Proving.USC.T18.Ch113.Ontology
