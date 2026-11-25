









import Proving.USC.T42.Ch21TitleVII.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Ontology

open Proving.USC.Common









axiom IsPerson (p : Person) (c : ComplaintText) : Prop






axiom IsEmployer (p : Person) (c : ComplaintText) : Prop





axiom HasFifteenOrMoreEmployees (p : Person) (c : ComplaintText) : Prop







axiom IsExemptFromEmployerDefinition (p : Person) (c : ComplaintText) : Prop






axiom IsEmploymentAgency (p : Person) (c : ComplaintText) : Prop









axiom IsLaborOrganization (p : Person) (c : ComplaintText) : Prop





axiom IsLaborOrganizationEngagedInIndustryAffectingCommerce (p : Person) (c : ComplaintText) : Prop





axiom IsEmployee (p : Person) (c : ComplaintText) : Prop




axiom EmployedBy (p : Person) (employer : Person) (c : ComplaintText) : Prop








axiom IsExemptedPublicOfficeAppointee (p : Person) (c : ComplaintText) : Prop







axiom IsCommerce (x : CommerceActivity) (c : ComplaintText) : Prop








axiom IsIndustryAffectingCommerce (i : Industry) (c : ComplaintText) : Prop




axiom EngagedInIndustry (p : Person) (i : Industry) (c : ComplaintText) : Prop






axiom IsState (s : StateJurisdiction) (c : ComplaintText) : Prop




axiom IsReligion (r : ReligiousPractice) (c : ComplaintText) : Prop






axiom CanReasonablyAccommodateWithoutUndueHardship
    (employer : Person) (r : ReligiousPractice) (c : ComplaintText) : Prop





axiom IsBecauseOfSex (b : Basis) (c : ComplaintText) : Prop




axiom MayBringActionUnderSubchapter (p : Person) (c : ComplaintText) : Prop





axiom IsCommission (p : Person) (c : ComplaintText) : Prop





axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom Demonstrates (p : Person) (s : Showing) (c : ComplaintText) : Prop







axiom IsJointLaborManagementCommittee (p : Person) (c : ComplaintText) : Prop








axiom IsFederalEntitySubjectToSection2000e16 (p : Person) (c : ComplaintText) : Prop








axiom IsReligiousOrganization (p : Person) (c : ComplaintText) : Prop






axiom ControlsCorporation (p : Person) (corp : Person) (c : ComplaintText) : Prop






axiom IsProtectedBasis (b : Basis) (c : ComplaintText) : Prop





axiom IsBFOQEligibleBasis (b : Basis) (c : ComplaintText) : Prop







axiom IsDiscriminationByEmployer (pr : EmploymentPractice) (c : ComplaintText) : Prop





axiom IsDiscriminationByEmploymentAgency (pr : EmploymentPractice) (c : ComplaintText) : Prop






axiom IsDiscriminationByLaborOrganization (pr : EmploymentPractice) (c : ComplaintText) : Prop






axiom IsDiscriminationInApprenticeshipProgram (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsBonaFideOccupationalQualification (q : Qualification) (c : ComplaintText) : Prop







axiom IsReligiousEducationalInstitution (p : Person) (c : ComplaintText) : Prop





axiom IsBonaFideSeniorityOrMeritSystem (s : SenioritySystem) (c : ComplaintText) : Prop





axiom IsProfessionallyDevelopedAbilityTest (t : AbilityTest) (c : ComplaintText) : Prop






axiom IsParticularEmploymentPractice (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom CausesDisparateImpact (pr : EmploymentPractice) (b : Basis) (c : ComplaintText) : Prop




axiom IsJobRelatedAndConsistentWithBusinessNecessity
    (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsAlternativeEmploymentPractice (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom RefusesToAdoptAlternativePractice
    (respondent : Person) (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsMotivatingFactor (b : Basis) (pr : EmploymentPractice) (c : ComplaintText) : Prop






axiom IsTestScoreAdjustmentPractice (pr : EmploymentPractice) (c : ComplaintText) : Prop






axiom IsRetaliationPractice (pr : EmploymentPractice) (c : ComplaintText) : Prop







axiom IsDiscriminatoryNoticeOrAdvertisement (pr : EmploymentPractice) (c : ComplaintText) : Prop








axiom IsCharge (ch : Charge) (c : ComplaintText) : Prop





axiom IsAggrievedPerson (p : Person) (c : ComplaintText) : Prop





axiom IsPatternOrPracticeOfResistance (pr : EmploymentPractice) (c : ComplaintText) : Prop







axiom IsPersonnelAction (act : PersonnelAction) (c : ComplaintText) : Prop




axiom IsDiscriminatoryPersonnelAction
    (act : PersonnelAction) (b : Basis) (c : ComplaintText) : Prop








axiom IsCoveredStateEmployee (p : Person) (c : ComplaintText) : Prop






axiom IsAcceptedAffirmativeActionPlan (plan : AffirmativeActionPlan) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Ontology
