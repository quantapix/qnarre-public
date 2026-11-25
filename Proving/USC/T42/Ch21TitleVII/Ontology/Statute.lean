















import Proving.USC.T42.Ch21TitleVII.Ontology.Types
import Proving.USC.T42.Ch21TitleVII.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def defEdges : List DefEdge :=
  [
    { defined := "employer", dependsOn := "person", citeDefine := "42 USC § 2000e(b)" },
    { defined := "employer", dependsOn := "industry affecting commerce",
      citeDefine := "42 USC § 2000e(b)" },
    { defined := "employer", dependsOn := "employee", citeDefine := "42 USC § 2000e(b)" },

    { defined := "employment agency", dependsOn := "person", citeDefine := "42 USC § 2000e(c)" },
    { defined := "employment agency", dependsOn := "employer", citeDefine := "42 USC § 2000e(c)" },
    { defined := "employment agency", dependsOn := "employee", citeDefine := "42 USC § 2000e(c)" },

    { defined := "labor organization", dependsOn := "industry affecting commerce",
      citeDefine := "42 USC § 2000e(d)" },
    { defined := "labor organization", dependsOn := "employer", citeDefine := "42 USC § 2000e(d)" },
    { defined := "labor organization", dependsOn := "employee", citeDefine := "42 USC § 2000e(d)" },
    { defined := "labor organization engaged in an industry affecting commerce",
      dependsOn := "labor organization", citeDefine := "42 USC § 2000e(e)" },
    { defined := "labor organization engaged in an industry affecting commerce",
      dependsOn := "employer", citeDefine := "42 USC § 2000e(e)" },

    { defined := "employee", dependsOn := "employer", citeDefine := "42 USC § 2000e(f)" },
    { defined := "employee", dependsOn := "State", citeDefine := "42 USC § 2000e(f)" },

    { defined := "industry affecting commerce", dependsOn := "commerce",
      citeDefine := "42 USC § 2000e(h)" },

    { defined := "religion", dependsOn := "employer", citeDefine := "42 USC § 2000e(j)" },
    { defined := "religion", dependsOn := "employee", citeDefine := "42 USC § 2000e(j)" },

    { defined := "because of sex", dependsOn := "employer", citeDefine := "42 USC § 2000e(k)" },

    { defined := "complaining party", dependsOn := "Commission", citeDefine := "42 USC § 2000e(l)" },
    { defined := "complaining party", dependsOn := "Attorney General",
      citeDefine := "42 USC § 2000e(l)" },
    { defined := "complaining party", dependsOn := "person", citeDefine := "42 USC § 2000e(l)" },

    { defined := "respondent", dependsOn := "employer", citeDefine := "42 USC § 2000e(n)" },
    { defined := "respondent", dependsOn := "employment agency", citeDefine := "42 USC § 2000e(n)" },
    { defined := "respondent", dependsOn := "labor organization",
      citeDefine := "42 USC § 2000e(n)" },
    { defined := "respondent", dependsOn := "joint labor-management committee",
      citeDefine := "42 USC § 2000e(n)" },
    { defined := "respondent", dependsOn := "Federal entity subject to section 2000e-16",
      citeDefine := "42 USC § 2000e(n)" },

    { defined := "religious organization exemption", dependsOn := "employer",
      citeDefine := "42 USC § 2000e-1(a)" },
    { defined := "religious organization exemption", dependsOn := "religion",
      citeDefine := "42 USC § 2000e-1(a)" },
    { defined := "controls a corporation", dependsOn := "employer",
      citeDefine := "42 USC § 2000e-1(c)(3)" },

    { defined := "unlawful employment practice", dependsOn := "employer",
      citeDefine := "42 USC § 2000e-2(a)" },
    { defined := "unlawful employment practice", dependsOn := "employment agency",
      citeDefine := "42 USC § 2000e-2(b)" },
    { defined := "unlawful employment practice", dependsOn := "labor organization",
      citeDefine := "42 USC § 2000e-2(c)" },
    { defined := "unlawful employment practice", dependsOn := "joint labor-management committee",
      citeDefine := "42 USC § 2000e-2(d)" },
    { defined := "unlawful employment practice", dependsOn := "protected basis",
      citeDefine := "42 USC § 2000e-2(a)" },
    { defined := "unlawful employment practice", dependsOn := "respondent",
      citeDefine := "42 USC § 2000e-2(l)" },
    { defined := "bona fide occupational qualification", dependsOn := "religion",
      citeDefine := "42 USC § 2000e-2(e)(1)" },
    { defined := "bona fide occupational qualification", dependsOn := "because of sex",
      citeDefine := "42 USC § 2000e-2(e)(1)" },
    { defined := "disparate impact", dependsOn := "complaining party",
      citeDefine := "42 USC § 2000e-2(k)(1)(A)" },
    { defined := "disparate impact", dependsOn := "respondent",
      citeDefine := "42 USC § 2000e-2(k)(1)(A)" },
    { defined := "disparate impact", dependsOn := "demonstrates",
      citeDefine := "42 USC § 2000e-2(k)(1)(A)" },
    { defined := "disparate impact", dependsOn := "particular employment practice",
      citeDefine := "42 USC § 2000e-2(k)(1)(B)(i)" },
    { defined := "alternative employment practice", dependsOn := "demonstrates",
      citeDefine := "42 USC § 2000e-2(k)(1)(C)" },
    { defined := "motivating factor", dependsOn := "complaining party",
      citeDefine := "42 USC § 2000e-2(m)" },
    { defined := "motivating factor", dependsOn := "demonstrates",
      citeDefine := "42 USC § 2000e-2(m)" },
    { defined := "motivating factor", dependsOn := "protected basis",
      citeDefine := "42 USC § 2000e-2(m)" },
    { defined := "retaliation", dependsOn := "unlawful employment practice",
      citeDefine := "42 USC § 2000e-3(a)" },
    { defined := "retaliation", dependsOn := "charge", citeDefine := "42 USC § 2000e-3(a)" },

    { defined := "charge", dependsOn := "aggrieved person", citeDefine := "42 USC § 2000e-5(b)" },
    { defined := "charge", dependsOn := "Commission", citeDefine := "42 USC § 2000e-5(b)" },
    { defined := "charge", dependsOn := "unlawful employment practice",
      citeDefine := "42 USC § 2000e-5(b)" },
    { defined := "respondent (§ 2000e-5(b) restatement)", dependsOn := "respondent",
      citeDefine := "42 USC § 2000e-5(b)" },
    { defined := "pattern or practice of resistance", dependsOn := "Attorney General",
      citeDefine := "42 USC § 2000e-6(a)" },

    { defined := "Federal entity subject to section 2000e-16", dependsOn := "personnel action",
      citeDefine := "42 USC § 2000e-16(a)" },
    { defined := "personnel action", dependsOn := "employee", citeDefine := "42 USC § 2000e-16(a)" },
    { defined := "personnel action", dependsOn := "protected basis",
      citeDefine := "42 USC § 2000e-16(a)" },
    { defined := "violation (Government Employee Rights Act)",
      dependsOn := "personnel action", citeDefine := "42 USC § 2000e-16a(c)" },
    { defined := "violation (Government Employee Rights Act)",
      dependsOn := "covered State employee", citeDefine := "42 USC § 2000e-16b(a)" },
    { defined := "covered State employee", dependsOn := "employee",
      citeDefine := "42 USC § 2000e-16c(a)" },
    { defined := "covered State employee", dependsOn := "State",
      citeDefine := "42 USC § 2000e-16c(a)" },
    { defined := "accepted affirmative action plan", dependsOn := "employer",
      citeDefine := "42 USC § 2000e-17" } ]





