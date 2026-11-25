






import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Procedure.Types
import Proving.USC.T18.Ch2.Procedure.Predicates
import Proving.USC.T18.Ch2.Procedure.Statute

namespace Proving.USC.T18.Ch2.Procedure

open Proving.USC.Common (Person ComplaintText)





theorem inServiceWindow_intro {a c}
    (hLo : PreflightStartHour a c ≤ ConductHour a c)
    (hHi : ConductHour a c ≤ LandingHour a c + 24) :
    InServiceWindow a c :=
  ⟨hLo, hHi⟩



theorem section32Jurisdiction_special_intro {a c}
    (h : WithinSpecialAircraftJurisdiction a c) : Section32Jurisdiction a c :=
  .special h

theorem section32Jurisdiction_airCommerce_intro {a c}
    (h : InInterstateOverseasForeignAirCommerce a c) : Section32Jurisdiction a c :=
  .airCommerce h

theorem section32Jurisdiction_foreignReg_intro {a c}
    (h : AircraftForeignRegistered a c) : Section32Jurisdiction a c :=
  .foreignReg h

theorem section39BApplicability_jurisdiction_intro {a c}
    (h : WithinSpecialAircraftJurisdiction a c) : Section39BApplicability a c :=
  .jurisdiction h

theorem section39BApplicability_runwayZone_intro {a c}
    (h : WithinRunwayExclusionZone c) : Section39BApplicability a c :=
  .runwayZone h

theorem section37Jurisdiction_territorial_intro {p c}
    (h : ProhibitedActivityInUS c) : Section37Jurisdiction p c :=
  .territorial h

theorem section37Jurisdiction_extraterritFound_intro {p c}
    (hOut : ProhibitedActivityOutsideUS c) (hFound : OffenderFoundInUS p c) :
    Section37Jurisdiction p c :=
  .extraterritFound hOut hFound

theorem section37Jurisdiction_extraterritNational_intro {p c}
    (hOut : ProhibitedActivityOutsideUS c) (hNat : OffenderOrVictimUSNational p c) :
    Section37Jurisdiction p c :=
  .extraterritNational hOut hNat



theorem prosecutionBar37_intro {c}
    (hUS : ConductOccurredWithinUS c) (hLabor : ConductInvolvedLaborDispute c)
    (hFelony : ConductProhibitedAsStateFelony c) : ProsecutionBar37 c :=
  ⟨hUS, hLabor, hFelony⟩



theorem interimRelief38_intro {c}
    (hProc : DistrictCourtEnforcementProceedingBrought c)
    (hRestraint : InterimRestraintPendingFinalDetermination c) :
    InterimRelief38 c :=
  ⟨hProc, hRestraint⟩

theorem estoppel38_intro {p c}
    (hJudg : CriminalFinalJudgmentForUS p c)
    (hCivil : SubsequentCivilProceedingByUS p c) : Estoppel38 p c :=
  ⟨hJudg, hCivil⟩

theorem sentencingForfeiture38_intro {p c}
    (hConv : ConvictedUnderSection38 p c)
    (hForf : ForfeitureOrderedAtSentencing p c) : SentencingForfeiture38 p c :=
  ⟨hConv, hForf⟩



theorem deathResultTrigger34_intro {p c}
    (hConv : ConvictedOfChapterCrime p c) (hDeath : CrimeResultedInDeath c) :
    DeathResultTrigger34 p c :=
  ⟨hConv, hDeath⟩

theorem radioactiveEnhancement33b_intro {p v c}
    (hConv : ConvictedUnderSection33a p c)
    (hCargo : VehicleCarriedHighLevelRadioactiveWasteOrSpentFuel v c) :
    RadioactiveEnhancement33b p v c :=
  ⟨hConv, hCargo⟩



theorem civilPenaltyAction35_intro {c}
    (h : CivilActionBroughtByUS c) : CivilPenaltyAction35 c :=
  ⟨h⟩



theorem section39AApplicable_intro {a c}
    (hJur : WithinSpecialAircraftJurisdiction a c)
    (hNoExc : ¬ ExceptionApplies39A c) : Section39AApplicable a c :=
  ⟨hJur, hNoExc⟩



theorem ninetyDayNoticeMet_intro {r c}
    (h : RegulationProposalNotificationDay r c + 90 ≤ RegulationFinalDay r c) :
    NinetyDayNoticeMet r c :=
  h




theorem compliantInspection_intro {v c}
    (hDir : DirectedToStop v c) (hStop : DriverStopped v c)
    (hSub : SubmittedToInspection v c) (hAuth : ¬ LeftBeforeAuthorized v c) :
    CompliantInspection v c :=
  .released (.submitted (.stopped (.directed hDir) hStop) hSub) hAuth

theorem inspectionOffense40_failedToStop_intro {v c}
    (hDir : DirectedToStop v c) (h : KnowinglyFailedToStop v c) :
    InspectionOffense40 v c :=
  .failedToStop hDir h

theorem inspectionOffense40_leftEarly_intro {v c}
    (hDir : DirectedToStop v c) (h : LeftBeforeAuthorized v c) :
    InspectionOffense40 v c :=
  .leftEarly hDir h

end Proving.USC.T18.Ch2.Procedure
