













import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Procedure.Types

namespace Proving.USC.T18.Ch2.Procedure

open Proving.USC.Common (Person ComplaintText)






axiom PreflightStartHour (a : Aircraft) (c : ComplaintText) : Nat




axiom LandingHour (a : Aircraft) (c : ComplaintText) : Nat



axiom ConductHour (a : Aircraft) (c : ComplaintText) : Nat





axiom AircraftInFlight (a : Aircraft) (c : ComplaintText) : Prop






axiom WithinSpecialAircraftJurisdiction (a : Aircraft) (c : ComplaintText) : Prop





axiom InInterstateOverseasForeignAirCommerce (a : Aircraft) (c : ComplaintText) : Prop




axiom AircraftForeignRegistered (a : Aircraft) (c : ComplaintText) : Prop




axiom MotorVehicleInInterstateOrForeignCommerce (v : MotorVehicle) (c : ComplaintText) : Prop




axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop






axiom ProhibitedActivityInUS (c : ComplaintText) : Prop




axiom ProhibitedActivityOutsideUS (c : ComplaintText) : Prop



axiom OffenderFoundInUS (p : Person) (c : ComplaintText) : Prop




axiom OffenderOrVictimUSNational (p : Person) (c : ComplaintText) : Prop




axiom ConductOccurredWithinUS (c : ComplaintText) : Prop




axiom ConductInvolvedLaborDispute (c : ComplaintText) : Prop




axiom ConductProhibitedAsStateFelony (c : ComplaintText) : Prop






axiom DistrictCourtEnforcementProceedingBrought (c : ComplaintText) : Prop




axiom InterimRestraintPendingFinalDetermination (c : ComplaintText) : Prop




axiom CriminalFinalJudgmentForUS (p : Person) (c : ComplaintText) : Prop




axiom SubsequentCivilProceedingByUS (p : Person) (c : ComplaintText) : Prop




axiom ConvictedUnderSection38 (p : Person) (c : ComplaintText) : Prop




axiom ForfeitureOrderedAtSentencing (p : Person) (c : ComplaintText) : Prop





axiom ConvictedOfChapterCrime (p : Person) (c : ComplaintText) : Prop



axiom CrimeResultedInDeath (c : ComplaintText) : Prop




axiom ConvictedUnderSection33a (p : Person) (c : ComplaintText) : Prop





axiom VehicleCarriedHighLevelRadioactiveWasteOrSpentFuel (v : MotorVehicle) (c : ComplaintText) : Prop






axiom CivilActionBroughtByUS (c : ComplaintText) : Prop




axiom InFurtheranceOfMajorDrugOffense (c : ComplaintText) : Prop







axiom ExceptionApplies39A (c : ComplaintText) : Prop




axiom RegulationProposalNotificationDay (r : Regulation) (c : ComplaintText) : Nat



axiom RegulationFinalDay (r : Regulation) (c : ComplaintText) : Nat




axiom WithinRunwayExclusionZone (c : ComplaintText) : Prop




axiom GovernmentOperationException40A (c : ComplaintText) : Prop






axiom DirectedToStop (v : MotorVehicle) (c : ComplaintText) : Prop



axiom DriverStopped (v : MotorVehicle) (c : ComplaintText) : Prop




axiom SubmittedToInspection (v : MotorVehicle) (c : ComplaintText) : Prop




axiom LeftBeforeAuthorized (v : MotorVehicle) (c : ComplaintText) : Prop




axiom KnowinglyFailedToStop (v : MotorVehicle) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch2.Procedure
