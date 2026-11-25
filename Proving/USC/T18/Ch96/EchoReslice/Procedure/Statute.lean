






import Proving.USC.T18.Ch96.EchoReslice.Procedure.Types
import Proving.USC.T18.Ch96.EchoReslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Procedure

open Proving.USC.Common








def ConsiderationPrecededOrder
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Prop :=
  daysFromInstitutionToRightsConsideration crt pr c
    ≤ daysFromInstitutionToPublicAccessOrder pr ord c







inductive Section1967Scope (pr : Proceeding) (c : ComplaintText) : Prop where


  | civilAction
      (hUS : InstitutedByUnitedStates pr c)
      (hCh : IsCivilActionUnderChapter96 pr c) : Section1967Scope pr c

  | ancillary
      (main : Proceeding)
      (hAnc : IsAncillaryTo pr main c)
      (hUS : InstitutedByUnitedStates main c)
      (hCh : IsCivilActionUnderChapter96 main c) : Section1967Scope pr c







inductive AffectedPersonsConsidered
    (crt : Court) (pr : Proceeding) (c : ComplaintText) : Prop where

  | witness
      (p : Person)
      (hAffected : IsAffectedPerson p pr c)
      (hConsidered : CourtConsideredRightsOfAffectedPersons crt pr c) :
      AffectedPersonsConsidered crt pr c

  | noneAffected
      (hConsidered : CourtConsideredRightsOfAffectedPersons crt pr c)
      (hNone : ∀ p : Person, ¬ IsAffectedPerson p pr c) :
      AffectedPersonsConsidered crt pr c






structure ValidPublicAccessDetermination
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Prop where
  inScope : Section1967Scope pr c
  rightsConsidered : AffectedPersonsConsidered crt pr c
  orderEntered : PublicAccessOrderEntered crt pr ord c
  considerationFirst : ConsiderationPrecededOrder crt pr ord c




inductive PublicAccessDisposition
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Prop where
  | opened
      (hValid : ValidPublicAccessDetermination crt pr ord c)
      (hOpen : OrderOpensProceedingToPublic ord c) :
      PublicAccessDisposition crt pr ord c
  | closed
      (hValid : ValidPublicAccessDetermination crt pr ord c)
      (hClosed : OrderClosesProceedingToPublic ord c) :
      PublicAccessDisposition crt pr ord c








structure DefectivePublicAccessOrder
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Prop where
  inScope : Section1967Scope pr c
  orderEntered : PublicAccessOrderEntered crt pr ord c
  considerationDefect :
    ¬ (AffectedPersonsConsidered crt pr c ∧ ConsiderationPrecededOrder crt pr ord c)


structure Transition where
  src : AccessState
  dst : AccessState
  guard : Prop



def considerRightsTransition
    (crt : Court) (pr : Proceeding) (c : ComplaintText) : Transition :=
  { src := AccessState.instituted
    dst := AccessState.rightsConsidered
    guard := AffectedPersonsConsidered crt pr c }



def openToPublicTransition
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Transition :=
  { src := AccessState.rightsConsidered
    dst := AccessState.openToPublic
    guard := ValidPublicAccessDetermination crt pr ord c ∧ OrderOpensProceedingToPublic ord c }



def closeToPublicTransition
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) : Transition :=
  { src := AccessState.rightsConsidered
    dst := AccessState.closedToPublic
    guard := ValidPublicAccessDetermination crt pr ord c ∧ OrderClosesProceedingToPublic ord c }




inductive Reaches
    (crt : Court) (pr : Proceeding) (ord : PublicAccessOrder) (c : ComplaintText) :
    AccessState → Prop where
  | instituted
      (hScope : Section1967Scope pr c) :
      Reaches crt pr ord c AccessState.instituted
  | rightsConsidered
      (hPrev : Reaches crt pr ord c AccessState.instituted)
      (hConsidered : AffectedPersonsConsidered crt pr c) :
      Reaches crt pr ord c AccessState.rightsConsidered
  | openToPublic
      (hPrev : Reaches crt pr ord c AccessState.rightsConsidered)
      (hValid : ValidPublicAccessDetermination crt pr ord c)
      (hOpen : OrderOpensProceedingToPublic ord c) :
      Reaches crt pr ord c AccessState.openToPublic
  | closedToPublic
      (hPrev : Reaches crt pr ord c AccessState.rightsConsidered)
      (hValid : ValidPublicAccessDetermination crt pr ord c)
      (hClosed : OrderClosesProceedingToPublic ord c) :
      Reaches crt pr ord c AccessState.closedToPublic

end Proving.USC.T18.Ch96.EchoReslice.Procedure
