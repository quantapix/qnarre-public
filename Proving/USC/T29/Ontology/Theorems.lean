






import Proving.USC.T29.Ontology.Statute
import Proving.USC.T29.Ontology.Predicates

namespace Proving.USC.T29.Ontology

open Proving.USC.Common



theorem employerMembership_intro {e c}
    (hEmp : IsEmployer e c) (hNotEx : ¬ IsSection152EmployerExcluded e c)
    : EmployerMembership e c := ⟨hEmp, hNotEx⟩



theorem employeeMembership_intro {e c}
    (hEmp : IsEmployee e c) (hNotEx : ¬ IsSection152EmployeeExcluded e c)
    : EmployeeMembership e c := ⟨hEmp, hNotEx⟩


theorem laborOrganizationMembership_intro {l c}
    (hOrg : IsLaborOrganization l c) : LaborOrganizationMembership l c := ⟨hOrg⟩



theorem affectingCommerceMembership_intro {k c}
    (hCom : IsCommerce k c) (hAff : IsAffectingCommerce k c)
    : AffectingCommerceMembership k c := ⟨hCom, hAff⟩


theorem unfairLaborPracticeMembership_intro {u c}
    (hUlp : IsUnfairLaborPractice u c) : UnfairLaborPracticeMembership u c := ⟨hUlp⟩


theorem personCase_individual_intro {p c}
    (hPerson : IsPerson p c) : PersonCase p c := .individual hPerson

end Proving.USC.T29.Ontology
