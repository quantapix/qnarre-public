























import Proving.USC.T05.Rulemaking.Elements.Statute
import Proving.USC.T05.Rulemaking.Deontic.Statute
import Proving.USC.T05.Rulemaking.Ontology.Statute
import Proving.USC.T05.Rulemaking.Procedure.Statute
import Proving.USC.T05.Rulemaking.Structure.Statute

namespace Proving.USC.T05.Rulemaking.Bridge

open Proving.USC.Common














axiom rE : Elements.Rule
axiom rDe : Deontic.Rule
axiom aDe : Deontic.Agency
axiom rP : Procedure.Rule
axiom aP : Procedure.Agency
axiom cc : ComplaintText













axiom corr_ep_applies :
    Elements.Section553Applies rE cc → Procedure.Section553Applies aP rP


axiom corr_ep_notice :
    Elements.NoticePublishedInFederalRegister rE cc → Procedure.NoticePublished aP rP




axiom corr_ep_contents :
    Elements.NoticeStatesTimePlaceNature rE cc →
    Elements.NoticeReferencesLegalAuthority rE cc →
    Elements.NoticeStatesTermsOrSubstance rE cc →
    Procedure.NoticeContentsComplete aP rP


axiom corr_ep_comment :
    Elements.OpportunityToCommentAfforded rE cc → Procedure.CommentOpportunityGiven aP rP



axiom corr_ep_basis :
    Elements.ConciseGeneralStatementIncorporated rE cc → Procedure.BasisAndPurposeStated aP rP


axiom corr_ep_petition :
    Elements.RightToPetitionForRulemaking rE cc → Procedure.PetitionRightAfforded aP rP





theorem s553_elements_implies_procedure
    (h : Elements.Section553Informal rE cc) :
    Procedure.LawfulRuleAdoption aP rP :=
  { notice :=
      { applies  := corr_ep_applies h.applies
        notice   := corr_ep_notice h.notice.published
        contents := corr_ep_contents h.notice.timePlaceNature h.notice.legalAuthority
                      h.notice.termsOrSubstance }
    comment  := { opened := corr_ep_comment h.commentOpportunity }
    adoption := { considered := corr_ep_basis h.basisAndPurpose }
    petition := corr_ep_petition h.petitionRight }













axiom corr_ed_notice :
    Elements.NoticePublishedInFederalRegister rE cc → Deontic.NoticePublished aDe rDe cc


axiom corr_ed_comment :
    Elements.OpportunityToCommentAfforded rE cc → Deontic.CommentOpportunityAfforded aDe rDe cc


axiom corr_ed_delay :
    Elements.ThirtyDayDeferredEffectiveDate rE cc → Deontic.ThirtyDayDelayObserved aDe rDe cc


axiom corr_ed_petition :
    Elements.RightToPetitionForRulemaking rE cc → Deontic.PetitionRightAfforded aDe cc




theorem s553b_elements_implies_no_deontic_breach
    (h : Elements.Section553Informal rE cc) :
    ¬ Deontic.Section553bBreached aDe rDe cc :=
  fun br => br.2 (corr_ed_notice h.notice.published)


theorem s553c_elements_implies_no_deontic_breach
    (h : Elements.Section553Informal rE cc) :
    ¬ Deontic.Section553cBreached aDe rDe cc :=
  fun br => br.2 (corr_ed_comment h.commentOpportunity)


theorem s553d_elements_implies_no_deontic_breach
    (h : Elements.Section553Informal rE cc) :
    ¬ Deontic.Section553dBreached aDe rDe cc :=
  fun br => br.2 (corr_ed_delay h.deferredEffective)


theorem s553e_elements_implies_no_deontic_breach
    (h : Elements.Section553Informal rE cc) :
    ¬ Deontic.Section553eBreached aDe cc :=
  fun br => br.2 (corr_ed_petition h.petitionRight)











axiom corr_ep_window :
    Elements.ThirtyDayDeferredEffectiveDate rE cc → Procedure.WithinThirtyDayWindow aP rP



theorem s553d_elements_implies_procedure_edge
    (h : Elements.Section553Informal rE cc) :
    Procedure.EffectiveDateTransition aP rP :=
  { timely := Or.inl (corr_ep_window h.deferredEffective) }











axiom sO : Ontology.ConciseGeneralStatement
axiom nO : Ontology.NoticeOfProposedRuleMaking



axiom corr_eo_statement :
    Elements.ConciseGeneralStatementIncorporated rE cc →
    Ontology.IsConciseGeneralStatement sO cc ∧ Ontology.IsNoticeOfProposedRuleMaking nO cc



theorem s553c_elements_implies_ontology
    (h : Elements.Section553Informal rE cc) :
    Ontology.ConciseStatementMembership sO nO cc :=
  let ⟨hStmt, hNotice⟩ := corr_eo_statement h.basisAndPurpose
  { statement := hStmt, afterNotice := hNotice }













axiom corr_se_override :
    Structure.ExceptionApplies Structure.edge_553c_exceptAsProvided_556_557 cc →
    Elements.FormalRulemakingRequiredOnRecord rE cc





theorem s553c_structure_override_implies_elements_formal
    (hCoh : Structure.Coherent553 cc)
    (hExc : Structure.ExceptionApplies Structure.edge_553c_exceptAsProvided_556_557 cc) :
    Structure.OverrideTriggered Structure.edge_553c_exceptAsProvided_556_557 cc ∧
    Elements.FormalRulemakingRequiredOnRecord rE cc :=
  ⟨hCoh.overrideWellFormed hExc, corr_se_override hExc⟩












theorem s553_core_tierA
    (h : Elements.Section553Informal rE cc) :
    Procedure.LawfulRuleAdoption aP rP ∧
    ¬ Deontic.Section553bBreached aDe rDe cc ∧
    ¬ Deontic.Section553cBreached aDe rDe cc ∧
    ¬ Deontic.Section553eBreached aDe cc :=
  ⟨s553_elements_implies_procedure h,
   s553b_elements_implies_no_deontic_breach h,
   s553c_elements_implies_no_deontic_breach h,
   s553e_elements_implies_no_deontic_breach h⟩

end Proving.USC.T05.Rulemaking.Bridge
