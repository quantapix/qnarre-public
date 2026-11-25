







































import Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure.Theorems
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch5Ch7Ch9Ch10











axiom corr_s81 {p c} : Elements.Section81 p c →
    Deontic.AddresseeInClass Deontic.Provision.s81 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s81 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s81 p c


theorem s81_elements_implies_deontic {p c} (h : Elements.Section81 p c) :
    Deontic.ProhibitionViolated81 p c :=
  let ⟨ha, hc, hr⟩ := corr_s81 h
  ⟨⟨ha, hc⟩, hr⟩



axiom corr_s111 {p c} : Elements.Section111 p c →
    Deontic.AddresseeInClass Deontic.Provision.s111 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s111 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s111 p c
theorem s111_elements_implies_deontic {p c} (h : Elements.Section111 p c) :
    Deontic.ProhibitionViolated111 p c :=
  let ⟨ha, hc, hr⟩ := corr_s111 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s112 {p c} : Elements.Section112 p c →
    Deontic.AddresseeInClass Deontic.Provision.s112 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s112 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s112 p c
theorem s112_elements_implies_deontic {p c} (h : Elements.Section112 p c) :
    Deontic.ProhibitionViolated112 p c :=
  let ⟨ha, hc, hr⟩ := corr_s112 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s113 {p c} : Elements.Section113 p c →
    Deontic.AddresseeInClass Deontic.Provision.s113 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s113 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s113 p c
theorem s113_elements_implies_deontic {p c} (h : Elements.Section113 p c) :
    Deontic.ProhibitionViolated113 p c :=
  let ⟨ha, hc, hr⟩ := corr_s113 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s114 {p c} : Elements.Section114 p c →
    Deontic.AddresseeInClass Deontic.Provision.s114 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s114 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s114 p c
theorem s114_elements_implies_deontic {p c} (h : Elements.Section114 p c) :
    Deontic.ProhibitionViolated114 p c :=
  let ⟨ha, hc, hr⟩ := corr_s114 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s115 {p c} : Elements.Section115 p c →
    Deontic.AddresseeInClass Deontic.Provision.s115 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s115 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s115 p c
theorem s115_elements_implies_deontic {p c} (h : Elements.Section115 p c) :
    Deontic.ProhibitionViolated115 p c :=
  let ⟨ha, hc, hr⟩ := corr_s115 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s116 {p c} : Elements.Section116 p c →
    Deontic.AddresseeInClass Deontic.Provision.s116 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s116 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s116 p c
theorem s116_elements_implies_deontic {p c} (h : Elements.Section116 p c) :
    Deontic.ProhibitionViolated116 p c :=
  let ⟨ha, hc, hr⟩ := corr_s116 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s117 {p c} : Elements.Section117 p c →
    Deontic.AddresseeInClass Deontic.Provision.s117 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s117 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s117 p c
theorem s117_elements_implies_deontic {p c} (h : Elements.Section117 p c) :
    Deontic.ProhibitionViolated117 p c :=
  let ⟨ha, hc, hr⟩ := corr_s117 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s118 {p c} : Elements.Section118 p c →
    Deontic.AddresseeInClass Deontic.Provision.s118 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s118 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s118 p c
theorem s118_elements_implies_deontic {p c} (h : Elements.Section118 p c) :
    Deontic.ProhibitionViolated118 p c :=
  let ⟨ha, hc, hr⟩ := corr_s118 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s119 {p c} : Elements.Section119 p c →
    Deontic.AddresseeInClass Deontic.Provision.s119 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s119 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s119 p c
theorem s119_elements_implies_deontic {p c} (h : Elements.Section119 p c) :
    Deontic.ProhibitionViolated119 p c :=
  let ⟨ha, hc, hr⟩ := corr_s119 h; ⟨⟨ha, hc⟩, hr⟩



axiom corr_s152 {p c} : Elements.Section152 p c →
    Deontic.AddresseeInClass Deontic.Provision.s152 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s152 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s152 p c
theorem s152_elements_implies_deontic {p c} (h : Elements.Section152 p c) :
    Deontic.ProhibitionViolated152 p c :=
  let ⟨ha, hc, hr⟩ := corr_s152 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s153 {p c} : Elements.Section153 p c →
    Deontic.AddresseeInClass Deontic.Provision.s153 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s153 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s153 p c
theorem s153_elements_implies_deontic {p c} (h : Elements.Section153 p c) :
    Deontic.ProhibitionViolated153 p c :=
  let ⟨ha, hc, hr⟩ := corr_s153 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s154 {p c} : Elements.Section154 p c →
    Deontic.AddresseeInClass Deontic.Provision.s154 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s154 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s154 p c
theorem s154_elements_implies_deontic {p c} (h : Elements.Section154 p c) :
    Deontic.ProhibitionViolated154 p c :=
  let ⟨ha, hc, hr⟩ := corr_s154 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s155 {p c} : Elements.Section155 p c →
    Deontic.AddresseeInClass Deontic.Provision.s155 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s155 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s155 p c
theorem s155_elements_implies_deontic {p c} (h : Elements.Section155 p c) :
    Deontic.ProhibitionViolated155 p c :=
  let ⟨ha, hc, hr⟩ := corr_s155 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s156 {p c} : Elements.Section156 p c →
    Deontic.AddresseeInClass Deontic.Provision.s156 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s156 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s156 p c