def danglingTerms : List String :=
  [ "joint labor-management committee controlling apprenticeship or other training",
    "person claiming to be aggrieved / person aggrieved",
    "American employer (42 USC § 2000e-1(c)(2))",
    "Indian tribe (42 USC § 2000e(b)(1))",
    "bona fide private membership club (42 USC § 2000e(b)(2))",
    "conciliation agreement (42 USC § 2000e-5(b), (f)(1))",
    "affirmative action plan (42 USC § 2000e-17)",
    "individual (used throughout; never defined)" ]






structure EmployerMembership (p : Person) (i : Industry) (c : ComplaintText) : Prop where
  isPerson          : IsPerson p c
  industryInCommerce : IsIndustryAffectingCommerce i c
  engagedIn         : EngagedInIndustry p i c
  numerosity        : HasFifteenOrMoreEmployees p c
  notCarvedOut      : ¬ IsExemptFromEmployerDefinition p c




structure EmployeeMembership (p : Person) (employer : Person) (c : ComplaintText) : Prop where
  isIndividual      : IsPerson p c
  employerQualifies : IsEmployer employer c
  employed          : EmployedBy p employer c
  notCarvedOut      : ¬ IsExemptedPublicOfficeAppointee p c




structure LaborOrganizationMembership (p : Person) (c : ComplaintText) : Prop where
  isPerson  : IsPerson p c
  engaged   : IsLaborOrganizationEngagedInIndustryAffectingCommerce p c




structure EmploymentAgencyMembership (p : Person) (employer : Person) (c : ComplaintText) : Prop where
  isPerson          : IsPerson p c
  employerQualifies : IsEmployer employer c
  procures          : IsEmploymentAgency p c




structure ReligionCoverage (r : ReligiousPractice) (employer : Person)
    (c : ComplaintText) : Prop where
  isReligion   : IsReligion r c
  accommodable : CanReasonablyAccommodateWithoutUndueHardship employer r c





