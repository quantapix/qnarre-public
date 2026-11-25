







import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Structure.Types
import Proving.USC.T18.Ch2.Structure.Predicates
import Proving.USC.T18.Ch2.Structure.Statute

namespace Proving.USC.T18.Ch2.Structure

open Proving.USC.Common

theorem coherent31_intro {c}
    (h1 : ReferencedSectionExists edge_31b_inc_49_40102 c)
    (h2 : ReferencedSectionExists edge_31b_inc_49_46501 c)
    : Coherent31 c := ⟨h1, h2⟩

theorem coherent32_intro {c}
    (h : IncorporationHonored edge_32_inc_31 c)
    : Coherent32 c := ⟨h⟩

theorem coherent33_intro {c}
    (h1 : IncorporationHonored edge_33_inc_31 c)
    (h2 : ReferencedSectionExists edge_33b_inc_42_10101_12 c)
    (h3 : ReferencedSectionExists edge_33b_inc_42_10101_23 c)
    : Coherent33 c := ⟨h1, h2, h3⟩

theorem coherent34_intro {c}
    (h : ReferencedSectionExists edge_34_inc_ch2 c)
    : Coherent34 c := ⟨h⟩

theorem coherent35_intro {c}
    (h1 : ReferencedSectionExists edge_35_inc_ch2 c)
    (h2 : ReferencedSectionExists edge_35_inc_ch97 c)
    (h3 : ReferencedSectionExists edge_35_inc_ch111 c)
    : Coherent35 c := ⟨h1, h2, h3⟩

theorem coherent36_intro {c}
    (h1 : ReferencedSectionExists edge_36_inc_21_848c c)
    (h2 : ReferencedSectionExists edge_36_inc_21_846 c)
    (h3 : ReferencedSectionExists edge_36_inc_21_963 c)
    (h4 : ReferencedSectionExists edge_36_inc_21_841 c)
    (h5 : ReferencedSectionExists edge_36_inc_21_960 c)
    (h6 : IncorporationHonored edge_36_inc_18_1111a c)
    : Coherent36 c := ⟨h1, h2, h3, h4, h5, h6⟩

theorem coherent37_intro {c}
    (h1 : IncorporationHonored edge_37_inc_18_1365 c)
    (h2 : ReferencedSectionExists edge_37_inc_8_1101 c)
    (h3 : ReferencedSectionExists edge_37_inc_29_113 c)
    (h4 : ExceptionApplies edge_37c_bar_37a c)
    (h5 : OverrideTriggered edge_37_lexspec_31 c)
    : Coherent37 c := ⟨h1, h2, h3, h4, h5⟩

theorem coherent38_intro {c}
    (h1 : IncorporationHonored edge_38_inc_31 c)
    (h2 : IncorporationHonored edge_38_inc_18_1365 c)
    (h3 : ReferencedSectionExists edge_38d_inc_21_853 c)
    (h4 : ExceptionApplies edge_38d_except_21_853d c)
    (h5 : ExceptionApplies edge_38e_savings c)
    : Coherent38 c := ⟨h1, h2, h3, h4, h5⟩

theorem coherent39A_intro {c}
    (h1 : IncorporationHonored edge_39A_inc_31 c)
    (h2 : ExceptionApplies edge_39Ac_except_39Aa c)
    : Coherent39A c := ⟨h1, h2⟩


theorem coherent39B_base_intro {c}
    (h1 : IncorporationHonored edge_39B_inc_31 c)
    (h2 : ReferencedSectionExists edge_39B_inc_14cfr71 c)
    : Coherent39B c := .base h1 h2


theorem coherent39B_enhanced_intro {c}
    (h1 : IncorporationHonored edge_39B_inc_31 c)
    (h2 : ReferencedSectionExists edge_39B_inc_14cfr71 c)
    (h3 : OverrideTriggered edge_39Bc1_except_39Bc2 c)
    : Coherent39B c := .enhanced h1 h2 h3

theorem coherent40_intro {c}
    (h : ReferencedSectionExists edge_40_inc_49_31132 c)
    : Coherent40 c := ⟨h⟩

theorem coherent40A_intro {c}
    (h1 : ExceptionApplies edge_40Aa_except_40Ab c)
    (h2 : ReferencedSectionExists edge_40A_inc_49_44801 c)
    (h3 : ReferencedSectionExists edge_40A_inc_42_1856m c)
    : Coherent40A c := ⟨h1, h2, h3⟩

end Proving.USC.T18.Ch2.Structure