theorem s156_elements_implies_deontic {p c} (h : Elements.Section156 p c) :
    Deontic.ProhibitionViolated156 p c :=
  let ⟨ha, hc, hr⟩ := corr_s156 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s157 {p c} : Elements.Section157 p c →
    Deontic.AddresseeInClass Deontic.Provision.s157 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s157 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s157 p c
theorem s157_elements_implies_deontic {p c} (h : Elements.Section157 p c) :
    Deontic.ProhibitionViolated157 p c :=
  let ⟨ha, hc, hr⟩ := corr_s157 h; ⟨⟨ha, hc⟩, hr⟩



axiom corr_s175 {p m c} : Elements.Section175 p m c →
    Deontic.AddresseeInClass Deontic.Provision.s175 p c
    ∧ Deontic.ConditionMet Deontic.Provision.s175 c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s175 p c


theorem s175_elements_implies_deontic {p m c} (h : Elements.Section175 p m c) :
    Deontic.ProhibitionViolated175 p c :=
  let ⟨ha, hc, hr⟩ := corr_s175 h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s175b {p m c} : Elements.Section175b p m c →
    Deontic.AddresseeInClass Deontic.Provision.s175b p c
    ∧ Deontic.ConditionMet Deontic.Provision.s175b c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s175b p c
theorem s175b_elements_implies_deontic {p m c} (h : Elements.Section175b p m c) :
    Deontic.ProhibitionViolated175b p c :=
  let ⟨ha, hc, hr⟩ := corr_s175b h; ⟨⟨ha, hc⟩, hr⟩

axiom corr_s175c {p c} : Elements.Section175c p c →
    Deontic.AddresseeInClass Deontic.Provision.s175c p c
    ∧ Deontic.ConditionMet Deontic.Provision.s175c c
    ∧ Deontic.RegulatedActOccurred Deontic.Provision.s175c p c
theorem s175c_elements_implies_deontic {p c} (h : Elements.Section175c p c) :
    Deontic.ProhibitionViolated175c p c :=
  let ⟨ha, hc, hr⟩ := corr_s175c h; ⟨⟨ha, hc⟩, hr⟩







axiom corr_117_locus {p c} :
    Elements.CommittedDomesticAssault p c → Elements.WithinSmtjOrIndianCountry c →
    Procedure.DomesticAssaultInSpecialJurisdiction p c

axiom corr_117_priors {p c} :
    Elements.HasTwoPriorQualifyingConvictions p c → Procedure.TwoPriorFinalConvictions p c



theorem s117_elements_implies_procedure {p c} (h : Elements.Section117 p c) :
    Procedure.HabitualOffenderStatus p c :=
  ⟨corr_117_locus h.assault h.jurisdiction, corr_117_priors h.recidivist⟩


axiom corr_175b_status {p c} :
    Elements.IsRestrictedPerson p c → Procedure.AdjudicativeStatusRestricted p c

axiom corr_175b_commerce {p c} :
    Elements.AffectsInterstateOrForeignCommerce c → Procedure.InterstateCommerceNexus p c



theorem s175b_elements_implies_procedure {p m c} (h : Elements.Section175b p m c) :
    Procedure.RestrictedPersonTransferBar p c :=
  ⟨corr_175b_status h.restricted, corr_175b_commerce h.commerce⟩











axiom corr_s175a_cond {c} :
    Procedure.EmergencyMilitaryAssistanceRequest c → Deontic.ConditionMet Deontic.Provision.s175a c

axiom corr_s175a_act {p c} :
    Procedure.EmergencyMilitaryAssistanceRequest c → Deontic.RegulatedActOccurred Deontic.Provision.s175a p c



theorem s175a_procedure_implies_deontic_modulo_gaps {p c}
    (h : Procedure.EmergencyMilitaryAssistanceRequest c)
    (gap_agPowerHolder : Deontic.AddresseeInClass Deontic.Provision.s175a p c) :
    Deontic.PowerExercised175a p c :=
  ⟨⟨gap_agPowerHolder, corr_s175a_cond h⟩, corr_s175a_act h⟩


axiom corr_s176_cond {m c} :
    Elements.Section176 m c → Deontic.ConditionMet Deontic.Provision.s176 c




theorem s176_elements_implies_deontic_modulo_gaps {p m c}
    (h : Elements.Section176 m c)
    (gap_usPowerHolder : Deontic.AddresseeInClass Deontic.Provision.s176 p c)
    (gap_seizureAct : Deontic.RegulatedActOccurred Deontic.Provision.s176 p c) :
    Deontic.PowerExercised176 p c :=
  ⟨⟨gap_usPowerHolder, corr_s176_cond h⟩, gap_seizureAct⟩


axiom corr_s177_cond {m c} :
    Elements.Section177 m c → Deontic.ConditionMet Deontic.Provision.s177 c



theorem s177_elements_implies_deontic_modulo_gaps {p m c}
    (h : Elements.Section177 m c)
    (gap_usPowerHolder : Deontic.AddresseeInClass Deontic.Provision.s177 p c)
    (gap_civilAct : Deontic.RegulatedActOccurred Deontic.Provision.s177 p c) :
    Deontic.PowerExercised177 p c :=
  ⟨⟨gap_usPowerHolder, corr_s177_cond h⟩, gap_civilAct⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Bridge
