import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false









namespace Proving.USC.T42.Ch21TitleVII.Elements




opaque Employer : Type


opaque EmploymentAgency : Type


opaque LaborOrganization : Type



opaque JointCommittee : Type



opaque TrainingProgram : Type


opaque EmploymentPractice : Type


opaque Charge : Type



opaque ConsentJudgment : Type



opaque SeniorityOrMeritSystem : Type



opaque FederalUnit : Type



opaque Advertisement : Type



opaque AffirmativeActionPlan : Type



opaque StateLaw : Type





inductive ProtectedBasis where
  | race
  | color
  | religion
  | sex
  | nationalOrigin
  deriving DecidableEq



inductive GeraBasis where
  | titleVII (b : ProtectedBasis)
  | age
  | disability




inductive Respondent where
  | employer (e : Employer)
  | employmentAgency (a : EmploymentAgency)
  | laborOrganization (l : LaborOrganization)
  | jointCommittee (j : JointCommittee)
  | federalEntity (f : FederalUnit)

end Proving.USC.T42.Ch21TitleVII.Elements
