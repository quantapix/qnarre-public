






import Proving.USC.T18.Ch96.EchoReslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Ontology

open Proving.USC.Common



theorem unitedStatesCivilAction_intro
    {a : CivilAction} {u : Entity} {c : ComplaintText}
    (hCivil : IsCivilAction a c) (hUS : IsUnitedStates u c)
    (hInst : InstitutedBy a u c) (hChap : IsUnderThisChapter a c)
    : UnitedStatesCivilAction a u c :=
  { civilAction := hCivil, unitedStates := hUS,
    instituted := hInst, underChapter := hChap }


theorem isUnitedStatesCivilAction_intro
    {a : CivilAction} {u : Entity} {c : ComplaintText}
    (h : UnitedStatesCivilAction a u c)
    : IsUnitedStatesCivilAction a c :=
  ⟨u, h⟩


theorem coveredProceedingAncillary_intro
    {p : Proceeding} {a : CivilAction} {c : ComplaintText}
    (hAnc : IsAncillaryProceeding p a c) (hAnchor : IsUnitedStatesCivilAction a c)
    : CoveredProceeding p a c :=
  CoveredProceeding.ancillary hAnc hAnchor


theorem coveredProceedingTheAction_intro
    {p : Proceeding} {a : CivilAction} {c : ComplaintText}
    (hIs : IsTheActionItself p a c) (hAnchor : IsUnitedStatesCivilAction a c)
    : CoveredProceeding p a c :=
  CoveredProceeding.theAction hIs hAnchor


theorem publicAccessOpen_intro
    {p : Proceeding} {c : ComplaintText} (h : IsOpenToPublic p c)
    : PublicAccessHolds PublicAccessStatus.openToPublic p c := h


theorem publicAccessClosed_intro
    {p : Proceeding} {c : ComplaintText} (h : IsClosedToPublic p c)
    : PublicAccessHolds PublicAccessStatus.closedToPublic p c := h


theorem affectedPersonRight_intro
    {r : LegalRight} {x : Person} {p : Proceeding} {c : ComplaintText}
    (hAff : IsAffectedPerson x p c) (hRight : IsRightOfPerson r x c)
    : AffectedPersonRight r x p c :=
  { affected := hAff, right := hRight }


theorem section1967Scope_intro
    {p : Proceeding} {a : CivilAction} {ct : Court} {c : ComplaintText}
    (hCovered : CoveredProceeding p a c) (hCourt : IsCourtOfTheProceeding ct p c)
    : Section1967Scope p a ct c :=
  { covered := hCovered, court := hCourt }


theorem section1967AccessDetermination_intro
    {p : Proceeding} {a : CivilAction} {ct : Court} {s : PublicAccessStatus}
    {c : ComplaintText}
    (hScope : Section1967Scope p a ct c) (hStatus : PublicAccessHolds s p c)
    : Section1967AccessDetermination p a ct s c :=
  { scope := hScope, status := hStatus }

end Proving.USC.T18.Ch96.EchoReslice.Ontology
