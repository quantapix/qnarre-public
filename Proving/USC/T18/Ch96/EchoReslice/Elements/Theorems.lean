import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Elements.Types
import Proving.USC.T18.Ch96.EchoReslice.Elements.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Elements.Statute

set_option autoImplicit false







namespace Proving.USC.T18.Ch96.EchoReslice.Elements

open Proving.USC.Common


theorem qualifyingUnitedStatesAction_intro
    {a : CivilAction} {c : ComplaintText}
    (hUS : IsCivilActionInstitutedByUnitedStates a c)
    (hCh : ArisesUnderChapter96 a c) :
    QualifyingUnitedStatesAction a c :=
  ⟨hUS, hCh⟩


theorem proceedingWithinSection1967_ancillary_intro
    {pr : Proceeding} {a : CivilAction} {c : ComplaintText}
    (hq : QualifyingUnitedStatesAction a c)
    (hAnc : IsAncillaryProceeding pr a c) :
    ProceedingWithinSection1967 pr a c :=
  .ancillary hq hAnc


theorem proceedingWithinSection1967_theAction_intro
    {pr : Proceeding} {a : CivilAction} {c : ComplaintText}
    (hq : QualifyingUnitedStatesAction a c)
    (hSelf : ProceedingIsTheCivilAction pr a c) :
    ProceedingWithinSection1967 pr a c :=
  .theAction hq hSelf


theorem personRightsConsidered_intro
    {ct : Court} {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hAff : RightsOfPersonAffected p pr c)
    (hCons : CourtConsideredRightsOfPerson ct p pr c) :
    PersonRightsConsidered ct p pr c :=
  ⟨hAff, hCons⟩




theorem considerationPrecededDetermination_of_days
    {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (h : dayOfRightsConsideration ct pr c ≤ dayOfAccessDetermination ct pr c) :
    ConsiderationPrecededDetermination ct pr c :=
  h


theorem rightsConsideration_intro
    {ct : Court} {pr : Proceeding} {persons : List Person} {c : ComplaintText}
    (hId : AffectedPersonsIdentified pr persons c)
    (hEach : ∀ p ∈ persons, PersonRightsConsidered ct p pr c)
    (hOrd : ConsiderationPrecededDetermination ct pr c) :
    RightsConsideration ct pr persons c :=
  ⟨hId, hEach, hOrd⟩


theorem publicAccessDisposition_opened_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : ProceedingsOpenToPublic pr c) :
    PublicAccessDisposition pr c :=
  .opened h


theorem publicAccessDisposition_closed_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : ProceedingsClosedToPublic pr c) :
    PublicAccessDisposition pr c :=
  .closed h


theorem section1967_intro
    {ct : Court} {pr : Proceeding} {a : CivilAction} {persons : List Person}
    {c : ComplaintText}
    (hWithin : ProceedingWithinSection1967 pr a c)
    (hCourt : IsPresidingCourt ct pr c)
    (hCons : RightsConsideration ct pr persons c)
    (hDisc : DeterminationWithinCourtDiscretion ct pr c)
    (hDisp : PublicAccessDisposition pr c) :
    Section1967 ct pr a persons c :=
  ⟨hWithin, hCourt, hCons, hDisc, hDisp⟩


theorem section1967Standing_party_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (h : IsPartyToProceeding p pr c) :
    Section1967Standing p pr c :=
  .party h


theorem section1967Standing_affectedPerson_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (h : RightsOfPersonAffected p pr c) :
    Section1967Standing p pr c :=
  .affectedPerson h


theorem section1967AccessClaim_intro
    {ct : Court} {p : Person} {pr : Proceeding} {a : CivilAction}
    {persons : List Person} {c : ComplaintText}
    (hSec : Section1967 ct pr a persons c)
    (hStand : Section1967Standing p pr c) :
    Section1967AccessClaim ct p pr a persons c :=
  ⟨hSec, hStand⟩



example
    {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (h1 : dayOfRightsConsideration ct pr c = 4)
    (h2 : dayOfAccessDetermination ct pr c = 9) :
    ConsiderationPrecededDetermination ct pr c := by
  show dayOfRightsConsideration ct pr c ≤ dayOfAccessDetermination ct pr c
  omega

end Proving.USC.T18.Ch96.EchoReslice.Elements
