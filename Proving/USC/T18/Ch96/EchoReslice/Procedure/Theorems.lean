







import Proving.USC.T18.Ch96.EchoReslice.Procedure.Types
import Proving.USC.T18.Ch96.EchoReslice.Procedure.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Procedure

open Proving.USC.Common


theorem section1967Scope_civilAction_intro
    {pr : Proceeding} {c : ComplaintText}
    (hUS : InstitutedByUnitedStates pr c)
    (hCh : IsCivilActionUnderChapter96 pr c) :
    Section1967Scope pr c :=
  Section1967Scope.civilAction hUS hCh


theorem section1967Scope_ancillary_intro
    {pr : Proceeding} {c : ComplaintText}
    (main : Proceeding)
    (hAnc : IsAncillaryTo pr main c)
    (hUS : InstitutedByUnitedStates main c)
    (hCh : IsCivilActionUnderChapter96 main c) :
    Section1967Scope pr c :=
  Section1967Scope.ancillary main hAnc hUS hCh


theorem affectedPersonsConsidered_witness_intro
    {crt : Court} {pr : Proceeding} {c : ComplaintText}
    (p : Person)
    (hAffected : IsAffectedPerson p pr c)
    (hConsidered : CourtConsideredRightsOfAffectedPersons crt pr c) :
    AffectedPersonsConsidered crt pr c :=
  AffectedPersonsConsidered.witness p hAffected hConsidered


theorem affectedPersonsConsidered_noneAffected_intro
    {crt : Court} {pr : Proceeding} {c : ComplaintText}
    (hConsidered : CourtConsideredRightsOfAffectedPersons crt pr c)
    (hNone : ∀ p : Person, ¬ IsAffectedPerson p pr c) :
    AffectedPersonsConsidered crt pr c :=
  AffectedPersonsConsidered.noneAffected hConsidered hNone


theorem considerationPrecededOrder_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hLe : daysFromInstitutionToRightsConsideration crt pr c
            ≤ daysFromInstitutionToPublicAccessOrder pr ord c) :
    ConsiderationPrecededOrder crt pr ord c :=
  hLe




theorem considerationPrecededOrder_of_days
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    {d₁ d₂ : Nat}
    (hCons : daysFromInstitutionToRightsConsideration crt pr c = d₁)
    (hOrder : daysFromInstitutionToPublicAccessOrder pr ord c = d₂)
    (hLe : d₁ ≤ d₂) :
    ConsiderationPrecededOrder crt pr ord c := by
  show daysFromInstitutionToRightsConsideration crt pr c
        ≤ daysFromInstitutionToPublicAccessOrder pr ord c
  omega


theorem validPublicAccessDetermination_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hScope : Section1967Scope pr c)
    (hConsidered : AffectedPersonsConsidered crt pr c)
    (hOrder : PublicAccessOrderEntered crt pr ord c)
    (hFirst : ConsiderationPrecededOrder crt pr ord c) :
    ValidPublicAccessDetermination crt pr ord c :=
  ⟨hScope, hConsidered, hOrder, hFirst⟩


theorem publicAccessDisposition_opened_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hValid : ValidPublicAccessDetermination crt pr ord c)
    (hOpen : OrderOpensProceedingToPublic ord c) :
    PublicAccessDisposition crt pr ord c :=
  PublicAccessDisposition.opened hValid hOpen


theorem publicAccessDisposition_closed_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hValid : ValidPublicAccessDetermination crt pr ord c)
    (hClosed : OrderClosesProceedingToPublic ord c) :
    PublicAccessDisposition crt pr ord c :=
  PublicAccessDisposition.closed hValid hClosed


theorem defectivePublicAccessOrder_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hScope : Section1967Scope pr c)
    (hOrder : PublicAccessOrderEntered crt pr ord c)
    (hDefect : ¬ (AffectedPersonsConsidered crt pr c
                  ∧ ConsiderationPrecededOrder crt pr ord c)) :
    DefectivePublicAccessOrder crt pr ord c :=
  ⟨hScope, hOrder, hDefect⟩



theorem reaches_instituted_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hScope : Section1967Scope pr c) :
    Reaches crt pr ord c AccessState.instituted :=
  Reaches.instituted hScope


theorem reaches_rightsConsidered_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hPrev : Reaches crt pr ord c AccessState.instituted)
    (hConsidered : AffectedPersonsConsidered crt pr c) :
    Reaches crt pr ord c AccessState.rightsConsidered :=
  Reaches.rightsConsidered hPrev hConsidered


theorem reaches_openToPublic_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hPrev : Reaches crt pr ord c AccessState.rightsConsidered)
    (hValid : ValidPublicAccessDetermination crt pr ord c)
    (hOpen : OrderOpensProceedingToPublic ord c) :
    Reaches crt pr ord c AccessState.openToPublic :=
  Reaches.openToPublic hPrev hValid hOpen


theorem reaches_closedToPublic_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    (hPrev : Reaches crt pr ord c AccessState.rightsConsidered)
    (hValid : ValidPublicAccessDetermination crt pr ord c)
    (hClosed : OrderClosesProceedingToPublic ord c) :
    Reaches crt pr ord c AccessState.closedToPublic :=
  Reaches.closedToPublic hPrev hValid hClosed





theorem reachesClosedFromLeaves_intro
    {crt : Court} {pr : Proceeding} {ord : PublicAccessOrder} {c : ComplaintText}
    {d₁ d₂ : Nat}
    (hScope : Section1967Scope pr c)
    (hConsidered : AffectedPersonsConsidered crt pr c)
    (hOrder : PublicAccessOrderEntered crt pr ord c)
    (hCons : daysFromInstitutionToRightsConsideration crt pr c = d₁)
    (hOrderDay : daysFromInstitutionToPublicAccessOrder pr ord c = d₂)
    (hLe : d₁ ≤ d₂)
    (hClosed : OrderClosesProceedingToPublic ord c) :
    Reaches crt pr ord c AccessState.closedToPublic :=
  Reaches.closedToPublic
    (Reaches.rightsConsidered (Reaches.instituted hScope) hConsidered)
    ⟨hScope, hConsidered, hOrder,
      considerationPrecededOrder_of_days hCons hOrderDay hLe⟩
    hClosed

end Proving.USC.T18.Ch96.EchoReslice.Procedure
