









import Proving.USC.T42.TitleVIIDef.Ontology.Statute

namespace Proving.USC.T42.TitleVIIDef.Ontology

open Proving.USC.Common



theorem employerMembership_intro {x c}
    (hEng : EngagedInIndustryAffectingCommerce x c)
    (hThr : MeetsEmployerCoverageThreshold x c)
    (hEmp : IsEmployer x c)
    : EmployerMembership x c :=
  ⟨hEng, hThr, hEmp⟩


theorem respondentMembership_intro_employer {c} (x : Employer)
    (h : IsEmployer x c) : RespondentMembership c :=
  .viaEmployer x h


theorem respondentMembership_intro_employmentAgency {c} (x : EmploymentAgency)
    (h : IsEmploymentAgency x c) : RespondentMembership c :=
  .viaEmploymentAgency x h


theorem respondentMembership_intro_laborOrg {c} (x : LaborOrganization)
    (h : IsLaborOrganization x c) : RespondentMembership c :=
  .viaLaborOrg x h



theorem unlawfulEmploymentPracticeMembership_intro {x c}
    (hActor : RespondentMembership c)
    (hEmployee : ∃ e : Employee, IsEmployee e c)
    (hPractice : IsUnlawfulEmploymentPractice x c)
    : UnlawfulEmploymentPracticeMembership x c :=
  ⟨hActor, hEmployee, hPractice⟩

end Proving.USC.T42.TitleVIIDef.Ontology
