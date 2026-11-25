









import Proving.USC.T05.Remedy.Types
import Proving.USC.Common.Types

namespace Proving.USC.T05.Remedy

open Proving.USC.Common






axiom HasPrivateRightOfAction (p : Person) (c : ComplaintText) : Prop





axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop





axiom CausedByViolation (p : Person) (c : ComplaintText) : Prop





axiom ReliefRedressable (p : Person) (c : ComplaintText) : Prop





axiom IrreparableInjuryPendingReview (p : Person) (c : ComplaintText) : Prop





axiom AgencyActionUnlawfullyWithheld (p : Person) (c : ComplaintText) : Prop





axiom AgencyActionSetAsideGround (g : SetAsideGround) (p : Person) (c : ComplaintText) : Prop






axiom PrejudicialError (p : Person) (c : ComplaintText) : Prop





axiom DispositionAvailable (d : Disposition) (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T05.Remedy
