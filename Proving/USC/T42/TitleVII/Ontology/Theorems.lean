









import Proving.USC.T42.TitleVII.Ontology.Statute

namespace Proving.USC.T42.TitleVII.Ontology

open Proving.USC.Common


theorem employerMembership_intro {e p ent c}
    (hE : IsEmployer e c) (hP : IsPerson p c) (hC : AffectsCommerce ent c)
    : EmployerMembership e p ent c := ⟨hE, hP, hC⟩


theorem employmentAgencyMembership_intro {a p c}
    (hA : IsEmploymentAgency a c) (hP : IsPerson p c)
    : EmploymentAgencyMembership a p c := ⟨hA, hP⟩


theorem laborOrganizationMembership_intro {l ent c}
    (hL : IsLaborOrganization l c) (hC : AffectsCommerce ent c)
    : LaborOrganizationMembership l ent c := ⟨hL, hC⟩


theorem industryAffectingCommerceMembership_intro {ent x c}
    (hC : AffectsCommerce ent c) (hX : IsCommerce x c)
    : IndustryAffectingCommerceMembership ent x c := ⟨hC, hX⟩


theorem respondentKind_intro_employer {c} (e : Employer) (h : IsEmployer e c)
    : RespondentKind c := .employer e h


theorem respondentKind_intro_employmentAgency {c}
    (a : EmploymentAgency) (h : IsEmploymentAgency a c)
    : RespondentKind c := .employmentAgency a h


theorem respondentKind_intro_laborOrg {c}
    (l : LaborOrganization) (h : IsLaborOrganization l c)
    : RespondentKind c := .laborOrg l h


theorem unlawfulPractice_intro {x c}
    (hR : RespondentKind c) (hU : IsUnlawfulEmploymentPractice x c)
    : UnlawfulPractice x c := ⟨hR, hU⟩


theorem motivatingFactorPractice_intro {x c}
    (hBase : UnlawfulPractice x c) (hM : IsMotivatingFactor x c)
    : MotivatingFactorPractice x c := ⟨hBase, hM⟩


theorem retaliationPractice_intro {x a c}
    (hR : RespondentKind c) (hA : IsProtectedActivity a c)
    (hU : IsUnlawfulEmploymentPractice x c)
    : RetaliationPractice x a c := ⟨hR, hA, hU⟩


theorem federalSectorPractice_intro {act x c}
    (hP : IsPersonnelAction act c) (hU : IsUnlawfulEmploymentPractice x c)
    : FederalSectorPractice act x c := ⟨hP, hU⟩

end Proving.USC.T42.TitleVII.Ontology
