




import Proving.USC.T42.Ch6ASchI.Part3.Structure.Statute

namespace Proving.USC.T42.Ch6ASchI.Part3.Structure
open Proving.USC.Common

theorem coherent218_intro {c : ComplaintText}
    (hGrant : IncorporationHonored edge_218_incorporates_254b c)
    (hT5 : OverrideTriggered edge_218_notwithstanding_t5_1013a c)
    : Coherent218 c :=
  ⟨hGrant, hT5⟩

theorem coherent218a_intro {c : ComplaintText}
    (h213 : IncorporationHonored edge_218a_incorporates_213 c)
    (h233 : IncorporationHonored edge_218a_incorporates_233 c)
    : Coherent218a c :=
  ⟨h213, h233⟩

theorem coherent233_intro {c : ComplaintText}
    (hFtca : IncorporationHonored edge_233_incorporates_t28_1346b c)
    (hAdmin : IncorporationHonored edge_233_incorporates_t28_2672 c)
    (hPay : IncorporationHonored edge_233_incorporates_t28_ch171 c)
    (hTort : OverrideTriggered edge_233_notwithstanding_t28_2680h c)
    (hPartC : ExceptionApplies edge_233_exceptAsProvided_partC c)
    : Coherent233 c :=
  ⟨hFtca, hAdmin, hPay, hTort, hPartC⟩

theorem coherent234_intro {c : ComplaintText}
    (hMrc : IncorporationHonored edge_234_incorporates_300hh15 c)
    (hEsar : IncorporationHonored edge_234_incorporates_247d7b c)
    (hDecl : IncorporationHonored edge_234_incorporates_247d c)
    (hVpa : SavingsPreserved edge_234_savings_vpa c)
    (hPreempt : ReferencedSectionExists edge_234_lexSpecialis_stateLaw c)
    : Coherent234 c :=
  ⟨hMrc, hEsar, hDecl, hVpa, hPreempt⟩

theorem coherent235_intro {c : ComplaintText}
    (hGrants : IncorporationHonored edge_235_incorporates_246 c)
    (hSavings : SavingsPreserved edge_235_savings_otherLaw c)
    : Coherent235 c :=
  ⟨hGrants, hSavings⟩

theorem coherent236_intro {c : ComplaintText}
    (hOrphan : IncorporationHonored edge_236_incorporates_t21_360aa c)
    (hApproval : IncorporationHonored edge_236_incorporates_t21_355 c)
    (hBio : IncorporationHonored edge_236_incorporates_262 c)
    : Coherent236 c :=
  ⟨hOrphan, hApproval, hBio⟩

theorem coherent237_intro {c : ComplaintText}
    (hT5 : OverrideTriggered edge_237_notwithstanding_t5_appt c)
    (hPay : IncorporationHonored edge_237_incorporates_t3_102 c)
    : Coherent237 c :=
  ⟨hT5, hPay⟩

theorem coherent238a_intro {c : ComplaintText}
    (hCarveout : ExceptionApplies edge_238a_exceptAsProvided_249a c)
    : Coherent238a c :=
  ⟨hCarveout⟩

theorem coherent238d_intro {c : ComplaintText}
    (hMhsa : IncorporationHonored edge_238d_incorporates_9511 c)
    : Coherent238d c :=
  ⟨hMhsa⟩

theorem coherent238e_intro {c : ComplaintText}
    (hReorg : IncorporationHonored edge_238e_incorporates_203 c)
    : Coherent238e c :=
  ⟨hReorg⟩

theorem coherent238l_intro {c : ComplaintText}
    (hFunds : IncorporationHonored edge_238l_incorporates_cmhca_2689 c)
    (hTest : IncorporationHonored edge_238l_incorporates_2689j c)
    : Coherent238l c :=
  ⟨hFunds, hTest⟩

theorem coherent238m_intro {c : ComplaintText}
    (hCarrier : IncorporationHonored edge_238m_incorporates_1395u c)
    (hIsda : IncorporationHonored edge_238m_incorporates_t25_5321 c)
    (hComp : OverrideTriggered edge_238m_notwithstanding_t41_6101 c)
    : Coherent238m c :=
  ⟨hCarrier, hIsda, hComp⟩

end Proving.USC.T42.Ch6ASchI.Part3.Structure
