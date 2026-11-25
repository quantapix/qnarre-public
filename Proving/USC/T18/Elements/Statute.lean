





import Proving.USC.T18.Elements.Predicates

namespace Proving.USC.T18.Elements
open Proving.USC.Common




structure Section1962c (p : Person) (e : Entity) (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  distinct           : PersonEnterpriseDistinct p e c
  associated         : EmployedOrAssociated p e c
  conducts           : ConductsOrParticipates p e c
  pattern            : PatternOfRacketeering acts c

end Proving.USC.T18.Elements
