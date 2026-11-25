















import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Ontology.Types
import Proving.USC.T05.Rulemaking.Ontology.Predicates

namespace Proving.USC.T05.Rulemaking.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_npRM_dependsOn_proposedRule : DefEdge :=
  { defined := "notice of proposed rule making",
    dependsOn := "proposed rule", citeDefine := "5 USC § 553(b)" }


def edge_proposedRule_dependsOn_rule : DefEdge :=
  { defined := "proposed rule",
    dependsOn := "rule", citeDefine := "5 USC § 553(b)" }



def edge_npRM_dependsOn_agency : DefEdge :=
  { defined := "notice of proposed rule making",
    dependsOn := "agency", citeDefine := "5 USC § 553(b)" }


def edge_npRM_dependsOn_person : DefEdge :=
  { defined := "notice of proposed rule making",
    dependsOn := "person", citeDefine := "5 USC § 553(c)" }


def edge_interpretativeRule_dependsOn_rule : DefEdge :=
  { defined := "interpretative rule",
    dependsOn := "rule", citeDefine := "5 USC § 553(b)(A)" }


def edge_generalStatementOfPolicy_dependsOn_rule : DefEdge :=
  { defined := "general statement of policy",
    dependsOn := "rule", citeDefine := "5 USC § 553(b)(A)" }


def edge_proceduralRule_dependsOn_rule : DefEdge :=
  { defined := "procedural rule",
    dependsOn := "rule", citeDefine := "5 USC § 553(b)(A)" }


def edge_substantiveRule_dependsOn_rule : DefEdge :=
  { defined := "substantive rule",
    dependsOn := "rule", citeDefine := "5 USC § 553(d)" }


def edge_rulePetition_dependsOn_rule : DefEdge :=
  { defined := "rule petition",
    dependsOn := "rule", citeDefine := "5 USC § 553(e)" }


def s553_defEdges : List DefEdge :=
  [ edge_npRM_dependsOn_proposedRule,
    edge_proposedRule_dependsOn_rule,
    edge_npRM_dependsOn_agency,
    edge_npRM_dependsOn_person,
    edge_interpretativeRule_dependsOn_rule,
    edge_generalStatementOfPolicy_dependsOn_rule,
    edge_proceduralRule_dependsOn_rule,
    edge_substantiveRule_dependsOn_rule,
    edge_rulePetition_dependsOn_rule ]




inductive RuleKind553
  | interpretative
  | generalStatementOfPolicy
  | procedural
  | substantive
  deriving DecidableEq






structure NoticeMembership
    (n : NoticeOfProposedRuleMaking) (r : ProposedRule) (c : ComplaintText) : Prop where
  notice    : IsNoticeOfProposedRuleMaking n c
  concerns  : IsProposedRule r c




structure ConciseStatementMembership
    (s : ConciseGeneralStatement) (n : NoticeOfProposedRuleMaking) (c : ComplaintText) : Prop where
  statement : IsConciseGeneralStatement s c
  afterNotice : IsNoticeOfProposedRuleMaking n c



structure GoodCauseMembership
    (g : GoodCauseFinding) (c : ComplaintText) : Prop where
  finding : IsGoodCauseFinding g c

end Proving.USC.T05.Rulemaking.Ontology
