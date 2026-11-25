import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Elements.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch96.EchoReslice.Elements

open Proving.USC.Common







axiom IsCivilActionInstitutedByUnitedStates (a : CivilAction) (c : ComplaintText) : Prop




axiom ArisesUnderChapter96 (a : CivilAction) (c : ComplaintText) : Prop






axiom IsAncillaryProceeding (pr : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop




axiom ProceedingIsTheCivilAction (pr : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop







axiom IsPresidingCourt (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop





axiom DeterminationWithinCourtDiscretion (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop








axiom AffectedPersonsIdentified (pr : Proceeding) (persons : List Person) (c : ComplaintText) : Prop





axiom RightsOfPersonAffected (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom CourtConsideredRightsOfPerson (ct : Court) (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop






axiom dayOfRightsConsideration (ct : Court) (pr : Proceeding) (c : ComplaintText) : Nat





axiom dayOfAccessDetermination (ct : Court) (pr : Proceeding) (c : ComplaintText) : Nat






axiom ProceedingsOpenToPublic (pr : Proceeding) (c : ComplaintText) : Prop




axiom ProceedingsClosedToPublic (pr : Proceeding) (c : ComplaintText) : Prop






axiom IsPartyToProceeding (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.EchoReslice.Elements
