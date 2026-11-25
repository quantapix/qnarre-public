






import Proving.USC.T18.Ontology.Predicates

namespace Proving.USC.T18.Ontology
open Proving.USC.Common


structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_pattern_dependsOn_activity : DefEdge :=
  { defined := "pattern of racketeering activity",
    dependsOn := "racketeering activity", citeDefine := "18 USC § 1961(5)" }



structure Section1962cTermsInhabited (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  person     : IsPerson p c
  enterprise : IsEnterprise e c
  pattern    : IsPatternOfRacketeering c

end Proving.USC.T18.Ontology
