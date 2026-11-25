











import Proving.USC.T18.Ch71.Ontology.Predicates

namespace Proving.USC.T18.Ch71.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr




def edge_indecent_dependsOn_crimeInciting : DefEdge :=
  { defined := "indecent", dependsOn := "crime-inciting matter",
    citeDefine := "18 USC § 1461" }


def edge_nonmailable_dependsOn_obscene : DefEdge :=
  { defined := "nonmailable matter", dependsOn := "obscene matter",
    citeDefine := "18 USC § 1461" }


def edge_nonmailable_dependsOn_abortion : DefEdge :=
  { defined := "nonmailable matter", dependsOn := "abortion-related article",
    citeDefine := "18 USC § 1461" }


def edge_nonmailable_dependsOn_indecent : DefEdge :=
  { defined := "nonmailable matter", dependsOn := "indecent",
    citeDefine := "18 USC § 1461" }



def edge_nonmailableWrapper_dependsOn_indecent : DefEdge :=
  { defined := "nonmailable matter (wrappers)", dependsOn := "indecent",
    citeDefine := "18 USC § 1463" }


def edge_s1465_dependsOn_obscene : DefEdge :=
  { defined := "obscene matter for sale/distribution", dependsOn := "obscene matter",
    citeDefine := "18 USC § 1465" }


def edge_s1465_dependsOn_commerce : DefEdge :=
  { defined := "obscene matter for sale/distribution",
    dependsOn := "interstate or foreign commerce", citeDefine := "18 USC § 1465" }



def edge_s1465_dependsOn_ics : DefEdge :=
  { defined := "obscene matter for sale/distribution",
    dependsOn := "interactive computer service", citeDefine := "18 USC § 1465" }


def edge_s1462_dependsOn_obscene : DefEdge :=
  { defined := "imported/transported obscene matter", dependsOn := "obscene matter",
    citeDefine := "18 USC § 1462" }



def edge_s1464_dependsOn_language : DefEdge :=
  { defined := "broadcast obscene/indecent/profane language",
    dependsOn := "obscene, indecent, or profane language", citeDefine := "18 USC § 1464" }


def chapter71Edges : List DefEdge :=
  [ edge_indecent_dependsOn_crimeInciting,
    edge_nonmailable_dependsOn_obscene,
    edge_nonmailable_dependsOn_abortion,
    edge_nonmailable_dependsOn_indecent,
    edge_nonmailableWrapper_dependsOn_indecent,
    edge_s1465_dependsOn_obscene,
    edge_s1465_dependsOn_commerce,
    edge_s1465_dependsOn_ics,
    edge_s1462_dependsOn_obscene,
    edge_s1464_dependsOn_language ]







inductive NonmailableMatterMembership (m : Matter) (c : ComplaintText) : Prop
  | obscene  (h : IsObsceneMatter m c)
  | abortion (h : IsAbortionRelatedArticle m c)
  | indecent (h : IsIndecent m c)





structure IndecentByCrimeIncitement (m : Matter) (c : ComplaintText) : Prop where
  crimeInciting : IsCrimeIncitingMatter m c
  indecent      : IsIndecent m c




structure ObsceneMatterInCommerce (m : Matter) (c : ComplaintText) : Prop where
  obscene  : IsObsceneMatter m c
  commerce : IsInInterstateOrForeignCommerce m c






inductive Section1462Matter (m : Matter) (c : ComplaintText) : Prop
  | obscene (h : IsObsceneMatter m c)
  | article (h : IsAbortionRelatedArticle m c)







structure Section1462Object (m : Matter) (c : ComplaintText) : Prop where
  matter   : Section1462Matter m c
  commerce : IsInInterstateOrForeignCommerce m c




structure InteractiveComputerServiceMembership
    (s : InteractiveComputerService) (c : ComplaintText) : Prop where
  isICS : IsInteractiveComputerService s c

end Proving.USC.T18.Ch71.Ontology
