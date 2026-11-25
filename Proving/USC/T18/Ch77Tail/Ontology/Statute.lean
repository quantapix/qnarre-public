













import Proving.USC.T18.Ch77Tail.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_slaveTrade_dependsOn_vessel : DefEdge :=
  { defined := "18 USC §§ 1582/1585/1586/1587/1588 (vessel offenses)",
    dependsOn := "vessel", citeDefine := "1 USC § 3 (out-of-slice)" }



def edge_slaveTrade_dependsOn_slave : DefEdge :=
  { defined := "18 USC §§ 1582/1585/1587/1588",
    dependsOn := "slave (held/sold as)", citeDefine := "undefined in ch. 77 (dangling)" }



def edge_crewOffenses_dependsOn_citizenOrResident : DefEdge :=
  { defined := "18 USC §§ 1585/1586/1588",
    dependsOn := "citizen or resident of the United States", citeDefine := "title-general status" }



def edge_s1592_dependsOn_severeFormVictim : DefEdge :=
  { defined := "18 USC § 1592(a)(3)/(b)",
    dependsOn := "severe form of trafficking in persons",
    citeDefine := "TVPA § 103 = 22 USC § 7102 (out-of-slice)" }



def edge_s1592_dependsOn_predicateOffenses : DefEdge :=
  { defined := "18 USC § 1592(a)(1)/(2)",
    dependsOn := "§§ 1581/1583/1584/1589/1590/1591/1594(a) (predicate offenses)",
    citeDefine := "18 USC ch. 77 (out-of-slice)" }



def edge_s1592_dependsOn_laborOrServices : DefEdge :=
  { defined := "18 USC § 1592(a)(3)",
    dependsOn := "labor or services", citeDefine := "TVPA family (out-of-slice)" }


def defEdges : List DefEdge :=
  [ edge_slaveTrade_dependsOn_vessel,
    edge_slaveTrade_dependsOn_slave,
    edge_crewOffenses_dependsOn_citizenOrResident,
    edge_s1592_dependsOn_severeFormVictim,
    edge_s1592_dependsOn_predicateOffenses,
    edge_s1592_dependsOn_laborOrServices ]





structure SlaveTradeVesselMembership (v : Vessel) (c : ComplaintText) : Prop where
  isVessel     : IsVessel v c
  inSlaveTrade : IsSlaveTradeVessel v c




structure DocumentOffenseObjectMembership (d : Document) (p : Person) (c : ComplaintText) : Prop where
  isDocument : IsImmigrationOrIdentityDocument d c
  victim     : IsSevereFormOfTraffickingVictim p c



inductive VesselSlaveTradeRole (p : Person) (c : ComplaintText) : Prop where

  | masterFactorOwner   : IsMasterFactorOrOwner p c → VesselSlaveTradeRole p c

  | captainMasterCmdr   : IsCaptainMasterOrCommander p c → VesselSlaveTradeRole p c

  | masterOwnerInCharge : IsMasterOwnerOrPersonInCharge p c → VesselSlaveTradeRole p c

  | crewMember          : IsCrewMember p c → VesselSlaveTradeRole p c

end Proving.USC.T18.Ch77Tail.Ontology
