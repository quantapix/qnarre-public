








import Proving.USC.T09.Ontology.Predicates

namespace Proving.USC.T09.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_arbAgreement_dependsOn_maritime : DefEdge :=
  { defined := "arbitration agreement (§ 2)",
    dependsOn := "maritime transaction (§ 1)", citeDefine := "9 USC § 2" }


def edge_arbAgreement_dependsOn_commerce : DefEdge :=
  { defined := "arbitration agreement (§ 2)",
    dependsOn := "transaction involving commerce (§ 1)", citeDefine := "9 USC § 2" }


def edge_compel_dependsOn_arbAgreement : DefEdge :=
  { defined := "order to compel (§ 4)",
    dependsOn := "arbitration agreement (§ 2)", citeDefine := "9 USC § 4" }


def edge_confirm_dependsOn_award : DefEdge :=
  { defined := "confirmation/vacatur (§§ 9–10)",
    dependsOn := "award (§§ 9, 10)", citeDefine := "9 USC § 9" }


def edge_convention_dependsOn_section2 : DefEdge :=
  { defined := "Convention relationship (§ 202)",
    dependsOn := "arbitration agreement (§ 2)", citeDefine := "9 USC § 202" }


def edge_efaa_dependsOn_predispute : DefEdge :=
  { defined := "EFAA non-enforceability (§ 402)",
    dependsOn := "predispute arbitration agreement (§ 401(1))", citeDefine := "9 USC § 402" }



def edge_efaa_dependsOn_disputeKind : DefEdge :=
  { defined := "EFAA non-enforceability (§ 402)",
    dependsOn := "sexual assault / harassment dispute (§ 401(3),(4))",
    citeDefine := "9 USC § 402" }


def title9DefEdges : List DefEdge :=
  [ edge_arbAgreement_dependsOn_maritime,
    edge_arbAgreement_dependsOn_commerce,
    edge_compel_dependsOn_arbAgreement,
    edge_confirm_dependsOn_award,
    edge_convention_dependsOn_section2,
    edge_efaa_dependsOn_predispute,
    edge_efaa_dependsOn_disputeKind ]






inductive SubjectTransaction (c : ComplaintText) : Prop where

  | maritime (m : MaritimeTransaction) (h : IsMaritimeTransaction m c)
      : SubjectTransaction c

  | commerce (t : CommerceTransaction) (h : IsCommerceTransaction t c)
      : SubjectTransaction c



structure Section2Arbitrability
    (a : ArbitrationAgreement) (x : Controversy) (c : ComplaintText) : Prop where
  agreement   : IsArbitrationAgreement a c
  controversy : IsControversy x c
  subject     : SubjectTransaction c



structure ConfirmableAward
    (w : Award) (j : Court) (c : ComplaintText) : Prop where
  award : IsAward w c
  court : IsCourt j c



structure ConventionCoverage
    (a : ArbitrationAgreement) (r : ConventionRelationship) (c : ComplaintText) : Prop where
  agreement    : IsArbitrationAgreement a c
  relationship : IsConventionRelationship r c


inductive CoveredEFAADispute (c : ComplaintText) : Prop where
  | assault (d : SexualAssaultDispute) (h : IsSexualAssaultDispute d c)
      : CoveredEFAADispute c
  | harassment (d : SexualHarassmentDispute) (h : IsSexualHarassmentDispute d c)
      : CoveredEFAADispute c




inductive EFAANonEnforceable (c : ComplaintText) : Prop where
  | predisputeAgreement
      (p : PredisputeArbitrationAgreement) (d : CoveredEFAADispute c)
      (h : IsPredisputeArbitrationAgreement p c)
      : EFAANonEnforceable c
  | jointActionWaiver
      (p : PredisputeJointActionWaiver) (d : CoveredEFAADispute c)
      (h : IsPredisputeJointActionWaiver p c)
      : EFAANonEnforceable c

end Proving.USC.T09.Ontology
