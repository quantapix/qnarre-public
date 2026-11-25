import Proving.USC.T05.ScopeOfReview.Procedure.Statute








namespace Proving.USC.T05.ScopeOfReview.Procedure

open Proving.USC.Common



theorem reliefPendingReview_intro {a c}
    (hNec : NecessaryToPreventIrreparableInjury a c)
    (hIssued : CourtIssuedPreservingProcess a c) :
    ReliefPendingReview a c :=
  ⟨hNec, hIssued⟩



theorem properScopeOfReview_intro {a r c}
    (hPres : QuestionProperlyPresented a c)
    (hWhole : WholeRecordReviewed r c)
    (hPrej : DueAccountOfPrejudicialError c) :
    ProperScopeOfReview a r c :=
  ⟨hPres, hWhole, hPrej⟩



theorem substantialEvidenceReviewAvailable_intro {a r c}
    (hScope : ProperScopeOfReview a r c)
    (hRecord : ReviewedOnAgencyHearingRecord r c) :
    SubstantialEvidenceReviewAvailable a r c :=
  ⟨hScope, hRecord⟩

end Proving.USC.T05.ScopeOfReview.Procedure
