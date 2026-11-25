













import Proving.USC.T18.Ch96.EchoReslice.Deontic.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Deontic

open Proving.USC.Common




axiom IsPresidingCourt (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsCivilActionInstitutedByUnitedStates (pr : Proceeding) (c : ComplaintText) : Prop




axiom ArisesUnderChapter96 (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsAncillaryTo (pr : Proceeding) (pr' : Proceeding) (c : ComplaintText) : Prop




axiom DeterminedOpenToPublic (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop




axiom DeterminedClosedToPublic (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop






axiom DiscretionActuallyExercised (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsAffectedPerson (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom RightsConsidered (ct : Court) (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop





axiom ConsiderationPrecededDetermination (ct : Court) (pr : Proceeding)
    (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.EchoReslice.Deontic
