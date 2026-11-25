






























































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.Review.Elements.Statute
import Proving.USC.T29.Review.Procedure.Statute
import Proving.USC.T29.Review.Deontic.Statute

namespace Proving.USC.Common.CrossWaveT29Review

open Proving.USC.Common
















axiom bridge_t29rev_proc_aggrieved_to_common
    {p : Person} {ord : Proving.USC.T29.Review.Procedure.BoardOrder} {c : ComplaintText} :
    Proving.USC.T29.Review.Procedure.PersonAggrievedByFinalOrder p ord c →
    AggrievedByAgencyAction p c



axiom bridge_t29rev_deon_aggrieved_to_common
    {p : Person} {o : Proving.USC.T29.Review.Deontic.BoardOrder} {c : ComplaintText} :
    Proving.USC.T29.Review.Deontic.IsPersonAggrievedByBoardOrder p o c →
    AggrievedByAgencyAction p c



theorem collapse_t29rev_aggrieved_proc_clean
    {p : Person} {ord : Proving.USC.T29.Review.Procedure.BoardOrder}
    {proc : Proving.USC.T29.Review.Procedure.UlpProceeding} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Procedure.AggrievedReview p ord proc c) :
    AggrievedByAgencyAction p c :=
  bridge_t29rev_proc_aggrieved_to_common h.aggrieved



theorem collapse_t29rev_aggrieved_deon_clean
    {p : Person} {o : Proving.USC.T29.Review.Deontic.BoardOrder} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Deontic.Permission160f p o c) :
    AggrievedByAgencyAction p c :=
  bridge_t29rev_deon_aggrieved_to_common h.addressee



theorem collapse_t29rev_aggrieved_elem_clean
    {o : Proving.USC.T29.Review.Elements.BoardOrder}
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {p : Person}
    {court : Proving.USC.T29.Review.Elements.ReviewingCourt} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Elements.Section160f o u p court c) :
    AggrievedByAgencyAction p c :=
  h.aggrieved














axiom bridge_t29rev_deon_finality_to_common
    {p : Person} {o : Proving.USC.T29.Review.Deontic.BoardOrder} {c : ComplaintText} :
    Proving.USC.T29.Review.Deontic.IsFinalBoardOrder o c →
    FinalAgencyActionReviewable p c


theorem collapse_t29rev_finality_deon_clean
    {p : Person} {o : Proving.USC.T29.Review.Deontic.BoardOrder} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Deontic.Permission160f p o c) :
    FinalAgencyActionReviewable p c :=
  bridge_t29rev_deon_finality_to_common (p := p) h.condition


theorem collapse_t29rev_finality_elem_clean
    {o : Proving.USC.T29.Review.Elements.BoardOrder}
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {p : Person}
    {court : Proving.USC.T29.Review.Elements.ReviewingCourt} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Elements.Section160f o u p court c) :
    FinalAgencyActionReviewable p c :=
  h.finality












axiom mapUlpParty : Proving.USC.T29.Review.Elements.UnfairLaborPractice → Person
axiom mapProcParty : Proving.USC.T29.Review.Procedure.UlpProceeding → Person


axiom bridge_t29rev_elem_limitations_to_common
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {c : ComplaintText} :
    Proving.USC.T29.Review.Elements.ChargeFiledWithinSixMonths u c →
    WithinLimitations (mapUlpParty u) c


axiom bridge_t29rev_proc_limitations_to_common
    {proc : Proving.USC.T29.Review.Procedure.UlpProceeding} {c : ComplaintText} :
    Proving.USC.T29.Review.Procedure.WithinSixMonthWindow proc c →
    WithinLimitations (mapProcParty proc) c

theorem collapse_t29rev_limitations_elem_clean
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Elements.ChargeFiledWithinSixMonths u c) :
    WithinLimitations (mapUlpParty u) c :=
  bridge_t29rev_elem_limitations_to_common h

theorem collapse_t29rev_limitations_proc_clean
    {proc : Proving.USC.T29.Review.Procedure.UlpProceeding} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Procedure.WithinSixMonthWindow proc c) :
    WithinLimitations (mapProcParty proc) c :=
  bridge_t29rev_proc_limitations_to_common h
















axiom bridge_t29rev_elem_venue_to_common
    {court : Proving.USC.T29.Review.Elements.ReviewingCourt} {p : Person}
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {c : ComplaintText} :
    Proving.USC.T29.Review.Elements.IsProperReviewingCourt court p u c →
    VenueNexus p c



axiom bridge_t29rev_proc_venue_to_common
    {p : Person} {ord : Proving.USC.T29.Review.Procedure.BoardOrder} {c : ComplaintText} :
    Proving.USC.T29.Review.Procedure.ReviewPetitionFiledInProperCourt p ord c →
    VenueNexus p c

theorem collapse_t29rev_venue_elem_clean
    {court : Proving.USC.T29.Review.Elements.ReviewingCourt} {p : Person}
    {u : Proving.USC.T29.Review.Elements.UnfairLaborPractice} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Elements.IsProperReviewingCourt court p u c) :
    VenueNexus p c :=
  bridge_t29rev_elem_venue_to_common h

theorem collapse_t29rev_venue_proc_clean
    {p : Person} {ord : Proving.USC.T29.Review.Procedure.BoardOrder} {c : ComplaintText}
    (h : Proving.USC.T29.Review.Procedure.ReviewPetitionFiledInProperCourt p ord c) :
    VenueNexus p c :=
  bridge_t29rev_proc_venue_to_common h











end Proving.USC.Common.CrossWaveT29Review
