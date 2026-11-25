












import Proving.USC.T18.Ch113.Counterfeiting.Ontology.Predicates

namespace Proving.USC.T18.Ch113.Counterfeiting.Ontology

open Proving.USC.Common







structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  inSlice    : Bool



def edge_ctftDocPkg_dependsOn_docPkg : DefEdge :=
  { defined := "counterfeit documentation or packaging",
    dependsOn := "documentation or packaging",
    citeDefine := "18 USC § 2318(b)(6)", inSlice := true }



def edge_traffic2318_dependsOn_traffic2320 : DefEdge :=
  { defined := "traffic (§ 2318(b)(2))", dependsOn := "traffic (§ 2320(f)(5))",
    citeDefine := "18 USC § 2318(b)(2)", inSlice := true }



def edge_ctftMilGood_dependsOn_ctftMark : DefEdge :=
  { defined := "counterfeit military good or service",
    dependsOn := "counterfeit mark",
    citeDefine := "18 USC § 2320(f)(4)", inSlice := true }



def edge_ctftMark_dependsOn_lanham : DefEdge :=
  { defined := "counterfeit mark", dependsOn := "Lanham Act",
    citeDefine := "18 USC § 2320(f)(1)(B)", inSlice := true }



def edge_illicitLabel_dependsOn_copyrightOwner : DefEdge :=
  { defined := "illicit label", dependsOn := "copyright owner",
    citeDefine := "17 USC § 101 (via 18 USC § 2318(b)(3))", inSlice := false }



def edge_drug_dependsOn_fdcAct : DefEdge :=
  { defined := "drug", dependsOn := "drug (FD&C Act § 201)",
    citeDefine := "21 USC § 321 (via 18 USC § 2320(f)(6))", inSlice := false }


def defEdges : List DefEdge :=
  [ edge_ctftDocPkg_dependsOn_docPkg,
    edge_traffic2318_dependsOn_traffic2320,
    edge_ctftMilGood_dependsOn_ctftMark,
    edge_ctftMark_dependsOn_lanham,
    edge_illicitLabel_dependsOn_copyrightOwner,
    edge_drug_dependsOn_fdcAct ]





structure CounterfeitLabel (l : Label) (c : ComplaintText) : Prop where
  appearsGenuineButNot : LabelAppearsGenuineButIsNot l c



structure IllicitLabel (l : Label) (c : ComplaintText) : Prop where
  usedToVerify         : UsedByCopyrightOwnerToVerify l c
  withoutAuthorization : WithoutCopyrightOwnerAuthorization l c




structure CounterfeitDocumentationOrPackaging (d : Packaging) (c : ComplaintText) : Prop where
  isDocOrPackaging     : IsDocumentationOrPackaging d c
  appearsGenuineButNot : PackagingAppearsGenuineButIsNot d c



inductive CounterfeitMark (m : Mark) (c : ComplaintText) : Prop where
  | spuriousMark        : IsSpuriousMarkAllConditions m c → CounterfeitMark m c
  | spuriousDesignation : IsSpuriousLanhamDesignation m c → CounterfeitMark m c




structure CounterfeitMilitaryGoodOrService (g : Good) (c : ComplaintText) : Prop where
  bearsCounterfeitMark : GoodBearsCounterfeitMark g c
  meetsMilitaryNexus   : GoodMeetsMilitaryNexus g c

end Proving.USC.T18.Ch113.Counterfeiting.Ontology
