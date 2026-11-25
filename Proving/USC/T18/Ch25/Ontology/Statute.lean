









import Proving.USC.T18.Ch25.Ontology.Types
import Proving.USC.T18.Ch25.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_counterfeit_dependsOn_obligation : DefEdge :=
  { defined := "counterfeit obligation or security of the United States",
    dependsOn := "obligation or other security of the United States",
    citeDefine := "18 USC § 472" }



def edge_obligation_dependsOn_section8 : DefEdge :=
  { defined := "obligation or other security of the United States",
    dependsOn := "18 USC § 8 (definition — out of slice)",
    citeDefine := "18 USC § 471" }



inductive Falsified (o : Obligation) (c : ComplaintText) : Prop where
  | falselyMade   : IsFalselyMade o c   → Falsified o c
  | forged        : IsForged o c        → Falsified o c
  | counterfeited : IsCounterfeited o c → Falsified o c
  | altered       : IsAltered o c       → Falsified o c




structure CounterfeitObligation (o : Obligation) (c : ComplaintText) : Prop where
  genus     : IsObligationOrSecurity o c
  falsified : Falsified o c

end Proving.USC.T18.Ch25.Ontology
