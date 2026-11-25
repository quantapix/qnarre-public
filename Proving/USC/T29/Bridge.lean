
























import Proving.USC.T29.Elements.Statute
import Proving.USC.T29.Deontic.Statute
import Proving.USC.T29.Procedure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.Bridge
open Proving.USC.Common















axiom corr_158a_addressee {p : Person} {c : ComplaintText} :
    Elements.IsCoveredEmployer p c → Deontic.EmployerAddressee p c



axiom corr_158a_act {p : Person} {c : ComplaintText} :
    Elements.EmployerUlpTheory p c → Deontic.EmployerULPActOccurred p c








theorem s158a_elements_implies_deontic_modulo_gaps
    {p : Person} {e : Entity} {c : ComplaintText}
    (gap_158_commerce : Deontic.AffectsCommerce e c)
    (h : Elements.Section158a p c)
    : Deontic.ProhibitionViolatedS158a p e c :=
  ⟨⟨corr_158a_addressee h.coveredEmployer, gap_158_commerce⟩,
   corr_158a_act h.theory⟩










axiom corr_158b_addressee {loE : Elements.LaborOrganization}
    {loD : Deontic.LaborOrganization} {c : ComplaintText} :
    Elements.IsLaborOrganization loE c → Deontic.LaborOrgAddressee loD c


axiom corr_158b_act {loE : Elements.LaborOrganization}
    {loD : Deontic.LaborOrganization} {c : ComplaintText} :
    Elements.UnionUlpTheory loE c → Deontic.LaborOrgULPActOccurred loD c



theorem s158b_elements_implies_deontic_modulo_gaps
    {loE : Elements.LaborOrganization} {loD : Deontic.LaborOrganization}
    {e : Entity} {c : ComplaintText}
    (gap_158_commerce : Deontic.AffectsCommerce e c)
    (h : Elements.Section158b loE c)
    : Deontic.ProhibitionViolatedS158b loD e c :=
  ⟨⟨corr_158b_addressee h.isLaborOrg, gap_158_commerce⟩,
   corr_158b_act h.theory⟩

















axiom corr_160_charge {p : Person} {ch : Procedure.Charge} {c : ComplaintText} :
    Elements.ChargeFiledAndServed p c → Procedure.ChargeFiled ch c



axiom corr_160_window {p : Person} {ch : Procedure.Charge} {c : ComplaintText} :
    Elements.WithinSixMonthLimitations p c → Procedure.WithinSixMonthWindow ch c






theorem s160_elements_implies_procedure_modulo_gaps
    {p : Person} {ch : Procedure.Charge} {c : ComplaintText}
    (gap_160_complaint : Procedure.ComplaintIssuedAndServed ch c)
    (h : Elements.ValidUnfairLaborPracticeCharge p c)
    : Procedure.TimelyComplaintIssuance ch c :=
  ⟨corr_160_charge h.chargeFiled, corr_160_window h.timely, gap_160_complaint⟩











axiom corr_162_e_to_d_act {p : Person} {c : ComplaintText} :
    Elements.WillfullyInterferesWithBoard p c → Deontic.InterfereWithBoardOccurred p c


axiom corr_162_e_to_d_addr {p : Person} {c : ComplaintText} :
    Elements.WillfullyInterferesWithBoard p c → Deontic.AnyPersonAddressee p c



theorem s162_elements_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Elements.Section162Offense p c)
    : Deontic.ProhibitionViolatedS162 p c :=
  ⟨⟨corr_162_e_to_d_addr h.willfulInterference⟩, corr_162_e_to_d_act h.willfulInterference⟩


axiom corr_162_e_to_p {p : Person} {c : ComplaintText} :
    Elements.WillfullyInterferesWithBoard p c → Procedure.ObstructedBoard p c



theorem s162_elements_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Elements.Section162Offense p c)
    : Procedure.ObstructionOffense p c :=
  ⟨corr_162_e_to_p h.willfulInterference⟩


axiom corr_162_d_to_p {p : Person} {c : ComplaintText} :
    Deontic.InterfereWithBoardOccurred p c → Procedure.ObstructedBoard p c



theorem s162_deontic_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolatedS162 p c)
    : Procedure.ObstructionOffense p c :=
  ⟨corr_162_d_to_p h.2⟩





def s162_tierA_pairwise_discharge : Prop :=
  (∀ {p c}, Elements.Section162Offense p c → Deontic.ProhibitionViolatedS162 p c)
  ∧ (∀ {p c}, Elements.Section162Offense p c → Procedure.ObstructionOffense p c)
  ∧ (∀ {p c}, Deontic.ProhibitionViolatedS162 p c → Procedure.ObstructionOffense p c)

theorem s162_tierA : s162_tierA_pairwise_discharge :=
  ⟨fun h => s162_elements_implies_deontic h,
   fun h => s162_elements_implies_procedure h,
   fun h => s162_deontic_implies_procedure h⟩






















axiom corr_161_step_presupposes_power {b : Deontic.Board} {s : Procedure.Subpena}
    {c : ComplaintText} :
    Procedure.ValidInvestigatoryStep s c → Deontic.BoardInvestigatoryPower b c





theorem s161_procedure_implies_deontic_modulo_gaps
    {b : Deontic.Board} {s : Procedure.Subpena} {c : ComplaintText}
    (h : Procedure.ValidInvestigatoryStep s c)
    : Deontic.BoardInvestigatoryPower b c :=
  corr_161_step_presupposes_power h

end Proving.USC.T29.Bridge
