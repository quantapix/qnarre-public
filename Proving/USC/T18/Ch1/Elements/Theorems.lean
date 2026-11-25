




import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Elements.Types
import Proving.USC.T18.Ch1.Elements.Predicates
import Proving.USC.T18.Ch1.Elements.Statute

namespace Proving.USC.T18.Ch1.Elements
open Proving.USC.Common


theorem principalLiable_direct_intro {p c}
    (h : CommitsOffenseAgainstUS p c) : PrincipalLiable p c := .direct h
theorem principalLiable_accomplice_intro {p c}
    (hOffense : OffenseAgainstUSCommitted c) (hAids : AidsAbetsOffense p c) :
    PrincipalLiable p c := .accomplice hOffense hAids
theorem principalLiable_causer_intro {p c}
    (h : WillfullyCausesOffendingAct p c) : PrincipalLiable p c := .causer h


theorem section3_intro {p c}
    (hOffense : OffenseAgainstUSCommitted c) (hKnows : KnowsOffenseCommitted p c)
    (hAssists : AssistsOffender p c) (hIntent : IntendsToHinderApprehension p c) :
    Section3 p c :=
  ⟨hOffense, hKnows, hAssists, hIntent⟩


theorem section4_intro {p c}
    (hKnow : KnowsOfFelonyCommission p c) (hConceal : ConcealsFelony p c)
    (hFail : FailsToDiscloseToAuthority p c) : Section4 p c :=
  ⟨hKnow, hConceal, hFail⟩


theorem withinUnitedStates_intro {loc c}
    (hSubject : SubjectToUSJurisdiction loc c) (hNotCanal : ¬ IsCanalZone loc c) :
    WithinUnitedStates loc c :=
  ⟨hSubject, hNotCanal⟩


theorem smtj_highSeas_intro {loc c} (h : OnHighSeasOrUSVessel loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .highSeas h
theorem smtj_greatLakes_intro {loc c} (h : OnGreatLakesVessel loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .greatLakes h
theorem smtj_reservedLands_intro {loc c} (h : OnUSReservedLands loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .reservedLands h
theorem smtj_guanoIsland_intro {loc c} (h : OnGuanoIsland loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .guanoIsland h
theorem smtj_aircraft_intro {loc c} (h : OnUSAircraftInFlight loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .aircraft h
theorem smtj_spacecraft_intro {loc c} (h : OnUSSpacecraftInFlight loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .spacecraft h
theorem smtj_outsideNation_intro {loc c} (h : OutsideAnyNationOffenseByAgainstUSNational loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .outsideNation h
theorem smtj_foreignVessel_intro {loc c} (h : OnForeignVesselScheduledUSVoyage loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .foreignVessel h
theorem smtj_missionAbroad_intro {loc c} (h : AtUSGovMissionPremisesAbroad loc c) :
    WithinSpecialMaritimeTerritorialJurisdiction loc c := .missionAbroad h


theorem section13a_intro {p loc c}
    (hWithin : WithinFederalEnclaveOrTerritorialSea loc c)
    (hAct : CommittedActOrOmission p c)
    (hNotFed : ¬ PunishableByCongressEnactment p c)
    (hState : PunishableUnderAssimilatedStateLaw p c) : Section13a p loc c :=
  ⟨hWithin, hAct, hNotFed, hState⟩


theorem section13bEnhancement_intro {p c}
    (hDui : DuiOffenseCommitted p c)
    (hPresent : PersonOtherThanOffenderPresentInVehicle c)
    (hMinor : PresentPersonIsMinor c)
    (hNoState : ¬ StateProvidesAdditionalTerm c) : Section13bEnhancement p c :=
  ⟨hDui, hPresent, hMinor, hNoState⟩

end Proving.USC.T18.Ch1.Elements
