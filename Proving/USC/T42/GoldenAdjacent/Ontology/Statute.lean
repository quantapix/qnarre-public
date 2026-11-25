



















import Proving.USC.T42.GoldenAdjacent.Ontology.Predicates

namespace Proving.USC.T42.GoldenAdjacent.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_propertyRight_dependsOn_citizen : DefEdge :=
  { defined := "equal property right (§ 1982)", dependsOn := "citizen of the United States",
    citeDefine := "42 USC § 1982" }


def edge_propertyRight_dependsOn_whiteComparator : DefEdge :=
  { defined := "equal property right (§ 1982)", dependsOn := "white citizens thereof",
    citeDefine := "42 USC § 1982" }


def edge_propertyRightExercise_dependsOn_property : DefEdge :=
  { defined := "property-right exercise (§ 1982)", dependsOn := "real and personal property",
    citeDefine := "42 USC § 1982" }



def edge_prevailingParty_dependsOn_enforcementAction : DefEdge :=
  { defined := "prevailing party (§ 1988(b))",
    dependsOn := "action to enforce a civil-rights provision",
    citeDefine := "42 USC § 1988(b)" }



def edge_enforcementAction_dependsOn_s1982 : DefEdge :=
  { defined := "civil-rights enforcement action (§ 1988(b))",
    dependsOn := "section 1982 of this title",
    citeDefine := "42 USC § 1988(b)" }



def edge_attorneysFee_dependsOn_enforcementAction : DefEdge :=
  { defined := "reasonable attorney's fee (§ 1988(b))",
    dependsOn := "action to enforce a civil-rights provision",
    citeDefine := "42 USC § 1988(b)" }



def edge_expertFee_dependsOn_attorneysFee : DefEdge :=
  { defined := "expert fees (§ 1988(c))", dependsOn := "attorney's fee under subsection (b)",
    citeDefine := "42 USC § 1988(c)" }



def edge_judicialOfficer_dependsOn_judicialCapacity : DefEdge :=
  { defined := "judicial-officer fee immunity (§ 1988(b))",
    dependsOn := "act or omission in judicial capacity",
    citeDefine := "42 USC § 1988(b)" }


def definitionalDAG : List DefEdge :=
  [ edge_propertyRight_dependsOn_citizen,
    edge_propertyRight_dependsOn_whiteComparator,
    edge_propertyRightExercise_dependsOn_property,
    edge_prevailingParty_dependsOn_enforcementAction,
    edge_enforcementAction_dependsOn_s1982,
    edge_attorneysFee_dependsOn_enforcementAction,
    edge_expertFee_dependsOn_attorneysFee,
    edge_judicialOfficer_dependsOn_judicialCapacity ]







structure PropertyRightMembership
    (x : Citizen) (e : PropertyRightExercise) (p : Property)
    (w : WhiteCitizenComparator) (c : ComplaintText) : Prop where
  citizen    : IsCitizen x c
  exercise   : IsPropertyRightExercise e c
  property   : IsProperty p c
  comparator : IsWhiteCitizenComparator w c





structure AttorneysFeeMembership
    (a : CivilRightsEnforcementAction) (x : PrevailingParty)
    (f : ReasonableAttorneysFee) (c : ComplaintText) : Prop where
  action       : IsCivilRightsEnforcementAction a c
  prevailing   : IsPrevailingParty x c
  fee          : IsReasonableAttorneysFee f c





structure ExpertFeeMembership
    (f : ExpertFee) (af : ReasonableAttorneysFee) (c : ComplaintText) : Prop where
  expert       : IsExpertFee f c
  attorneysFee : IsReasonableAttorneysFee af c





inductive PropertyExerciseCase (e : PropertyRightExercise) (c : ComplaintText) : Prop where

  | inherit  : IsPropertyRightExercise e c → PropertyExerciseCase e c

  | purchase : IsPropertyRightExercise e c → PropertyExerciseCase e c

  | lease    : IsPropertyRightExercise e c → PropertyExerciseCase e c

  | sell     : IsPropertyRightExercise e c → PropertyExerciseCase e c

  | hold     : IsPropertyRightExercise e c → PropertyExerciseCase e c

  | convey   : IsPropertyRightExercise e c → PropertyExerciseCase e c




inductive JudicialOfficerFeePosture (j : JudicialOfficer) (c : ComplaintText) : Prop where

  | immune : IsJudicialOfficer j c → JudicialOfficerFeePosture j c

  | feeExposed : IsJudicialOfficer j c → IsActInExcessOfJurisdiction j c →
      JudicialOfficerFeePosture j c

end Proving.USC.T42.GoldenAdjacent.Ontology
