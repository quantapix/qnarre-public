





























import Proving.USC.Common.Predicates
import Proving.USC.T29.Review.Elements.Statute
import Proving.USC.T29.Review.Procedure.Statute
import Proving.USC.T29.Review.Deontic.Statute

namespace Proving.USC.T29.Review.Bridge

open Proving.USC.Common










axiom corr_proc_aggrieved {p : Person} {ord : Procedure.BoardOrder} {c : ComplaintText} :
    Procedure.PersonAggrievedByFinalOrder p ord c → AggrievedByAgencyAction p c



axiom corr_deon_aggrieved {p : Person} {o : Deontic.BoardOrder} {c : ComplaintText} :
    Deontic.IsPersonAggrievedByBoardOrder p o c → AggrievedByAgencyAction p c




theorem s160f_proc_standing_implies_common
    {p : Person} {ord : Procedure.BoardOrder} {proc : Procedure.UlpProceeding}
    {c : ComplaintText}
    (h : Procedure.AggrievedReview p ord proc c)
    : AggrievedByAgencyAction p c :=
  corr_proc_aggrieved h.aggrieved




theorem s160f_deon_standing_implies_common
    {p : Person} {o : Deontic.BoardOrder} {c : ComplaintText}
    (h : Deontic.Permission160f p o c)
    : AggrievedByAgencyAction p c :=
  corr_deon_aggrieved h.addressee




theorem s160f_elem_standing_implies_common
    {o : Elements.BoardOrder} {u : Elements.UnfairLaborPractice} {p : Person}
    {court : Elements.ReviewingCourt} {c : ComplaintText}
    (h : Elements.Section160f o u p court c)
    : AggrievedByAgencyAction p c :=
  h.aggrieved










axiom corr_deon_finality {p : Person} {o : Deontic.BoardOrder} {c : ComplaintText} :
    Deontic.IsFinalBoardOrder o c → FinalAgencyActionReviewable p c


theorem s160f_deon_finality_implies_common
    {p : Person} {o : Deontic.BoardOrder} {c : ComplaintText}
    (h : Deontic.Permission160f p o c)
    : FinalAgencyActionReviewable p c :=
  corr_deon_finality (p := p) h.condition


theorem s160f_elem_finality_implies_common
    {o : Elements.BoardOrder} {u : Elements.UnfairLaborPractice} {p : Person}
    {court : Elements.ReviewingCourt} {c : ComplaintText}
    (h : Elements.Section160f o u p court c)
    : FinalAgencyActionReviewable p c :=
  h.finality










axiom corr_proc_finalorder {p : Person} {ord : Procedure.BoardOrder}
    {oD : Deontic.BoardOrder} {proc : Procedure.UlpProceeding} {c : ComplaintText} :
    Procedure.FinalOrderIssued ord proc c → Deontic.IsFinalBoardOrder oD c


axiom corr_proc_to_deon_aggrieved {p : Person} {ord : Procedure.BoardOrder}
    {oD : Deontic.BoardOrder} {c : ComplaintText} :
    Procedure.PersonAggrievedByFinalOrder p ord c →
    Deontic.IsPersonAggrievedByBoardOrder p oD c





theorem s160f_proc_implies_deon_permission
    {p : Person} {ord : Procedure.BoardOrder} {oD : Deontic.BoardOrder}
    {proc : Procedure.UlpProceeding} {c : ComplaintText}
    (h : Procedure.AggrievedReview p ord proc c)
    : Deontic.Permission160f p oD c :=
  ⟨corr_proc_to_deon_aggrieved h.aggrieved, corr_proc_finalorder (p := p) h.finalOrder⟩









axiom corr_proc_enforce {b : Deontic.Board} {ord : Procedure.BoardOrder}
    {oD : Deontic.BoardOrder} {ct : Deontic.Court} {proc : Procedure.UlpProceeding}
    {c : ComplaintText} :
    Procedure.BoardEnforcementPetitionFiled ord proc c →
    Deontic.PetitionsForEnforcement b oD ct c


axiom corr_proc_isboard {b : Deontic.Board} {ord : Procedure.BoardOrder}
    {proc : Procedure.UlpProceeding} {c : ComplaintText} :
    Procedure.BoardEnforcement ord proc c → Deontic.IsBoard b c




theorem s160e_proc_implies_deon_power
    {b : Deontic.Board} {ord : Procedure.BoardOrder} {oD : Deontic.BoardOrder}
    {ct : Deontic.Court} {proc : Procedure.UlpProceeding} {c : ComplaintText}
    (h : Procedure.BoardEnforcement ord proc c)
    : Deontic.Power160eExercised b oD ct c :=
  ⟨⟨corr_proc_isboard h⟩, corr_proc_enforce h.petitioned⟩

end Proving.USC.T29.Review.Bridge
