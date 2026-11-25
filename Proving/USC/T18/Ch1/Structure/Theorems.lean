








import Proving.USC.T18.Ch1.Structure.Statute
import Proving.USC.T18.Ch1.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Structure

open Proving.USC.Common (ComplaintText)

theorem coherent3_intro {c : ComplaintText}
    (hOverride : OverrideTriggered edge_3_notwithstanding_3571 c)
    (hExcept : ExceptionApplies edge_3_exceptAsProvided_actOfCongress c)
    (hTarget : ReferencedSectionExists edge_3_notwithstanding_3571 c)
    : Coherent3 c :=
  ⟨hOverride, hExcept, hTarget⟩

theorem coherent4_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_4_incorporates_titleFine c)
    (hTarget : ReferencedSectionExists edge_4_incorporates_titleFine c)
    : Coherent4 c :=
  ⟨hInc, hTarget⟩

theorem coherent6_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_6_incorporates_t5s1 c)
    (hTarget : ReferencedSectionExists edge_6_incorporates_t5s1 c)
    : Coherent6 c :=
  ⟨hInc, hTarget⟩

theorem coherent7_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_7_incorporates_ina101 c)
    (hTarget : ReferencedSectionExists edge_7_incorporates_ina101 c)
    : Coherent7 c :=
  ⟨hInc, hTarget⟩

theorem coherent11_intro {c : ComplaintText}
    (hExcept : ExceptionApplies edge_11_exceptAsProvided_sections c)
    (hTargets : ReferencedSectionExists edge_11_exceptAsProvided_sections c)
    : Coherent11 c :=
  ⟨hExcept, hTargets⟩

theorem coherent12_intro {c : ComplaintText}
    (hInc : IncorporationHonored edge_12_incorporates_t39 c)
    (hTarget : ReferencedSectionExists edge_12_incorporates_t39 c)
    : Coherent12 c :=
  ⟨hInc, hTarget⟩

theorem coherent13_intro {c : ComplaintText}
    (hPlace : IncorporationHonored edge_13_incorporates_7 c)
    (hStateLaw : IncorporationHonored edge_13_incorporates_stateLaw c)
    (hSubject : ReferencedSectionExists edge_13b1_subjectTo_13b2 c)
    (hPlace7 : ReferencedSectionExists edge_13_incorporates_7 c)
    : Coherent13 c :=
  ⟨hPlace, hStateLaw, hSubject, hPlace7⟩

end Proving.USC.T18.Ch1.Structure
