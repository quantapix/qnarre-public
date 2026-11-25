












import Proving.USC.T18.Ch96.EchoReslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Procedure

open Proving.USC.Common




axiom IsCivilActionUnderChapter96 (pr : Proceeding) (c : ComplaintText) : Prop




axiom InstitutedByUnitedStates (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsAncillaryTo (anc : Proceeding) (main : Proceeding) (c : ComplaintText) : Prop




axiom IsAffectedPerson (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom CourtConsideredRightsOfAffectedPersons
    (crt : Court) (pr : Proceeding) (c : ComplaintText) : Prop





axiom PublicAccessOrderEntered
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Prop




axiom OrderClosesProceedingToPublic (ord : PublicAccessOrder) (c : ComplaintText) : Prop




axiom OrderOpensProceedingToPublic (ord : PublicAccessOrder) (c : ComplaintText) : Prop






axiom daysFromInstitutionToRightsConsideration
    (crt : Court) (pr : Proceeding) (c : ComplaintText) : Nat





axiom daysFromInstitutionToPublicAccessOrder
    (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch96.EchoReslice.Procedure
