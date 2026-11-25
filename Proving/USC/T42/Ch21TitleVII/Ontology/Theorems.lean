











import Proving.USC.T42.Ch21TitleVII.Ontology.Types
import Proving.USC.T42.Ch21TitleVII.Ontology.Predicates
import Proving.USC.T42.Ch21TitleVII.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Ontology

open Proving.USC.Common




theorem employerMembership_intro {p : Person} {i : Industry} {c : ComplaintText}
    (hPerson : IsPerson p c)
    (hIndustry : IsIndustryAffectingCommerce i c)
    (hEngaged : EngagedInIndustry p i c)
    (hCount : HasFifteenOrMoreEmployees p c)
    (hNotCarvedOut : ¬ IsExemptFromEmployerDefinition p c) :
    EmployerMembership p i c :=
  ⟨hPerson, hIndustry, hEngaged, hCount, hNotCarvedOut⟩


theorem employeeMembership_intro {p employer : Person} {c : ComplaintText}
    (hIndividual : IsPerson p c)
    (hEmployer : IsEmployer employer c)
    (hEmployed : EmployedBy p employer c)
    (hNotCarvedOut : ¬ IsExemptedPublicOfficeAppointee p c) :
    EmployeeMembership p employer c :=
  ⟨hIndividual, hEmployer, hEmployed, hNotCarvedOut⟩


theorem laborOrganizationMembership_intro {p : Person} {c : ComplaintText}
    (hPerson : IsPerson p c)
    (hEngaged : IsLaborOrganizationEngagedInIndustryAffectingCommerce p c) :
    LaborOrganizationMembership p c :=
  ⟨hPerson, hEngaged⟩


theorem employmentAgencyMembership_intro {p employer : Person} {c : ComplaintText}
    (hPerson : IsPerson p c)
    (hEmployer : IsEmployer employer c)
    (hProcures : IsEmploymentAgency p c) :
    EmploymentAgencyMembership p employer c :=
  ⟨hPerson, hEmployer, hProcures⟩


theorem religionCoverage_intro {r : ReligiousPractice} {employer : Person} {c : ComplaintText}
    (hReligion : IsReligion r c)
    (hAccommodable : CanReasonablyAccommodateWithoutUndueHardship employer r c) :
    ReligionCoverage r employer c :=
  ⟨hReligion, hAccommodable⟩


theorem bonaFideOccupationalQualificationCoverage_intro
    {q : Qualification} {b : Basis} {c : ComplaintText}
    (hEligible : IsBFOQEligibleBasis b c)
    (hBFOQ : IsBonaFideOccupationalQualification q c) :
    BonaFideOccupationalQualificationCoverage q b c :=
  ⟨hEligible, hBFOQ⟩


theorem disparateImpactEstablished_intro
    {pr : EmploymentPractice} {b : Basis} {complainant : Person} {s : Showing}
    {c : ComplaintText}
    (hBasis : IsProtectedBasis b c)
    (hParticular : IsParticularEmploymentPractice pr c)
    (hShows : Demonstrates complainant s c)
    (hImpact : CausesDisparateImpact pr b c)
    (hNotJobRelated : ¬ IsJobRelatedAndConsistentWithBusinessNecessity pr c) :
    DisparateImpactEstablished pr b complainant s c :=
  ⟨hBasis, hParticular, hShows, hImpact, hNotJobRelated⟩


theorem alternativePracticeRefusal_intro
    {alt : EmploymentPractice} {respondent complainant : Person} {s : Showing}
    {c : ComplaintText}
    (hAlternative : IsAlternativeEmploymentPractice alt c)
    (hShows : Demonstrates complainant s c)
    (hRefusal : RefusesToAdoptAlternativePractice respondent alt c) :
    AlternativePracticeRefusal alt respondent complainant s c :=
  ⟨hAlternative, hShows, hRefusal⟩


theorem motivatingFactorEstablished_intro
    {b : Basis} {pr : EmploymentPractice} {complainant : Person} {s : Showing}
    {c : ComplaintText}
    (hBasis : IsProtectedBasis b c)
    (hMotivating : IsMotivatingFactor b pr c)
    (hShows : Demonstrates complainant s c) :
    MotivatingFactorEstablished b pr complainant s c :=
  ⟨hBasis, hMotivating, hShows⟩


theorem chargeByAggrievedPerson_intro {ch : Charge} {p : Person} {c : ComplaintText}
    (hCharge : IsCharge ch c)
    (hAggrieved : IsAggrievedPerson p c) :
    ChargeByAggrievedPerson ch p c :=
  ⟨hCharge, hAggrieved⟩


