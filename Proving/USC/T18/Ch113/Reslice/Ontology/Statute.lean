import Proving.USC.T18.Ch113.Reslice.Ontology.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false
namespace Proving.USC.T18.Ch113.Reslice.Ontology
open Proving.USC.Common








structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_s2315_dependsOn_state : DefEdge :=
  { defined := "18 USC § 2315 offense", dependsOn := "State",
    citeDefine := "18 USC § 2315" }
def edge_s2315_dependsOn_veteransMemorialObject : DefEdge :=
  { defined := "18 USC § 2315 offense", dependsOn := "veterans' memorial object",
    citeDefine := "18 USC § 2315" }





def edge_s2318a_dependsOn_counterfeitLabel : DefEdge :=
  { defined := "18 USC § 2318(a) offense", dependsOn := "counterfeit label",
    citeDefine := "18 USC § 2318(b)(1)" }
def edge_s2318a_dependsOn_illicitLabel : DefEdge :=
  { defined := "18 USC § 2318(a) offense", dependsOn := "illicit label",
    citeDefine := "18 USC § 2318(b)(4)" }
def edge_s2318a_dependsOn_counterfeitDocPackaging : DefEdge :=
  { defined := "18 USC § 2318(a) offense",
    dependsOn := "counterfeit documentation or packaging",
    citeDefine := "18 USC § 2318(b)(6)" }
def edge_s2318a_dependsOn_traffic : DefEdge :=
  { defined := "18 USC § 2318(a) offense", dependsOn := "traffic",
    citeDefine := "18 USC § 2318(b)(2)" }

def edge_traffic2318_dependsOn_traffic2320 : DefEdge :=
  { defined := "traffic (18 USC § 2318(b)(2))",
    dependsOn := "traffic (18 USC § 2320(f)(5))", citeDefine := "18 USC § 2318(b)(2)" }

def edge_illicitLabel_dependsOn_docPackaging : DefEdge :=
  { defined := "illicit label", dependsOn := "documentation or packaging",
    citeDefine := "18 USC § 2318(b)(4)" }

def edge_illicitLabel_dependsOn_copyrightOwner : DefEdge :=
  { defined := "illicit label", dependsOn := "copyright owner",
    citeDefine := "18 USC § 2318(b)(3)" }

def edge_counterfeitDocPackaging_dependsOn_docPackaging : DefEdge :=
  { defined := "counterfeit documentation or packaging",
    dependsOn := "documentation or packaging", citeDefine := "18 USC § 2318(b)(6)" }


def edge_docPackaging_dependsOn_phonorecord : DefEdge :=
  { defined := "documentation or packaging", dependsOn := "phonorecord",
    citeDefine := "18 USC § 2318(b)(5)" }



def edge_s2320a_dependsOn_counterfeitMark : DefEdge :=
  { defined := "18 USC § 2320(a) offense", dependsOn := "counterfeit mark",
    citeDefine := "18 USC § 2320(f)(1)" }
def edge_s2320a_dependsOn_counterfeitMilitary : DefEdge :=
  { defined := "18 USC § 2320(a) offense",
    dependsOn := "counterfeit military good or service",
    citeDefine := "18 USC § 2320(f)(4)" }
def edge_s2320a_dependsOn_drug : DefEdge :=
  { defined := "18 USC § 2320(a) offense", dependsOn := "drug",
    citeDefine := "18 USC § 2320(f)(6)" }
def edge_s2320a_dependsOn_traffic : DefEdge :=
  { defined := "18 USC § 2320(a) offense", dependsOn := "traffic",
    citeDefine := "18 USC § 2320(f)(5)" }

def edge_counterfeitMilitary_dependsOn_counterfeitMark : DefEdge :=
  { defined := "counterfeit military good or service", dependsOn := "counterfeit mark",
    citeDefine := "18 USC § 2320(f)(4)" }

def edge_traffic_dependsOn_financialGain : DefEdge :=
  { defined := "traffic", dependsOn := "financial gain",
    citeDefine := "18 USC § 2320(f)(5)" }


def edge_counterfeitMark_dependsOn_lanhamAct : DefEdge :=
  { defined := "counterfeit mark", dependsOn := "Lanham Act",
    citeDefine := "18 USC § 2320(f)(1)" }





inductive StateMembership (j : Jurisdiction) (c : ComplaintText) : Prop where
  | stateOfUnitedStates (h : IsState j c) : StateMembership j c
  | districtOfColumbia (h : IsState j c) : StateMembership j c
  | commonwealthTerritoryOrPossession (h : IsState j c) : StateMembership j c



inductive CounterfeitMarkMembership (m : Mark) (c : ComplaintText) : Prop where
  | spuriousMark (h : IsCounterfeitMark m c) : CounterfeitMarkMembership m c
  | spuriousDesignation (h : IsCounterfeitMark m c) : CounterfeitMarkMembership m c





structure CounterfeitDocPackagingMembership (p : Packaging) (c : ComplaintText) : Prop where
  base        : IsDocumentationOrPackaging p c
  counterfeit : IsCounterfeitDocumentationOrPackaging p c



structure CounterfeitMilitaryMembership (g : GoodOrService) (m : Mark) (c : ComplaintText) : Prop where
  usesCounterfeitMark : IsCounterfeitMark m c
  militaryNexus       : IsCounterfeitMilitaryGoodOrService g c



structure TrafficMembership (act : Conduct) (g : Gain) (c : ComplaintText) : Prop where
  financialPurpose : IsFinancialGain g c
  traffic          : IsTraffic act c

end Proving.USC.T18.Ch113.Reslice.Ontology