structure BonaFideOccupationalQualificationCoverage (q : Qualification) (b : Basis)
    (c : ComplaintText) : Prop where
  eligibleBasis : IsBFOQEligibleBasis b c
  isBFOQ        : IsBonaFideOccupationalQualification q c



structure DisparateImpactEstablished (pr : EmploymentPractice) (b : Basis)
    (complainant : Person) (s : Showing) (c : ComplaintText) : Prop where
  protectedBasis    : IsProtectedBasis b c
  particularPractice : IsParticularEmploymentPractice pr c
  complainantShows  : Demonstrates complainant s c
  causesImpact      : CausesDisparateImpact pr b c
  notJobRelated     : ¬ IsJobRelatedAndConsistentWithBusinessNecessity pr c




structure AlternativePracticeRefusal (alt : EmploymentPractice) (respondent complainant : Person)
    (s : Showing) (c : ComplaintText) : Prop where
  isAlternative    : IsAlternativeEmploymentPractice alt c
  complainantShows : Demonstrates complainant s c
  refusal          : RefusesToAdoptAlternativePractice respondent alt c




structure MotivatingFactorEstablished (b : Basis) (pr : EmploymentPractice)
    (complainant : Person) (s : Showing) (c : ComplaintText) : Prop where
  protectedBasis   : IsProtectedBasis b c
  motivating       : IsMotivatingFactor b pr c
  complainantShows : Demonstrates complainant s c



structure ChargeByAggrievedPerson (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  isCharge    : IsCharge ch c
  isAggrieved : IsAggrievedPerson p c



structure PatternOrPracticeAction (pr : EmploymentPractice) (ag : Person)
    (c : ComplaintText) : Prop where
  isAttorneyGeneral : IsAttorneyGeneral ag c
  patternOrPractice : IsPatternOrPracticeOfResistance pr c




structure CoveredFederalPersonnelAction (act : PersonnelAction) (entity : Person)
    (b : Basis) (c : ComplaintText) : Prop where
  coveredEntity  : IsFederalEntitySubjectToSection2000e16 entity c
  isAction       : IsPersonnelAction act c
  protectedBasis : IsProtectedBasis b c
  discriminatory : IsDiscriminatoryPersonnelAction act b c





structure GovernmentEmployeeRightsActViolation (p : Person) (act : PersonnelAction)
    (b : Basis) (c : ComplaintText) : Prop where
  coveredEmployee : IsCoveredStateEmployee p c
  isAction        : IsPersonnelAction act c
  protectedBasis  : IsProtectedBasis b c
  discriminatory  : IsDiscriminatoryPersonnelAction act b c



structure AffirmativeActionPlanProtection (plan : AffirmativeActionPlan) (employer : Person)
    (c : ComplaintText) : Prop where
  isEmployer : IsEmployer employer c
  accepted   : IsAcceptedAffirmativeActionPlan plan c








inductive RespondentClass (c : ComplaintText) : Prop where
  | employer (p : Person) (h : IsEmployer p c) : RespondentClass c
  | employmentAgency (p : Person) (h : IsEmploymentAgency p c) : RespondentClass c
  | laborOrganization (p : Person) (h : IsLaborOrganization p c) : RespondentClass c
  | jointCommittee (p : Person) (h : IsJointLaborManagementCommittee p c) : RespondentClass c
  | federalEntity (p : Person) (h : IsFederalEntitySubjectToSection2000e16 p c) :
      RespondentClass c




inductive ComplainingPartyClass (c : ComplaintText) : Prop where
  | commission (p : Person) (h : IsCommission p c) : ComplainingPartyClass c
  | attorneyGeneral (p : Person) (h : IsAttorneyGeneral p c) : ComplainingPartyClass c
  | privateParty (p : Person) (h : MayBringActionUnderSubchapter p c) : ComplainingPartyClass c






inductive UnlawfulEmploymentPracticeClass (pr : EmploymentPractice) (c : ComplaintText) : Prop where
  | employerPractice (h : IsDiscriminationByEmployer pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | employmentAgencyPractice (h : IsDiscriminationByEmploymentAgency pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | laborOrganizationPractice (h : IsDiscriminationByLaborOrganization pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | apprenticeshipPractice (h : IsDiscriminationInApprenticeshipProgram pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | testScoreAdjustment (h : IsTestScoreAdjustmentPractice pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | retaliation (h : IsRetaliationPractice pr c) :
      UnlawfulEmploymentPracticeClass pr c
  | discriminatoryAdvertisement (h : IsDiscriminatoryNoticeOrAdvertisement pr c) :
      UnlawfulEmploymentPracticeClass pr c

end Proving.USC.T42.Ch21TitleVII.Ontology
