







import Proving.USC.T42.CRIPA.Structure.Statute

namespace Proving.USC.T42.CRIPA.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent1997a_intro {c : ComplaintText}
    (hDef : ReferencedSectionExists edge_1997a_incorporates_1997 c)
    (hDefH : IncorporationHonored edge_1997a_incorporates_1997 c)
    (hJail : IncorporationHonored edge_1997a_incorporates_1997_1Bii c)
    : Coherent1997a c :=
  ⟨hDef, hDefH, hJail⟩

theorem coherent1997b_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1997b_incorporates_1997a c)
    (hHonored : IncorporationHonored edge_1997b_incorporates_1997a c)
    : Coherent1997b c :=
  ⟨hExists, hHonored⟩

theorem coherent1997c_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1997c_incorporates_1997 c)
    (hHonored : IncorporationHonored edge_1997c_incorporates_1997 c)
    : Coherent1997c c :=
  ⟨hExists, hHonored⟩

theorem coherent1997e_intro {c : ComplaintText}
    (h1983 : ReferencedSectionExists edge_1997e_subjectTo_1983 c)
    (hExh : OverrideTriggered edge_1997e_subjectTo_1983 c)
    (hG1997a : ExceptionApplies edge_1997e_exceptAsProvided_1997a c)
    (hG1997c : ExceptionApplies edge_1997e_exceptAsProvided_1997c c)
    (hFee : ReferencedSectionExists edge_1997e_subjectTo_1988 c)
    (hRate : IncorporationHonored edge_1997e_incorporates_t18_3006A c)
    (hSex : IncorporationHonored edge_1997e_incorporates_t18_2246 c)
    : Coherent1997e c :=
  ⟨h1983, hExh, hG1997a, hG1997c, hFee, hRate, hSex⟩

theorem coherent1997f_intro {c : ComplaintText}
    (hVehicle : ReferencedSectionExists edge_1997f_incorporates_t28_522 c)
    : Coherent1997f c :=
  ⟨hVehicle⟩

theorem coherent1997h_intro {c : ComplaintText}
    (hInvest : ReferencedSectionExists edge_1997h_incorporates_1997a c)
    (hInterv : ReferencedSectionExists edge_1997h_incorporates_1997c c)
    (hInvestH : IncorporationHonored edge_1997h_incorporates_1997a c)
    (hIntervH : IncorporationHonored edge_1997h_incorporates_1997c c)
    : Coherent1997h c :=
  ⟨hInvest, hInterv, hInvestH, hIntervH⟩

theorem coherentSavings_intro {c : ComplaintText}
    (hStd : SavingsClauseRespected edge_1997i_savings_subchapter c)
    (hPriv : SavingsClauseRespected edge_1997j_savings_existing_law c)
    : CoherentSavings c :=
  ⟨hStd, hPriv⟩

theorem coherentCRIPA_intro {c : ComplaintText}
    (h1997a : Coherent1997a c) (h1997b : Coherent1997b c) (h1997c : Coherent1997c c)
    (h1997e : Coherent1997e c) (h1997f : Coherent1997f c) (h1997h : Coherent1997h c)
    (hSav : CoherentSavings c)
    : CoherentCRIPA c :=
  ⟨h1997a, h1997b, h1997c, h1997e, h1997f, h1997h, hSav⟩

end Proving.USC.T42.CRIPA.Structure
