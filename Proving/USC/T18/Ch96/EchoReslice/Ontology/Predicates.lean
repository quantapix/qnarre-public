












import Proving.USC.T18.Ch96.EchoReslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Ontology

open Proving.USC.Common





axiom IsCivilAction (a : CivilAction) (c : ComplaintText) : Prop





axiom IsUnitedStates (u : Entity) (c : ComplaintText) : Prop




axiom InstitutedBy (a : CivilAction) (u : Entity) (c : ComplaintText) : Prop





axiom IsUnderThisChapter (a : CivilAction) (c : ComplaintText) : Prop





axiom IsAncillaryProceeding (p : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop





axiom IsTheActionItself (p : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop




axiom IsCourtOfTheProceeding (ct : Court) (p : Proceeding) (c : ComplaintText) : Prop





axiom IsAffectedPerson (x : Person) (p : Proceeding) (c : ComplaintText) : Prop





axiom IsRightOfPerson (r : LegalRight) (x : Person) (c : ComplaintText) : Prop





axiom IsOpenToPublic (p : Proceeding) (c : ComplaintText) : Prop





axiom IsClosedToPublic (p : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.EchoReslice.Ontology
