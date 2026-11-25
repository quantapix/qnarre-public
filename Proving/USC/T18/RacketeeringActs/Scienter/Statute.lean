












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.RacketeeringActs.Scienter.Types
import Proving.USC.T18.RacketeeringActs.Scienter.Predicates

namespace Proving.USC.T18.RacketeeringActs.Scienter

open Proving.USC.Common (MentalState)






def Culpable (p : Person) (c : ComplaintText) (required : MentalState) : Prop :=
  ∃ proven : MentalState, proven.atLeast required ∧ MentalStateProven p proven c


abbrev Scienter1951 (p : Person) (c : ComplaintText) : Prop :=
  Culpable p c RequiredMentalState1951


abbrev Scienter1952 (p : Person) (c : ComplaintText) : Prop :=
  Culpable p c RequiredMentalState1952


abbrev Scienter1956Intent (p : Person) (c : ComplaintText) : Prop :=
  Culpable p c RequiredMentalState1956Intent


abbrev Scienter1956Knowing (p : Person) (c : ComplaintText) : Prop :=
  Culpable p c RequiredMentalState1956Knowing


abbrev Scienter1957 (p : Person) (c : ComplaintText) : Prop :=
  Culpable p c RequiredMentalState1957

end Proving.USC.T18.RacketeeringActs.Scienter
