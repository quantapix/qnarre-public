











import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Ontology.Types
import Proving.USC.T42.ReligiousFreedom.Ontology.Predicates

namespace Proving.USC.T42.ReligiousFreedom.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_indian_dependsOn_tribe : DefEdge :=
  { defined := "Indian", dependsOn := "Indian tribe", citeDefine := "42 USC § 1996a(c)(1)" }


def edge_tribe_dependsOn_indian : DefEdge :=
  { defined := "Indian tribe", dependsOn := "Indian", citeDefine := "42 USC § 1996a(c)(2)" }



def edge_tribe_dependsOn_alaskaVillage : DefEdge :=
  { defined := "Indian tribe", dependsOn := "Alaska Native village",
    citeDefine := "42 USC § 1996a(c)(2)" }


def edge_religion_dependsOn_indian : DefEdge :=
  { defined := "Indian religion", dependsOn := "Indian", citeDefine := "42 USC § 1996a(c)(3)(A)" }


def edge_religion_dependsOn_culture : DefEdge :=
  { defined := "Indian religion", dependsOn := "traditional Indian culture or community",
    citeDefine := "42 USC § 1996a(c)(3)(B)" }


def defEdges : List DefEdge :=
  [ edge_indian_dependsOn_tribe, edge_tribe_dependsOn_indian,
    edge_tribe_dependsOn_alaskaVillage, edge_religion_dependsOn_indian,
    edge_religion_dependsOn_culture ]





inductive TribeForm
  | tribe
  | band
  | nation
  | pueblo
  | organizedGroupOrCommunity
  | alaskaNativeVillage
  deriving DecidableEq, Repr



structure IndianMembership (x : Indian) (t : IndianTribe) (c : ComplaintText) : Prop where
  isMember  : IsIndian x c
  tribeOk   : IsIndianTribe t c



structure IndianReligionMembership (r : IndianReligion) (cul : TraditionalIndianCulture)
    (c : ComplaintText) : Prop where
  prongA : IsPracticedByIndians r c
  prongB : HasTraditionalIndianOrigin r cul c



structure IndianTribeMembership (t : IndianTribe) (c : ComplaintText) : Prop where
  recognized : IsIndianTribe t c

end Proving.USC.T42.ReligiousFreedom.Ontology
