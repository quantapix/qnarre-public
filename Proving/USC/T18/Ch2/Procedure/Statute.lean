











import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Procedure.Types
import Proving.USC.T18.Ch2.Procedure.Predicates

namespace Proving.USC.T18.Ch2.Procedure

open Proving.USC.Common (Person ComplaintText)






structure Transition where
  fromState : State
  toState   : State
  guard     : Prop







def InServiceWindow (a : Aircraft) (c : ComplaintText) : Prop :=
  PreflightStartHour a c ≤ ConductHour a c ∧
  ConductHour a c ≤ LandingHour a c + 24






inductive Section32Jurisdiction (a : Aircraft) (c : ComplaintText) : Prop
  | special      (h : WithinSpecialAircraftJurisdiction a c)
  | airCommerce  (h : InInterstateOverseasForeignAirCommerce a c)
  | foreignReg   (h : AircraftForeignRegistered a c)



inductive Section39BApplicability (a : Aircraft) (c : ComplaintText) : Prop
  | jurisdiction (h : WithinSpecialAircraftJurisdiction a c)
  | runwayZone   (h : WithinRunwayExclusionZone c)






inductive Section37Jurisdiction (p : Person) (c : ComplaintText) : Prop
  | territorial          (h : ProhibitedActivityInUS c)
  | extraterritFound     (hOut : ProhibitedActivityOutsideUS c)
                         (hFound : OffenderFoundInUS p c)
  | extraterritNational  (hOut : ProhibitedActivityOutsideUS c)
                         (hNat : OffenderOrVictimUSNational p c)




structure ProsecutionBar37 (c : ComplaintText) : Prop where
  withinUS     : ConductOccurredWithinUS c
  laborDispute : ConductInvolvedLaborDispute c
  stateFelony  : ConductProhibitedAsStateFelony c





structure InterimRelief38 (c : ComplaintText) : Prop where
  proceeding : DistrictCourtEnforcementProceedingBrought c
  restraint  : InterimRestraintPendingFinalDetermination c




structure Estoppel38 (p : Person) (c : ComplaintText) : Prop where
  criminalJudgment : CriminalFinalJudgmentForUS p c
  subsequentCivil  : SubsequentCivilProceedingByUS p c



structure SentencingForfeiture38 (p : Person) (c : ComplaintText) : Prop where
  convicted : ConvictedUnderSection38 p c
  forfeited : ForfeitureOrderedAtSentencing p c





structure DeathResultTrigger34 (p : Person) (c : ComplaintText) : Prop where
  convicted : ConvictedOfChapterCrime p c
  death     : CrimeResultedInDeath c




structure RadioactiveEnhancement33b (p : Person) (v : MotorVehicle)
    (c : ComplaintText) : Prop where
  convicted : ConvictedUnderSection33a p c
  cargo     : VehicleCarriedHighLevelRadioactiveWasteOrSpentFuel v c





structure CivilPenaltyAction35 (c : ComplaintText) : Prop where
  civilAction : CivilActionBroughtByUS c





structure Section39AApplicable (a : Aircraft) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialAircraftJurisdiction a c
  noException  : ¬ ExceptionApplies39A c





def NinetyDayNoticeMet (r : Regulation) (c : ComplaintText) : Prop :=
  RegulationProposalNotificationDay r c + 90 ≤ RegulationFinalDay r c






inductive InspectionReaches (v : MotorVehicle) (c : ComplaintText) :
    State → Prop
  | directed  (h : DirectedToStop v c) :
      InspectionReaches v c State.Directed
  | stopped   (hprev : InspectionReaches v c State.Directed)
              (h : DriverStopped v c) :
      InspectionReaches v c State.Stopped
  | submitted (hprev : InspectionReaches v c State.Stopped)
              (h : SubmittedToInspection v c) :
      InspectionReaches v c State.Submitted
  | released  (hprev : InspectionReaches v c State.Submitted)
              (hAuth : ¬ LeftBeforeAuthorized v c) :
      InspectionReaches v c State.Released


def CompliantInspection (v : MotorVehicle) (c : ComplaintText) : Prop :=
  InspectionReaches v c State.Released



inductive InspectionOffense40 (v : MotorVehicle) (c : ComplaintText) : Prop
  | failedToStop (hDir : DirectedToStop v c) (h : KnowinglyFailedToStop v c)
  | leftEarly    (hDir : DirectedToStop v c) (h : LeftBeforeAuthorized v c)

end Proving.USC.T18.Ch2.Procedure
