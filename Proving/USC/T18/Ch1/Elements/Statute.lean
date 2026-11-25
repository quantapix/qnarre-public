








import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Elements.Types
import Proving.USC.T18.Ch1.Elements.Predicates

namespace Proving.USC.T18.Ch1.Elements
open Proving.USC.Common


inductive PrincipalLiable (p : Person) (c : ComplaintText) : Prop where

  | direct (h : CommitsOffenseAgainstUS p c)

  | accomplice (hOffense : OffenseAgainstUSCommitted c) (hAids : AidsAbetsOffense p c)

  | causer (h : WillfullyCausesOffendingAct p c)


structure Section3 (p : Person) (c : ComplaintText) : Prop where
  offenseCommitted : OffenseAgainstUSCommitted c
  knows            : KnowsOffenseCommitted p c
  assists          : AssistsOffender p c
  intent           : IntendsToHinderApprehension p c


structure Section4 (p : Person) (c : ComplaintText) : Prop where
  knowledge     : KnowsOfFelonyCommission p c
  conceals      : ConcealsFelony p c
  failsDisclose : FailsToDiscloseToAuthority p c


structure WithinUnitedStates (loc : Location) (c : ComplaintText) : Prop where
  subject      : SubjectToUSJurisdiction loc c
  notCanalZone : ¬ IsCanalZone loc c


inductive WithinSpecialMaritimeTerritorialJurisdiction (loc : Location) (c : ComplaintText) : Prop where
  | highSeas       (h : OnHighSeasOrUSVessel loc c)
  | greatLakes     (h : OnGreatLakesVessel loc c)
  | reservedLands  (h : OnUSReservedLands loc c)
  | guanoIsland    (h : OnGuanoIsland loc c)
  | aircraft       (h : OnUSAircraftInFlight loc c)
  | spacecraft     (h : OnUSSpacecraftInFlight loc c)
  | outsideNation  (h : OutsideAnyNationOffenseByAgainstUSNational loc c)
  | foreignVessel  (h : OnForeignVesselScheduledUSVoyage loc c)
  | missionAbroad  (h : AtUSGovMissionPremisesAbroad loc c)


structure Section13a (p : Person) (loc : Location) (c : ComplaintText) : Prop where
  withinJurisdiction   : WithinFederalEnclaveOrTerritorialSea loc c
  actOrOmission        : CommittedActOrOmission p c
  notFederalPunishable : ¬ PunishableByCongressEnactment p c
  statePunishable      : PunishableUnderAssimilatedStateLaw p c




def PresentPersonIsMinor (c : ComplaintText) : Prop := AgeOfPresentPerson c < 18


structure Section13bEnhancement (p : Person) (c : ComplaintText) : Prop where
  dui         : DuiOffenseCommitted p c
  present     : PersonOtherThanOffenderPresentInVehicle c
  isMinor     : PresentPersonIsMinor c
  noStateTerm : ¬ StateProvidesAdditionalTerm c

end Proving.USC.T18.Ch1.Elements
