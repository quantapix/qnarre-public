











import Proving.USC.Common.Types

namespace Proving.USC.T20.Procedure



opaque Agency : Type



opaque EducationProgram : Type




opaque Recipient : Type



opaque Rule : Type




opaque EnforcementAction : Type





opaque EducationalInstitution : Type










inductive State
  | assisted
  | ruleEffective
  | advised
  | found
  | ordered
  | reported
  | effective

end Proving.USC.T20.Procedure
