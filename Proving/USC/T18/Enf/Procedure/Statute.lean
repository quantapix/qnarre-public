










import Proving.USC.T18.Enf.Procedure.Predicates

namespace Proving.USC.T18.Enf.Procedure

open Proving.USC.Common




structure Transition where
  frm   : State
  to    : State
  guard : Prop






inductive PreservationGuard (i : ChargingInstrument) (o : PreservationOrder)
    (c : ComplaintText) : Prop

  | postCharge (h : ChargeFiled i c) : PreservationGuard i o c


  | preCharge  (h : PreOrderNoticeAndHearing o c) : PreservationGuard i o c




structure TimelyTRO (o : PreservationOrder) (c : ComplaintText) : Prop where
  issued   : TROIssuedExParte o c
  inWindow : WithinFourteenDayTROWindow o c







structure TimelyAncillaryPetition (pet : AncillaryPetition) (c : ComplaintText) : Prop where
  notice   : ForfeitureNoticePublished c
  petition : PetitionWithinThirtyDaysOfNotice pet c
  verified : PetitionProperlyVerified pet c








structure TimelyCivilAction (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : DistrictCourtJurisdiction c
  filed        : PrivateCivilSuitFiled p c
  accrued      : CivilClaimAccrued p c
  inWindow     : WithinLimitationsWindow p c
  venue        : VenueProper p c





inductive Reachable (p : Person) (pet : AncillaryPetition) (c : ComplaintText) :
    State → Prop

  | init : Reachable p pet c State.Initiated

  | civil (h : TimelyCivilAction p c) :
      Reachable p pet c State.Adjudicated


  | ancillary (hPrev : Reachable p pet c State.Adjudicated)
      (h : TimelyAncillaryPetition pet c) :
      Reachable p pet c State.AncillaryPending

end Proving.USC.T18.Enf.Procedure
