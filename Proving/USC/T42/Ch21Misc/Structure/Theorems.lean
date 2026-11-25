




import Proving.USC.T42.Ch21Misc.Structure.Statute

namespace Proving.USC.T42.Ch21Misc.Structure

open Proving.USC.Common


theorem coherent2000d4a_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000d4a_incorporates_t20s7801 c)
    (hInc : IncorporationHonored edge_2000d4a_incorporates_t20s7801 c)
    : Coherent2000d4a c := ⟨hEx, hInc⟩


theorem coherent2000e1_intro {c : ComplaintText}
    (hEx2  : ReferencedSectionExists edge_2000e1c1_incorporates_2000e2 c)
    (hEx3  : ReferencedSectionExists edge_2000e1c1_incorporates_2000e3 c)
    (hInc2 : IncorporationHonored edge_2000e1c1_incorporates_2000e2 c)
    (hInc3 : IncorporationHonored edge_2000e1c1_incorporates_2000e3 c)
    : Coherent2000e1 c := ⟨hEx2, hEx3, hInc2, hInc3⟩


theorem exemption2000e1_religiousOrAlien_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e1a_exceptsSubchapter c)
    : Exemption2000e1 c := .religiousOrAlien h


theorem exemption2000e1_foreignLaw2000e2_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e1b_excepts_2000e2 c)
    : Exemption2000e1 c := .foreignLaw2000e2 h


theorem exemption2000e1_foreignLaw2000e3_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e1b_excepts_2000e3 c)
    : Exemption2000e1 c := .foreignLaw2000e3 h


theorem exemption2000e1_foreignPerson2000e2_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e1c2_excepts_2000e2 c)
    : Exemption2000e1 c := .foreignPerson2000e2 h


theorem exemption2000e1_foreignPerson2000e3_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e1c2_excepts_2000e3 c)
    : Exemption2000e1 c := .foreignPerson2000e3 h


theorem coherent2000e7_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000e7_incorporates_2000e2 c)
    (hInc : IncorporationHonored edge_2000e7_incorporates_2000e2 c)
    (hSav : SavingsPreserved edge_2000e7_savings_stateLaw c)
    : Coherent2000e7 c := ⟨hEx, hInc, hSav⟩


theorem coherent2000e10_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000e10a_incorporates_2000e4 c)
    (hInc : IncorporationHonored edge_2000e10a_incorporates_2000e4 c)
    : Coherent2000e10 c := ⟨hEx, hInc⟩


theorem coherent2000e11_intro {c : ComplaintText}
    (hSav : SavingsPreserved edge_2000e11_savings_veteransLaws c)
    : Coherent2000e11 c := ⟨hSav⟩


theorem coherent2000e13_intro {c : ComplaintText}
    (hEx111   : ReferencedSectionExists edge_2000e13_incorporates_t18s111 c)
    (hEx1114  : ReferencedSectionExists edge_2000e13_incorporates_t18s1114 c)
    (hInc111  : IncorporationHonored edge_2000e13_incorporates_t18s111 c)
    (hInc1114 : IncorporationHonored edge_2000e13_incorporates_t18s1114 c)
    : Coherent2000e13 c := ⟨hEx111, hEx1114, hInc111, hInc1114⟩


theorem penaltyPath2000e13_standardPenalty_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000e13_incorporates_t18s1114 c)
    : PenaltyPath2000e13 c := .standardPenalty h


theorem penaltyPath2000e13_killingOverride_intro {c : ComplaintText}
    (h : OverrideTriggered edge_2000e13_notwithstanding_t18s1114 c)
    : PenaltyPath2000e13 c := .killingOverride h


theorem coherent2000e14_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000e14_incorporates_2000e4 c)
    (hInc : IncorporationHonored edge_2000e14_incorporates_2000e4 c)
    : Coherent2000e14 c := ⟨hEx, hInc⟩


theorem coherent2000e15_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000e15_incorporates_2000e c)
    (hInc : IncorporationHonored edge_2000e15_incorporates_2000e c)
    : Coherent2000e15 c := ⟨hEx, hInc⟩


theorem coherent2000e17_intro {c : ComplaintText}
    (hEx  : ReferencedSectionExists edge_2000e17_incorporates_t5s554 c)
    (hInc : IncorporationHonored edge_2000e17_incorporates_t5s554 c)
    (hLex : LexSpecialisControls edge_2000e17_lexSpecialis_eeoOrders c)
    : Coherent2000e17 c := ⟨hEx, hInc, hLex⟩


theorem applicability2000e17_hearingProtected_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000e17_incorporates_t5s554 c)
    : Applicability2000e17 c := .hearingProtected h


theorem applicability2000e17_substantialDeviation_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000e17_proviso_excepts_self c)
    : Applicability2000e17 c := .substantialDeviation h

end Proving.USC.T42.Ch21Misc.Structure
