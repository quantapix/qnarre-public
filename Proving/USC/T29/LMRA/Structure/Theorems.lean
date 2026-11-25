








import Proving.USC.T29.LMRA.Structure.Statute

namespace Proving.USC.T29.LMRA.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent172_intro {c : ComplaintText}
    (hPay : ReferencedSectionExists edge_172b_incorporates_t5_pay c)
    (hTransfer : IncorporationHonored edge_172d_incorporates_29s51 c)
    : Coherent172 c :=
  ⟨hPay, hTransfer⟩

theorem coherent173_intro {c : ComplaintText}
    (hCommittee : IncorporationHonored edge_173e_incorporates_175a c)
    (hAdr : ReferencedSectionExists edge_173f_incorporates_t5_adr c)
    : Coherent173 c :=
  ⟨hCommittee, hAdr⟩

theorem coherent175a_intro {c : ComplaintText}
    (hGuard : IncorporationHonored edge_175a_incorporates_157 c)
    : Coherent175a c :=
  ⟨hGuard⟩

theorem coherent177_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_177c_incorporates_t15 c)
    (hHonored : IncorporationHonored edge_177c_incorporates_t15 c)
    : Coherent177 c :=
  ⟨hExists, hHonored⟩

theorem coherent178_intro {c : ComplaintText}
    (hReport : IncorporationHonored edge_178a_incorporates_176 c)
    (hOverride : OverrideTriggered edge_178b_overrides_ch6 c)
    (hReview : ReferencedSectionExists edge_178c_incorporates_t28 c)
    : Coherent178 c :=
  ⟨hReport, hOverride, hReview⟩

theorem coherent179_intro {c : ComplaintText}
    (hInj : IncorporationHonored edge_179a_incorporates_178 c)
    : Coherent179 c :=
  ⟨hInj⟩

theorem coherent182_intro {c : ComplaintText}
    (hRla : ReferencedSectionExists edge_182_except_rla c)
    (hExempt : ExceptionApplies edge_182_except_rla c)
    : Coherent182 c :=
  ⟨hRla, hExempt⟩

theorem coherent183_intro {c : ComplaintText}
    (hNotice : IncorporationHonored edge_183a_incorporates_158d c)
    : Coherent183 c :=
  ⟨hNotice⟩

theorem coherent185_intro {c : ComplaintText}
    (hDefs : IncorporationHonored edge_185_incorporates_chapDefs c)
    : Coherent185 c :=
  ⟨hDefs⟩

theorem coherent186_intro {c : ComplaintText}
    (hMotor : ReferencedSectionExists edge_186b_incorporates_t49 c)
    (hCommittee : IncorporationHonored edge_186c9_incorporates_175a c)
    (hNotice : ReferencedSectionExists edge_186e_subjectTo_t28s381 c)
    (hOverride : OverrideTriggered edge_186e_overrides_antiInjunction c)
    : Coherent186 c :=
  ⟨hMotor, hCommittee, hNotice, hOverride⟩

theorem coherent187_intro {c : ComplaintText}
    (hUlp : IncorporationHonored edge_187a_incorporates_158b4 c)
    (hS185 : ReferencedSectionExists edge_187b_subjectTo_185 c)
    : Coherent187 c :=
  ⟨hUlp, hS185⟩


theorem injectionPath_nationalEmergency_intro {c : ComplaintText}
    (h : OverrideTriggered edge_178b_overrides_ch6 c)
    : InjunctionOverridePath c :=
  .nationalEmergency h


theorem injectionPath_financialRestriction_intro {c : ComplaintText}
    (h : OverrideTriggered edge_186e_overrides_antiInjunction c)
    : InjunctionOverridePath c :=
  .financialRestriction h

end Proving.USC.T29.LMRA.Structure
