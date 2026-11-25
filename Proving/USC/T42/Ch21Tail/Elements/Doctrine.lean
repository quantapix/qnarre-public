







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic
import Proving.USC.T42.Ch21Tail.Elements.Types
import Proving.USC.T42.Ch21Tail.Elements.Predicates
import Proving.USC.T42.Ch21Tail.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Elements

open Proving.USC.Common




@[grind →] theorem protectedReport1997d_of_leaves
    {p : Person} {r : Report} {i : Institution} {c : ComplaintText}
    (h1 : MadeReportOfConditions p r c)
    (h2 : ConditionsReportedAtInstitution r i c)
    (h3 : IsCoveredInstitution i c)
    (h4 : ConditionsMayConstituteSubchapterViolation r c) :
    ProtectedReport1997d p r i c :=
  ⟨h1, h2, h3, h4⟩

example {p : Person} {r : Report} {i : Institution} {c : ComplaintText}
    (h1 : MadeReportOfConditions p r c)
    (h2 : ConditionsReportedAtInstitution r i c)
    (h3 : IsCoveredInstitution i c)
    (h4 : ConditionsMayConstituteSubchapterViolation r c) :
    ReportedProtectedConditions p r i c := by prove_element




@[grind →] theorem deprivation_of_constitutional
    {i : Institution} {c : ComplaintText}
    (h : ConditionsDepriveConstitutionalRights i c) :
    DeprivationOfProtectedRights i c :=
  .constitutional h


@[grind →] theorem deprivation_of_federal_statutory
    {i : Institution} {c : ComplaintText}
    (h : ConditionsDepriveFederalStatutoryRights i c) :
    DeprivationOfProtectedRights i c :=
  .federalStatutory h


@[grind →] theorem correctableConditions1997g_of_leaves
    {i : Institution} {c : ComplaintText}
    (h1 : IsCoveredInstitution i c)
    (h2 : ConditionsAreDeplorable i c)
    (h3 : DeprivationOfProtectedRights i c) :
    CorrectableConditions1997g i c :=
  ⟨h1, h2, h3⟩

example {i : Institution} {c : ComplaintText}
    (h1 : IsCoveredInstitution i c)
    (h2 : ConditionsAreDeplorable i c)
    (h3 : ConditionsDepriveConstitutionalRights i c) :
    ConditionsWarrantCorrection i c := by prove_element

example {i : Institution} {c : ComplaintText}
    (h1 : IsCoveredInstitution i c)
    (h2 : ConditionsAreDeplorable i c)
    (h3 : ConditionsDepriveFederalStatutoryRights i c) :
    ConditionsWarrantCorrection i c := by prove_element

end Proving.USC.T42.Ch21Tail.Elements
