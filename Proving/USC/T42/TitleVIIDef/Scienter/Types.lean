





















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Scienter

open Proving.USC.Common




inductive Addressee
  | Employer
  | EmploymentAgency
  | LaborOrganization
  | JointLaborManagementCommittee
  | Respondent
  deriving DecidableEq, Repr

end Proving.USC.T42.TitleVIIDef.Scienter
