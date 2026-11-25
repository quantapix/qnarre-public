







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr



opaque EducationProgramOrActivity : Type




opaque Recipient : Type



opaque FederalAgency : Type



opaque AgencyRule : Type



opaque EnforcementAction : Type



opaque CongressionalReport : Type


opaque CourseOfStudy : Type



opaque SexSeparateActivity : Type


opaque LivingFacility : Type



opaque AbortionRelatedService : Type



opaque TaskForce : Type



opaque PersonnelDetail : Type

end Proving.USC.T20.Ch38.Reearn.Deontic
