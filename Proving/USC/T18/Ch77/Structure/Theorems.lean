






import Proving.USC.T18.Ch77.Structure.Statute

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch77.Structure

theorem coherent1581_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1581b_incorporates_1581a c) :
    Coherent1581 c :=
  ⟨h⟩

theorem coherent1589_intro {c : ComplaintText}
    (hA : IncorporationHonored edge_1589a_incorporates_1589d c)
    (hB : IncorporationHonored edge_1589b_incorporates_1589d c) :
    Coherent1589 c :=
  ⟨hA, hB⟩

theorem coherent1590_intro {c : ComplaintText}
    (hRes : ReferencedSectionExists edge_1590_incorporates_ch77 c)
    (hHon : IncorporationHonored edge_1590_incorporates_ch77 c)
    (hPen : IncorporationHonored edge_1590b_incorporates_1590a c) :
    Coherent1590 c :=
  ⟨hRes, hHon, hPen⟩

theorem coherent1591_intro {c : ComplaintText}
    (hPen : IncorporationHonored edge_1591a_incorporates_1591b c)
    (hDef : IncorporationHonored edge_1591a_incorporates_1591e2 c) :
    Coherent1591 c :=
  ⟨hPen, hDef⟩

theorem coherent1592_intro {c : ComplaintText}
    (h1581  : ReferencedSectionExists edge_1592_incorporates_1581 c)
    (h1583  : ReferencedSectionExists edge_1592_incorporates_1583 c)
    (h1584  : ReferencedSectionExists edge_1592_incorporates_1584 c)
    (h1589  : ReferencedSectionExists edge_1592_incorporates_1589 c)
    (h1590  : ReferencedSectionExists edge_1592_incorporates_1590 c)
    (h1591  : ReferencedSectionExists edge_1592_incorporates_1591 c)
    (h1594a : ReferencedSectionExists edge_1592_incorporates_1594a c)
    (hTvpa  : IncorporationHonored edge_1592_incorporates_tvpa103 c) :
    Coherent1592 c :=
  ⟨h1581, h1583, h1584, h1589, h1590, h1591, h1594a, hTvpa⟩

theorem section1592_liable_intro {c : ComplaintText}
    (coherent  : Coherent1592 c)
    (notExempt : ¬ ExceptionApplies edge_1592_exceptAsProvided_victim c) :
    Section1592Disposition c :=
  .liable coherent notExempt

theorem section1592_exempt_intro {c : ComplaintText}
    (exception : ExceptionApplies edge_1592_exceptAsProvided_victim c) :
    Section1592Disposition c :=
  .exempt exception

end Proving.USC.T18.Ch77.Structure
