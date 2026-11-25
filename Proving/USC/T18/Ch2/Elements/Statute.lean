












import Proving.USC.T18.Ch2.Elements.Predicates

namespace Proving.USC.T18.Ch2.Elements

open Proving.USC.Common





inductive ProhibitedAct32a (p : Person) (c : ComplaintText) : Prop where
  | setsFire      (h : SetsFireToOrWrecksAircraft p c)
  | placesSubst   (h : PlacesDestructiveSubstanceOnAircraft p c)
  | damagesNav    (h : DamagesAirNavigationFacility p c)
  | damagesApp    (h : DamagesAircraftAppurtenance p c)
  | interferes    (h : InterferesWithAircraftPersonnel p c)
  | violence      (h : ActOfViolenceAgainstPersonOnAircraft p c)
  | falseInfo     (h : CommunicatesFalseInfoEndangeringAircraft p c)
  | attempt       (h : AttemptsOrConspiresAircraftOffense p c)



structure Section32a (p : Person) (ac : Aircraft) (c : ComplaintText) : Prop where
  willful  : ActedWithScienter p c
  coverage : AircraftIsCovered ac c
  act      : ProhibitedAct32a p c




inductive ProhibitedAct32b (p : Person) (c : ComplaintText) : Prop where
  | violence    (h : ViolenceAgainstPersonOnForeignAircraftInFlight p c)
  | destroys    (h : DestroysForeignAircraftInService p c)
  | placesDev   (h : PlacesDeviceOnForeignAircraftInService p c)
  | attempt     (h : AttemptsOrConspiresForeignAircraftOffense p c)


structure Section32b (p : Person) (ac : Aircraft) (c : ComplaintText) : Prop where
  willful         : ActedWithScienter p c
  foreignRegistered : AircraftForeignRegistered ac c
  act             : ProhibitedAct32b p c



structure Section32c (p : Person) (c : ComplaintText) : Prop where
  willful       : ActedWithScienter p c
  threat        : ImpartsThreatToViolate32 p c
  determination : WithApparentDeterminationToExecute p c


inductive Section32Offense (p : Person) (ac : Aircraft) (c : ComplaintText) : Prop where
  | subA (h : Section32a p ac c)
  | subB (h : Section32b p ac c)
  | subC (h : Section32c p c)




inductive ProhibitedAct33a (p : Person) (c : ComplaintText) : Prop where
  | vehicle   (h : DamagesMotorVehicleOrCargo p c)
  | facility  (h : DamagesMotorVehicleFacility p c)
  | driver    (h : DisablesMotorVehicleDriver p c)
  | attempt   (h : AttemptsOrConspiresMotorVehicleOffense p c)



structure Section33a (p : Person) (mv : MotorVehicle) (c : ComplaintText) : Prop where
  willful   : ActedWithScienter p c
  intent    : IntentToEndangerSafetyOrReckless p c
  commerce  : MotorVehicleUsedInInterstateCommerce mv c
  act       : ProhibitedAct33a p c





structure Section35a (p : Person) (c : ComplaintText) : Prop where
  knowsFalse    : ActedWithScienter p c
  imparts       : ImpartsFalseInformation p c
  concernsCrime : InformationConcernsChapterCrimeAttempt p c



structure Section35b (p : Person) (c : ComplaintText) : Prop where
  knowsFalse    : ActedWithScienter p c
  aggravated    : WillfulMaliciousOrRecklessDisregard p c
  imparts       : ImpartsFalseInformation p c
  concernsCrime : InformationConcernsChapterCrimeAttempt p c






structure Section36b (p : Person) (c : ComplaintText) : Prop where
  furtherance : InFurtheranceOfMajorDrugOffense p c
  intent      : IntentToIntimidateHarassInjureMaim p c
  fires       : FiresWeaponIntoGroup p c
  twoOrMore   : GroupSizeFiredInto c ≥ 2
  graveRisk   : CausesGraveRiskToHumanLife p c




inductive ProhibitedAct37a (p : Person) (c : ComplaintText) : Prop where
  | violence  (h : ActOfViolenceAtInternationalAirport p c)
  | facility  (h : DestroysAirportFacilitiesOrDisruptsServices p c)



inductive Section37Jurisdiction (p : Person) (c : ComplaintText) : Prop where
  | inUS      (h : ProhibitedActInUnitedStates p c)
  | foundInUS (h : OffenderFoundInUnitedStates p c)
  | national  (h : OffenderOrVictimUSNational p c)




structure Section37 (p : Person) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  means         : UsingDeviceSubstanceOrWeapon p c
  act           : ProhibitedAct37a p c
  jurisdiction  : Section37Jurisdiction p c
  noLaborBar    : ¬ Section37LaborDisputeBar p c




inductive ProhibitedAct38a (p : Person) (c : ComplaintText) : Prop where
  | falsifies (h : FalsifiesOrMisrepresentsAircraftPart p c)
  | deals     (h : DealsFraudulentAircraftPart p c)
  | attempt   (h : AttemptsOrConspiresPartsFraud p c)



structure Section38a (p : Person) (c : ComplaintText) : Prop where
  commerce     : InOrAffectingInterstateOrForeignCommerce p c
  knowing      : ActedWithScienter p c
  intentDefraud : IntentToDefraud p c
  act          : ProhibitedAct38a p c





structure Section39a1 (p : Person) (c : ComplaintText) : Prop where
  commerce     : InOrAffectingInterstateOrForeignCommerce p c
  knowing      : ActedWithScienter p c
  sells        : SellsPreemptionTransmitter p c
  nonqualUser  : ToNonqualifyingUser p c



structure Section39a2 (p : Person) (c : ComplaintText) : Prop where
  commerce        : InOrAffectingInterstateOrForeignCommerce p c
  isNonqual       : IsNonqualifyingUser p c
  unauthorizedUse : MakesUnauthorizedUseOfTransmitter p c





structure Section39A (p : Person) (c : ComplaintText) : Prop where
  knowing : ActedWithScienter p c
  aims    : AimsLaserPointerBeam p c
  target  : AtAircraftInSpecialJurisdictionOrFlightPath p c





structure Section39Ba (p : Person) (c : ComplaintText) : Prop where
  operates  : OperatesUnmannedAircraft p c
  mensRea   : KnowinglyOrRecklessly p c
  interferes : InterferesWithOccupiedAircraftImminentHazard p c



structure Section39Bb (p : Person) (c : ComplaintText) : Prop where
  operates : OperatesUnmannedAircraft p c
  knowing  : ActedWithScienter p c
  noAuth   : WithoutAuthorization p c
  inZone   : OperatesWithinRunwayExclusionZone p c





structure Section40b (p : Person) (c : ComplaintText) : Prop where
  driver   : IsCommercialMotorVehicleDriver p c
  knowing  : ActedWithScienter p c
  directed : DirectedByAuthorizedEmployeeToStop p c
  fails    : FailsToStopOrLeavesInspection p c





structure Section40Aa (p : Person) (c : ComplaintText) : Prop where
  operates   : OperatesUnmannedAircraft p c
  mensRea    : KnowinglyOrRecklessly p c
  interferes : InterferesWithWildfireSuppression p c

end Proving.USC.T18.Ch2.Elements
