import Proving.USC.T18.Ch2Ch3.Structure.Statute
import Proving.USC.Common.Types
set_option autoImplicit false
open Proving.USC.Common

namespace Proving.USC.T18.Ch2Ch3.Structure




theorem coherent32_intro {c : ComplaintText}
    (hIna : ReferencedSectionExists edge_32_incorporates_ina101 c)
    (hInaInc : IncorporationHonored edge_32_incorporates_ina101 c)
    (hFine : ReferencedSectionExists edge_32_incorporates_3571 c)
    : Coherent32 c :=
  ⟨hIna, hInaInc, hFine⟩

theorem coherent36_intro {c : ComplaintText}
    (h848c : IncorporationHonored edge_36_incorporates_csa848c c)
    (h846 : IncorporationHonored edge_36_incorporates_csa846 c)
    (h963 : IncorporationHonored edge_36_incorporates_csiea963 c)
    (h841 : IncorporationHonored edge_36_incorporates_csa841 c)
    (h960 : IncorporationHonored edge_36_incorporates_csiea960 c)
    (hMurder : IncorporationHonored edge_36_incorporates_1111a c)
    (hFine : ReferencedSectionExists edge_36_incorporates_3571 c)
    : Coherent36 c :=
  ⟨h848c, h846, h963, h841, h960, hMurder, hFine⟩

theorem coherent37_intro {c : ComplaintText}
    (hSbi : IncorporationHonored edge_37_incorporates_1365 c)
    (hIna : IncorporationHonored edge_37_incorporates_ina101 c)
    (hLabor : IncorporationHonored edge_37_incorporates_norris113c c)
    (hFine : ReferencedSectionExists edge_37_incorporates_3571 c)
    : Coherent37 c :=
  ⟨hSbi, hIna, hLabor, hFine⟩

theorem coherent38_intro {c : ComplaintText}
    (hSbi : IncorporationHonored edge_38_incorporates_1365 c)
    (hForf : ReferencedSectionExists edge_38_subjectTo_853 c)
    (hSav : SavingsPreserved edge_38_savings_otherlaw c)
    (hFine : ReferencedSectionExists edge_38_incorporates_3571 c)
    : Coherent38 c :=
  ⟨hSbi, hForf, hSav, hFine⟩

theorem coherent39B_intro {c : ComplaintText}
    (hCfr : IncorporationHonored edge_39b_incorporates_cfr71 c)
    (hExc : ExceptionApplies edge_39b_except_c2 c)
    (hFine : ReferencedSectionExists edge_39b_incorporates_3571 c)
    : Coherent39B c :=
  ⟨hCfr, hExc, hFine⟩

theorem coherent40A_intro {c : ComplaintText}
    (hUnmanned : IncorporationHonored edge_40a_incorporates_t49_44801 c)
    (hWildfire : IncorporationHonored edge_40a_incorporates_t42_1856m c)
    (hGov : ExceptionApplies edge_40a_except_b c)
    (hFine : ReferencedSectionExists edge_40a_incorporates_3571 c)
    : Coherent40A c :=
  ⟨hUnmanned, hWildfire, hGov, hFine⟩

theorem coherent42_intro {c : ComplaintText}
    (hPhsa : SavingsPreserved edge_42_savings_phsa c)
    (hFdca : SavingsPreserved edge_42_savings_fdca c)
    (hFppa : SavingsPreserved edge_42_savings_fppa c)
    (hPermit : OverrideTriggered edge_42_notwithstanding_a1 c)
    (hFine : ReferencedSectionExists edge_42_incorporates_3571 c)
    : Coherent42 c :=
  ⟨hPhsa, hFdca, hFppa, hPermit, hFine⟩

theorem coherent43_intro {c : ComplaintText}
    (hFamily : IncorporationHonored edge_43_incorporates_115 c)
    (hR3663 : ReferencedSectionExists edge_43_subjectTo_3663 c)
    (hR3663A : ReferencedSectionExists edge_43_subjectTo_3663a c)
    (hFirstAmend : SavingsPreserved edge_43_savings_firstAmendment c)
    (hRemedies : SavingsPreserved edge_43_savings_remedies c)
    (hStateLaw : SavingsPreserved edge_43_savings_statelaw c)
    (hFine : ReferencedSectionExists edge_43_incorporates_3571 c)
    : Coherent43 c :=
  ⟨hFamily, hR3663, hR3663A, hFirstAmend, hRemedies, hStateLaw, hFine⟩

end Proving.USC.T18.Ch2Ch3.Structure
