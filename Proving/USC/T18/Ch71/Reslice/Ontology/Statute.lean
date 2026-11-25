















import Proving.USC.T18.Ch71.Reslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String

def edge_s1462_obsceneMatter : DefEdge :=
  { defined := "18 USC § 1462", dependsOn := "obscene matter",
    citeDefine := "18 USC § 1462" }

def edge_s1462_indecentArticle : DefEdge :=
  { defined := "18 USC § 1462", dependsOn := "indecent article",
    citeDefine := "18 USC § 1462(c)" }

def edge_s1462_ics : DefEdge :=
  { defined := "18 USC § 1462", dependsOn := "interactive computer service",
    citeDefine := "§ 230(e)(2) Communications Act of 1934" }

def edge_s1462_commonCarrier : DefEdge :=
  { defined := "18 USC § 1462", dependsOn := "common carrier",
    citeDefine := "(undefined in-slice)" }

def edge_s1462_commerce : DefEdge :=
  { defined := "18 USC § 1462", dependsOn := "interstate or foreign commerce",
    citeDefine := "18 USC § 10" }

def edge_s1465_obsceneMatter : DefEdge :=
  { defined := "18 USC § 1465", dependsOn := "obscene matter",
    citeDefine := "18 USC § 1465" }

def edge_s1465_ics : DefEdge :=
  { defined := "18 USC § 1465", dependsOn := "interactive computer service",
    citeDefine := "§ 230(e)(2) Communications Act of 1934" }

def edge_s1465_commerce : DefEdge :=
  { defined := "18 USC § 1465", dependsOn := "interstate or foreign commerce",
    citeDefine := "18 USC § 10" }


def defEdges : List DefEdge :=
  [ edge_s1462_obsceneMatter, edge_s1462_indecentArticle, edge_s1462_ics,
    edge_s1462_commonCarrier, edge_s1462_commerce,
    edge_s1465_obsceneMatter, edge_s1465_ics, edge_s1465_commerce ]




inductive Section1462Object (c : ComplaintText) : Prop where
  | expressiveObscene (m : ObsceneMatter) (h : IsObsceneMatter m c) : Section1462Object c
  | indecentArticle   (a : IndecentArticle) (h : IsIndecentArticle a c) : Section1462Object c





structure Section1462Matter (c : ComplaintText) : Prop where
  object : Section1462Object c
  channelInCommerce :
    ∃ e : Entity,
      (IsCommonCarrier e c ∨ IsInteractiveComputerService e c)
        ∧ InInterstateOrForeignCommerce e c





structure Section1465Matter (m : ObsceneMatter) (c : ComplaintText) : Prop where
  object : IsObsceneMatter m c
  channelInCommerce :
    ∃ e : Entity,
      InInterstateOrForeignCommerce e c ∨ IsInteractiveComputerService e c

end Proving.USC.T18.Ch71.Reslice.Ontology
