











import Proving.USC.T18.Enf.Procedure.Types

namespace Proving.USC.T18.Enf.Procedure

open Proving.USC.Common







axiom ChargeFiled (i : ChargingInstrument) (c : ComplaintText) : Prop






axiom PreOrderNoticeAndHearing (o : PreservationOrder) (c : ComplaintText) : Prop





axiom TROIssuedExParte (o : PreservationOrder) (c : ComplaintText) : Prop







axiom WithinFourteenDayTROWindow (o : PreservationOrder) (c : ComplaintText) : Prop






axiom ForfeitureNoticePublished (c : ComplaintText) : Prop





axiom PetitionWithinThirtyDaysOfNotice (pet : AncillaryPetition) (c : ComplaintText) : Prop





axiom PetitionProperlyVerified (pet : AncillaryPetition) (c : ComplaintText) : Prop







axiom DistrictCourtJurisdiction (c : ComplaintText) : Prop





axiom PrivateCivilSuitFiled (p : Person) (c : ComplaintText) : Prop






axiom CivilClaimAccrued (p : Person) (c : ComplaintText) : Prop





axiom WithinLimitationsWindow (p : Person) (c : ComplaintText) : Prop






axiom VenueProper (p : Person) (c : ComplaintText) : Prop






axiom EndsOfJusticeForNationwideService (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Enf.Procedure
