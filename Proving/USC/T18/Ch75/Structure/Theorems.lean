




import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Structure.Types
import Proving.USC.T18.Ch75.Structure.Predicates
import Proving.USC.T18.Ch75.Structure.Statute

namespace Proving.USC.T18.Ch75.Structure

open Proving.USC.Common

theorem coherent1542_intro {c : ComplaintText}
    (hTermR : ReferencedSectionExists edge_1542_incorp_2331 c)
    (hDrugR : ReferencedSectionExists edge_1542_incorp_929a c)
    (hLawR  : ReferencedSectionExists edge_1542_incorp_passportLaw c)
    (hTermH : IncorporationHonored edge_1542_incorp_2331 c)
    (hDrugH : IncorporationHonored edge_1542_incorp_929a c)
    (hLawH  : IncorporationHonored edge_1542_incorp_passportLaw c)
    : Coherent1542 c :=
  ⟨hTermR, hDrugR, hLawR, hTermH, hDrugH, hLawH⟩

theorem coherent1543_intro {c : ComplaintText}
    (hTermR : ReferencedSectionExists edge_1543_incorp_2331 c)
    (hDrugR : ReferencedSectionExists edge_1543_incorp_929a c)
    (hTermH : IncorporationHonored edge_1543_incorp_2331 c)
    (hDrugH : IncorporationHonored edge_1543_incorp_929a c)
    : Coherent1543 c :=
  ⟨hTermR, hDrugR, hTermH, hDrugH⟩

theorem coherent1544_intro {c : ComplaintText}
    (hTermR  : ReferencedSectionExists edge_1544_incorp_2331 c)
    (hDrugR  : ReferencedSectionExists edge_1544_incorp_929a c)
    (hRulesR : ReferencedSectionExists edge_1544_incorp_passportRules c)
    (hTermH  : IncorporationHonored edge_1544_incorp_2331 c)
    (hDrugH  : IncorporationHonored edge_1544_incorp_929a c)
    (hRulesH : IncorporationHonored edge_1544_incorp_passportRules c)
    : Coherent1544 c :=
  ⟨hTermR, hDrugR, hRulesR, hTermH, hDrugH, hRulesH⟩

theorem coherent1546_intro {c : ComplaintText}
    (hTermR  : ReferencedSectionExists edge_1546_incorp_2331 c)
    (hDrugR  : ReferencedSectionExists edge_1546_incorp_929a c)
    (hPerjR  : ReferencedSectionExists edge_1546_incorp_1746 c)
    (hInaR   : ReferencedSectionExists edge_1546_incorp_ina c)
    (hTermH  : IncorporationHonored edge_1546_incorp_2331 c)
    (hDrugH  : IncorporationHonored edge_1546_incorp_929a c)
    (hPerjH  : IncorporationHonored edge_1546_incorp_1746 c)
    (hInaH   : IncorporationHonored edge_1546_incorp_ina c)
    (hOcca   : ExceptionApplies edge_1546_except_occa c)
    : Coherent1546 c :=
  ⟨hTermR, hDrugR, hPerjR, hInaR, hTermH, hDrugH, hPerjH, hInaH, hOcca⟩

end Proving.USC.T18.Ch75.Structure
