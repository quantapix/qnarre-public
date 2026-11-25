

















import Proving.USC.Common.Types
import Proving.USC.T18.Trafficking.Ontology.Types
import Proving.USC.T18.Trafficking.Ontology.Predicates

namespace Proving.USC.T18.Trafficking.Ontology

open Proving.USC.Common (ComplaintText Person Entity)



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr




def edge_coercion_dependsOn_seriousHarm : DefEdge :=
  { defined := "coercion", dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_coercion_dependsOn_abuseOfLegalProcess : DefEdge :=
  { defined := "coercion", dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)" }


def edge_participation_dependsOn_venture : DefEdge :=
  { defined := "participation in a venture", dependsOn := "venture",
    citeDefine := "18 USC § 1591(e)(4)" }




def edge_participation_dependsOn_subsectionA1 : DefEdge :=
  { defined := "participation in a venture", dependsOn := "violation of § 1591(a)(1)",
    citeDefine := "18 USC § 1591(e)(4)" }


def definitionalDAG : List DefEdge :=
  [ edge_coercion_dependsOn_seriousHarm,
    edge_coercion_dependsOn_abuseOfLegalProcess,
    edge_participation_dependsOn_venture,
    edge_participation_dependsOn_subsectionA1 ]







inductive CoercionContent (c : ComplaintText) : Prop where

  | threatOfSeriousHarm (h : SeriousHarm) (hH : IsSeriousHarm h c)


  | schemeReSeriousHarm (h : SeriousHarm) (hH : IsSeriousHarm h c)

  | abuseOfLegalProcess (a : AbuseOfLegalProcess) (hA : IsAbuseOfLegalProcess a c)





structure ParticipationContent
    (pv : ParticipationInVenture) (v : Entity) (c : ComplaintText) : Prop where

  venture       : IsVenture v c

  participation : IsParticipationInVenture pv c




structure CoercionMembership (co : Coercion) (c : ComplaintText) : Prop where
  membership : IsCoercion co c
  content    : CoercionContent c

end Proving.USC.T18.Trafficking.Ontology
