






import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Remedy.Types

namespace Proving.USC.T18.Spec.Remedy

open Proving.USC.Common





axiom HasPrivateRightOfAction (p : Person) (c : ComplaintText) : Prop





axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop





axiom CausedByViolation (p : Person) (c : ComplaintText) : Prop





axiom ViolationEstablished (c : ComplaintText) : Prop




axiom AttorneyGeneralProceeding (c : ComplaintText) : Prop





axiom InjunctiveReliefAvailable (c : ComplaintText) : Prop





axiom ForfeitableInterest (e : Entity) (c : ComplaintText) : Prop





axiom CriminalConviction (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Spec.Remedy
