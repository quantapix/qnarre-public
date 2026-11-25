







import Proving.USC.T05.ScopeOfReview.Ontology.Statute

namespace Proving.USC.T05.ScopeOfReview.Ontology

open Proving.USC.Common


theorem wholeRecordMembership_intro {a r c}
    (hAction : IsAgencyAction a c) (hRecord : IsWholeRecord r c)
    : WholeRecordMembership a r c :=
  ⟨hAction, hRecord⟩


theorem setAsideMembership_intro {court a g r c}
    (hForum : IsReviewingCourt court c) (hAction : IsAgencyAction a c)
    (hGround : IsSetAsideGround g a c) (hRecord : IsWholeRecord r c)
    (hPrej : SatisfiesRuleOfPrejudicialError a r c)
    : SetAsideMembership court a g r c :=
  ⟨hForum, hAction, hGround, hRecord, hPrej⟩


theorem compelActionMembership_intro {court a c}
    (hForum : IsReviewingCourt court c) (hAction : IsAgencyAction a c)
    (hWithheld : IsUnlawfullyWithheldOrDelayed a c)
    : CompelActionMembership court a c :=
  ⟨hForum, hAction, hWithheld⟩


theorem reliefPendingReviewMembership_intro {court a c}
    (hForum : IsReviewingCourt court c) (hAction : IsAgencyAction a c)
    (hWarranted : WarrantsReliefPendingReview a c)
    : ReliefPendingReviewMembership court a c :=
  ⟨hForum, hAction, hWarranted⟩

end Proving.USC.T05.ScopeOfReview.Ontology
