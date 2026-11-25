








import Proving.USC.T18.Enf.Procedure.Statute

namespace Proving.USC.T18.Enf.Procedure

open Proving.USC.Common



theorem preservationGuardPostCharge_intro
    {i : ChargingInstrument} {o : PreservationOrder} {c : ComplaintText}
    (hCharge : ChargeFiled i c) : PreservationGuard i o c :=
  PreservationGuard.postCharge hCharge



theorem preservationGuardPreCharge_intro
    {i : ChargingInstrument} {o : PreservationOrder} {c : ComplaintText}
    (hNH : PreOrderNoticeAndHearing o c) : PreservationGuard i o c :=
  PreservationGuard.preCharge hNH


theorem timelyTRO_intro
    {o : PreservationOrder} {c : ComplaintText}
    (hIssued : TROIssuedExParte o c) (hWin : WithinFourteenDayTROWindow o c) :
    TimelyTRO o c :=
  ⟨hIssued, hWin⟩


theorem timelyAncillaryPetition_intro
    {pet : AncillaryPetition} {c : ComplaintText}
    (hNotice : ForfeitureNoticePublished c)
    (hPetition : PetitionWithinThirtyDaysOfNotice pet c)
    (hVerified : PetitionProperlyVerified pet c) :
    TimelyAncillaryPetition pet c :=
  ⟨hNotice, hPetition, hVerified⟩



theorem timelyCivilAction_intro
    {p : Person} {c : ComplaintText}
    (hJur : DistrictCourtJurisdiction c)
    (hFiled : PrivateCivilSuitFiled p c)
    (hAccrued : CivilClaimAccrued p c)
    (hWin : WithinLimitationsWindow p c)
    (hVenue : VenueProper p c) :
    TimelyCivilAction p c :=
  ⟨hJur, hFiled, hAccrued, hWin, hVenue⟩


theorem reachableAdjudicated_intro
    {p : Person} {pet : AncillaryPetition} {c : ComplaintText}
    (h : TimelyCivilAction p c) :
    Reachable p pet c State.Adjudicated :=
  Reachable.civil h

end Proving.USC.T18.Enf.Procedure
