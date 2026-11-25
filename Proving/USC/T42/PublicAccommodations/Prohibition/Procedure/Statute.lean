







import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Procedure

open Proving.USC.Common




structure InterferenceTransition (p : Person) (c : ComplaintText) : Prop where
  rightSecured : RightSecuredToPerson p c
  interfered   : InterferenceActOccurred p c




structure TimelyEnforcement (p : Person) (c : ComplaintText) : Prop where
  rightSecured : RightSecuredToPerson p c
  exercised    : RightExercised p c
  interfered   : InterferenceActOccurred p c
  inWindow     : WithinEnforcementWindow p c





structure StateMandatedEnforcement (p : Person) (c : ComplaintText) : Prop where
  stateRequired : StateRequiredDiscrimination p c
  timely        : TimelyEnforcement p c





inductive Reachable (p : Person) (c : ComplaintText) : State → Prop
  | secured  (h : RightSecuredToPerson p c) : Reachable p c State.RightSecured
  | interfered (h : InterferenceTransition p c) : Reachable p c State.InterferenceOccurred
  | enforced (h : TimelyEnforcement p c) : Reachable p c State.EnforcementTriggered
  | barred (hi : InterferenceActOccurred p c) (hn : ¬ WithinEnforcementWindow p c) :
      Reachable p c State.TimeBarred

end Proving.USC.T42.PublicAccommodations.Prohibition.Procedure