theorem patternOrPracticeAction_intro {pr : EmploymentPractice} {ag : Person}
    {c : ComplaintText}
    (hAG : IsAttorneyGeneral ag c)
    (hPattern : IsPatternOrPracticeOfResistance pr c) :
    PatternOrPracticeAction pr ag c :=
  ⟨hAG, hPattern⟩


theorem coveredFederalPersonnelAction_intro
    {act : PersonnelAction} {entity : Person} {b : Basis} {c : ComplaintText}
    (hEntity : IsFederalEntitySubjectToSection2000e16 entity c)
    (hAction : IsPersonnelAction act c)
    (hBasis : IsProtectedBasis b c)
    (hDiscriminatory : IsDiscriminatoryPersonnelAction act b c) :
    CoveredFederalPersonnelAction act entity b c :=
  ⟨hEntity, hAction, hBasis, hDiscriminatory⟩


theorem governmentEmployeeRightsActViolation_intro
    {p : Person} {act : PersonnelAction} {b : Basis} {c : ComplaintText}
    (hCovered : IsCoveredStateEmployee p c)
    (hAction : IsPersonnelAction act c)
    (hBasis : IsProtectedBasis b c)
    (hDiscriminatory : IsDiscriminatoryPersonnelAction act b c) :
    GovernmentEmployeeRightsActViolation p act b c :=
  ⟨hCovered, hAction, hBasis, hDiscriminatory⟩


theorem affirmativeActionPlanProtection_intro
    {plan : AffirmativeActionPlan} {employer : Person} {c : ComplaintText}
    (hEmployer : IsEmployer employer c)
    (hAccepted : IsAcceptedAffirmativeActionPlan plan c) :
    AffirmativeActionPlanProtection plan employer c :=
  ⟨hEmployer, hAccepted⟩




theorem respondentClass_intro_employer {p : Person} {c : ComplaintText}
    (h : IsEmployer p c) : RespondentClass c :=
  RespondentClass.employer p h


theorem respondentClass_intro_employmentAgency {p : Person} {c : ComplaintText}
    (h : IsEmploymentAgency p c) : RespondentClass c :=
  RespondentClass.employmentAgency p h


theorem respondentClass_intro_laborOrganization {p : Person} {c : ComplaintText}
    (h : IsLaborOrganization p c) : RespondentClass c :=
  RespondentClass.laborOrganization p h


theorem respondentClass_intro_jointCommittee {p : Person} {c : ComplaintText}
    (h : IsJointLaborManagementCommittee p c) : RespondentClass c :=
  RespondentClass.jointCommittee p h


theorem respondentClass_intro_federalEntity {p : Person} {c : ComplaintText}
    (h : IsFederalEntitySubjectToSection2000e16 p c) : RespondentClass c :=
  RespondentClass.federalEntity p h


theorem complainingPartyClass_intro_commission {p : Person} {c : ComplaintText}
    (h : IsCommission p c) : ComplainingPartyClass c :=
  ComplainingPartyClass.commission p h


theorem complainingPartyClass_intro_attorneyGeneral {p : Person} {c : ComplaintText}
    (h : IsAttorneyGeneral p c) : ComplainingPartyClass c :=
  ComplainingPartyClass.attorneyGeneral p h


theorem complainingPartyClass_intro_privateParty {p : Person} {c : ComplaintText}
    (h : MayBringActionUnderSubchapter p c) : ComplainingPartyClass c :=
  ComplainingPartyClass.privateParty p h


theorem unlawfulEmploymentPracticeClass_intro_employer
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsDiscriminationByEmployer pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.employerPractice h


theorem unlawfulEmploymentPracticeClass_intro_employmentAgency
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsDiscriminationByEmploymentAgency pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.employmentAgencyPractice h


theorem unlawfulEmploymentPracticeClass_intro_laborOrganization
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsDiscriminationByLaborOrganization pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.laborOrganizationPractice h


theorem unlawfulEmploymentPracticeClass_intro_apprenticeship
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsDiscriminationInApprenticeshipProgram pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.apprenticeshipPractice h


theorem unlawfulEmploymentPracticeClass_intro_testScoreAdjustment
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsTestScoreAdjustmentPractice pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.testScoreAdjustment h


theorem unlawfulEmploymentPracticeClass_intro_retaliation
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsRetaliationPractice pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.retaliation h


theorem unlawfulEmploymentPracticeClass_intro_advertisement
    {pr : EmploymentPractice} {c : ComplaintText}
    (h : IsDiscriminatoryNoticeOrAdvertisement pr c) : UnlawfulEmploymentPracticeClass pr c :=
  UnlawfulEmploymentPracticeClass.discriminatoryAdvertisement h

end Proving.USC.T42.Ch21TitleVII.Ontology
