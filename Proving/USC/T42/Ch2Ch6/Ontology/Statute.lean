import Proving.USC.T42.Ch2Ch6.Ontology.Types
import Proving.USC.T42.Ch2Ch6.Ontology.Predicates
import Proving.USC.Common.Types











namespace Proving.USC.T42.Ch2Ch6.Ontology

open Proving.USC.Common (Person ComplaintText)




structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
deriving Repr



structure DanglingTerm where
  term   : String
  usedAt : String
deriving Repr





def edge_bureau_dependsOn_hhs : DefEdge :=
  { defined := "Children's Bureau",
    dependsOn := "Department of Health and Human Services",
    citeDefine := "42 USC § 191" }



def edge_chief_dependsOn_bureau : DefEdge :=
  { defined := "chief of the Children's Bureau",
    dependsOn := "Children's Bureau", citeDefine := "42 USC § 192" }



def edge_assistantChief_dependsOn_bureau : DefEdge :=
  { defined := "assistant chief of the Children's Bureau",
    dependsOn := "Children's Bureau", citeDefine := "42 USC § 193" }





def edge_vessel_dependsOn_healthLaws : DefEdge :=
  { defined := "vessel subject to quarantine",
    dependsOn := "health laws of any State", citeDefine := "42 USC § 89" }



def edge_warehouse_dependsOn_vessel : DefEdge :=
  { defined := "quarantine warehouse",
    dependsOn := "vessel subject to quarantine", citeDefine := "42 USC § 89" }





def edge_s88_uses_vessel : DefEdge :=
  { defined := "42 USC § 88 (using section)",
    dependsOn := "vessel subject to quarantine", citeDefine := "42 USC § 89" }


def edge_s90_uses_warehouse : DefEdge :=
  { defined := "42 USC § 90 (using section)",
    dependsOn := "quarantine warehouse", citeDefine := "42 USC § 89" }


def edge_s91_uses_vessel : DefEdge :=
  { defined := "42 USC § 91 (using section)",
    dependsOn := "vessel subject to quarantine", citeDefine := "42 USC § 89" }


def edge_s97_uses_vessel : DefEdge :=
  { defined := "42 USC § 97 (using section)",
    dependsOn := "vessel subject to quarantine", citeDefine := "42 USC § 89" }


def definitionalDAG : List DefEdge :=
  [ edge_bureau_dependsOn_hhs, edge_chief_dependsOn_bureau,
    edge_assistantChief_dependsOn_bureau,
    edge_vessel_dependsOn_healthLaws, edge_warehouse_dependsOn_vessel,
    edge_s88_uses_vessel, edge_s90_uses_warehouse,
    edge_s91_uses_vessel, edge_s97_uses_vessel ]



def danglingTerms : List DanglingTerm :=
  [ { term := "Department of Health and Human Services", usedAt := "42 USC § 191" },
    { term := "Secretary of Health and Human Services",  usedAt := "42 USC § 88" },
    { term := "President",                                usedAt := "42 USC § 89" },
    { term := "Senate",                                   usedAt := "42 USC § 192" },
    { term := "health laws of any State",                 usedAt := "42 USC § 88" },
    { term := "collection district",                      usedAt := "42 USC § 88" },
    { term := "port of entry",                            usedAt := "42 USC § 88" },
    { term := "collector",                                usedAt := "42 USC § 88" },
    { term := "quarantine authorities",                   usedAt := "42 USC § 98" },
    { term := "contagious or epidemic disease",           usedAt := "42 USC § 112" } ]




structure ChildrensBureauDef (b : ChildrensBureau) (c : ComplaintText) : Prop where
  isBureau : IsChildrensBureau b c


structure BureauChiefMembership (p : Person) (b : ChildrensBureau) (c : ComplaintText) : Prop where
  bureau : IsChildrensBureau b c
  chief  : IsBureauChief p c


structure AssistantChiefMembership (p : Person) (b : ChildrensBureau) (c : ComplaintText) : Prop where
  bureau    : IsChildrensBureau b c
  assistant : IsAssistantChief p c



structure QuarantineWarehouseMembership (w : Warehouse) (v : Vessel) (c : ComplaintText) : Prop where
  vessel    : IsVesselSubjectToQuarantine v c
  warehouse : IsQuarantineWarehouse w c







def bureauQuartersRentalCapUSD : Nat := 2000



def WithinRentalCap (annualRentalUSD : Nat) : Prop :=
  annualRentalUSD ≤ bureauQuartersRentalCapUSD

end Proving.USC.T42.Ch2Ch6.Ontology
